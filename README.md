# Zoom Manager

## Zoom API APP Information
- Client ID: p7vvc7rAQuGlBq4_rK_xEg
- Client Secret: gHRLjafXkXE65MVEJZ84t2mWe2uKW36J
- Secret Token: CCB58E6DTveIkUquVYGjhQ
- Verification Token: 96rl6VUDT7GYxeOMj8h2lQ (Retires in August 2024)
- Scopes:
    meeting:update:meeting meeting:delete:meeting meeting:write:invite_links meeting:write:meeting meeting:read:list_upcoming_meetings meeting:read:participant meeting:read:meeting meeting:read:chat_message meeting:read:invitation
- Authorization URL: https://zoom.us/oauth/authorize?response_type=code&client_id=vFRcsT3jSU2QsmFupBbPkA&redirect_uri=https://properservices-dev-ed.develop.my.salesforce.com/services/authcallback/Zoom_Auth

## Salesforce Information

### Auth. Provider
- Name: Zoom_Auth
- Callback URL: https://properservices-dev-ed.develop.my.salesforce.com/services/authcallback/Zoom_Auth
- OAuth Only Callback URL: https://properservices-dev-ed.develop.my.salesforce.com/services/auth/oauth/Zoom_Auth

### Named Credentials
- Name: Zoom_Connect
- URL: https://api.zoom.us/v2
- Authentication Provider: Zoom Auth
- Generate Authorization Header: true
- Allow Merge Fields in HTTP Header: true




DEV ED Org - proper@zoomapp.com (amit1to4)

meeting.chat_message_file_sent
meeting.chat_message_sent
meeting.deleted
meeting.updated


===========
BLOCKERS
===========
=> Clicking on Recurring Meeting showing error.
=> https://app.ipgeolocation.io/