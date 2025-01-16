function injectStyle (ssrContext) {
  require("!!../../node_modules/extract-text-webpack-plugin/dist/loader.js?{\"omit\":1,\"remove\":true,\"publicPath\":\"../../\"}!vue-style-loader!css-loader?{\"sourceMap\":true}!../../node_modules/vue-loader/lib/style-compiler/index?{\"vue\":true,\"id\":\"data-v-5664626c\",\"scoped\":true,\"hasInlineConfig\":false}!sass-loader?{\"sourceMap\":true}!sass-resources-loader?{\"resources\":\"C:\\\\Users\\\\17563\\\\Documents\\\\WeChat Files\\\\wxid_1wlsabavb7ok21\\\\FileStorage\\\\File\\\\2020-09\\\\v2\\\\src\\\\assets\\\\style\\\\mixin.scss\"}!../../node_modules/vue-loader/lib/selector?type=styles&index=0!./success.vue")
}
var normalizeComponent = require("!../../node_modules/vue-loader/lib/component-normalizer")
/* script */
export * from "!!babel-loader!../../node_modules/vue-loader/lib/selector?type=script&index=0!./success.vue"
import __vue_script__ from "!!babel-loader!../../node_modules/vue-loader/lib/selector?type=script&index=0!./success.vue"
/* template */
import __vue_template__ from "!!../../node_modules/vue-loader/lib/template-compiler/index?{\"id\":\"data-v-5664626c\",\"hasScoped\":true,\"transformToRequire\":{\"video\":[\"src\",\"poster\"],\"source\":\"src\",\"img\":\"src\",\"image\":\"xlink:href\"},\"buble\":{\"transforms\":{}}}!../../node_modules/vue-loader/lib/selector?type=template&index=0!./success.vue"
/* template functional */
var __vue_template_functional__ = false
/* styles */
var __vue_styles__ = injectStyle
/* scopeId */
var __vue_scopeId__ = "data-v-5664626c"
/* moduleIdentifier (server only) */
var __vue_module_identifier__ = null
var Component = normalizeComponent(
  __vue_script__,
  __vue_template__,
  __vue_template_functional__,
  __vue_styles__,
  __vue_scopeId__,
  __vue_module_identifier__
)

export default Component.exports



//////////////////
// WEBPACK FOOTER
// ./src/view/success.vue
// module id = null
// module chunks = 