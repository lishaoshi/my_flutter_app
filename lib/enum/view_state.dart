//页面状态类型
enum ViewState {
  hasdata,  //正常显示， 有数据
  empty,  //无数据
  busy,   // 正在请求中
  error   // 请求错误
}