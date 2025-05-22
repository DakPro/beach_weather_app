import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WindSpeedPage extends StatelessWidget {
  const WindSpeedPage({super.key});
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
      body: SingleChildScrollView(
        child: Container(
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
            SizedBox(height: 90)
          ],
        ),
      ),
    ),
    );
  }
}

class WavesPage extends StatelessWidget {
  const WavesPage({super.key});
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }
}

class AQIPage extends StatelessWidget {
  const AQIPage({super.key});
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }
}

class TidePage extends StatelessWidget {
  const TidePage({super.key});
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }
}

class HumidityPage extends StatelessWidget {
  const HumidityPage({super.key});
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }
}

class CloudCoveragePage extends StatelessWidget {
  const CloudCoveragePage({super.key});
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }
}

class SunRiseSetPage extends StatelessWidget {
  const SunRiseSetPage({super.key});
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }
}

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key});
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }
}

class UVPage extends StatelessWidget {
  const UVPage({super.key});
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }
}

class VisibilityPage extends StatelessWidget {
  const VisibilityPage({super.key});
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }
}