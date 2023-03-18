import 'package:flutter/material.dart';

import 'Card_Ui.dart';

class Result_page extends StatelessWidget {
  String folder_name;
Result_page(this.folder_name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  Widget PageBody() {
    return (Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Text(
              "Your Result",
              textAlign: TextAlign.center,

              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Expanded(
              child: Card_Ui(
                card_color: Color(0xFFF8E7E7FF),
                iconsContents: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Image(image: AssetImage("assets/images/"+folder_name+"/teen.png")),

                    Text(
                      "GOOD JOB",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 40,
                          fontFamily:'',
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),

        ],
      ),
    ));
  }

}
