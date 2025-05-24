import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
                    'Waves Information',
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
}

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