import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'あなたのターンです'),
    );
  }
}

// class DataList{
//   final id;
//   final user_id;
//   final image;
//   final isTapped;

//   const DataList({this.id,this.user_id,this.image,this.isTapped});
  
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  
  List alldata = [];

  @override
  void initState(){
    super.initState();
    setState(() {
      alldata = cList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new GridView.extent(
        maxCrossAxisExtent: 120.0,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: wList(),
      )
    );
  }

  List cList() {
    List cardlist = [];
    for(var i = 0; i < 6; i++) {
      cardlist.add(
        {
          "id": i,
          "user_id": 0,
          "image":'images/spa${ i+ 1}.jpg', 
          "isTapped": false
        }
      );
    }
    return cardlist;
  }
    

  List<Widget> wList() {
    List<Widget> _buffer = [];
    for(var i = 0; i < 6; i++) {
      if(alldata[i]["isTapped"]){
        _buffer.add(
          GestureDetector(
            child:Container(
              margin: const EdgeInsets.all(5.0),
              color: Colors.teal,
              child: Card(
                child:new Image.asset(
                  alldata[i]["image"],
                  fit:BoxFit.cover
                ),
              ),
            ),
            onTap: (){
              setState(() {
                alldata[i]["isTapped"]=false;
                // DataList(
                //   id: i,
                //   isTapped: false
                // );
                //print(alldata[i]["isTapped"]);
              });
            },
          ),
        );
      }else{
        _buffer.add(
          GestureDetector(
            child:Container(
              margin: const EdgeInsets.all(5.0),
              color: Colors.teal,
              child: Card(
                child:new Image.asset(
                  'images/card2.jpg',
                  fit:BoxFit.cover
                ),
              ),
            ),
            onTap: (){
              setState(() {
                alldata[i]["isTapped"]=true;
                // DataList(
                //   id:i,
                //   isTapped: true
                // );
              });
              // print(alldata[i].isTapped);
              //print(i);
            },
          ),
        );
      }
    }
    return _buffer;
  }
}


