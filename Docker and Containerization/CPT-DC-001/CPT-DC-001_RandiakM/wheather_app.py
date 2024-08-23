from flask import Flask, request, render_template, jsonify
import requests

app = Flask(__name__)

# Your OpenWeatherMap API Key
API_KEY = 'YOUR_API_KEY'
GEO_URL = 'http://api.openweathermap.org/geo/1.0/direct'
WEATHER_URL = 'https://api.openweathermap.org/data/2.5/weather'

# Predefined list of cities
cities = ['London', 'New York', 'Paris', 'Tokyo', 'Sydney']

@app.route('/')
def home():
    return render_template('index.html', cities=cities)

@app.route('/weather')
def get_weather():
    city = request.args.get('city')
    if not city:
        return jsonify({'error': 'City parameter is required'}), 400
    
    # Get the latitude and longitude for the city
    geo_params = {
        'q': city,
        'limit': 1,
        'appid': API_KEY
    }
    geo_response = requests.get(GEO_URL, params=geo_params)
    
    # Debugging output
    print("Requested URL:", geo_response.url)
    print("Status Code:", geo_response.status_code)
    print("Response Text:", geo_response.text)

    if geo_response.status_code != 200:
        return jsonify({'error': 'Error fetching location data'}), geo_response.status_code
    
    geo_data = geo_response.json()
    
    if not geo_data:
        return jsonify({'error': 'City not found'}), 404
    
    try:
        lat = geo_data[0]['lat']
        lon = geo_data[0]['lon']
    except (IndexError, KeyError) as e:
        return jsonify({'error': 'Invalid location data returned from API'}), 500
    
    # Get the weather data using the correct API endpoint
    weather_params = {
        'lat': lat,
        'lon': lon,
        'appid': API_KEY,
        'units': 'metric'  # or 'imperial' for Fahrenheit
    }
    
    weather_response = requests.get(WEATHER_URL, params=weather_params)
    
    if weather_response.status_code != 200:
        return jsonify({'error': 'Error fetching weather data'}), weather_response.status_code
    
    weather_data = weather_response.json()
    
    if 'main' in weather_data:
        current_weather = {
            'city': weather_data.get('name', city),
            'temperature': weather_data['main']['temp'],
            'description': weather_data['weather'][0]['description'],
            'humidity': weather_data['main']['humidity'],
            'wind_speed': weather_data['wind']['speed']
        }
        return render_template('weather.html', weather=current_weather)
    else:
        return jsonify({'error': 'Unable to fetch weather data'}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
