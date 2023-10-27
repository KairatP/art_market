// import 'package:art_market/screens/art_page/model/order_model.dart';

class  ProfileData {
  static Map<String, String> profileData = 
  {
    "userId": "0001",
    "name": "John Doe",
    "avatar": "https://parade.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkyNDkzNjAxNDUwNjMyNTE4/us-entertainment-movie.jpg", 
    "email": "johndoe@example.com",
    "phone": "+77017771111",
    "country": "USA",
    "city": "Anytown",
  };
  static List<Map<String, dynamic>> profilePostDataList = [
  {
    "id": "0001",
    "userId": "001",
    "price": "120000",
    "width": "20",
    "hight": "10",
    "color": "Oil color",
    "pano": "Canvas",
    "description": "Bla lalalall laldalalslasclalcaslc",
    "imageUrl": [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROe50Arc2DWKHpOGIZBJrYadsziv7h5kmfxA&usqp=CAU",
    ]
  },
  {
    "id": "0002",
    "userId": "001",
    "price": "140000",
    "width": "200",
    "hight": "120",
    "color": "Oil color",
    "pano": "Canvas",
    "description": "Bla lalalall laldalalslasclalcaslc",
    "imageUrl": [
      "https://static.greatbigcanvas.com/images/singlecanvas_thick_none/world-art-group/jeweltone-prism-ii,2604687.jpg?max=400",
      ]
  },
  {
    "id": "0003",
    "userId": "001",
    "price": "40000",
    "width": "250",
    "hight": "150",
    "color": "Oil color",
    "pano": "Canvas",
    "description": "Bla lalalall laldalalslasclalcaslc",
    "imageUrl": [
      "https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-22DAj1Pz0InEJHXuuonObhsL8gX6bDOtWyrhyT5rSXrqiwlVFfY5g9gutF_eGSwH-0o&usqp=CAU"
    ]
  },
  {
    "id": "0004",
    "userId": "001",
    "price": "1700",
    "width": "2000",
    "hight": "1000",
    "color": "Oil color",
    "pano": "Canvas",
    "description": "Bla lalalall laldalalslasclalcaslc",
    "imageUrl": [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2J6GbFqDYeXB889JbcluwKQw3wYtJakL1Ug&usqp=CAU",
    ]
  },
  ];
}




// List<ArtModel> artList = [
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "27 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "157 kg / 2 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "21 oct 2023", weight: "1000 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "07 oct 2023", weight: "754 kg / 10 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "28 oct 2023", weight: "175 kg / 15 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "22 oct 2023", weight: "454 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "29 oct 2023", weight: "754 kg / 45 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "30 oct 2023", weight: "7540 kg / 500 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "15 oct 2023", weight: "1754 kg / 50 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "14 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "21 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "23 oct 2023", weight: "54 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "27 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "157 kg / 2 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "21 oct 2023", weight: "1000 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "07 oct 2023", weight: "754 kg / 10 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "28 oct 2023", weight: "175 kg / 15 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "22 oct 2023", weight: "454 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "29 oct 2023", weight: "754 kg / 45 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "30 oct 2023", weight: "7540 kg / 500 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "15 oct 2023", weight: "1754 kg / 50 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "14 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "21 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "23 oct 2023", weight: "54 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "27 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "157 kg / 2 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "21 oct 2023", weight: "1000 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "07 oct 2023", weight: "754 kg / 10 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "28 oct 2023", weight: "175 kg / 15 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "22 oct 2023", weight: "454 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "29 oct 2023", weight: "754 kg / 45 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "30 oct 2023", weight: "7540 kg / 500 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "15 oct 2023", weight: "1754 kg / 50 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "14 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "21 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "23 oct 2023", weight: "54 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "27 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "157 kg / 2 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "21 oct 2023", weight: "1000 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "07 oct 2023", weight: "754 kg / 10 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "28 oct 2023", weight: "175 kg / 15 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "22 oct 2023", weight: "454 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "29 oct 2023", weight: "754 kg / 45 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "30 oct 2023", weight: "7540 kg / 500 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "15 oct 2023", weight: "1754 kg / 50 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "14 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "21 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "23 oct 2023", weight: "54 kg / 1 m3"),
//   ];




// class OrderData {
//   static List<ArtModel> orderList = [
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "27 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "157 kg / 2 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "21 oct 2023", weight: "1000 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "07 oct 2023", weight: "754 kg / 10 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "28 oct 2023", weight: "175 kg / 15 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "22 oct 2023", weight: "454 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "29 oct 2023", weight: "754 kg / 45 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "30 oct 2023", weight: "7540 kg / 500 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "15 oct 2023", weight: "1754 kg / 50 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "14 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "21 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "23 oct 2023", weight: "54 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "27 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "157 kg / 2 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "21 oct 2023", weight: "1000 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "07 oct 2023", weight: "754 kg / 10 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "28 oct 2023", weight: "175 kg / 15 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "22 oct 2023", weight: "454 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "29 oct 2023", weight: "754 kg / 45 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "30 oct 2023", weight: "7540 kg / 500 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "15 oct 2023", weight: "1754 kg / 50 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "14 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "21 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "23 oct 2023", weight: "54 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "27 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "157 kg / 2 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "21 oct 2023", weight: "1000 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "07 oct 2023", weight: "754 kg / 10 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "28 oct 2023", weight: "175 kg / 15 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "22 oct 2023", weight: "454 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "29 oct 2023", weight: "754 kg / 45 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "30 oct 2023", weight: "7540 kg / 500 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "15 oct 2023", weight: "1754 kg / 50 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "14 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "21 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "23 oct 2023", weight: "54 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "27 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "157 kg / 2 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "21 oct 2023", weight: "1000 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "07 oct 2023", weight: "754 kg / 10 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "28 oct 2023", weight: "175 kg / 15 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "22 oct 2023", weight: "454 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "29 oct 2023", weight: "754 kg / 45 m3"),
//     const ArtModel(onChange: false, destination: "Балхаш - Актау", id: "12345", date: "30 oct 2023", weight: "7540 kg / 500 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "15 oct 2023", weight: "1754 kg / 50 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Усть-Камменогорск", id: "12345", date: "28 oct 2023", weight: "14 kg / 1 m3"),
//     const ArtModel(onChange: false, destination: "Астана - Костанай", id: "12345", date: "21 oct 2023", weight: "754 kg / 5 m3"),
//     const ArtModel(onChange: false, destination: "Алматы - Астана", id: "12345", date: "23 oct 2023", weight: "54 kg / 1 m3"),
//   ];
// }
