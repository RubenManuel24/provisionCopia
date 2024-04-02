import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String patch = "PATCH";
  static const String delete = "DELETE";
}

class HttpManager {
  Future<Map> resRequest(
      {required String urlEndPoint,
      required method,
      Map? headers,
      Map? body}) async {
    //Headers da Requisição
    final defaultHeader = headers?.cast<String, String>() ?? {}
      ..addAll({
        'Content-Type': 'application/json',
        'accept': '*/*',
      });

    Dio dio = Dio();

    try {
      Response response = await dio.request(urlEndPoint,
          options: Options(
            method: method,
            headers: defaultHeader,
          ),
          data: body);

      //Retorno dos resultados do BackEnd
      return response.data;
    } on DioException catch (error) {
      //Retorno do erro da Dio request
      if (error.response?.data is Map<dynamic, dynamic>) {
        return error.response?.data as Map<dynamic, dynamic>;
      } else {
        // Trate o caso em que error.response?.data não é um Map
        return {}; // Ou qualquer valor padrão que faça sentido para seu caso
      }
    } catch (error) {
      //Retorno de Map vazio para erro generalizado
      return {};
    }
  }
}
