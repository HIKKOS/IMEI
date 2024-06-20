class Result<TValue, TError> {
  final TValue? _data;
  final TError? _error;

  Result.success({required TValue? data})
      : _data = data,
        _error = null;
  Result.failure({required TError? error})
      : _error = error,
        _data = null;

  bool get isSuccess => _data != null;
  TValue? get data => _data;
  TError? get error => _error;

  when({
    required void Function(TValue value) success,
    required void Function(TError error) failure,
  }) {
    if (_data != null) {
      success(_data as TValue);
      return;
    } else {
      failure(_error as TError);
    }
  }
}
