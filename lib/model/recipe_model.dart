import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  String? rcpName;
  String? rcpDescription;
  List? rcpDirections;
  int? rcpCookTime;
  int? rcpServings;

  Future<void> createRecipe() {
    CollectionReference recipes =
        FirebaseFirestore.instance.collection("recipes");

    return recipes.add({
      "RcpName": rcpName,
      "RcpDescription": rcpDescription,
      "RcpDirections": rcpDirections,
      "RcpCookTime": rcpCookTime,
      "RcpServings": rcpServings
    });
  }
}
