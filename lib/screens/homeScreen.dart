import 'package:answers/models/answer.dart';
import 'package:answers/services/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cevapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        buttonColor: Color(0xFF233DFF),
        backgroundColor: Color(0xFF233DFF),
      ),
      home: CevappHomePage(),
    );
  }
}

class CevappHomePage extends StatefulWidget {
  CevappHomePage();

  @override
  _CevappHomePageState createState() => _CevappHomePageState();
}

class _CevappHomePageState extends State<CevappHomePage> with TickerProviderStateMixin {
  late AnimationController controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
  late Animation opacityAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(controller);

  String _currentAnswer = "";
  Controller controllerClass = Controller();

  void _newAnswer() async {
    Answer answer = controllerClass.getAnswer();

    setState(() {
      controller =
          AnimationController(vsync: this, duration: Duration(seconds: 5));

      opacityAnimation =
          Tween<double>(begin: 0.0, end: 1.0).animate(controller);

      controller.addListener(() {
        setState(() {});
      });

      controller.repeat();

      _currentAnswer = answer.answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: mediaSize.height,
          width: mediaSize.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Colors.white,
                Color(0xFF233DFF),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Cevapp',
                style: GoogleFonts.nunito(
                    fontSize: mediaSize.height * 0.08,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: mediaSize.height * 0.2,
              ),
              Center(
                child: Text(
                  _currentAnswer,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      fontSize: mediaSize.width * 0.07,
                      color: Colors.blue.shade900
                          .withOpacity(opacityAnimation.value)),
                ),
              ),
              SizedBox(height: mediaSize.height * 0.2),
              ElevatedButton(
                onPressed: _newAnswer,
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(mediaSize.width * 0.5, mediaSize.height * 0.1),
                  primary: Theme.of(context).buttonColor,
                  elevation: 2,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                child: Text(
                  'Yeni Cevap Bul',
                  style: GoogleFonts.nunito(
                      fontSize: mediaSize.width * 0.06,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonColor,
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context),
          );
        },
        tooltip: 'Nedir?',
        child: Icon(Icons.help),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Cevapp Nedir?',
          style: GoogleFonts.nunito(color: Colors.blue)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              "Cevapp olumlu/olumsuz sonucunu kestiremediğiniz sorularınızda size yol gösterir. Sorunuzu sorun ve doğru anı hissetiğinizde butona basın. Çıkan yanıt size yardımcı olacaktır.",
              style: GoogleFonts.nunito()),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
          child: Text('Anladım',
              style: GoogleFonts.nunito(color: Colors.blue)),
        ),
      ],
    );
  }
}
