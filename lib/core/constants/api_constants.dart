class ApiConstants {
  ApiConstants._();

  // OpenHolidays API
  static const String baseUrl = 'https://openholidaysapi.org';
  static const String countryCode = 'DE';
  static const String languageCode = 'DE';

  /// Get public holidays endpoint
  /// Returns holidays for a specific year in Germany
  static String publicHolidaysEndpoint(int year) =>
      '/PublicHolidays?countryIsoCode=$countryCode&languageIsoCode=$languageCode&validFrom=$year-01-01&validTo=$year-12-31';

  /// Get school holidays endpoint
  /// Returns school holidays for a specific year and subdivision in Germany
  static String schoolHolidaysEndpoint(int year, String subdivisionCode) =>
      '/SchoolHolidays?countryIsoCode=$countryCode&languageIsoCode=$languageCode&validFrom=$year-01-01&validTo=$year-12-31&subdivisionCode=$subdivisionCode';

  /// Get subdivisions (federal states) endpoint
  static String subdivisionsEndpoint() =>
      '/Subdivisions?countryIsoCode=$countryCode';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);

  /// Cache validity duration (24 hours)
  static const Duration cacheValidDuration = Duration(hours: 24);
}
