class RApiConstants {
  RApiConstants._();

  static const String apiKey = 'your_api_key_here';

  /// Base API configuration
  static const String baseScheme = 'https';
  static const String baseHost = 'api.reshop.app';
  static const String apiVersion = 'v1';
  static const String basePath = '/$apiVersion';

  /// Authentication endpoints
  static const String authPath = '$basePath/auth';
  static const String signInPath = '$authPath/sign-in';
  static const String signUpPath = '$authPath/sign-up';
  static const String refreshTokenPath = '$authPath/refresh-token';
  static const String forgotPasswordPath = '$authPath/forgot-password';

  /// Commerce resources
  static const String productsPath = '$basePath/products';
  static const String categoriesPath = '$basePath/categories';
  static const String collectionsPath = '$basePath/collections';
  static const String cartPath = '$basePath/cart';
  static const String wishlistPath = '$basePath/wishlist';
  static const String ordersPath = '$basePath/orders';
  static const String paymentsPath = '$basePath/payments';
  static const String profilePath = '$basePath/profile';
  static const String addressPath = '$basePath/addresses';
  static const String reviewsPath = '$basePath/reviews';

  /// Query parameter keys
  static const String queryPage = 'page';
  static const String queryLimit = 'limit';
  static const String querySort = 'sort';
  static const String querySearch = 'search';
  static const String queryCategory = 'category';
  static const String queryCollection = 'collection';
  static const String queryPriceMin = 'price_min';
  static const String queryPriceMax = 'price_max';
  static const String queryRatingMin = 'rating_min';
  static const String queryInclude = 'include';

  /// Header keys
  static const String headerAuthorization = 'Authorization';
  static const String headerContentType = 'Content-Type';
  static const String headerAccept = 'Accept';
  static const String headerApiKey = 'x-api-key';

  static const Map<String, String> defaultJsonHeaders = <String, String>{
    headerContentType: 'application/json',
    headerAccept: 'application/json',
  };

  static Map<String, String> authorizedHeaders(String bearerToken) {
    return <String, String>{
      ...defaultJsonHeaders,
      headerAuthorization: 'Bearer $bearerToken',
    };
  }

  static Map<String, String> withApiKey(Map<String, String> headers,
      String apiKey) {
    return <String, String>{
      ...headers,
      headerApiKey: apiKey,
    };
  }

  static Uri buildUri(String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return Uri(
      scheme: baseScheme,
      host: baseHost,
      path: path,
      queryParameters: queryParameters?.map(
            (String key, dynamic value) =>
            MapEntry<String, String>(key, value.toString()),
      ),
    );
  }

  static Uri paginatedProductUri({
    int page = 1,
    int limit = 20,
    String? categoryId,
    String? collectionId,
    String? sort,
  }) {
    final Map<String, dynamic> params = <String, dynamic>{
      queryPage: page,
      queryLimit: limit,
    };
    if (categoryId != null && categoryId.isNotEmpty) {
      params[queryCategory] = categoryId;
    }
    if (collectionId != null && collectionId.isNotEmpty) {
      params[queryCollection] = collectionId;
    }
    if (sort != null && sort.isNotEmpty) {
      params[querySort] = sort;
    }
    return buildUri(productsPath, queryParameters: params);
  }

  static Uri searchProductsUri({
    required String query,
    int page = 1,
    int limit = 20,
  }) {
    final Map<String, dynamic> params = <String, dynamic>{
      querySearch: query,
      queryPage: page,
      queryLimit: limit,
    };
    return buildUri('$productsPath/search', queryParameters: params);
  }

  static Uri orderDetailsUri(String orderId) {
    return buildUri('$ordersPath/$orderId');
  }

  static Uri collectPaymentUri(String orderId) {
    return buildUri('$paymentsPath/$orderId/collect');
  }

  static Uri reviewProductUri(String productId) {
    return buildUri('$reviewsPath/$productId');
  }
}
