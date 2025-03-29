// ignore: file_names
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  Future<bool?> show(String msg) async {
    await cancelToast();
    return await Fluttertoast.showToast(msg: msg);
  }

  Future<bool?> cancelToast() async {
    return await Fluttertoast.cancel();
  }
}
