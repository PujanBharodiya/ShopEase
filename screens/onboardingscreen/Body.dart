import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/model/itemlist.dart';
import 'package:project1/Project_Implementation/prefernce/pref_utiles.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';
import 'package:project1/Project_Implementation/screens/onboardingscreen/indicator.dart';
import 'package:project1/Project_Implementation/screens/onboardingscreen/slideview.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Item> itemList = [];
  var currentIndex = 0;
  final _pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemList.add(
    Item(
        title: 'Select Item',
        desc:
        'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
        image: 'assets/Images1/i1.jpg')
    );
    itemList.add(
    Item(
    title: 'Purchase',
    desc:
    'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
    image: 'assets/Images1/i1.jpg'),
    );
    itemList.add(
    Item(
    title: 'Delivery',
    desc:
    'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
    image: 'assets/Images1/i1.jpg'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(controller: _pageController,onPageChanged: (value) {
        setState(() {
          currentIndex = value;
        });
      },itemCount: itemList.length,itemBuilder: (context, index) {
        return slideviw(itemList[index]);
      },),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              for(int i = 0; i < itemList.length ; i++)
                if(i==currentIndex)
                  getindicator(true)
                else
                  getindicator(false)

            ],
          ),
          ElevatedButton(onPressed: () {
            if(currentIndex != itemList.length-1) {
              currentIndex++;
              _pageController.animateToPage(currentIndex, duration: Duration(microseconds: 500), curve: Curves.linear);
            }
            else{
              pref_utiles.updateOnboardingScreenStatus(true).then((value) {
                if(value){
                  Navigator.pushReplacementNamed(context, approute.sigin);
                }
              });
            }

          },child: Text(currentIndex != itemList.length-1 ? "NEXT" : "FINISH")),


        ],
      ),
    );
  }
}
