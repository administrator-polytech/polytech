import 'package:flutter/material.dart';
import '/backend/schema/enums/enums.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _applicationPage =
          await secureStorage.read(key: 'ff_applicationPage') != null
              ? deserializeEnum<ApplicationPage>(
                  (await secureStorage.getString('ff_applicationPage')))
              : _applicationPage;
    });
    await _safeInitAsync(() async {
      _applicationPageHover =
          await secureStorage.read(key: 'ff_applicationPageHover') != null
              ? deserializeEnum<ApplicationPage>(
                  (await secureStorage.getString('ff_applicationPageHover')))
              : _applicationPageHover;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  ApplicationPage? _applicationPage = ApplicationPage.home;
  ApplicationPage? get applicationPage => _applicationPage;
  set applicationPage(ApplicationPage? value) {
    _applicationPage = value;
    value != null
        ? secureStorage.setString('ff_applicationPage', value.serialize())
        : secureStorage.remove('ff_applicationPage');
  }

  void deleteApplicationPage() {
    secureStorage.delete(key: 'ff_applicationPage');
  }

  int _currentAboutUsPage = 0;
  int get currentAboutUsPage => _currentAboutUsPage;
  set currentAboutUsPage(int value) {
    _currentAboutUsPage = value;
  }

  ApplicationPage? _applicationPageHover;
  ApplicationPage? get applicationPageHover => _applicationPageHover;
  set applicationPageHover(ApplicationPage? value) {
    _applicationPageHover = value;
    value != null
        ? secureStorage.setString('ff_applicationPageHover', value.serialize())
        : secureStorage.remove('ff_applicationPageHover');
  }

  void deleteApplicationPageHover() {
    secureStorage.delete(key: 'ff_applicationPageHover');
  }

  HomePageShowcaseWidget? _currentHomePageShowcaseWidget =
      HomePageShowcaseWidget.galaxy;
  HomePageShowcaseWidget? get currentHomePageShowcaseWidget =>
      _currentHomePageShowcaseWidget;
  set currentHomePageShowcaseWidget(HomePageShowcaseWidget? value) {
    _currentHomePageShowcaseWidget = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
