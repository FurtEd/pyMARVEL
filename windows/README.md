# pyMARVEL – User Guide (Windows Beta)

Welcome to the Windows beta test version of the pyMARVEL graphical user interface! 

---

## 1. Prerequisites (One-time Setup)

Since the application is fully containerized, you do not need to install Python. The only requirement is having Docker running on your machine.

1. Download and install Docker Desktop for Windows from the official site: https://www.docker.com/products/docker-desktop/
2. Launch Docker Desktop and ensure the engine is running (the whale icon in your system tray should be green).

---

## 2. Launching the Program

### How to Launch (run.bat)
* What to do: Simply **double-click run.bat**.
* What happens: The script will automatically check for the latest application updates from the repository, pull them if available, refresh your local container, and open the web interface in your default browser at http://localhost:8080.
* Note: Keep the black command prompt window open while using the app. When you are finished with your session, press any key inside that command prompt window to safely stop the local server.
---

## 3. Step-by-Step Usage Guide

### Left Side: Configuration & File Uploads
1. Set Parameters:
   * NQN: Enter the Next Quantum Number length (default is 6).
   * unc: Choose the uncertainty handling mode (1 or 2).
   * minSize (Disabled in Beta): Set the minimum component size filter. (This field is currently greyed out for the test phase).
2. Upload Transitions File: Click the transitionFile (.txt) box and select your dataset. You will see a success confirmation in the logs window.
3. Upload Segment File (Optional): If you do not have a segment file, leave it blank! On the first run, the app will automatically generate the segment data for you.
4. Execute: Click the large blue RUN button.

### Right Side: Live Console & Report Downloads
* Logs Console: Displays live progress with auto-scrolling. If there is a format mismatch, it will scroll to the bottom and display a bright red error.
* Clear Logs Button: Located right next to the "Logs:" header. Click this to instantly wipe the log screen clean and start fresh.
* In-Memory Export Buttons: Upon a successful run, click the reports you need, and your browser will instantly download them:
   * Download Auto Segment File (Perfect for checking what the engine built).
   * Download Converted Report (The unit conversion log).
   * Download BAD Transitions (List of isolated anomalous or bad lines).
   * Download Calculated Energies (The final calculated energy levels).

---

## 4. Testing Feedback

Please share your thoughts with us regarding:
* Is this UI more intuitive than the previous CLI/legacy setup?
* Did your custom files process smoothly without crashes?
* How do you feel about the web-based file download approach?

Thank you for testing pyMARVEL!