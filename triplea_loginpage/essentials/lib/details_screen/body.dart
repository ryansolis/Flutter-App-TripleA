import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
//import 'package:triplea_loginpage/announcements.dart';
import 'package:triplea_loginpage/color.dart';


class Body extends StatefulWidget {
  final String title, description, image;

  const Body({Key key, this.title, this.description, this.image}) : super(key: key);

  @override
  _BodyState createState() => _BodyState(title, description, image);
}

class _BodyState extends State<Body> {
  final FlutterTts flutterTts = FlutterTts();

  final String title, description, image;

  _BodyState(this.title, this.description, this.image);

  @override
  Widget build(BuildContext context) {

    Future _speak() async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
      await flutterTts.speak(description);
    }

    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: size.height*0.8,
          child: SingleChildScrollView(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Poster(size: size, image: 'https://10.0.2.2/triple_a/images/'+image,
                ),
                Text(title,
                style: Theme.of(context).textTheme.headline6.copyWith(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                RaisedButton(
                  child: Text("Tap to listen"),
                  onPressed: () => _speak(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20/2),
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Poster extends StatelessWidget {
  const Poster({
    Key key,
    @required this.size, 
    this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      height: size.width * 0.8,
      child: Stack(
        children: <Widget> [
        Container( 
          height: size.width*0.7,
          width: size.width*0.7,
        ),
        Image.network(
          image,
          height: size.width*0.7,
          width: size.width*0.7,
          fit: BoxFit.scaleDown,
        )
      ],)
    );
  }
}