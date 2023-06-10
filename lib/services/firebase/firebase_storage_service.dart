import 'dart:io' as io;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/storage_mode.dart';
// import 'package:universal_html/html.dart';

class FirebaseStorageService extends GetxService {
  //ref("signager") - this indicates the storage parent folder
  final storageRef = FirebaseStorage.instance.ref("dysignager");

  Reference? imagesRef;
  Reference? videosRef;

  FirebaseStorageService() {
    imagesRef = storageRef.child('images');
    videosRef = storageRef.child('videos');
  }

  getFileDetails(String fileName) {
    final imageRef = imagesRef?.child(fileName);
    final imageRefPath =
        imageRef?.fullPath; //this will get the full path in the cloud
    final imageRefName = imageRef?.name; //gets the file name

    imagesRef = imageRef?.parent;
  }

  Future<UploadTask> uploadFiles(io.File file) =>
      Future.value(imagesRef?.putFile(file));

  Future<List<StorageModel>> getAllImageUrl() async {
    //this will list all the entries present in the dysignager/images folder
    final response = await imagesRef?.listAll();

    if (response?.items != null) {
      var listOfFiles = await Future.wait(
          response!.items.map((ref) => ref.getDownloadURL()).toList());

      return listOfFiles.asMap().map((key, url) {
        var model = StorageModel(
          ref:  response.items[key],
          name: response.items[key].name,
          url: url
        );
        return MapEntry(key,model);
      }).values.toList();
    }

    return List<StorageModel>.empty(growable: false);
  }

  static downloadVideoUrl(Reference ref) async {
    final dir = await getApplicationDocumentsDirectory();

    //name of the directory that you want your files to be stored
    var customDirectory = io.Directory("${dir.path}/dysignager");

    //will create the directory if not yet created
    if (await customDirectory.exists() == false) {
      await customDirectory.create(recursive: true);
    }

    //this will let the
    final file = io.File("${dir.path}/dysignager/${ref.name}");

    await ref.writeToFile(file);
  }
}
