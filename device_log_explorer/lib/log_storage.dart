import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'log_model.dart';

class LogStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/device_logs.json');
  }

  Future<List<LogEntry>> loadLogs() async {
    try {
      final file = await _localFile;
      if (!await file.exists()) return [];

      final contents = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(contents);

      return jsonData.map((e) => LogEntry.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> saveLogs(List<LogEntry> logs) async {
    final file = await _localFile;
    final jsonList = logs.map((e) => e.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonList));
  }
}
