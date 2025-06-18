---
layout: post
title: "Automating my Car shooter game with MCTS"
date:   2025-06-18 00:03:36 +0530

---
<p align="center">
  <img src="/assets/car.gif" alt="Car Game" width="100%" />
</p>

This project began as a casual college game I developed in my second year, using Pygame. The idea was simple. You're driving a car, and your job is to survive enemy attacks, collect energy to stay alive, and shoot down as many opponents as you can. The more you destroy, the higher your score.

The core gameplay loop was designed in Pygame and includes:

- A player car that moves left and right.
- Opponent cars that spawn and rush toward the player.
- Energy pickups that keep your car alive.
- Bullets using which you take down enemy cars.

Each component is managed by its respective class: `MyCar`, `Opponent`, `Fire`, and `Explosion`.

The original version used keyboard input for movement and shooting. The objective was to survive as long as possible while scoring points by destroying opponents.

While building the game, I found myself knee-deep in things I hadn’t anticipated—like why a car would randomly vanish mid-frame, or why every collision either did nothing or ended in total chaos. I spent hours tweaking bounding rectangles, trying to get explosions to appear in the right place, and making sure enemy cars didn’t spawn on top of each other. Most of my time went into figuring out how to reset things properly after a crash or making sure the game didn’t freeze when too many things happened at once. It was messy, confusing, and at times exhausting, but weirdly satisfying when everything finally came together.

Recently, I revisited this project with the idea of **automating** it. I wanted to see if the car could make its own decisions—to dodge, shoot, or stay put—all without human input. That’s where **Monte Carlo Tree Search (MCTS)** came in. Being a decision-making algorithm, it’s particularly useful in many strategic games when the search space is large and rewards are sparse or delayed—perfect for a chaotic survival game like mine.

### Implementation Details

The first step was to abstract the game state into a simplified object. I created a `GameState` class in `mcts_car_shooter.py` that captures:

- My car’s `x` position.
- Remaining energy and current score.
- Positions and energy levels of alive opponents.
- Fire coordinates (optional) and energy pickup position.

This allowed the MCTS algorithm to run without needing to interact with the actual rendering or physics code.

In the main game loop, every 5 frames, I pass the current game state to the MCTS engine:

```python
if frame_counter % 5 == 0:
    state = get_game_state_from_main(mycar, energy, score, list(opponent))
    action = mcts_search(state, computation_time=0.05)
```

The result is one of four possible actions: `"left"`, `"right"`, `"shoot"`, or `"none"`.

Once the decision is made, the game responds accordingly:

```python
if action == "left":
    mycar.move("left")
elif action == "right":
    mycar.move("right")
elif action == "shoot":
    fire_sound.play()
```

So here’s what’s actually going on behind the scenes every time the AI makes a move. The MCTS algorithm starts by traversing the existing tree of game states to find the most promising node to explore—this is the selection step. Once it lands on that node, it simulates one new possible action from there, which is the expansion phase. From that new state, it plays out a few random steps of the game using a basic policy (like “shoot if you see enemies” or “don’t move if energy is low”)—this is the simulation part. And then finally, based on how well or badly that rollout went, it backpropagates the reward back up the tree so that decisions that led to good outcomes get reinforced and are more likely to be chosen in the future. Each loop tries to balance exploration (trying out new stuff) and exploitation (doing what’s already known to work), and this constant balance somehow ends up producing surprisingly smart behavior out of nothing but random simulations and reward math.


After integrating MCTS, the game now plays itself. The car intelligently avoids enemy fire, conserves energy, and shoots at the right moments. It’s not perfect—but it’s good enough to survive for a few minutes and rack up a decent score.

However, one limitation of the current setup is that the AI doesn’t retain any memory of past games—it starts from scratch every time the game restarts. The MCTS algorithm only simulates forward from the current state and doesn’t learn or adapt across episodes. So while it can make fairly smart decisions in the moment, it has no long-term strategy or evolving understanding of what works best over time. There's no persistence of experience, which means it can't build on previous runs to improve future performance. This makes it efficient for one-off decisions but not ideal for learning patterns or refining behavior over multiple plays.


Next, I’m planning to take things a bit further. I want to train a policy network on the trajectories generated by MCTS so the model can learn from past simulations and make better long-term decisions without needing to simulate every time. I’m also thinking of adding a simple GUI to visualize how the MCTS tree grows and changes in real time—because watching the AI think would honestly be super fun. And eventually, I’d like to give players the option to toggle between AI-controlled and manual play, so they can either sit back and watch the car do its thing or take control themselves. You can find the full implementation on my [GitHub](https://github.com/srirupa19/Racing-Car). Thanks for reading!


