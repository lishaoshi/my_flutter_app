


enum ViewState {
  idle,  //空闲状态，有数据展示
  busy,  //正在请求中
  empty, //空，没有数据展示
  error, //请求错误
}

///错误枚举
enum ViewStateErrorType {
  defaultError,          //其他错误  状态码：500、404、403
  networkTimeOutError,  //网络超时
  unauthorizedError    //用户未登录
}


class ViewStateError {
  ViewStateErrorType _errorType;
  String message;
  String errorMessage;

  ViewStateError(this._errorType, {this.message, this.errorMessage}) {
    _errorType ??= ViewStateErrorType.defaultError;
    message ??= errorMessage;
  }

  ViewStateErrorType get errorType => _errorType;

  /// 以下变量是为了代码书写方便,加入的get方法.严格意义上讲,并不严谨
  get isDefaultError => _errorType == ViewStateErrorType.defaultError;
  get isNetworkTimeOut => _errorType == ViewStateErrorType.networkTimeOutError;
  get isUnauthorized => _errorType == ViewStateErrorType.unauthorizedError;

  @override
  String toString() {
    return 'ViewStateError{errorType: $_errorType, message: $message, errorMessage: $errorMessage}';
  }
}