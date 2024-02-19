class DonationModel {
  String id;
  double amount;
  String date;
  String donationtitle;
  String organization;
  String paymentMethod;

  DonationModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.donationtitle,
    required this.organization,
    required this.paymentMethod,
  });
}
