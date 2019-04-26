AMUI.dialog.alert({
  title: '错误提示', content: '你的家还好吧', onConfirm: function () {
    console.log('close');
  }
});
AMUI.dialog.confirm({
  title: '错误提示', content: '正文内容', onConfirm: function () {
    console.log('onConfirm');
  }, onCancel: function () {
    console.log('onCancel')
  }
});
var $loading = AMUI.dialog.loading();
setTimeout(function () {
  $loading.modal('close');
}, 3000);
var $actions = AMUI.dialog.actions({
  title: '标题啊',
  items: [{content: '<a href="#"><span class="am-icon-wechat"></span> 分享到微信</a>'}, {content: '<a href="#"><i class="am-icon-mobile"></i> 短信分享</a>'}, {content: '<a href="#"><i class="am-icon-twitter"></i> 分享到 XX 萎跛</a>'}],
  onSelected: function (index, target) {
    console.log(index);
    $actions.close();
  }
});
$actions.show();
AMUI.dialog.popup({title: '标题', content: '正文'});