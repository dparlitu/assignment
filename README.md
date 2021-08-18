# assignment
Assessment 4 CYB6004: Software Based Solution

This Software Based Solution consists of a Main menu with multiple choices. Each choice will run a script or multiple scripts, depending on the intended functionality.

Application can be started by running the menu.sh script file.

When the application is first started, the user will have to create a password with requirements as per below:
- length has to be higher than 8 characters
- contain a number between 0 and 9
- requirement of an uppercase letter
- requirement of a lowercase letter
- requirement of a special character: !,$,@,'#',%,*,+,-


The scripts will perform various tasks as listed below:

1. Download Botnet C2 IP Blocklist - download a CSV file from https://feodotracker.abuse.ch containing a list of IPs and ports with malware.

2. View Botnet C2 IP Blocklist - web scrape the description of the webpage and then format the CSV file data and display it to the bash window.

3. Download Malware URL List - will download a CSV file from https://urlhaus.abuse.ch containing a list of websites hosting malware.

4. View Botnet C2 IP Blocklist - web scrape the description of the webpage and then will format the CSV file data and display it to the bash window.

5. View Linear Regression Graph - will prepare the data for the graph by executing a Python script to generate and show the graph using matplotlib library. The graph will also show the Best Fit Straight Line Trajectory with the purpose of visualising an overall trend on positive or negative spectrum.

6. View IP Info - will prompt for an IP address and retrieve its technical info from ipinfo.io.

7. Change Password - allows the user to change password whilst checking that the password complexity is satisfied.

8. Quit will exit the program.

