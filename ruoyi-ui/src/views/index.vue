<!--<template>-->
<!--  <el-row :gutter="20">-->
<!--    <el-col :span="12"><div class="grid-content bg-purple">-->
<!--      <el-card class="box-card">-->
<!--      <div id="main" style="height: 350px"></div>-->
<!--      </el-card>-->
<!--    </div></el-col>-->
<!--    <el-col :span="12"><div class="grid-content bg-purple">-->
<!--      <el-card class="box-card">-->
<!--        <div style="height: 350px"></div>-->
<!--      </el-card>-->
<!--    </div></el-col>-->
<!--  </el-row>-->
<!--</template>-->

<!--<script>-->
<!--import echarts from 'echarts'-->
<!--import {echartdemo1} from "../api/people/home"-->
<!--require('echarts/theme/macarons') // echarts theme-->
<!--export default {-->

<!--  data() {-->
<!--    return {}-->
<!--  },-->
<!--  mounted() {-->
<!--    this.$nextTick(() => {-->
<!--      this.initChart()-->
<!--    })-->
<!--  },-->
<!--  beforeDestroy() {-->
<!--    if (!this.chart) {-->
<!--      return-->
<!--    }-->
<!--    this.chart.dispose()-->
<!--    this.chart = null-->
<!--  },-->
<!--  methods: {-->
<!--    async initChart() {-->
<!--      var xdata = []-->
<!--      var ydata = []-->
<!--       echartdemo1().then(response => {-->
<!--          xdata = response.data.xdata-->
<!--          ydata = response.data.ydata-->
<!--          console.log(xdata)-->
<!--          console.log(ydata)-->
<!--         var chartDom = document.getElementById('main');-->
<!--         var myChart = echarts.init(chartDom);-->
<!--         var option;-->
<!--         option = {-->
<!--           xAxis: {-->
<!--             type: 'category',-->
<!--             boundaryGap: false,-->
<!--             data: xdata-->
<!--           },-->
<!--           yAxis: {-->
<!--             type: 'value'-->
<!--           },-->
<!--           series: [-->
<!--             {-->
<!--               data: ydata,-->
<!--               type: 'line',-->
<!--               areaStyle: {}-->
<!--             }-->
<!--           ]-->
<!--         };-->
<!--         option && myChart.setOption(option);-->
<!--      });-->
<!--    }-->
<!--  }-->
<!--}-->
<!--</script>-->

<template>
  <div>
    <h2>


      saaaaaa
    </h2>
  </div>
</template>

