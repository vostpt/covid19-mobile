import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {}

class MockBaseOptions extends Mock implements BaseOptions {}

class MockDefaultHttpClientAdapter extends Mock implements DefaultHttpClientAdapter {}
