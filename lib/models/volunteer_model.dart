class VolunteerModel {
  String id;
  String volunteername;
  String volunteerid;
  String volunteerphone;
  String volunteeremail;
  String voluntertitle;
  String orgnanization;
  String licensenumber;

  VolunteerModel(
      {required this.id,
      required this.volunteername,
      required this.licensenumber,
      required this.volunteeremail,
      required this.volunteerphone,
      required this.orgnanization,
      required this.volunteerid,
      required this.voluntertitle});
}
