import 'package:shopping/consts/consts.dart';

class firestoreServices {
  //get users data
  static getUser(uid){
    return firestore.collection(userCollection).where('id',isEqualTo: uid).snapshots();
  }
}