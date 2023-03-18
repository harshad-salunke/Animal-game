import 'package:animal_feed/CompletDinner.dart';
import 'package:flutter/material.dart';
import 'package:animal_feed/AnimalSelectPage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState()=>HomePageState();

}
class HomePageState extends State<HomePage> {
  List<String> animal_folders = ['smilodon', 'orca', 'mammoth', 'dodo', 'dino'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
        body:
      Stack(
      children: <Widget>[
        Positioned(

          child: PageBody(),
        )
      ],
    ),
      );
  }

 Widget PageBody() {

   return (
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Text(
                "Choose the animal to see your completed meal with him.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w200),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompletDinner(animal_folders[0])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(

                                  image: AssetImage("assets/images/" +
                                      animal_folders[0] +
                                      "/teen.png")),
                              Text(animal_folders[0],style: TextStyle(color: Colors.white,fontSize: 20),)

                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompletDinner(animal_folders[1])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage("assets/images/" +
                                      animal_folders[1] +
                                      "/teen.png")),
                              Text(animal_folders[1],style: TextStyle(color: Colors.white,fontSize: 20),)

                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompletDinner(animal_folders[2])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage("assets/images/" +
                                      animal_folders[2] +
                                      "/teen.png")),
                              Text(animal_folders[2],style: TextStyle(color: Colors.white,fontSize: 20),)

                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompletDinner(animal_folders[3])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage("assets/images/" +
                                      animal_folders[3] +
                                      "/teen.png")),
                              Text(animal_folders[3],style: TextStyle(color: Colors.white,fontSize: 20),)

                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompletDinner(animal_folders[4])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage("assets/images/" +
                                      animal_folders[4] +
                                      "/teen.png")),
                              Text(animal_folders[4],style: TextStyle(color: Colors.white,fontSize: 20),)

                            ],
                          ),
                        ),
                      ),
                    ],
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(),padding: EdgeInsets.fromLTRB(30, 15, 30, 15),backgroundColor: Color(0xFF3E8B3A)),
                  child: Text('Share your meal',style: TextStyle(fontSize: 25),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimalSelectPage()));

                  },
                ),
              ),
            )
          ],
        )
    );

  }




  @override
  void initState() {
    super.initState();

  }





}

