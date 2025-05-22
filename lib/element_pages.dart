import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WindSpeedPage extends StatelessWidget {
  const WindSpeedPage({super.key, required this.speed});
  final String speed;
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
  final String pressure;
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
  final String index;
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

class HumidityPage extends StatelessWidget {
  const HumidityPage({super.key, required this.humidity});
  final String humidity;
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
                    'Humidity Information',
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
  final String coverage;
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
  final String time;
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
  final String time;
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
  const TemperaturePage({super.key, required this.temp});
  final String temp;
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
  final String vis;
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