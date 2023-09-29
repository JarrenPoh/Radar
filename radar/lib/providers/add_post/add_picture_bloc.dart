import 'dart:async';

import 'package:flutter/material.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:radar/valueNotifier/bool_value.dart';

class AddPictureBloc with ChangeNotifier{
  final StreamController<InstaAssetsExportDetails> imgStreamController =
      StreamController<InstaAssetsExportDetails>();
  int maxAssets = 10;
  final BoolValueNotifier addPictureNotifier = BoolValueNotifier(false);
  List assetPics = [];
}