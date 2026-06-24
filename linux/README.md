# pyMARVEL – User Guide (Linux Beta)

Welcome to the Linux beta test version of the pyMARVEL graphical user interface!

---

## 1. Prerequisites (One-time Setup)

Since the application is fully containerized, you do not need to install Python. The only requirement is having Docker running on your machine.

1. Ensure Docker is installed on your system (e.g., `docker-ce` or `docker.io`).
2. Make sure the Docker service is running (you can start it with `sudo systemctl start docker`).

---

## 2. Launching the Program

### Step 1: Grant Permission & Launch (Quick Method)
Linux security requires you to explicitly grant execution privileges to the script before the first run. 

1. Open your Terminal.
2. Navigate to this folder (for example: `cd ~/Downloads/pyMARVEL/linux`).
3. Run the following combined command and press Enter:
   chmod +x run.sh && ./run.sh

*Note: Because Docker usually requires root privileges on Linux, the script may prompt you for your `sudo` password to pull the image and manage the container.*

### Step 2: What Happens Next
* **Automated Setup:** The script will automatically check for the latest application updates from Docker Hub, pull them if available, refresh your local container environment, and attempt to automatically open the user interface in your default browser at http://localhost:8080.
* **Manual Fail-safe:** If your Linux distribution configuration prevents the browser from opening automatically, simply open any browser and navigate manually to: http://localhost:8080
* **Closing the App:** Keep the Terminal window open while using the app. When you are finished with your session, press **CTRL + C** inside that Terminal window to safely stop and clean up the local server.

---

## 3. Step-by-Step Usage Guide

### Left Side: Configuration & File Uploads
1. **Set Parameters:**
   * **NQN:** Enter the Next Quantum Number length (default is 6).
   * **unc:** Choose the uncertainty handling mode (1 or 2).
   * **minSize (Disabled in Beta):** Set the minimum component size filter. (This field is currently greyed out for the test phase).
2. **Upload Transitions File:** Click the `transitionFile (.txt) *` box and select your dataset. You will see a green success confirmation in the logs window.
3. **Upload Segment File (Optional):** If you do not have a segment file, leave it blank! The app will automatically generate the segment data for you from the transition file.
4. **Execute:** Click the large blue **RUN** button.

### Right Side: Live Console & Report Downloads
* **Logs Console:** Displays live progress with auto-scrolling. If there is a format mismatch, it will display a bright red error.
* **Clear Logs Button:** Located right next to the "Logs:" header. Click this to instantly wipe the log screen clean and start fresh.
* **In-Memory Export Buttons:** Upon a successful run, the export buttons will light up. Click the reports you need, and your browser will instantly download them:
   * **Download Auto Segment File** (Perfect for saving the segment file that the engine built for you).
   * **Download Converted Report** (The unit conversion log).
   * **Download BAD Transitions** (List of isolated anomalous or bad lines).
   * **Download Calculated Energies** (The final calculated energy levels).

---

## 4. Testing Feedback

Please share your thoughts with us regarding:
* Is this UI more intuitive than the previous CLI/legacy setup?
* Did your custom files process smoothly without crashes?
* How do you feel about the web-based file download approach?

Thank you for testing pyMARVEL!
