import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/datamodel.dart';
import 'package:flutter_app/speech.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  late int text;
  late int title;
  bool hide=false;
  var desig="Welcome";
  @override
  void _setText() {
    setState(() {
      hide=true;
      text=title;
      desig=titletext();
    });
  }
  String titletext() {

    var title="";
    if(text==1){
      title="doctor";
    }else if(text==2){
      title="Hospital Management";
    }else if(text==3){
      title="Medical Store";
    }else{
      title="Patient";
    }
    return "Welcome $title";
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title:  Text(desig),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Visibility(
                visible: text<=4?true:false,
                child:RaisedButton(
                  onPressed:(){



                  },
                  child: Text("Patient"),
                ), ),
              Visibility(
                visible: text<=3 ?true:false,
                child:RaisedButton(
                  onPressed:(){

                  },
                  child: Text("Medical Store"),
                ), ),
            ],
          ),
          Row(
            children: [
              Visibility(
                visible: text<=2 ?true:false,
                child:RaisedButton(
                  onPressed:(){

                  },

                  child: Text("Hospital Mangement"),
                ), ),
              Visibility(
                visible: text==1?true:false,
                child:RaisedButton(
                  onPressed:(){
                  },

                  child: Text("Doctor"),
                ), ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        new Row(
          children: [




          ],
        )
      ],
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Visibility(
            visible: hide==false,
            child: TextField(
            onChanged: (value) => title = int.parse(value),
            decoration: InputDecoration(hintText: "enter id"),
          ),),
          Visibility(
            visible: hide==false,
            child: RaisedButton(onPressed: _setText,
            child: Text("Submit"),),),

          Text(desig),
    Visibility(
      visible: hide,
      child:  RaisedButton(
      child: Text(
        'Show Pop-up',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Colors.black,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog(context),
        );
      },
    ),)

        ],
      ),
        // body: FutureBuilder(
        //   future: ReadJsonData(),
        //   builder: (context, data) {
        //     if (data.hasError) {
        //       return Center(child: Text("${data.error}"));
        //     } else if (data.hasData) {
        //       var items = data.data as List<datamodel>;
        //       return ListView.builder(
        //           itemCount: items == null ? 0 : items.length,
        //           itemBuilder: (context, index) {
        //             return Card(
        //               elevation: 5,
        //               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        //               child: Container(
        //                 padding: EdgeInsets.all(8),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: [
        //                     Container(
        //                       width: 50,
        //                       height: 50,
        //                       child: Image(
        //                         image:
        //                         NetworkImage(items[index].imageURL.toString()),
        //                         fit: BoxFit.fill,
        //                       ),
        //                     ),
        //                     Expanded(
        //                         child: Container(
        //                           padding: EdgeInsets.only(bottom: 8),
        //                           child: Column(
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             crossAxisAlignment: CrossAxisAlignment.start,
        //                             children: [
        //                               Padding(
        //                                 padding: EdgeInsets.only(left: 8, right: 8),
        //                                 child: items[index].gender.toString()=="Male"?Text(
        //                                   "Mr "+items[index].name.toString(),
        //                                   style: TextStyle(
        //                                       fontSize: 16,
        //                                       fontWeight: FontWeight.bold),
        //                                 ):Text(
        //                                   "Ms "+items[index].name.toString(),
        //                                   style: TextStyle(
        //                                       fontSize: 16,
        //                                       fontWeight: FontWeight.bold),
        //                                 ),
        //                               ),
        //                               SizedBox(height: 10,),
        //                               Padding(
        //                                 padding: EdgeInsets.only(left: 8, right: 8),
        //                                 child: Text(items[index].description.toString()),
        //                               )
        //                             ],
        //                           ),
        //                         ))
        //                   ],
        //                 ),
        //               ),
        //             );
        //           });
        //     } else {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SpeechScreen()));

          // Add your onPressed code here!
    },
    child: Icon(Icons.mic),
    backgroundColor: Colors.green,
    ),
    );
  }
  Future<List<datamodel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/mock_data.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => datamodel.fromJson(e)).toList();
  }






}

