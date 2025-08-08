# Installation

1. Setup venv

   ```sh
   python -m venv venv
   ```

2. Activate virtual environment

   - macOS/linux

     ```sh
     source venv/bin/activate
     ```

   - windows

     ```sh
     venv\Scripts\activate
     ```

3. Install Robotframework

   ```sh
   pip install robotframework
   ```

4. Install Robotframework-SeleniumLibrary

   ```sh
   pip install robotframework-seleniumLibrary
   ```
5. Install Robotframework-RequestsLibrary

   ```sh
   pip install robotframework-requests
   ```

# Assignment 2.1: Web UI Automation

1. Source code : [web_ui_test.robot](./web_ui_test.robot)
2. วิธีการรันสคริปต์
   ```sh
   robot web_ui_test.robot
   ```
3. รายงานผลการทดสอบ
   ![Log_Web_UI_1](./images/webui_1.png)
   ![Log_Web_UI_2](./images/webui_2.png)
   ![Log_Web_UI_3](./images/webui_3.png)

# Assignment 2.2: API Automation

1. Source code : [api_test.robot](./api_test.robot)
2. วิธีการรันสคริปต์
   ```sh
   robot api_test.robot
   ```
3. รายงานผลการทดสอบ
   ![Log_API_1](./images/api_1.png)
   ![Log_API_2](./images/api_2.png)
