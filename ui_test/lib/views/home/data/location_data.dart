class LocationData {
  String id;
  String name;
  String des;
  String urlImg;
  String distance;
  String price;
  int bedRooms;
  int bathRooms;

  LocationData({
    required this.id,
    required this.name,
    required this.des,
    required this.urlImg,
    required this.distance,
    required this.price,
    required this.bedRooms,
    required this.bathRooms,
  });
}

List<LocationData> listLocation = [
  LocationData(
      id: '1',
      name: 'DreamsVille House',
      des: 'Jl. Sultan Iskandar Muda, Jakarta selatan',
      urlImg: '',
      distance: '1.8 km',
      price: '2.500.000.000 / Year',
      bedRooms: 6,
      bathRooms: 4),
  LocationData(
      id: '2',
      name: 'Ascot House',
      des: 'Jl. Cilandak Tengah',
      urlImg: '',
      distance: '3.0 km',
      price: '2.000.000.000 / Year',
      bedRooms: 6,
      bathRooms: 4),
  LocationData(
      id: '3',
      name: 'Orchad House',
      des: '',
      urlImg: '',
      distance: '1.8 km',
      price: '2.500.000.000 / Year',
      bedRooms: 6,
      bathRooms: 4),
  LocationData(
      id: '4',
      name: 'The Hollies House',
      des: '',
      urlImg: '',
      distance: '1.8 km',
      price: '2.000.000.000 / Year',
      bedRooms: 5,
      bathRooms: 4),
];
