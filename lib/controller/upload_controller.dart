class UploadController {
  String? validateDescription(String? input) {
    if (input == null || input.isEmpty) {
      return "Please provide a description";
    }
    return null;
  }

  String? validateName(String? input) {
    if (input == null || input.isEmpty) {
      return "Please provide a name";
    }
    return null;
  }
}
