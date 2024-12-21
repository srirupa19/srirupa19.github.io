---
layout: about
title: About
permalink: /about/
---

<div style="display: flex; align-items: center; justify-content: space-between;">
  <h1 style="margin: 0;">Srirupa Datta</h1>
  <img id="profileImage" src="/assets/dp.jpeg" alt="Srirupa Datta" style="width: 200px; height: 200px; border-radius: 50%;">
</div>
<br>

<script>
  var images = ['/assets/dp.jpeg', '/assets/draw.png']; // Paths to the two images
  var currentIndex = 0;

  function toggleImage() {
    currentIndex = (currentIndex + 1) % images.length; // Toggle between 0 and 1
    document.getElementById('profileImage').src = images[currentIndex];
  }

  setInterval(toggleImage, 5000); // Change image every 5 seconds
</script>

<style>body {text-align: justify; font-size: 13px;}</style>


Hi, I am Srirupa (IRC: sriru:matrix.org). I am currently a Software Developer at [Morgan Stanley](https://www.morganstanley.com/), interested in pursuing research in Computer Science. My research interests focus on the intersection of deep learning, computer vision, and computer graphics. Coupled with my passion for digital art and contributions to [Krita](https://krita.org/en/), I am driven to explore the integration of AI and creative technologies, particularly in areas like 3D modeling, animation, and motion tracking.

Currently, I am working with [Prof. Sanjoy Kumar Saha](https://scholar.google.co.in/citations?user=X3Cu3hYAAAAJ&hl=en) on developing a robust framework for classifying motor movements and imagery, while balancing my full-time role as a Software Developer. I joined Morgan Stanley in 2023, where I am involved in a data migration project and responsible for maintaining financial data on the cloud (Snowflake). In the summer of 2023, I also contributed to Krita (KDE) as part of [Google Summer of Code](https://summerofcode.withgoogle.com/archive/2023/projects/SB6pWpuy) under the mentorship of Emmet O'Neill. During this project, I redesigned Krita's Bundle Creator, a tool that enables users to create compressed files called Resource Bundles, which house collections of resources. I also added the capability to edit these bundles, enhancing the tool's functionality for the Krita community.

Before my graduation, I collaborated with [Prof. Amit Konar](https://scholar.google.co.in/citations?user=s1F23CAAAAAJ&hl=en) and Prof. Sanjoy Kumar Saha on research projects that deepened knowledge of deep learning and signal processing. As a painter with a passion for software development, I actively contributed to Krita while also immersing myself in learning and practicing digital painting. During my undergraduate years, I had the opportunity to intern at [Simon Fraser University](https://www.sfu.ca/) in the summer of 2022 through the [Mitacs Globalink Fellowship](https://www.mitacs.ca/our-programs/globalink-research-internship-students/), where I gained valuable research experience. I graduated from [Jadavpur University](https://jadavpuruniversity.in/), India, in 2023 with a Bachelor's degree in Electrical Engineering.

<p style="text-align: center;">  
<a href="mailto:srirupa.sps@gmail.com">Email</a>  /  
<a href="https://drive.google.com/file/d/1Vs1ARMm-Q5m9TeAnWasNLkoTX3CtFJaz/view?usp=sharing">CV</a>  /  
<a href="https://scholar.google.com/citations?hl=en&user=UV_Jyr0AAAAJ">Google Scholar</a>  /  
<a href="https://www.github.com/srirupa19">GitHub</a>  /  
<a href="https://www.linkedin.com/in/srirupa-datta/">LinkedIn</a>  
</p>


<h3 style="color: #0074D9;">Research</h3>

<br>
<div style="display: flex; align-items: center;">
  <!-- Image or Animation on the left -->
  <img src="/assets/SKS.gif" alt="Description of image" style="width: 250px; height: auto; margin-right: 20px;">
  
  <!-- Text on the right -->
  <div>
    <b>Motor Imagery Classification Using Activation/Deactivation Pattern Created from EEG Signal</b>
    <br>
    <i>Rahash Agarwal, <b>Srirupa Datta</b>, Debatri Chatterjee, Sanjoy Kumar Saha</i>
    <br>
    <!-- Link at the bottom of the text -->
    [<a href="https://drive.google.com/file/d/17O2kqI7DtxLB-XtFqaH6o4vpqYGXkivS/view?usp=sharing" target="_blank">Paper</a>] 
    [<a href="https://colab.research.google.com/drive/1kjnx0TdhqyVCMbuT2QW5HwbmW7gUPguR?usp=sharing">Code</a>]  
    
  </div>
</div>
<br>

<div style="display: flex; align-items: center; flex-wrap: wrap;">
  <!-- Image or Animation on the left -->
  <img src="/assets/AK1.gif" alt="Description of image" style="flex: 1; max-width: 250px; height: auto; margin-right: 20px;">

  <!-- Text on the right -->
  <div style="flex: 2; min-width: 300px;">
    <b>A Deep Learning Approach for Position Control of a Mobile Robot</b>
    <br>
    <i><b>Srirupa Datta</b>, Swapnil Sengupta, Tamodip Das, Sourya Dasgupta, Sayantani Ghosh, Amit Konar</i>
    <br>
    <span style="color: rgb(178, 4, 4);">CODEC'23</span>
    <br>
    <!-- Link at the bottom of the text -->
    [<a href="https://ieeexplore.ieee.org/document/10466131">Paper</a>] 
    [<a href="https://github.com/srirupa19/EEG_Motor_Imagery">Code</a>]  
  </div>
</div>





<h3 style="color: #0074D9;">Work Experience</h3>


<div style="display: flex; align-items: center;">
  <!-- Image or Animation on the left -->
  <img src="/assets/MS.gif" alt="Description of image" style="width: 250px; height: auto; margin-right: 20px;">
  
  <!-- Text on the right -->
  <div>
    <h5>Morgan Stanley, Software Engineer II</h5>
    <i>Currently Working</i>
    <p>As part of the Institutional Securities Department, worked on data transformation projects migrating finance reference data to Snowflake (Azure) and developed Jenkins-based CI/CD pipelines for automated deployments. Contributed to optimizing legacy ETL functionality by converting Perl code to Python and improving performance with PySpark, while also enhancing a full-stack application using Python, Flask, and Angular.</p>
    
    <!-- Link at the bottom of the text -->
    <!-- [<a href="https://community.kde.org/GSoc/2023/StatusReports/SrirupaDatta" target="_blank">About</a>] 
    [<a href="https://invent.kde.org/graphics/krita/-/merge_requests/1802">Code</a>]   -->
    
  </div>
</div>


<div style="display: flex; align-items: center;">
  <!-- Image or Animation on the left -->
  <img src="/assets/bundle_editor.gif" alt="Description of image" style="width: 250px; height: auto; margin-right: 20px;">
  
  <!-- Text on the right -->
  <div>
    <h5>Google Summer of Code, 2023</h5>
    <p>Redesigned Krita’s Bundle Creator into a resizable wizard with four distinct pages, improving its modularity and user interface. This tool allows users to create, manage, and edit resource bundles, with enhanced features like resource filtering, grid/list view toggling, and integration with Krita's Resource Database.</p>
    
    <!-- Link at the bottom of the text -->
    [<a href="https://community.kde.org/GSoc/2023/StatusReports/SrirupaDatta" target="_blank">About</a>] 
    [<a href="https://invent.kde.org/graphics/krita/-/merge_requests/1802">Code</a>]  
    
  </div>
</div>

<div style="display: flex; align-items: center;">
  <!-- Image or Animation on the left -->
  <img src="/assets/MS.gif" alt="Description of image" style="width: 250px; height: auto; margin-right: 20px;">
  
  <!-- Text on the right -->
  <div>
    <h5>Morgan Stanley, Technology Analyst Intern, 2022</h5>
    <p>Worked on a firm-wide Greenplum decommission project, migrating from on-premises Greenplum to Snowflake (Azure) to optimize cost efficiency. Developed scripts to automate the migration of stage and dimension tables, greatly reducing manual effort and streamlining the process for Cost Reporting and Balance Sheet.</p>
    
    <!-- Link at the bottom of the text -->
    <!-- [<a href="https://community.kde.org/GSoc/2023/StatusReports/SrirupaDatta" target="_blank">About</a>] 
    [<a href="https://invent.kde.org/graphics/krita/-/merge_requests/1802">Code</a>]   -->
    
  </div>
</div>


<div style="display: flex; align-items: center;">
  <!-- Image or Animation on the left -->
  <img src="/assets/animation2.gif" alt="Description of image" style="width: 250px; height: auto; margin-right: 20px;">
  
  <!-- Text on the right -->
  <div>
    <h5>Season of KDE, 2022</h5>
    <p>Developed a Perspective Ellipse Assistant in Krita that is used for accurately drawing ellipses within a square, ensuring proper alignment in perspective. This tool streamlines the process by automating perspective projection, enhancing precision and efficiency in digital art creation.</p>
    
    <!-- Link at the bottom of the text -->
    [<a href="https://community.kde.org/SoK/2022/StatusReport/Srirupa_Datta" target="_blank">About</a>] 
    [<a href="https://invent.kde.org/graphics/krita/-/merge_requests/1343">Code</a>]  
    
  </div>
</div>

<h3 style="color: #0074D9;">Honors and Awards</h3>

- [May, 2022] [Mitacs Globalink Research Internship](https://www.mitacs.ca/our-programs/globalink-research-internship-students/), awarded to top-ranked applicants from 15 different countries, offering a 12-week research opportunity at Canadian universities.
- [October, 2019] [JBNSTS Bigyani Kanya Scholarship](https://jbnsts.ac.in/), 4-year scholarship for academic excellence awarded to the top 50 girls of the state.
- [June, 2019] [Joint Entrance Examination Main](https://jeemain.nta.nic.in/), secured All India Rank 4588 among 9.5 million
candidates
- [December, 2017] [KVPY](https://en.wikipedia.org/wiki/Kishore_Vaigyanik_Protsahan_Yojana), national research fellowship scholarship awarded to top students during senior high school




