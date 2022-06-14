import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class Recipes {
  String recipe;
  String description;
  String photoURL;
  int? rating;
  int chefID;
  int categoryID;
  int dietID;

  Recipes({
    required this.recipe,
    required this.description,
    required this.photoURL,
    this.rating,
    required this.categoryID,
    required this.chefID,
    required this.dietID,
  });

  static SupabaseClient supabase = Supabase.instance.client;

  Future<String?> _uploadRecipePhoto(PlatformFile image) async {
    // Upload to bucket
    String path = image.path.toString();
    String fileName = image.name;
    int fileNameLength = fileName.length;
    String? extension = image.extension;
    int extensionLength = image.extension!.length.toInt() + 1;
    final parsedFileName = fileName.characters
        .take(fileNameLength - extensionLength); // File name sans extension

    File photo = File(path);
    String uuid = const Uuid().v1();
    String finalFileName = "$parsedFileName-$uuid.$extension";

    StorageResponse<String> res =
        await supabase.storage.from('recipe-files').upload(
              'photos/$finalFileName',
              photo,
            );

    if (res.hasError) {
      return res.error?.message;
    } else {
      String? publicURL = supabase.storage
          .from('recipe-files')
          .getPublicUrl(finalFileName)
          .data;

      return publicURL;
    }
  }

  void createRecipe(PlatformFile image) async {
    try {
      // First upload photo to get URL
      _uploadRecipePhoto(image);
      final response = await supabase.from("recipes").insert([
        {
          'recipe': recipe,
          'description': description,
          'photoURL': photoURL,
          'rating': rating,
          'categoryID': categoryID,
          'chefID': chefID,
          'dietID': dietID,
        }
      ]).execute();

      print(response);
    } catch (e) {
      print(e);
    }
  }
  // TODO: GET recipe method
  // TODO: UPDATE recipe method
  // TODO: DELETE recipe method

}
