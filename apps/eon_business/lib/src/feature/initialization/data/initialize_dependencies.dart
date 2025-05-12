import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:eon_business/src/core/config/config.dart';
import 'package:eon_business/src/core/model/dependencies.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Initialize [Dependencies].
///
/// It will initialize the [Dependencies] using the available config.
///
/// It will throw an exception if the [Dependencies] cannot be initialized.
///
/// Returns the initialized [Dependencies].
Future<Dependencies> $initializeDependencies() async {
  // final stopwatch = Stopwatch()..start();
  try {
    final dependencies = Dependencies();
    final sharedPreferences = await SharedPreferences.getInstance();

    /// Configure and create the [Dio] instance.
    final dio = Dio(BaseOptions(baseUrl: Config.baseUrl, receiveDataWhenStatusError: true));

    /// Add interceptors to the [Dio] instance.
    dio.interceptors.addAll([
      /// Retry interceptor.
      ///
      /// It will retry the request if it fails.
      RetryInterceptor(
        dio: dio,
        logPrint: print, // specify log function (optional)
        retries: 3, // retry count (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),

      /// Cache interceptor.
      ///
      /// It will cache the responses and return the cached response
      /// if the request fails.
      DioCacheInterceptor(
        options: CacheOptions(
          // A default store is required for interceptor.
          store: MemCacheStore(),

          // All subsequent fields are optional to get a standard behaviour.

          // Default.
          policy: CachePolicy.request,
          // Returns a cached response on error for given status codes.
          // Defaults to `[]`.
          hitCacheOnErrorCodes: [500],
          // Allows to return a cached response on network errors (e.g. offline usage).
          // Defaults to `false`.
          hitCacheOnNetworkFailure: true,
          // Overrides any HTTP directive to delete entry past this duration.
          // Useful only when origin server has no cache config or custom behaviour is desired.
          // Defaults to `null`.
          maxStale: const Duration(days: 7),
          // Default. Allows 3 cache sets and ease cleanup.
          priority: CachePriority.normal,
          // Default. Body and headers encryption with your own algorithm.
          cipher: null,
          // Default. Key builder to retrieve requests.
          keyBuilder: CacheOptions.defaultCacheKeyBuilder,
          // Default. Allows to cache POST requests.
          // Assigning a [keyBuilder] is strongly recommended when `true`.
          allowPostMethod: false,
        ),
      ),
    ]);

    /// Set the [HttpClientAdapter] for the [Dio] instance.
    dio.httpClientAdapter = HttpClientAdapter();

    return dependencies
      ..dio = dio
      ..sharedPreferences = sharedPreferences;
  } on Object {
    rethrow;
  } finally {
    // log('${(stopwatch..stop()).elapsedMicroseconds} μs', name: 'select', level: 100);
  }
}
