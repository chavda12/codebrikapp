class HttpResult<T> {
  HttpResultStatus status;
  T? data;
  String message;

  HttpResult.loading(this.message) : status = HttpResultStatus.LOADING;
  HttpResult.completed(this.data,
      [this.status = HttpResultStatus.COMPLETED, this.message = 'Success']);
  HttpResult.error([String? message])
      : status = HttpResultStatus.ERROR,
        message = message ?? "";

  bool get hasError => status == HttpResultStatus.ERROR && message.isNotEmpty;
  bool get hasData => status == HttpResultStatus.COMPLETED && data != null;

  bool get isNull => data == null;

  bool get isNotNull => !isNull;

  bool get isEmpty {
    if (isNull) return true;

    if (data is List) {
      return (data as List).isEmpty;
    }
    if (data is Map) {
      return (data as Map).isEmpty;
    }

    return data.toString().trim().isEmpty;
  }

  bool get showOtpBox {
    if (data is Map) {
      return (data as Map)['other_info']['showOTPBox'] == true;
    }
    return false;
  }

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum HttpResultStatus { LOADING, COMPLETED, ERROR }
