import 'package:flutter/material.dart';
import 'package:animal_feed/CameraPage.dart';

class AnimalSelectPage extends StatefulWidget {
  @override
  AnimalSelectPageState createState() => AnimalSelectPageState();
}

class AnimalSelectPageState extends State<AnimalSelectPage> {
  List<String> animal_folders = ['smilodon', 'orca', 'mammoth', 'dodo', 'dino'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
        child: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: new Icon(
            Icons.arrow_back,
            size: 30,
          ),
          backgroundColor: Color(0xFF3E8B3A),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 120),
            child: Text(
              "Choose your favorite animal to have dinner with you.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
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
                                builder: (context) => CameraPage(animal_folders[0])));
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
                                builder: (context) => CameraPage(animal_folders[1])));
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
                                builder: (context) => CameraPage(animal_folders[2])));
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
                                builder: (context) => CameraPage(animal_folders[3])));
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
                                builder: (context) => CameraPage(animal_folders[4])));
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
          )
        ],
      ),
    );
  }
}
