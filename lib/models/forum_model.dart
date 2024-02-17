class ForumModel {
  String id;
  String authorName;
  String content;
  int numOfLikes;
  int numOfReplies;
  int numOfShares;

  ForumModel({
    required this.id,
    required this.authorName,
    required this.content,
    required this.numOfLikes,
    required this.numOfReplies,
    required this.numOfShares,
  });
}
