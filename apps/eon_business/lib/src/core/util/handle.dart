/// Handles a future operation by providing callbacks for processing,
/// success, and error scenarios.
///
/// This function executes the given future and calls the appropriate
/// callback based on the outcome.
///
/// - [future] is the future operation to be executed.
/// - [onProcessing] is called before the future starts processing.
/// - [onError] is called if the future throws an error, with the error and stack trace.
/// - [onSuccess] is called if the future completes successfully, with the result data.
Future<void> futureHandle<T>(
  Future<T> future, {
  required void Function() onProcessing,
  required void Function(T data) onSuccess,
  required void Function(Object error, StackTrace stackTrace) onError,
}) async {
  try {
    // Invoke the processing callback before starting the future.
    onProcessing.call();
    // Await the future and call the success callback with the result.
    final data = await future;
    onSuccess(data);
  } on Object catch (error, stackTrace) {
    // If an error occurs, call the error callback with the error and stack trace.
    onError(error, stackTrace);
  }
}
