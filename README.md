# Destimate API

## MSIB 5 Alterra Academy Capstone Project 2023
Alterra Capstone Team ID : 2 - Sustain Tour <br>
Here is our repository for Backend Golang Capstone project - Destimate

# Destimate API: Your Gateway to Seamless and Eco-Friendly Travel Experiences

Welcome to Destimate API, the robust backend solution powering an innovative travel application crafted with Golang, Echo, and cutting-edge technologies. Elevate your travel experience with our eco-friendly approach, seamlessly blending technology and nature.

## Key Features

### 1. Golang and Echo Powerhouse
Harness the speed and efficiency of Golang paired with the elegance of Echo to create a high-performance API that drives the heart of Destimate. Enjoy lightning-fast responses and a developer-friendly framework for building robust APIs.

### 2. Fortified Security with Bcrypt
Safeguarding user data is our top priority. Destimate API employs Bcrypt for user authentication, ensuring your personal information is protected with industry-leading security measures.

### 3. JWT for Seamless User Authentication
Experience a secure and efficient user access control system through JSON Web Tokens (JWT). Your credentials are verified seamlessly, providing a frictionless and secure journey within the Destimate ecosystem.

### 4. Cloud Storage Integration
Immerse yourself in a seamless multimedia experience with Cloud Storage Bucket integration. Our API seamlessly manages and serves images, enhancing your travel interactions. Your memories are securely stored and readily accessible for an enriched user experience.

### 5. Dynamic Data Management with Cloud SQL
Destimate API integrates seamlessly with Cloud SQL, offering a robust and flexible data management system. Experience dynamic and efficient data handling, ensuring a smooth and reliable interaction with our application.

### 6. Hosted on Google App Engine
Elevate your scalability, reliability, and speed with Destimate API hosted on Google App Engine. Enjoy optimal performance and responsiveness, ensuring an unparalleled travel application experience.

## Why Choose Destimate API

- **Eco-Friendly Focus:** We believe in responsible travel. Destimate API aligns with eco-friendly practices, providing a guilt-free travel experience that respects and preserves the environment.

- **Optimized Performance:** Our API is finely tuned for optimal performance, ensuring a seamless and responsive experience for users exploring the wonders of the world.

- **Scalability and Reliability:** With Google App Engine as our hosting platform, Destimate API offers unmatched scalability and reliability, providing a foundation for growth and innovation.

Embark on your next adventure with Destimate API, where technology meets eco-conscious travel for an unforgettable journey. Explore, experience, and embrace the future of sustainable tourism.


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
