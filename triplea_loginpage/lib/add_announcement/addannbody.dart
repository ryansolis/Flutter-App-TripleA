import 'dart:io';
import 'package:flutter/material.dart';
import 'package:triplea_loginpage/color.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';

class Announcements {
  static const ROOT = 'https://10.0.2.2/triple_a/addannouncements.php';
  static const _ADD_ANN_ACTION = 'ADD_ANN';

  static Future<String> addAnouncement(
      String title, String snippet, String description, File image) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_ANN_ACTION;
      map['title'] = title;
      map['snippet'] = snippet;
      map['description'] = description;
      map['image'] = image;
      final response = await http.post(ROOT, body: map);
      print('add response: ${response.body}');

      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  File imageFile;
  TextEditingController title = new TextEditingController();
  TextEditingController snippet = new TextEditingController();
  TextEditingController description = new TextEditingController();

  Future _openGallery(BuildContext context) async {
    // ignore: deprecated_member_use
    var _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = _image;
    });
    Navigator.of(context).pop();
  }

  Future _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    var _image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = _image;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Select from"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      },
                    ),
                  ],
                ),
              ));
        });
  }

  Future upload(File _image) async {
    // ignore: deprecated_member_use
    var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));
    var length = await _image.length();
    var uri = Uri.parse("https://10.0.2.2/triple_a/upload.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("image", stream, length,
        filename: basename(_image.path));

    request.fields['title'] = title.text;
    request.fields['snippet'] = snippet.text;
    request.fields['description'] = description.text;
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF781b1b),
      appBar: AppBar(
        backgroundColor: buttonColor,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.insert_photo),
              onPressed: () {
                _showChoiceDialog(context);
              }),
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              }),
        ],
        title: Text(
          'Cancel'.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: title,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Title',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextField(
                controller: snippet,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'About',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              if (imageFile != null)
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  height: 250.0,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: FileImage(imageFile),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  imageFile = null;
                                });
                              },
                              child: Icon(
                                Icons.delete,
                                size: 16.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              TextField(
                maxLines: 10,
                controller: description,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter announcement',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                onPressed: () {
                  //addannouncement();
                  upload(imageFile);
                  Navigator.pop(context);
                },
                color: Colors.white,
                child: Text(
                  'POST',
                  style: TextStyle(
                    fontSize: 20,
                    color: buttonColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
