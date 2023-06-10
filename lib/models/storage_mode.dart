import 'dart:js_interop';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageModel {
  final Reference? ref;
  final String? name;
  final String? url;

  const StorageModel({
    @required this.ref,
    @required this.name,
    @required this.url,
  });

  factory StorageModel.fromModel(StorageModel model) =>
      StorageModel(ref: model.ref, name: model.name, url: model.url);
}
