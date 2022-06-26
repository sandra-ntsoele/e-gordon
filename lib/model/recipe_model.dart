import 'dart:io';

import 'package:e_gordon/services/auth_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class Recipes {
  /* 
    Class fields 
  */
  String recipe;
  String description;
  String category;
  String diet;
  PlatformFile image;

  late String? chefID;
  late int categoryID;
  late int dietID;
  late String photoURL;

  static SupabaseClient supabase = Supabase.instance.client;

  /* 
   * Getters/Setters
  */
  late Map data;

  /* 
   * Constructor
  */
  Recipes({
    required this.recipe,
    required this.description,
    required this.category,
    required this.diet,
    required this.image,
  }) {
    chefID = AuthService().currentUser?.uid; // Initialise chefID

    // Initialise categoryID
    _addRecipeCategory().then((response) async {
      if (response == "23505") {
        // Category already exists so find existing id
        categoryID = await _getCategoryID();
      } else {
        // If insert was successful get the new ID
        categoryID = response;
      }
    });

    print(categoryID);

    // Initialise dietID
    _addDiet().then(
      (response) async {
        if (response == "23505") {
          // Diet already exists so find existing id
          dietID = await _getDietID();
        } else {
          // If insert was successful get the new ID
          dietID = response;
        }
      },
    );

    // Initialise photoURL
    _uploadRecipePhoto().then(
      (response) {
        if (response.runtimeType == StorageError) {
          throw response;
        } else {
          photoURL = response;
        }
      },
    );
  }

  /* 
    Class methods 
  */
  Future<dynamic> _uploadRecipePhoto() async {
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
      return res.error;
    } else {
      String? publicURL = supabase.storage
          .from('recipe-files')
          .getPublicUrl(finalFileName)
          .data;

      return publicURL;
    }
  }

  Future<int> _getCategoryID() async {
    PostgrestResponse<dynamic> response = await supabase
        .from("recipecategories")
        .select("categoryid")
        .eq("category", category)
        .execute();

    return response.data[0]["categoryid"];
  }

  Future<dynamic> _addRecipeCategory() async {
    PostgrestResponse<dynamic> response = await supabase
        .from("recipecategories")
        .insert({'category': category},
            returning: ReturningOption.representation).execute();

    if (response.hasError) {
      return response.error?.code;
    } else {
      return response.data[0]["categoryid"];
    }
  }

  Future<dynamic> _addDiet() async {
    PostgrestResponse<dynamic> response = await supabase.from("diets").insert(
        {'diet': diet},
        returning: ReturningOption.representation).execute();

    if (response.hasError) {
      return response.error?.code;
    } else {
      return response.data[0]["dietid"];
    }
  }

  Future<int> _getDietID() async {
    PostgrestResponse<dynamic> response = await supabase
        .from("recipecategories")
        .select("categoryid")
        .eq("category", category)
        .execute();

    return response.data[0]["categoryid"];
  }

  void createRecipe() async {
    try {
      final response = await supabase.from("recipes").insert([
        {
          'recipe': recipe,
          'description': description,
          'photoURL': photoURL,
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
}
