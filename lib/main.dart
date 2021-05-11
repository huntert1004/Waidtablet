import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:permission_handler/permission_handler.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webview Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}



  Future hello() async{
    // super.initState();
    var status = await Permission.speech.request();
    if (status.isGranted) {print("U enabled your mic");}
    else{
      print("U f'd up");
    }
    print(status);




  // Or call your function here
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final myController = TextEditingController();
  String url = 'https://waidai.netlify.app';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  Widget buildWebView(BuildContext context, _title, _showBackButton) {
    return WebviewScaffold(
      url: this.url,
      appBar: new AppBar(
        title: Text(""),
        //  button: RaisedButton(
        //   child: Text("Rock & Roll"),
        //   color: Colors.red,
        //   onPressed: () => hello(),
        //
        // ),
      ),

      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        child:  Center(
          child: CircularProgressIndicator(),

        ),
      ),
      // bottomNavigationBar:
      //    Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //   ElevatedButton.icon(
      //   icon: Icon(Icons.arrow_forward, size: 16),
      //   label: Text('Icon Button'),
      //   onPressed: () => hello(),
      // ),
      //   ]
      //
      // ),

        //   body: ListView(
        //       children: <Widget>[
        //
        //   Center(
        //
        //   )
        // ]



// ),
    );
  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
             key: _scaffoldKey,
             appBar: AppBar(title: const Text('Drawer Demo')),
            body: Center(
               child: ElevatedButton(
                 // child: Text('enable mic'),
                 // child: const Text('enable mic'),
                onPressed: _goToWebView,

           child: ElevatedButton(
             onPressed: hello,
             child: Text('enable mic'),
           ),

               ),
             ),
             drawer: Drawer(
               child: Center(
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     const Text('This is the Drawer'),


                   ],

                 ),
               ),

             ),

             // Disable opening the drawer with a swipe gesture.
             drawerEnableOpenDragGesture: false,
           );
  }

  void _goToWebView(){
    hello();
    String text = "https://waidai.netlify.app";
    if(text == "" || text == null){
      return _showAlert("Url Cannot Empty");
    }

    
    setState(() {
      url = text;
    });
    
    Navigator.of(context).push(MaterialPageRoute( 
      builder: (context) => buildWebView(context, "Webview Example", false)
    ));
  }

  void _showAlert(text){
    SnackBar snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Drawer _createDrawer()
  {
    return Drawer(

      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Image.network("https://avatars2.githubusercontent.com/u/37338847?s=460&v=4", fit: BoxFit.cover,),
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text("My GitHub"),
            subtitle: Text("Open My Github"),
            dense: true,
            leading: Icon(Icons.open_in_new),
            onTap: () {
              setState(() {
                url = 'https://github.com/pravodev';
              });
              Navigator.of(context).push(MaterialPageRoute( 
                builder: (context) => buildWebView(context, "My Github", true)
              ));
            },
          )
        ],
      ),
    );
  }

}