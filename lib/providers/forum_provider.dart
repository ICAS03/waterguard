import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/forum_model.dart';

class ForumProvider with ChangeNotifier {
  List<String> forumIdList = [];
  List<ForumModel> loadedForumList = [];

  /*Future<void>? createNewForum(String content) {
    FirebaseFirestore.instance.collection('forum').doc().set(
      {
        "authorName": loadedForumList.map((e) => null),
        "content": content,
        'id': '',
        'numOfLikes': '',
        'numOfReplies': '',
        'numOfShares': '',
      },
    );
  }*/

  Future<void> fetchForumId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('forum').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (forum) {
              forumIdList.add(forum.reference.id);
            },
          );
        },
      );
      print('Success! fetched forumId List: ${forumIdList}');
    } catch (e) {
      print("error");
      return null;
    }
  }

  Future<void> fetchAllForumData() async {
    for (int i = 0; i < forumIdList.length; i++) {
      await fetchForumDataFromId(forumIdList[i]);
    }
    print('all done');
  }

  Future<void> fetchForumDataFromId(String forumId) async {
    await FirebaseFirestore.instance
        .collection('forum')
        .doc(forumId)
        .get()
        .then(
      (snapshot) {
        ForumModel loadedForum = ForumModel(
          id: snapshot.data()!['id'],
          authorName: snapshot.data()!['authorName'],
          content: snapshot.data()!['content'],
          numOfLikes: snapshot.data()!['numOfLikes'],
          numOfShares: snapshot.data()!['numOfShares'],
          numOfReplies: snapshot.data()!['numOfReplies'],
        );
        loadedForumList.add(loadedForum);
        print('fetched ${snapshot.data()!['title']}');
      },
    );
  }
}
