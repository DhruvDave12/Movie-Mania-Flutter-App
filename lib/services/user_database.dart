import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_mania/models/user_data.dart';

class Database {
  String uid;
  Database({required this.uid});

  // Name of collection
  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('UserData');

  // Update user data here.
  Future updateUserData(userData user) async {
    return await userDataCollection.doc(uid).set(user.toMap());
  }

  // Now here we will be taking snapshots and returning the List<userData>
  userData _userdataretrieval(DocumentSnapshot snapshot) {
    return userData(
        uid: snapshot['uid'],
        name: snapshot['name'],
        gender: snapshot['gender'],
        address: snapshot['address'],
        age: snapshot['age']);
  }

  Stream<userData> get dataUser {

    // mapping snapshot to user data and returning stream of user data
    return userDataCollection.doc(uid).snapshots().map(_userdataretrieval);
  }
}
