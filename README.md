# Destimate API

## MSIB 5 Alterra Academy Capstone Project 2023
Alterra Capstone Team ID : 2 - Sustain Tour <br>
Here is our repository for Backend Golang Capstone project - Destimate

## API Description
Destimate API is an application that serves as the back-end of the system, designed using Golang and Echo for API creation and using Bcrypt for user authentication security. In order to verify user access, we utilize JWT (JSON Web Token) to provide a secure and efficient method. In addition, we use Cloud Storage Bucket to store images integrated with our Cloud SQL database, ensuring effective and flexible data management. The entire application is hosted on Google App Engine, which ensures optimal scalability, reliability and speed for our high-performance applications.
<br>

## The Team
- Muhammad Aimar Rizki Utama
- Bryan Rizki Prakosa
- Laode Saady
- Stefanny
- Zahr Fitria Maharani
## Repository

|   Learning Paths   |                                Link                                |
| :----------------: | :----------------------------------------------------------------: |
| Mobile Development | [Github](https://github.com/Capstone-Tim-02/sustain-tour-mobile) |
| Front End Landing Page - WEB | [Github](https://github.com/Capstone-Tim-02/sustain-tour-frontend-landing-page)  |
| Front End CMS - WEB  | [Github](https://github.com/Capstone-Tim-02/sustain-tour-frontend-cms)  |
| Quality Assurance | [Github](https://github.com/Capstone-Tim-02/sustain-tour-quality-assurance) |

## Cloud Architecture Destimate
![Cloud Architecture Destimate](https://storage.googleapis.com/destimate/Screenshot%202023-12-19%20at%2004.08.32.png)

## API URL & DOCUMENTATION
[Destimate API URL & DOCUMENTATION](https://destimate.uc.r.appspot.com/)

## How this API runs on Google Cloud Platform:
1. Create Cloud Storage Bucket -> Export key.json -> Add key.json to keys directory
2. Create Cloud SQL Instance (MySQL) -> Import db_destimate.sql
3. Create App Engine -> Deploy

## Deploy Destimate to App Engine
1. Create App Engine on Google Cloud Platform
2. Clone this Repository ```git clone https://github.com/Capstone-Tim-02/sustain-tour-backend.git```
3. Create .env in app engine terminal and configure your env
5. Run the ```gcloud init``` command to initialize, configure, or authenticate the Google Cloud SDK client
6. Finally, run the ```gcloud app deploy``` command to start deploying the API to the server.
