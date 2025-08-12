import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Banco de dados Quicky Group Code

class BancoDeDadosQuickyGroup {
  static String getBaseUrl() =>
      'https://southamerica-east1-quick-b108e.cloudfunctions.net';
  static Map<String, String> headers = {};
  static StripeIdentyVerifyCall stripeIdentyVerifyCall =
      StripeIdentyVerifyCall();
  static UpdateAccountStripeCopyCall updateAccountStripeCopyCall =
      UpdateAccountStripeCopyCall();
  static CriarContaStripeCopyCall criarContaStripeCopyCall =
      CriarContaStripeCopyCall();
  static VerifySessionStripeIdentifyCall verifySessionStripeIdentifyCall =
      VerifySessionStripeIdentifyCall();
  static CriarContaStripeCall criarContaStripeCall = CriarContaStripeCall();
}

class StripeIdentyVerifyCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
  }) async {
    final baseUrl = BancoDeDadosQuickyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'stripeIdenty Verify',
      apiUrl: '${baseUrl}/stripeIdentyWebhoock',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'accountId': accountId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class UpdateAccountStripeCopyCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
    String? tosAcceptanceIp = '',
    String? firstName = '',
    String? lastName = '',
    String? dobDay = '',
    String? ssnLast4 = '',
    String? email = '',
    dynamic bankAccountInfoJson,
  }) async {
    final baseUrl = BancoDeDadosQuickyGroup.getBaseUrl();

    final bankAccountInfo = _serializeJson(bankAccountInfoJson);

    return ApiManager.instance.makeApiCall(
      callName: 'update Account Stripe Copy',
      apiUrl: '${baseUrl}/updateAccountStripe',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'accountId': accountId,
        'tosAcceptanceIp': tosAcceptanceIp,
        'firstName': firstName,
        'lastName': lastName,
        'dob': dobDay,
        'ssnLast4': ssnLast4,
        'email': email,
        'bankAccountInfo': bankAccountInfo,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CriarContaStripeCopyCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = BancoDeDadosQuickyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Criar Conta Stripe Copy',
      apiUrl: '${baseUrl}/createAccountStripe',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accountId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.accountId''',
      ));
}

class VerifySessionStripeIdentifyCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
  }) async {
    final baseUrl = BancoDeDadosQuickyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Verify session stripe identify',
      apiUrl: '${baseUrl}/createVerificationSession',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'accountId': accountId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  String? session(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sessionId''',
      ));
}

class CriarContaStripeCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = BancoDeDadosQuickyGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar Conta Stripe',
      apiUrl: '${baseUrl}/createAccountStripe',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accountId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.accountId''',
      ));
}

/// End Banco de dados Quicky Group Code

/// Start Stripe Group Code

class StripeGroup {
  static String getBaseUrl() => 'https://api.stripe.com/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  static GetAccountCall getAccountCall = GetAccountCall();
  static RecuperarSaldoDoUsuarioCall recuperarSaldoDoUsuarioCall =
      RecuperarSaldoDoUsuarioCall();
  static CriarContaCall criarContaCall = CriarContaCall();
  static AccountLinksCall accountLinksCall = AccountLinksCall();
  static SessionCall sessionCall = SessionCall();
  static AdicionarSaldoParaOUsuarioCall adicionarSaldoParaOUsuarioCall =
      AdicionarSaldoParaOUsuarioCall();
}

class GetAccountCall {
  Future<ApiCallResponse> call({
    String? clientSecret = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Account',
      apiUrl: '${baseUrl}/payment_intents/${clientSecret}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'client_secret': clientSecret,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? accountOnboardFinish(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.charges_enabled''',
      ));
}

class RecuperarSaldoDoUsuarioCall {
  Future<ApiCallResponse> call({
    String? customer = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Recuperar Saldo do Usuario',
      apiUrl: '${baseUrl}/billing/credit_balance_summary',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'customer': customer,
        'filter': "credit_grant",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CriarContaCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? country = '',
    String? type = '',
    String? businessType = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Criar Conta',
      apiUrl: '${baseUrl}/accounts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'business_type': businessType,
        'type': type,
        'country': country,
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class AccountLinksCall {
  Future<ApiCallResponse> call({
    String? returnUrl = '',
    String? refreshUrl = '',
    String? type = '',
    String? account = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Account Links',
      apiUrl: '${baseUrl}/account_links',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'account': account,
        'type': type,
        'refresh_url': refreshUrl,
        'return_url': returnUrl,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class SessionCall {
  Future<ApiCallResponse> call({
    int? quantity,
    String? name = '',
    String? currency = '',
    String? cancelUrl = '',
    String? successUrl = '',
    int? unitAmount,
    String? connectedAcct = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Session',
      apiUrl: '${baseUrl}/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Stripe-Account': '${connectedAcct}',
      },
      params: {
        'cancel_url': cancelUrl,
        'success_url': successUrl,
        'line_items[0][price_data][currency]': currency,
        'line_items[0][price_data][product_data][name]': name,
        'line_items[0][quantity]': quantity,
        'mode': "payment",
        'line_items[0][price_data][unit_amount]': unitAmount,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  String? idSession(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class AdicionarSaldoParaOUsuarioCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    int? amount,
  }) async {
    final baseUrl = StripeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Adicionar Saldo para o Usuario',
      apiUrl: '${baseUrl}/billing/credit_grants',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'amount[monetary][value]': amount,
        'amount[monetary][currency]': "usd",
        'applicability_config[scope][price_type]': "metered",
        'customer': customer,
        'amount[type]': "monetary",
        'name': "Saldo Quicky",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Stripe Group Code

class CreateAccountStripeCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createAccountStripe',
      apiUrl:
          'https://southamerica-east1-quick-b108e.cloudfunctions.net/createAccountStripe',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListarTransacoesCall {
  static Future<ApiCallResponse> call({
    String? connectedAccountId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listarTransacoes',
      apiUrl:
          'https://us-central1-quick-b108e.cloudfunctions.net/listarTransacoes',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'connectedAccountId': connectedAccountId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? list(dynamic response) => getJsonField(
        response,
        r'''$.charges''',
        true,
      ) as List?;
}

class GetSaldoCall {
  static Future<ApiCallResponse> call({
    String? connectedAccountId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get saldo',
      apiUrl: 'https://us-central1-quick-b108e.cloudfunctions.net/getSaldo',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'connectedAccountId': connectedAccountId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? pending(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.balance.pending[:].amount''',
      ));
  static int? avaliable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.balance.available[:].amount''',
      ));
}

class CreateaccountstripeAllCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createaccountstripe all',
      apiUrl:
          'https://us-central1-quick-b108e.cloudfunctions.net/createAccountStripe',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RejetedTaskCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'rejetedTask',
      apiUrl:
          'https://us-central1-quick-b108e.cloudfunctions.net/rejectedTask/check-task?taskId=NXkirmKIhtJx3tY1s6CQ&currentTime=2025-06-17T18:00:00Z',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetirarSaldoStripeConnectedCall {
  static Future<ApiCallResponse> call({
    String? connectedAccountId = '',
    String? amount = '',
    String? paymentIntentId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'retirar saldo stripe connected',
      apiUrl: 'https://us-central1-quick-b108e.cloudfunctions.net/retirarSaldo',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'connectedAccountId': connectedAccountId,
        'amount': amount,
        'paymentIntentId': paymentIntentId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class UpdateAccountCall {
  static Future<ApiCallResponse> call({
    String? accountId = '',
    String? tosAcceptanceIp = '',
    String? firstName = '',
    String? lastName = '',
    dynamic dobJson,
    String? ssnLast4 = '',
    String? email = '',
    dynamic bankAccountInfoJson,
  }) async {
    final dob = _serializeJson(dobJson);
    final bankAccountInfo = _serializeJson(bankAccountInfoJson);
    final ffApiRequestBody = '''
{
  "accountId": "${escapeStringForJson(accountId)}",
  "tosAcceptanceIp": "${escapeStringForJson(tosAcceptanceIp)}",
  "firstName": "${escapeStringForJson(firstName)}",
  "lastName": "${escapeStringForJson(lastName)}",
  "dob": ${dob},
  "ssnLast4": "${escapeStringForJson(ssnLast4)}",
  "email": "${escapeStringForJson(email)}",
  "bankAccountInfo": ${bankAccountInfo}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateAccount',
      apiUrl:
          'https://southamerica-east1-quick-b108e.cloudfunctions.net/updateAccountStripe',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? sucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? capacidadeDeTransferencia(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.account.capabilities.transfers''',
      ));
}

class AddSaldoNoStripeConnectCopyCall {
  static Future<ApiCallResponse> call({
    String? connectedAccountId = '',
    String? amount = '',
    String? paymentIntentId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'add saldo no stripe connect Copy',
      apiUrl:
          'https://us-central1-quick-b108e.cloudfunctions.net/addSaldoStripe',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'connectedAccountId': connectedAccountId,
        'amount': amount,
        'paymentIntentId': paymentIntentId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LantlngForStringCall {
  static Future<ApiCallResponse> call({
    String? latlng = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'lantlng for string',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlng}&key=AIzaSyCFBfcNHFg97sM7EhKnAP4OHIoY3Q8Y_xQ',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latlng': latlng,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? formatAddress(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class MandarparaconnectedCall {
  static Future<ApiCallResponse> call({
    String? accountId = '',
    String? valor = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'mandarparaconnected',
      apiUrl:
          'https://us-central1-quick-b108e.cloudfunctions.net/realizarpagamentoparaoconnected',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'account_id': accountId,
        'valor': valor,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EnviarValorPaypalCall {
  static Future<ApiCallResponse> call({
    String? paypalEmail = '',
    String? amount = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'enviar valor paypal',
      apiUrl:
          'https://us-central1-quick-b108e.cloudfunctions.net/enviarPagamentoPayPal',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'paypalEmail': paypalEmail,
        'amount': amount,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
