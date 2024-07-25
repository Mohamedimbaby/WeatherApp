
# Weatherly app

A brief description of what this project does and who it's for

Weatherly App
Welcome to the Weather App! This app allows users to search for cities and view detailed weather information for each city. The app includes details about current weather conditions, snow, rain, soil temperature, and a 5-day weather forecast.

Features
City Search: Search for any city using keywords.
Weather Details: View detailed weather information for the selected city.
5-Day Forecast: See the weather forecast for the next 5 days, including information about snow, rain, and soil temperature.
Screenshots


Installation
To run this app locally, follow these steps:


Requirements
Flutter SDK: Ensure you have Flutter SDK version 3.19.4 installed. You can download it from the official Flutter website.
Usage
Search for a City: Enter the name of the city you want to search for in the search bar.
Select a City: Tap on the city from the search results to navigate to the details screen.
View Weather Details: On the details screen, view current weather information including snow, rain, soil temperature, and the 5-day weather forecast.

Project Structure
The project structure is organized as follows:

main.dart: The entry point of the application.
ui/: Contains the main screens of the app (search and details).
models/: Contains data models used in the app.
services/: Contains services for fetching weather data.



#Screen shots
![Screenshot_1721857930](https://github.com/user-attachments/assets/c0354f3a-8a07-47b0-a9bf-3346f5d2f34d)

![Screenshot_1721857938](https://github.com/user-attachments/assets/e0892c79-5a8c-4c50-bc62-a460bbbcb437)
![Screenshot_1721857867](https://github.com/user-attachments/assets/b658a34d-6058-4f3d-a046-50ca18f07073)![Screenshot_1721858987](https://github.com/user-attachments/assets/56af749a-4fd3-4214-8318-d343d2d354bb)

![Screenshot_1721857946](https://github.com/user-attachments/assets/e3ac04e1-6365-4f0b-8afd-72e9d857538f)

Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your changes. Make sure to follow the code style and include appropriate tests.



Contact
If you have any questions or feedback, feel free to reach out to me at Mohamedimbaby999@gmail.com.
## API Reference

#### Get city current temperature degree

```http
  GET latitude=$lat&longitude=$long&current=temperature_2m&current_weather=true
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `latitude`      | `double` | **Required**. latitude of item to fetch |
| `longitude`      | `double` | **Required**. longitude of item to fetch |

#### Get city temperature details

```http
  GET latitude=$lat&longitude=$lng&hourly=temperature_2m,wind_speed_10m,,soil_temperature_0cm,rain,snowfall,wind_direction_10m,weather_code&forecast_days=5&current_weather=true
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `latitude`      | `double` | **Required**. latitude of item to fetch |
| `longitude`      | `double` | **Required**. longitude of item to fetch |


