import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      {
        "title": "Paper Products",
        "Color": '69CFFF',
      },
      {
        "title": "Writing Instrument",
        "Color": "BAA30B",
      },
      {
        "title": "Art Material",
        "Color": "FF0000",
      },
      {
        "title": "packing supplies",
        "Color": "3465F4",
      },
      {
        "title": "Pc Books",
        "Color": "00A51B",
      }
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 10,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22,
                  backgroundImage: AssetImage(
                    "assets/image/profile.jpg",
                  ),
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: context.isPhone ? 12 : 14,
                      fontFamily: 'EN-REGULAR',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Mon Phanith",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: context.isPhone ? 18 : 20,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Image.asset(
                  "assets/image/notification.png",
                  height: 22,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              cursorColor: Theme.of(context).hoverColor,
              cursorWidth: 0.8,
              style: TextStyle(
                color: Theme.of(context).hoverColor,
                fontSize: context.isPhone ? 12 : 16,
                fontFamily: 'EN-REGULAR',
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                hintText: 'Which product that u want to find ? ',
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(
                  color: const Color(0xffB7B7B7),
                  fontSize: context.isPhone ? 12 : 16,
                  fontFamily: 'EN-REGULAR',
                ),
                labelStyle: TextStyle(
                  color: const Color(0xff434343).withOpacity(0.3),
                  fontSize: context.isPhone ? 16 : 16,
                  fontFamily: 'EN-REGULAR',
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Color(0xffAAAAAA),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Color(0xffAAAAAA),
                  ),
                ),
                prefixIcon: Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Image.asset(
                    'assets/image/search.png',
                    height: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(list.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Color(0xff '${list[index]["title"]}')
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: Text(
                          '${list[index]["title"]}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: context.isPhone ? 12 : 14,
                            fontFamily: 'EN-REGULAR',
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
