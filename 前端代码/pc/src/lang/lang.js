import Vue from 'vue'
import VueI18n from 'vue-i18n'
Vue.use(VueI18n)
import zh from './zh'
import en from './en'
import kr from './kr'
import jp from './jp'
import hk from './hk'
import sp from './sp'
import th from './th'
let locale = window.localStorage.getItem('locale') || '';
if(locale == ''){
  locale = 'en';
  window.localStorage.setItem('locale','en');
}
export default new VueI18n({
  locale:locale,
  messages:{
    zh:zh,
    en:en,
    kr:kr,
    jp:jp,
    hk:hk,
    sp:sp,
	th:th,
  }
})



// WEBPACK FOOTER //
// ./src/lang/lang.js
