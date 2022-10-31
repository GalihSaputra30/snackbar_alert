import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  showToast() {
    setState(() {
      Fluttertoast.showToast(
          msg: 'this is notification from toast',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER);
    });
  }

  showSnackbar() {
    setState(() {
      final snackBar = SnackBar(
          content: Text("This is Notification from snackbar"),
          duration: Duration(seconds: 5),
          action: SnackBarAction(label: 'undo', onPressed: () {}));
    });
  }

  void showAlert(BuildContext context) {
    setState(() {
      Widget buttonOK = MaterialButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ); // MaterialButton
      Widget buttonCancel = MaterialButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      AlertDialog alert = AlertDialog(
        title: Text("Simple Alert"),
        content: TextField(),
        actions: [
          buttonOK,
          buttonCancel,
        ],
      ); // AlertDialog
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Text("Latihan Notification"),
        ),
        body: Center(
            child: Builder(
                builder: (context) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            showToast();
                          },
                          child: Text("Show Toast"),
                        ),
                        MaterialButton(
                          onPressed: () {
                            showSnackbar();
                          },
                          child: Text("Show Snackbar"),
                        ),
                        MaterialButton(
                          onPressed: () {
                            showAlert(context);
                          },
                          child: Text("Show Alert"),
                        )
                      ],
                    ))),
      ),
    );
  }
}
