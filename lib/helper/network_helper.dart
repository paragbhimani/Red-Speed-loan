import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lone_counter/utils/app_config.dart';

class NetworkHelper {

  static Future<AdsModel> fetchData() async {
    final response =
    await http.get(Uri.parse(AppConfig.baseUrl));
    if (response.statusCode == 200) {
      print('responce ~~~~~~~~~~~~~~~~~~> ${response.body}');
       AdsModel model = AdsModel.fromJson(json.decode(response.body));
      AppConfig.redirect = model.redirect!;
      AppConfig.redirectlogo = model.redirectlogo!;
      AppConfig.applogorate = model.applogo!;
      AppConfig.native_id = model.nativeId!;
      AppConfig.interstrial_ad = model.interstrialAd!;
      AppConfig.banner_id = model.bannerId!;
      AppConfig.appopen = model.appopen!;
      AppConfig.privacypolicy = model.privacypolicy!;
      AppConfig.ratepakagename = model.ratepakagename!;
      AppConfig.pakagename = model.pakagename!;
      return AdsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load AdsModel');
    }
  }
}


class AdsModel {
  AdsModel({
    this.nativeId,
    this.interstrialAd,
    this.bannerId,
    this.appopen,
    this.privacypolicy,
    this.pakagename,
    this.redirect,
    this.ratepakagename,
    this.applogo,
    this.redirectlogo,
  });

  String ?nativeId;
  String ?interstrialAd;
  String ?bannerId;
  String ?appopen;
  String ?privacypolicy;
  String ?pakagename;
  String ?redirect;
  String ?ratepakagename;
  String ?applogo;
  String ?redirectlogo;

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
    nativeId: json["native_id"],
    interstrialAd: json["interstrial_ad"],
    bannerId: json["banner_id"],
    appopen: json["appopen"],
    privacypolicy: json["privacypolicy"],
    pakagename: json["pakagename"],
    redirect: json["redirect"],
    ratepakagename: json["ratepakagename"],
    applogo: json["applogo"],
    redirectlogo: json["redirectlogo"],
  );

  Map<String, dynamic> toJson() => {
    "native_id": nativeId,
    "interstrial_ad": interstrialAd,
    "banner_id": bannerId,
    "appopen": appopen,
    "privacypolicy": privacypolicy,
    "pakagename": pakagename,
    "redirect": redirect,
    "ratepakagename": ratepakagename,
    "applogo": applogo,
    "redirectlogo": redirectlogo,
  };
}