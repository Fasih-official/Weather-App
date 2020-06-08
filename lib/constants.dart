class Constants {
  static final String BASE_URL = "https://www.metaweather.com/";

  static String printWrapped(String text) {
    String generatedString = '';
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach(
        (match) => {generatedString = generatedString + match.group(0)});

    return generatedString;
  }
}
