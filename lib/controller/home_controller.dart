import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/items.dart';
import '../services/api.dart';

class HomeController extends GetxController {
  @override
  bool get wantKeepAlive => true;
  // var index = 0.obs;
  final selected= 0.obs;

  var heart = false;
  PageController controller = PageController();
  Api? _apicart;
   var home = 'Home'.obs;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  Future<Null> refreshLocalGallery() async{
    await Future.delayed(Duration(seconds: 3),(){
    home.value ="text";
    });



  }
  List<Color> colors = [
    Colors.blue,
    Colors.orangeAccent,
    Colors.grey,
    Colors.green,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.indigoAccent,
    Colors.yellowAccent,
    Colors.brown,
  ];
  final List<String> imgList = [
    'assets/banner1.png',
    'assets/banner2.jpg',
    'assets/banner3.jpg',
    'assets/banner6.jpg',
    'assets/banner7.png',
  ];
  var list = [
    Homes(
      Name: 'Home',
      img: 'assets/telegram.png',
      ban: 'assets/ban4.png',
      btndesc: 'Recharge for others',
      game: 'assets/game1.png',
      title: 'Super mario',
      backimg: 'assets/yellow.jpg',
      movie: 'assets/movie1.jpg',
      gif: 'assets/gif1.gif',
      no: 'assets/1.png',
      no2: 'assets/11.png',
      bis: 'assets/bis1.jpg',
      people: 'assets/people1.png',
    ),
    Homes(
      Name: 'Fashion ',
      img: "assets/fashion.png",
      ban: "assets/ban2.png",
      btndesc: "Help & Support",
      game: "assets/game2.png",
      title: "Super sonic",
      backimg: "assets/meroon.jpg",
      movie: "assets/movie2.jpg",
      gif: "assets/gif2.gif",
      no: "assets/2.png",
      no2: "assets/22.png",
      bis: 'assets/bis2.jpg',
      people: 'assets/people2.png',
    ),
    Homes(
      Name: 'Game ',
      img: "assets/joystick.png",
      ban: "assets/ban3.png",
      btndesc: "Order new vip number ",
      game: "assets/game3.png",
      title: "Pokeymon",
      backimg: "assets/black.jpg",
      movie: "assets/movie4.png",
      gif: "assets/gif3.gif",
      no: "assets/3.png",
      no2: "assets/33.png",
      bis: 'assets/bis3.jpg',
      people: 'assets/people4.png',
    ),
    Homes(
      Name: 'Food ',
      img: "assets/salad.png",
      ban: "assets/ban1.png",
      btndesc: "Jobs & Education",
      game: "assets/game4.png",
      title: "Clash of clans",
      movie: "assets/movie5.jpeg",
      gif: "assets/gif4.gif",
      no: "assets/4.png",
      no2: "assets/44.png",
      bis: '',
      backimg: "",
      people: 'assets/people3.png',
    ),
    Homes(
      Name: 'Bar ',
      img: "assets/beer.png",
      ban: "assets/ban5.png",
      btndesc: "Recharge for others",
      game: "assets/game5.png",
      title: "Dragon ball z",
      movie: "assets/movie7.jpg",
      gif: "assets/gif5.gif",
      no: "assets/5.png",
      no2: "assets/55.png",
      bis: '',
      backimg: "",
      people: '',
    ),
    Homes(
      Name: 'Home ',
      img: "assets/telegram.png",
      ban: "assets/ban6.png",
      btndesc: "Recharge for others",
      game: "assets/game1.png",
      title: "Super sonic",
      movie: "assets/movie8.jpeg",
      gif: "assets/gif1.gif",
      no: "assets/6.png",
      no2: "assets/66.png",
      bis: '',
      backimg: "",
      people: '',
    ),
    Homes(
      Name: 'Fashion ',
      img: "assets/fashion.png",
      ban: "assets/ban2.png",
      btndesc: "Recharge for others",
      game: "assets/game4.png",
      title: "Super sonic",
      movie: "assets/movie9.jpg",
      gif: "assets/gif2.gif",
      no: "assets/7.png",
      no2: "assets/77.png",
      bis: '',
      backimg: "",
      people: '',
    ),
    Homes(
      Name: 'Game ',
      img: "assets/joystick.png",
      ban: "assets/ban1.png",
      btndesc: "Recharge for others",
      game: "assets/game2.png",
      title: "Super sonic",
      movie: "assets/movie1.jpg",
      gif: "assets/gif3.gif",
      no: "assets/8.png",
      no2: "assets/88.png",
      bis: '',
      backimg: "",
      people: '',
    ),
    Homes(
      Name: 'Food ',
      img: "assets/salad.png",
      ban: "assets/ban4.png",
      btndesc: "Recharge for others",
      game: "assets/game5.png",
      title: "Super sonic",
      movie: "assets/movie2.jpg",
      gif: "assets/gif4.gif",
      no: "assets/9.png",
      no2: "assets/99.png",
      bis: '',
      backimg: "",
      people: '',
    ),
    Homes(
      Name: 'Bar ',
      img: "assets/beer.png",
      ban: "assets/ban2.png",
      btndesc: "Recharge for others",
      game: "assets/game3.png",
      title: "Super sonic",
      movie: "assets/movie4.png",
      gif: "assets/gif5.gif",
      no: "assets/ten.png",
      no2: "assets/10.png",
      bis: '',
      backimg: "",
      people: '',
    ),
  ];

  var _Homeslist = <Homes>[].obs;

  List<Homes> get getHomesList => _Homeslist;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {


    heart = !heart;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _apicart?.setcartitem();
      await _apicart?.setcoloritem();
    });
    super.onInit();
    _Homeslist.addAll(list);
  }
}
