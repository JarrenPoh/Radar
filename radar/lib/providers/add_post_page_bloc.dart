import 'dart:async';

import 'package:flutter/material.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';

class AddPostPageBloc with ChangeNotifier{
  List imgList = [];
  final StreamController<InstaAssetsExportDetails> imgStreamController = StreamController<InstaAssetsExportDetails>();
  
}