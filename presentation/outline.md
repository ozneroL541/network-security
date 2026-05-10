- What is a vulnerability assessment, how they are performed

- Introduction to the tool:
  - Explain the tool
  - Functionalities
  - Methodologies (show the interface, explain how to use it)
  - Differences between the free version and the paid version
  - Vulnerability database
  - Explain the database
  - Show the bare-metal system and the one in VirtualBox, explaining differences in usage and why VirtualBox is preferable
  - Network explanation
    - Creation of a virtual LAN on VirtualBox
    - Set the gateway on Greenbone
    - VM explanation
    - Docker network
    - How it was configured
    - Start a VM without an interface
    - Bring up the Docker network (`docker-vulnet`)
    - Start network discovery (mention that it will take a long time and results may not be immediately visible)
    - 5-minute exercise break
    - Show the report yourself and explain key points

- VM analysis
  - Windows XP
    - Why it was chosen
    - Essentially no firewall
    - Vulnerable services
      - FTP with anonymous credentials (any password works)

  - Debian
    - Why it was chosen
    - Services (refer to the PDF report)
      - Apache
      - CUPS
      - Docker vulnet
      - FTP
      - Samba
      - SSH
      - Syslog


  - Identify which IPs are dynamic (this could be an exercize cause it may be different from anybody due to DHCP)
  - Show the full web UI interface, explaining configurations

  - Explanation of VMs and services
    - Feeds are the most important part; without them, the system cannot identify vulnerabilities. Ensure they are updated and not currently updating, otherwise nothing will work
    - Show the configuration panel (otherwise it would take too long; it’s essentially like Nmap)
    - Credentials allow access using specific credentials only for SSH and Samba
    - Target creation
    - Task creation
      - Exercise about finding XP http service
    - Results: various reports and commentary
      - Briefly explain the most important vulnerabilities
      - What these vulnerabilities can lead to
      - Explain that through Greenbone we have an HTTP page exposed on XP