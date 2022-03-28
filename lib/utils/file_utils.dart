import 'dart:math';

class FileUtils {
  FileUtils._();

  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  // get File Extension
  static String getFileExtension(String fileName) {
    var split = fileName.split('.');
    return split[split.length - 1];
  }
}
