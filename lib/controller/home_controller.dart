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
  List<Color> coloring = [
    Colors.red,
    Colors.yellowAccent,
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
      img: 'assets/btn1.png',
      ban: 'assets/ban6.png',
      btndesc: 'Recharge for others',
      game: 'assets/game1.png',
      title: 'Super mario',
      backimg: 'assets/yellow.jpg',
      movie: 'assets/movie4.png',
      gif: 'assets/gif1.gif',
      no: 'assets/1.png',
      no2: 'assets/11.png',
      bis: 'assets/bis1.jpg',
      people: 'assets/people1.png',
      music: 'assets/music1.jpg',
      news: 'assets/news1.png',
      offer: 'assets/offer1.jpg',
      banner: 'assets/sale1.webp',
      help: 'assets/dots.png',
      coupen: 'assets/coupen3.jpg',
    ),
    Homes(
      Name: 'Fashion ',
      img: "assets/btn2.png",
      ban: "assets/ban2.png",
      btndesc: "Help & Support",
      game: "assets/game2.png",
      title: "Super sonic",
      backimg: "assets/meroon.jpg",
      movie: "assets/movie5.jpeg",
      gif: "assets/gif2.gif",
      no: "assets/2.png",
      no2: "assets/22.png",
      bis: 'assets/bis2.jpg',
      people: 'assets/people2.png',
      music: 'assets/music2.jpg',
      news: 'assets/news2.png',
      offer: 'assets/offer8.jpg',
      banner: 'assets/sale2.jpg',
      help: 'assets/user1.png',
      coupen: 'assets/coupen4.jpg',
    ),
    Homes(
      Name: 'Game ',
      img: "assets/btn3.png",
      ban: "assets/ban3.png",
      btndesc: "Order new number ",
      game: "assets/game3.png",
      title: "Pokeymon",
      backimg: "assets/black.jpg",
      movie: "assets/movie1.jpg",
      gif: "assets/gif3.gif",
      no: "assets/3.png",
      no2: "assets/33.png",
      bis: 'assets/bis3.jpg',
      people: 'assets/people4.png',
      music: 'assets/music3.jpg',
      news: 'assets/news3.png',
      offer: 'assets/offer2.jpg',
      banner: 'assets/sale.jpg',
      help: 'assets/wifi.png',
      coupen: 'assets/coupen5.jpg',
    ),
    Homes(
      Name: 'Food ',
      img: "assets/btn4.png",
      ban: "assets/ban1.png",
      btndesc: "Jobs & Education",
      game: "assets/game4.png",
      title: "Clash of clans",
      movie: "assets/movie1.jpg",
      gif: "assets/gif4.gif",
      no: "assets/4.png",
      no2: "assets/44.png",
      bis: '',
      backimg: "",
      people: 'assets/people3.png',
      music: 'assets/music4.jpg',
      news: 'assets/news4.png',
      offer: 'assets/offer3.jpg',
      banner: 'assets/sale4.png',
      help: 'assets/distrub.png',
      coupen: 'assets/coupen6.jpg',
    ),
    Homes(
      Name: 'Bar ',
      img: "assets/btn5.png",
      ban: "assets/ban5.png",
      btndesc: "Recharge for others",
      game: "assets/game5.png",
      title: "Dragon ball z",
      movie: "assets/movie7.jpg",
      gif: "assets/gif5.gif",
      no: "assets/5.png",
      no2: "assets/55.png",
      music: 'assets/music5.jpg',
      bis: '',
      backimg: "",
      people: '',
      news: 'assets/news5.png',
      offer: 'assets/offer4.jpg',
      banner: 'assets/sale5.jpg',
      help: '',
      coupen: 'assets/coupen11.jpg',
    ),
    Homes(
      Name: 'Home ',
      img: "assets/btn1.png",
      ban: "assets/ban4.png",
      btndesc: "Recharge for others",
      game: "assets/game1.png",
      title: "Super sonic",
      movie: "assets/movie8.jpeg",
      gif: "assets/gif1.gif",
      no: "assets/6.png",
      no2: "assets/66.png",
      music: 'assets/music6.jpg',
      bis: '',
      backimg: "",
      people: '',
      news: 'assets/news6.png',
      offer: 'assets/offer5.jpg',
      banner: 'assets/sale6.jpg',
      help: '',
      coupen: 'assets/coupen12.jpg',

    ),
    Homes(
      Name: 'Fashion ',
      img: "assets/btn2.png",
      ban: "assets/ban2.png",
      btndesc: "Recharge for others",
      game: "assets/game4.png",
      title: "Super sonic",
      movie: "assets/movie9.jpg",
      gif: "assets/gif2.gif",
      no: "assets/7.png",
      no2: "assets/77.png",
      music: 'assets/music7.jpg',
      bis: '',
      backimg: "",
      people: '',
      news: 'assets/news7.png',
      offer: 'assets/offer7.jpg',
      banner: 'assets/sale7.jpg',
      help: '',
      coupen: 'assets/coupen13.jpg',
    ),
    Homes(
      Name: 'Game ',
      img: "assets/btn3.png",
      ban: "assets/ban1.png",
      btndesc: "Recharge for others",
      game: "assets/game2.png",
      title: "Super sonic",
      movie: "assets/movie1.jpg",
      gif: "assets/gif3.gif",
      no: "assets/8.png",
      no2: "assets/88.png",
      music: 'assets/music8.jpg',
      bis: '',
      backimg: "",
      people: '',
      news: 'assets/news8.png',
      offer: 'assets/offer6.webp',
      banner: 'assets/sale8.jpg',
      help: '',
      coupen: 'assets/coupen14.jpg',
    ),
    Homes(
      Name: 'Food ',
      img: "assets/btn4.png",
      ban: "assets/ban4.png",
      btndesc: "Recharge for others",
      game: "assets/game5.png",
      title: "Super sonic",
      movie: "assets/movie2.jpg",
      gif: "assets/gif4.gif",
      no: "assets/9.png",
      no2: "assets/99.png",
      music: 'assets/music9.jpg',
      bis: '',
      backimg: "",
      people: '',
      news: 'assets/news9.png',
      offer: 'assets/offer9.jpg',
      banner: 'assets/sale9.webp',
      help: '',
      coupen: 'assets/coupen3.jpg',
    ),
    Homes(
      Name: 'Bar ',
      img: "assets/btn5.png",
      ban: "assets/ban2.png",
      btndesc: "Recharge for others",
      game: "assets/game3.png",
      title: "Super sonic",
      movie: "assets/movie4.png",
      gif: "assets/gif5.gif",
      no: "assets/ten.png",
      no2: "assets/10.png",
      music: 'assets/music10.jpg',
      bis: '',
      backimg: "",
      people: '',
      news: "assets/news10.png",
      offer: 'assets/offer10.jpg',
      banner: 'assets/sale10.webp',
      help: '',
      coupen: 'assets/coupen5.jpg',
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
