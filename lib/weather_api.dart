import 'dart:io';

// Future<void> callMeteoApi(double latitude, double longitude) async
void main() async {
  var latitude = 52.71;
  var longitude = 13.41;
  String pythonCode =
  '''import openmeteo_requests

import pandas as pd
import requests_cache
from retry_requests import retry

# Setup the Open-Meteo API client with cache and retry on error
cache_session = requests_cache.CachedSession('.cache', expire_after = 3600)
retry_session = retry(cache_session, retries = 5, backoff_factor = 0.2)
openmeteo = openmeteo_requests.Client(session = retry_session)

# Make sure all required weather variables are listed here
# The order of variables in hourly or daily is important to assign them correctly below
url = "https://api.open-meteo.com/v1/forecast"
params = {
    "latitude": $latitude,
    "longitude": $longitude,
    "daily": ["uv_index_max", "sunrise", "sunset"],
    "hourly": ["temperature_2m", "relative_humidity_2m", "apparent_temperature", "precipitation_probability", "pressure_msl", "cloud_cover", "visibility", "wind_speed_80m"],
    "current": ["temperature_2m", "relative_humidity_2m", "apparent_temperature", "wind_speed_10m", "precipitation", "cloud_cover", "pressure_msl"]
}
responses = openmeteo.weather_api(url, params=params)

# Process first location. Add a for-loop for multiple locations or weather models
response = responses[0]
print(f"Coordinates {response.Latitude()}°N {response.Longitude()}°E")
print(f"Elevation {response.Elevation()} m asl")
print(f"Timezone {response.Timezone()}{response.TimezoneAbbreviation()}")
print(f"Timezone difference to GMT+0 {response.UtcOffsetSeconds()} s")

# Current values. The order of variables needs to be the same as requested.
current = response.Current()
current_temperature_2m = current.Variables(0).Value()
current_relative_humidity_2m = current.Variables(1).Value()
current_apparent_temperature = current.Variables(2).Value()
current_wind_speed_10m = current.Variables(3).Value()
current_precipitation = current.Variables(4).Value()
current_cloud_cover = current.Variables(5).Value()
current_pressure_msl = current.Variables(6).Value()

print(f"Current time {current.Time()}")
print(f"Current temperature_2m {current_temperature_2m}")
print(f"Current relative_humidity_2m {current_relative_humidity_2m}")
print(f"Current apparent_temperature {current_apparent_temperature}")
print(f"Current wind_speed_10m {current_wind_speed_10m}")
print(f"Current precipitation {current_precipitation}")
print(f"Current cloud_cover {current_cloud_cover}")
print(f"Current pressure_msl {current_pressure_msl}")

# Process hourly data. The order of variables needs to be the same as requested.
hourly = response.Hourly()
hourly_temperature_2m = hourly.Variables(0).ValuesAsNumpy()
hourly_relative_humidity_2m = hourly.Variables(1).ValuesAsNumpy()
hourly_apparent_temperature = hourly.Variables(2).ValuesAsNumpy()
hourly_precipitation_probability = hourly.Variables(3).ValuesAsNumpy()
hourly_pressure_msl = hourly.Variables(4).ValuesAsNumpy()
hourly_cloud_cover = hourly.Variables(5).ValuesAsNumpy()
hourly_visibility = hourly.Variables(6).ValuesAsNumpy()
hourly_wind_speed_80m = hourly.Variables(7).ValuesAsNumpy()

hourly_data = {"date": pd.date_range(
    start = pd.to_datetime(hourly.Time(), unit = "s", utc = True),
    end = pd.to_datetime(hourly.TimeEnd(), unit = "s", utc = True),
    freq = pd.Timedelta(seconds = hourly.Interval()),
    inclusive = "left"
)}

hourly_data["temperature_2m"] = hourly_temperature_2m
hourly_data["relative_humidity_2m"] = hourly_relative_humidity_2m
hourly_data["apparent_temperature"] = hourly_apparent_temperature
hourly_data["precipitation_probability"] = hourly_precipitation_probability
hourly_data["pressure_msl"] = hourly_pressure_msl
hourly_data["cloud_cover"] = hourly_cloud_cover
hourly_data["visibility"] = hourly_visibility
hourly_data["wind_speed_80m"] = hourly_wind_speed_80m

hourly_dataframe = pd.DataFrame(data = hourly_data)
print(hourly_dataframe)

# Process daily data. The order of variables needs to be the same as requested.
daily = response.Daily()
daily_uv_index_max = daily.Variables(0).ValuesAsNumpy()
daily_sunrise = daily.Variables(1).ValuesInt64AsNumpy()
daily_sunset = daily.Variables(2).ValuesInt64AsNumpy()

daily_data = {"date": pd.date_range(
	start = pd.to_datetime(daily.Time(), unit = "s", utc = True),
	end = pd.to_datetime(daily.TimeEnd(), unit = "s", utc = True),
	freq = pd.Timedelta(seconds = daily.Interval()),
	inclusive = "left"
)}

daily_data["uv_index_max"] = daily_uv_index_max
daily_data["sunrise"] = daily_sunrise
daily_data["sunset"] = daily_sunset

daily_dataframe = pd.DataFrame(data = daily_data)
print(daily_dataframe)''';

  File pythonFile = File('meteo_api.py');
  await pythonFile.writeAsString(pythonCode);
  final result = await Process.run('python', ['meteo_api.py']);
  print(result.stdout);
  print(result.stderr);
}