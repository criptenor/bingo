import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class MercadopagoCall {
  static Future<ApiCallResponse> call({
    double? amount = 1,
    String? email = 'adeilton@gmail.com',
    String? firstName = 'dfsdhnjysfsfd',
    String? token =
        'APP_USR-3670598789067419-082914-499a54f5fa47ddabc17be2267260c442-273265872',
    String? uuid4 = '',
    String? lastName = '',
    String? identificationType = '',
    String? numberCpf = '',
  }) async {
    final ffApiRequestBody = '''
{
  "transaction_amount": ${amount},
  "payment_method_id": "pix",
  "payer": {
    "email": "${email}",
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "identification": {
      "type": "${identificationType}",
      "number": "${numberCpf}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MERCADOPAGO',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'X-Idempotency-Key': '${uuid4}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? qrcode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.qr_code''',
      ));
  static double? valor(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.transaction_details.total_paid_amount''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ConferirpagamentoCall {
  static Future<ApiCallResponse> call({
    String? idPix = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CONFERIRPAGAMENTO',
      apiUrl: 'https://api.mercadopago.com/v1/payments/${idPix}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
