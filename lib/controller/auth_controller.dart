import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/consts/consts.dart';
import 'package:shopping/consts/firebase_consts.dart';
import 'package:shopping/consts/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  var isloading =false.obs;

  //textcontroller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  //loginMethod
  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;

    try{
      await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    }on FirebaseAuthException catch (e){
      VxToast.show(context, msg: e.toString());


    }

    return userCredential;
  }


  //signupMethod

  Future<UserCredential?> signupMethod({email,password,context}) async{
    UserCredential? userCredential;

    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e){
      VxToast.show(context, msg: e.toString());


    }

    return userCredential;
  }


  //storing data Method
  storeUserData({name,password,email}) async {
    DocumentReference store = await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name' : name,
      'password' : password,
      'email' : email,
      'imageUrl' : '',
      'id' :currentUser!.uid,
      'cart_count' :"00",
      'order_count' :"00",
      'wishlist_count' :"00",

    });
  }




  //signout Method
  signoutMethod(context) async {
    try{
      await auth.signOut();
    }catch (e){
      VxToast.show(context, msg: e.toString());

    }

  }















}