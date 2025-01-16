<template>
    <div class="home">
        <div class="account flex">
            <div class="box-wrap">
                <div class="handle" id="handle-bg">
                    <div :class="['handle-item', current == 0 && 'active']" @click="goPage('/Property/product')">{{$t('property.product')}}</div>
                    <div :class="['handle-item', current == 1 && 'active']" @click="goPage('/Property/myOrder')">{{$t('property.myorder')}}</div>
                </div>
                <div class="list-main">
                    <router-view />
                </div>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    name: "Property",
    components: {

    },
    data() {
        return {
            current: 0
        };
    },
    watch: {
        $route:{
            handler(val){
                this.current = val.path == '/Property/product' ? 0 :1
            },
            immediate: true
        }
    },
    created() {
  
    },
    methods: {
        goPage(url){
            this.$router.replace(url)
        }
    },
    mounted() {
        
    }
};
</script>

<style lang="scss" scoped>
.home {
    // margin-bottom: 3px;
    color: #fff;
	background-color: #171c2b;
	// border: 1px solid #171c2b;
    .box-wrap{
        width: 100%;    
        // border: 1px solid rgb(68, 68, 68);
        box-sizing: border-box;
        border-radius: 8px;
        .handle{
            padding: 20px 150px;
            display: flex;
            justify-content: space-between;
            align-items: center;
			background-color: #1b2c42;
            // background: rgb(43, 42, 42);
            font-size: 18px;
            .handle-item{
                color: gray;
                cursor: pointer;
            }
            .active{
                color: #fff;
            }
        }

        .list-main{
            width: 100%;
        }
    }
}

</style>
