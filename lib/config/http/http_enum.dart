enum BaseUrl {
  devBazaar,
  bigbull,
  noBaseUrl;

  String get url => _getBaseUrl(this);
}

String _getBaseUrl(BaseUrl base) {
  return switch (base) {
    BaseUrl.bigbull => "https://api.bigbullsind.com/",
    BaseUrl.devBazaar => 'https://devapi.bazaarconn.xyz/',
    BaseUrl.noBaseUrl => '',
  };
}
