import 'package:travel_app/config/app_image.dart';

class ListTravel {
  String image;
  String name;
  String date;
  ListTravel({required this.image, required this.name, required this.date});
  static List<ListTravel> listTravel = [
    ListTravel(image: AppImage.image1, name: 'Around France', date: '30 april - 12 may 2021'),
    ListTravel(image: AppImage.image2, name: 'Around France', date: '30 april - 12 may 2021'),
    ListTravel(image: AppImage.image3, name: 'Around France', date: '30 april - 12 may 2021'),
    ListTravel(image: AppImage.image4, name: 'Around France', date: '30 april - 12 may 2021'),
    //     ListTravel(image: 'image', name: 'name', date: 'date'),
    //         ListTravel(image: 'image', name: 'name', date: 'date'),
  ];
}
