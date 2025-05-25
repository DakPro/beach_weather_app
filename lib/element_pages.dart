import 'package:flutter/material.dart';
import 'package:beach_weather_app/stats/percentage_graph.dart';
import 'package:beach_weather_app/stats/values_graph.dart';

class WindSpeedPage extends StatelessWidget {
  const WindSpeedPage({super.key, required this.speed});
  final Map speed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Wind Speed Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(12.0),
                    height: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Current Wind Speed: ${speed.values.first.round()} km/h.\n',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF121418),
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'The wind speed for the next 24 hours has been displayed below. It is recommended to look for higher wind speeds if planning to go sailing, and lower wind speeds if hoping to enjoy a day on the beach.\n\n', style: TextStyle(fontSize: 12, color: Color(0xFF121418))),
                        ],
                      ),
                    )
                ),
                SizedBox(height: 10),
                Container(
                  height: 260,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ValGraph(loadData: speed, title: 'Wind Speed Next 24h'),
                ),
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
} // DONE

class PressurePage extends StatelessWidget {
  const PressurePage({super.key, required this.pressure});
  final Map pressure;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 44),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'MSL Pressure Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    height: 460,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'Weather information...',
                      style: TextStyle(),
                    )
                )
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WavesPage extends StatelessWidget {
  const WavesPage({super.key, required this.waves});
  final String waves;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Wave Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(12.0),
                    height: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Current Wave Height: $waves m.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF121418),
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'What wave heights are considered dangerous?\n', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF121418))),
                          TextSpan(text: 'Generally, waves over 1 m tall are dangerous to children and some more sensitive adults, whilst anything above 1.5 m is able to cause serious injuries to anyone in its path. Nonetheless, you should always be cautious when the sea is turbulent.\n\n', style: TextStyle(fontSize: 12, color: Color(0xFF121418))),
                        ],
                      ),
                    )
                ),
              ]
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        height: 100.0,
        color: Color(0xFF263644),
        child: Text('Sourced from: McKiernan, M. (2025, March 20). Why small changes in wave height can create big dangers for boaters, rock fishermen, and beachgoers — DECKEE. DECKEE. https://deckee.com/blog/why-small-changes-in-wave-height-can-create-big-dangers-for-boaters-rock-fishermen-and-beachgoers',
          style: TextStyle(
            color: Color(0xFF121418),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
} // DONE

class AQIPage extends StatelessWidget {
  const AQIPage({super.key, required this.index});
  final Map index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'AQI Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(12.0),
                    height: 500,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Current AQI: ${index.values.first.round()}.\n\n',
                        style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF121418),
                      ),
                        children: const <TextSpan>[
                          TextSpan(text: 'What is AQI for?\n', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF121418))),
                          TextSpan(text: 'The air quality index is a tool for communicating about the outdoor air quality and its effects on health. The higher the AQI value, the greater the level of air pollution and increase in health risks.\n\n', style: TextStyle(fontSize: 12, color: Color(0xFF121418))),
                          TextSpan(text: 'Good (0 to 50): Air quality is satisfactory, and air pollution poses little or no risk.\n'
                          'Moderate (51 to 100): Air quality is acceptable. However, there may be a risk for some people, particularly those who are unusually sensitive to air pollution.\n'
                          'Unhealthy for Sensitive Groups (101 to 150): Members of sensitive groups may experience health effects. The general public is less likely to be affected.\n'
                          'Unhealthy (151 to 200): Some members of the general public may experience health effects; members of sensitive groups may experience more serious health effects.\n'
                          'Very Unhealthy (201 to 300): The risk of health effects is increased for everyone.\n'
                          'Hazardous (301 and higher): Health warnings for emergency conditions, everyone is more likely to be affected.', style: TextStyle(fontSize: 12, color: Color(0xFF121418)))
                        ],
                      ),
                    )
                ),
              ]
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        height: 50.0,
        color: Color(0xFF263644),
        child: Text('Sourced from: AQI Basics | AirNow.gov. (n.d.). https://www.airnow.gov/aqi/aqi-basics/',
        style: TextStyle(
            color: Color(0xFF121418),
        fontSize: 10,
        fontWeight: FontWeight.bold,
        ),
      ),
      ),
    );
  }
} // DONE

class TidePage extends StatelessWidget {
  const TidePage({super.key, required this.tide});
  final String tide;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Tide Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(12.0),
                    height: 500,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Current Tide: $tide.\n\n',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF121418),
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'What are tides?\n', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF121418))),
                          TextSpan(text: 'Tides are influenced by the gravitational pull from the Moon and Sun. Due to the Moon\'s elliptic orbit, twice a month, the Moon, Sun and Earth are aligned and create a combined gravitational force. This may result in more or less of the beach\'s surface being covered by water.\n\n', style: TextStyle(fontSize: 12, color: Color(0xFF121418))),
                          TextSpan(text: 'Low tides: Also called neap tides, they happen twice a month, when the Moon faces the Earth at a right angle to the Sun, so their gravitational forces work against each other. Low tides can be dangerous when participating in activities such as regular or kite surfing, as they leave parts of the beach that are further out, and usually contain sharp rocks that could cause injury, exposed. They can be good for experienced surfers, as they create faster and more hollow waves.\n'
                              'High tides: Also called spring tides, they too happen twice a month, when the Sun, Moon and Earth are in alignment and the gravitational force is strong. Waves are more likely to be flat during these periods, creating poor conditions for surfing.\n', style: TextStyle(fontSize: 12, color: Color(0xFF121418)))
                        ],
                      ),
                    )
                ),
              ]
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        height: 50.0,
        color: Color(0xFF263644),
        child: Text('Sourced from: Tides. (n.d.). Met Office. https://weather.metoffice.gov.uk/learn-about/weather/oceans/tides',
          style: TextStyle(
            color: Color(0xFF121418),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
} // DONE

class PrecipitationPage extends StatelessWidget {
  const PrecipitationPage({super.key, required this.prec, required this.precp});
  final Map prec, precp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Precipitation Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(12.0),
                    height: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Current Precipitation: ${prec.values.first.round()} mm.\n',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF121418),
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'The probability of precipitation for the next 24 hours has been displayed below. Additionally, the second graph below is displaying the precipitation over the same time period. For an ideal day at the beach, it is recommended to go when both values are low. Make sure to plan your day accordingly.\n\n', style: TextStyle(fontSize: 12, color: Color(0xFF121418))),
                        ],
                      ),
                    )
                ),
                SizedBox(height: 10),
                Container(
                  height: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Graph(loadData: precp, title: 'Probability of Precipitation'),
                ),
                SizedBox(height: 10),
                Container(
                  height: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ValGraph(loadData: prec, title: 'Precipitation Next 24h'),
                ),
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
} // DONE

class CloudCoveragePage extends StatelessWidget {
  const CloudCoveragePage({super.key, required this.coverage});
  final Map coverage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'Cloud Coverage Information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF122428),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.all(12.0),
                      height: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF264864).withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: 'Current Cloud Coverage: ${coverage.values.first.round()}%.\n',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF121418),
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: 'The cloud coverage for the next 24 hours has been displayed below. Make sure to plan your day accordingly.\n\n', style: TextStyle(fontSize: 12, color: Color(0xFF121418))),
                            ],
                        ),
                      )
                  ),
                SizedBox(height: 10),
                Container(
                    height: 260,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Graph(loadData: coverage, title: 'Cloud Coverage Next 24h'),
                ),
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
} // DONE

class SunsetPage extends StatelessWidget {
  const SunsetPage({super.key, required this.time});
  final List time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 44),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Sunset Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'Weather information...',
                      style: TextStyle(),
                    )
                ),
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SunrisePage extends StatelessWidget {
  const SunrisePage({super.key, required this.time});
  final List time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 44),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Sunrise Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    height: 460,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'Weather information...',
                      style: TextStyle(),
                    )
                )
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key, required this.temp, required this.atemp});
  final Map temp, atemp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Temperature Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(12.0),
                    height: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Current Temperature: ${temp.values.first.round()}°C.\nApparent Temperature: ${atemp.values.first.round()}°C.\n',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF121418),
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'Both the temperature and apparent temperature for the next 24 hours have been displayed below. For a day at the beach, most people prefer temperatures between 25°C and 35°C.\n', style: TextStyle(fontSize: 12, color: Color(0xFF121418))),
                        ],
                      ),
                    )
                ),
                SizedBox(height: 10),
                Container(
                  height: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ValGraph(loadData: temp, title: 'Temperature Next 24h'),
                ),
                SizedBox(height: 10),
                Container(
                  height: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ValGraph(loadData: atemp, title: 'Apparent Temperature Next 24h'),
                ),
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
} // DONE

class UVPage extends StatelessWidget {
  const UVPage({super.key, required this.uv});
  final String uv;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 44),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'UV Index Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    height: 460,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'Weather information...',
                      style: TextStyle(),
                    )
                )
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VisibilityPage extends StatelessWidget {
  const VisibilityPage({super.key, required this.vis});
  final Map vis;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF264864),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Visibility Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF122428),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(12.0),
                    height: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF264864).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Current Visibility: ${(vis.values.first / 1000).round()} km.\n',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF121418),
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'The visibility for the next 24 hours has been displayed below. In general, values above 15 km indicate clear skies and are favourable, especially if planning to participate in any water sports that may lead you further away from the shore, as it improves the ability of lifeguards and people on the beach to see you in case of emergency.\n\n', style: TextStyle(fontSize: 12, color: Color(0xFF121418))),
                        ],
                      ),
                    )
                ),
                SizedBox(height: 10),
                Container(
                  height: 260,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF264864).withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ValGraph(loadData: Map.fromEntries(vis.entries.map((entry) => MapEntry(entry.key, entry.value / 1000))), title: 'Visibility Next 24h'),
                ),
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
} // DONE