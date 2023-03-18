import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'AnimalSelectPage.dart';
import 'CameraPage.dart';

class CompletDinner extends StatefulWidget {

  final  String folder_name;
  CompletDinner(this.folder_name);

  List<String> list = [];
  @override
  State<CompletDinner> createState() => _CompletDinnerState();
}

class _CompletDinnerState extends State<CompletDinner> {
   bool isDatapresent=true;




  @override
  void initState() {
     print("init state");

     setState(() {

     });
    firebaseDataget();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
        child: FloatingActionButton(
          onPressed: ()=>Navigator.pop(context),
          child: new Icon(
            Icons.arrow_back,
            size: 30,
          ),
          backgroundColor: Color(0xFF3E8B3A),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: PageBody(),
    );;
  }

  Widget PageBody(){
    return (
    Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:100),
          child: Text(
            "Your completed Dinner with ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w200),
          ),
        ),

        Image(

            image: AssetImage("assets/images/" +
                widget.folder_name +
                "/teen.png")),
        Container(
          child: Text(
            widget.folder_name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w200),
          ),
        ),

        showCompletedDinnersORnot()
      ],
    )
    );
  }
  
   firebaseDataget() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('Foods/'+widget.folder_name).get();
    if (snapshot.exists) {
      Map values = snapshot.value as Map;
      values.forEach((key, value) {
        widget.list.add(value);

      });
    } else {
      isDatapresent=false;
      print('No data available.');
    }
    setState(() {
    });
  }

  Widget showCompletedDinnersORnot() {
    List<String> imagesList =widget.list;
    int totalPhotosCount = imagesList.length;

    if (totalPhotosCount > 0 || isDatapresent) {
      return new GridView.builder(
          itemCount: totalPhotosCount,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Tapped on thumbnail.');
                    print('Photo doc id: ${imagesList[index]}');
                  },
                  child: Container(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                        ClipRect(
                          child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: 0.5,
                              child: new CachedNetworkImage(
                                placeholder: (context, url) =>
                                    new CircularProgressIndicator(),
                                imageUrl: imagesList[index],
                              )),
                        ),
                      ])),
                ),
              ),
            );
          });
    }

    return new Center(
        child: Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 50.0),
        ),
        new Text("No Completed dinner  found.",textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.w200),),

          Container(

            margin: EdgeInsets.all(20),
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Color(0xFF3E8B3A),padding: EdgeInsets.fromLTRB(20, 10, 20, 10),),
              child: Text('Share your meal with '+widget.folder_name,textAlign: TextAlign.center,

                style: TextStyle(

                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w200),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage(widget.folder_name)));

              },
            ),
          )




      ],
    ));
  }
}
