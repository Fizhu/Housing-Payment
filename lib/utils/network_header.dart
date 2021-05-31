class NetworkHeader {
  static getNetworkHeader() =>
      <String, dynamic>{
        "Access-Control-Allow-Origin": "*",
        "Vary": "Origin",
        "Vary": "Access-Control-Request-Method",
        "Vary": "Access-Control-Request-Headers",
        "Access-Control-Allow-Headers": "Content-Type, Origin, Accept, token",
        "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  };
}
