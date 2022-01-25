import 'package:flutter/material.dart';

const sharedPrefKey = 'AppLauchData';

const radius1 = Radius.circular(30);
const dayContainerRadius = Radius.circular(11);
const searchIconCRadius = Radius.circular(9);
const loginBorderRadius =
    BorderRadius.only(topRight: radius1, topLeft: radius1);

// const searchBarBorder = Out

const sampleProfileImageUrl =
    "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60";
const sampleProfileImageUrl2 =
    "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";
const divider = Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Divider(
    height: 0.2,
    color: Color(0xFF3E4C67),
  ),
);

const shadow = <Shadow>[
  Shadow(
    offset: Offset(-1.0, 1.0),
    blurRadius: 1.0,
    color: Color(0xFF9C9292),
  ),

];

const sampleDates = [
  '21/1/22',
  '23/1/22',
  '27/1/22',
  '30/1/22',
  '3/2/22',
  '15/2/22',
];
const sampleName = [
  'Firmani Hilpo',
  'Loplo Dixin',
  'Nimbil Mialoi',
  'Wenim Qepoi',
  'Zeqdana Yimb',
  'Gercy Vekoi',
  'Zasinb Csai',
];
const samplePlaces = [
  'Ziross',
  'Ekruading',
  'Vrofstin',
  'Briver',
  'Jiphis',
  'Ezhario'
];
const searchImages = [
  'assets/images/searchImages/searchImage1.jfif',
  'assets/images/searchImages/searchImage2.jfif',
  'assets/images/searchImages/searchImage3.jfif',
  'assets/images/searchImages/searchImage4.jfif',
  'assets/images/searchImages/searchImage1.jfif',
  'assets/images/searchImages/searchImage3.jfif',
];

const sampleRating = ['4.3', '4.3', '4.2', '3.3', '3.3', '3.2'];

const sampleAmounts = ['3500', '3200', '3600', '2900', '3200', '3600'];

const dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries";

final bssBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none);
