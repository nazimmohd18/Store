import 'package:flutter/material.dart';
import '../Utils/Colors.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'HomePage';
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('STORE',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,letterSpacing: 10)),
backgroundColor: orange,
      ),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,

        child: Column(
          children: [

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(deviceWidth * .05),
                itemCount: 8,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                primary: false,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 8,
                    shadowColor: Colors.black45,
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            "assets/images/orange.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          '\$ 5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Orange',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: orange,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '1 KG',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
