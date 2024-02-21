class FloodModel {
  String id;
  String time;
  String location;
  int waterlevel;
  String risklevel;
  String evacuationcentre;
  String affectedroads;

  FloodModel(
      {required this.id,
      required this.time,
      required this.location,
      required this.waterlevel,
      required this.risklevel,
      required this.evacuationcentre,
      required this.affectedroads});
}
