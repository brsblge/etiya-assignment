import 'api_content_type.dart';
import 'api_method.dart';
import 'api_response_type.dart';

class ApiCall<TOutput extends Object> {
  ApiCall({
    required this.method,
    required this.path,
    this.contentType = ApiContentType.json,
    this.responseType = ApiResponseType.json,
    this.responseMapper,
    this.queryParams,
    this.body,
    this.ignoreBaseUrl,
    this.ignoreBadCertificate,
    this.canLogContent = true,
  }) {
    if (method == ApiMethod.get) {
      assert(body == null, 'Get APIs cannot have a body to send!');
    }
    if (responseType == ApiResponseType.json && method == ApiMethod.get) {
      assert(
        responseMapper != null,
        '''
Get APIs must have a response mapper provided if JSON is expected as a response!''',
      );
    } else if (responseType == ApiResponseType.text) {
      assert(
        TOutput == String,
        'Output type should be String if text is expected as a response!',
      );
      assert(
        responseMapper == null,
        'Response mapper cannot be set if text is expected as a response!',
      );
    }
  }

  /// Api method.
  final ApiMethod method;

  /// Api path. It can also be an endpoint if base url is provided.
  final String path;

  /// Specified api request content type. Defaults to [ApiContentType.json].
  final ApiContentType contentType;

  /// Expected api response type. Defaults to [ApiResponseType.json].
  final ApiResponseType responseType;

  /// Mapper to deserialize response JSON map.
  final TOutput Function(dynamic response)? responseMapper;

  /// Additional query parameters.
  final Map<String, dynamic>? queryParams;

  /// Request body to send.
  final dynamic body;

  /// Ignore base url to be able to use full path only.
  final bool? ignoreBaseUrl;

  /// Whether ignore bad certificate or not.
  final bool? ignoreBadCertificate;

  /// Whether request/response contents can be logged or not. Defaults to true.
  final bool canLogContent;
}
