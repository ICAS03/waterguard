import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterguard/auth.dart';
import 'package:waterguard/models/forum_model.dart';
import 'package:waterguard/models/user_model.dart';
import 'package:waterguard/providers/forum_provider.dart';
import 'package:waterguard/providers/user_provider.dart';
import 'package:waterguard/widgets/create_new_forum_category.dart';
import '../models/colors.dart';
import 'package:waterguard/models/colors.dart' as custom_color;

class CreateNewForum extends StatefulWidget {
  const CreateNewForum({super.key});
  static const routeName = '/create-new-forum';
  @override
  State<CreateNewForum> createState() => _CreateNewForumState();
}

class _CreateNewForumState extends State<CreateNewForum> {
  TextEditingController postController = TextEditingController();

  UserModel userProviderData = UserModel(
    id: '', // Initialize with the desired value
    name: '', // Initialize with the desired value
    email: '',
    phone: '',
    address: '',
  );

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  fetchUserData() async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .get()
        .then(
      (snapshot) {
        setState(() {
          userProviderData.address = snapshot.data()!['address'];
          userProviderData.email = snapshot.data()!['email'];
          userProviderData.id = snapshot.data()!['id'];
          userProviderData.name = snapshot.data()!['name'];
          userProviderData.phone = snapshot.data()!['phone'];
        });
      },
    );
  }

  Widget build(BuildContext context) {
    var _provider = Provider.of<ForumProvider>(context, listen: false);

    /*UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;*/

    ForumModel _loadedForum = ForumModel(
      id: userProviderData.id,
      authorName: userProviderData.name,
      content: postController.text,
      numOfLikes: 0,
      numOfShares: 0,
      numOfReplies: 0,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_color.secondaryYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.account_circle_rounded,
                        color: Colors.grey, size: 60)),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userProviderData.name,
                      style: TextStyle(color: custom_color.black),
                    ),
                    Text(
                      "@${userProviderData.name}",
                      style: TextStyle(color: custom_color.grey),
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: postController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  hintStyle:
                      TextStyle(color: custom_color.black.withOpacity(0.2)),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 200),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: custom_color.primaryBlue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      CreateNewForumCategory(Icons.photo, "Photos and Videos"),
                      CreateNewForumCategory(
                          Icons.pin_drop_rounded, "Location"),
                      CreateNewForumCategory(Icons.tag, "Tagging"),
                      CreateNewForumCategory(
                          Icons.diversity_1_rounded, "Community"),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() async {
                            _provider.loadedForumList.add(_loadedForum);

                            await FirebaseFirestore.instance
                                .collection('forum')
                                .add({
                              'id': _loadedForum.id,
                              'authorName': _loadedForum.authorName,
                              'content': postController.text,
                              'numOfLikes': _loadedForum.numOfLikes,
                              'numOfShares': _loadedForum.numOfShares,
                              'numOfReplies': _loadedForum.numOfReplies,
                            });

                            Navigator.of(context).pop();
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 225,
                          height: 55,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: black.withOpacity(0.7),
                                spreadRadius: 1,
                                blurRadius: 5,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: custom_color.backgroundwhite,
                          ),
                          child: Text("Post",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: custom_color.black)),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
