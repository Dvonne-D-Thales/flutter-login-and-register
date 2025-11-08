import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_api_model.dart';
import '../network/client_network.dart';
import '../routes/routes.dart';

// Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginApiController extends GetxController {
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  var isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // ✅ Login API manual
  Future<void> loginApi() async {
    isLoading.value = true;

    final url = '${ClientNetwork.baseUrl}/latihan/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': usernameC.text,
          'password': passwordC.text,
        },
      );

      if (response.statusCode == 200) {
        final result = loginModelFromJson(response.body);

        if (result.status) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', result.token);
          await prefs.setString('username', usernameC.text);

          Get.snackbar('Berhasil', result.message);
          Get.offAllNamed(AppRoutes.premiertable);
        } else {
          Get.snackbar('Error', result.message);
        }
      } else {
        Get.snackbar('Error', 'Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }

    isLoading.value = false;
  }

 // ✅ Login Google dengan selalu menampilkan pilihan akun
Future<void> signInWithGoogle() async {
  try {
    // 🔹 Tambahkan baris ini agar selalu muncul dialog pilihan akun
    await _googleSignIn.signOut();

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return; // user batal memilih akun

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    final User? user = userCredential.user;

    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", user.displayName ?? "");
      await prefs.setString("email", user.email ?? "");

      Get.snackbar("Sukses", "Login Google berhasil!");
      Get.offAllNamed(AppRoutes.premiertable);
    }
  } catch (e) {
    Get.snackbar("Error", e.toString());
  }
}


  // ✅ Logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    await _auth.signOut();
    await _googleSignIn.signOut();

    Get.offAllNamed(AppRoutes.loginapi);
    Get.snackbar("Logout", "Anda telah keluar");
  }
}
