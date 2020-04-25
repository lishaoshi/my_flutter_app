import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import './view_state.dart';
import 'package:flutter_provider/dio/dio_config.dart';

// export './view_state.dart';


class ViewStateModel with ChangeNotifier {
  //页面丢失取消监听
  bool _disposed = false;


  ViewState _viewState;
  ViewStateError _viewStateError;

  ///获取页面当前状态 isIdle：暂无请求，展示数据（正藏），isBusy：请求中， isEmpty:没数据， isError: 请求错误
  //get 
  bool get isIdle =>_viewState ==ViewState.idle;
  bool get isBusy => _viewState == ViewState.busy;
  bool get isEmpty => _viewState == ViewState.empty;
  bool get isError => _viewState == ViewState.error;
  ViewState get viewState => _viewState;
  ViewStateError get viewStateError => _viewStateError;


  ///设置状态的方法
  //set
  void setIdle ()=>_viewState=ViewState.idle;
  void setBusy ()=>_viewState=ViewState.busy;
  void setEmpty ()=>_viewState=ViewState.empty;

  void setError (e, s, {String message}){
    ViewStateErrorType errorType = ViewStateErrorType.defaultError;
    if(e is DioError) {
      if( e.type == DioErrorType.CONNECT_TIMEOUT || 
          e.type == DioErrorType.SEND_TIMEOUT || 
          e.type == DioErrorType.RECEIVE_TIMEOUT ) 
      {
        errorType = ViewStateErrorType.networkTimeOutError;
        message = e.error;
      }
      else if ( e.type == DioErrorType.RESPONSE ) 
      {
        //后台设置的错误状态码： 500、404
        // errorType = ViewStateErrorType.defaultError
        message = e.message;

      }
      else if (e.type == DioErrorType.CANCEL) {
        // to be continue...
        message = e.error;
      }
    } else {
      e = e.error;
      if(e is UnAuthorizedException) {
        s = null;
        errorType = ViewStateErrorType.unauthorizedError;
      } else if(e is NotSuccessException) {
        s = null;
        message = e.message;
      } else if(e is SocketException) {
        errorType = ViewStateErrorType.networkTimeOutError;
        message = e.message;
      } else {
        message = e.message;
      }
    }
    _viewState = ViewState.error;

    _viewStateError = ViewStateError(
      errorType,
      message: message,
      errorMessage: e.toString(),
    );
  }

   @override
  String toString() {
    return 'BaseModel{_viewState: $_viewState, _viewStateError: $_viewStateError}';
  }
  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    debugPrint('view_state_model dispose -->$runtimeType');
    super.dispose();
  }

  
  /// [e]为错误类型 :可能为 Error , Exception ,String
/// [s]为堆栈信息
printErrorStack(e, s) {
  debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----error-----↓↓↓↓↓↓↓↓↓↓----->
$e
<-----↑↑↑↑↑↑↑↑↑↑-----error-----↑↑↑↑↑↑↑↑↑↑----->''');
  if (s != null) debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----trace-----↓↓↓↓↓↓↓↓↓↓----->
$s
<-----↑↑↑↑↑↑↑↑↑↑-----trace-----↑↑↑↑↑↑↑↑↑↑----->
    ''');
}






}