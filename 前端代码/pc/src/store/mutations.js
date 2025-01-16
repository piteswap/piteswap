let mutations = {
    setAccountNum(state){
        let accountNum  = window.localStorage.getItem('accountNum')
        this.state.accountNum = accountNum
    },
    setDatas(state,datas){
        this.state.datas = datas;
    },
    setLogo(state,data){
        state.logo = data
    }
}
export default mutations


// WEBPACK FOOTER //
// ./src/store/mutations.js