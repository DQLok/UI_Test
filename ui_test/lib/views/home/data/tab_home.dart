class TabHome {
  String id;
  String name;
  bool select;

  TabHome({required this.id, required this.name, required this.select});
}

List<TabHome> listTabHome = [
  TabHome(id: 'home', name: 'Home', select: true),
  TabHome(id: 'apartment', name: 'Apartment', select: false),
  TabHome(id: 'hotel', name: 'Hotel', select: false),
  TabHome(id: 'villa', name: 'Villa', select: false),
  TabHome(id: 'cottage', name: 'Cottage', select: false),
];