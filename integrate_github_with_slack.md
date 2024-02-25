### Step 1: Create a Slack App
- Navigate to Your Slack Apps: Visit the Slack API page (https://api.slack.com/apps) and log in if necessary.
- Create New App: Click "Create New App", select "From scratch", name your app, and choose your workspace.
- Permissions: Access the "OAuth & Permissions" page in your app settings and add necessary bot token scopes, such as chat:write.
- Install the App: Install the app in your workspace and note the Bot User OAuth Token for authentication.

### Step 2: Set up an Incoming Webhook in Slack
- Incoming Webhooks: In your app settings, find "Incoming Webhooks" and enable them.
- Create New Webhook: Click "Add New Webhook to Workspace", select the channel for notifications, and authorize the app.
- Webhook URL: Copy the Webhook URL provided; this is what GitHub will call.

### Step 3: Configure GitHub Webhook
- GitHub Repository Settings: Go to your GitHub repository, navigate to "Settings" > "Webhooks" > "Add webhook".

#### Webhook Settings:
- Payload URL: Enter the Slack Webhook URL you copied.
- Content type: Choose application/json.
- Events: Select "Let me select individual events." Opt for "Pushes" and any other relevant events. There isn't a specific event for file creation or modification, but "Pushes" typically covers these actions.
- Active: Ensure the webhook is set to active.
- Save: Click "Add webhook".


test test test test
