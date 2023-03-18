import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:animal_feed/Result_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CameraPage extends StatefulWidget {

  
  
  
final  String folder_name;
  CameraPage(this.folder_name);
  @override
  State<CameraPage> createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  late String imagePath;
  List<String> Animals = ['baby.png', 'kid.png','teen.png'];

  String foodClickTag="Click your meal";

  int animalAgeCount=0;
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  var isCameraInit = false;
  var isImageCapture = false;
  var reCaptureImage=false;
  int direction = 0;

  void onPressed() {
    setState(() {

    });
  }

  @override
  void initState() {
    
    initFirebase();
    initNotification();
    
    startCamera(direction);
    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,

    );


    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        isCameraInit = true;
      }); //To refresh widget
    }).catchError((e) {
      Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      body: PageBody(),
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
    ));
  }

  Widget imageCapturebutton(){
    return ( GestureDetector(
      onTap: () {
        cameraController.setFlashMode(FlashMode.off);
        cameraController.takePicture().then((XFile? file) {
          if (mounted) {
            if (file != null) {
              setState(() {
                if(!reCaptureImage){
                  imagePath = file.path;
                  uploadImagetFirebase();
                  isImageCapture = true;
                  if(animalAgeCount==2){
                    animalAgeCount=0;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>(Result_page(widget.folder_name))));
                  }
                  animalAgeCount++;
                  reCaptureImage=true;
                  foodClickTag="Click again I want more food .";
                }else{
                  reCaptureImage=false;
                  isImageCapture = false;
                  foodClickTag="Click your meal.";
                }

              });
            }
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF3E8B3A),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: reCaptureImage? Icon(
            Icons. settings_backup_restore_sharp ,
            color: Colors.white,
            size: 40,
          ):Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    ));
  }

  Widget cameraORimage() {

    return (isImageCapture
        ? AspectRatio(aspectRatio: 1, child:CircleAvatar(
      radius: 48, // Image radius
      backgroundImage: FileImage(File(imagePath)) as ImageProvider,
    ))
        : AspectRatio(
            aspectRatio: 1,
            child: isCameraInit == true
                ? CameraPreview(cameraController)
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ));
  }

  uploadImagetFirebase () async{
    print(imagePath);
    File file=new File(imagePath);
    String filename=imagePath.split('/').last;

    print(filename);
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('user_Image')
        .child(filename);

    UploadTask uploadTask = ref.putFile(File(imagePath));
    final snapshot = await uploadTask.whenComplete(() => null);
    final urlImageUser = await snapshot.ref.getDownloadURL();
    setDatatoDatabase(urlImageUser);
    _showNotification("Animal Game", "Thank you for sharing Food with me");
    print("url is"+urlImageUser);
  }

  setDatatoDatabase(urlImageUser) async{
    final DBRef = FirebaseDatabase.instance.reference().child('Foods');
    String? id= DBRef.push().key;
    DBRef.child(widget.folder_name).child(id!).set(urlImageUser);
  }


  Widget PageBody() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
         Container(
           margin: EdgeInsets.only(top: 80),
           child: Image(
                  image: AssetImage("assets/images/"+widget.folder_name+"/" + Animals[animalAgeCount]),
                ),
         ),

          Expanded(
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/images/fork.png"),
                          height: 150,
                          width: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 220,
                          height: 200,
                          child: Stack(
                            children: [
                              Image(
                                image:
                                    AssetImage("assets/images/camera_frame.png"),
                                width: 220,
                                height: 200,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(360.0),
                                      topRight: Radius.circular(360.0),
                                      bottomRight: Radius.circular(360.0),
                                      bottomLeft: Radius.circular(360.0),
                                    ),
                                    child: cameraORimage(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image(
                          image: AssetImage("assets/images/spoon.png"),
                          height: 160,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(foodClickTag,
                        style: TextStyle(fontSize: 24, fontFamily: "")),
                    SizedBox(
                      height: 30,
                    ),
                   imageCapturebutton(),
                  ]),
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Color(0xE7E5E5FF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initFirebase() {
    Firebase.initializeApp();
    WidgetsFlutterBinding.ensureInitialized();
  }
  void initNotification(){
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,);
  }

  Future<void> _showNotification(String title, String message) async {
    var androidPlatformChannelSpecifics =
    AndroidNotificationDetails( 'channel id',
        'channel name',
        'channel description',  importance: Importance.max);
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,);
    await flutterLocalNotificationsPlugin.show(100, title, message, platformChannelSpecifics);
  }

}
