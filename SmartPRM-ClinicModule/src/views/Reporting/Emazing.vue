<template>
    <div class="container-fluid">
        <iq-card>
          <template v-slot:body>
            <h5 class="card-title">Revenue Statistics</h5>
            <div class="row">
              <div class="col-sm-3 col-12">
                <h4 class="margin-0">{{ todayRevenue ? todayRevenue : 0 | formatPrice }} </h4>
                <p class="text-muted">{{ $t('statisticsForClinic.todaysIncome') }}</p>
              </div>
              <div class="col-sm-3 col-12">
                <h4 class="margin-0">{{ weeklyRevenue | formatPrice }} </h4>
                <p class="text-muted">{{ $t('statisticsForClinic.weeksIncome') }}</p>
              </div>
              <div class="col-sm-3 col-12">
                <h4 class="margin-0">{{ monthlyRevenue | formatPrice }} </h4>
                <p class="text-muted">{{ $t('statisticsForClinic.monthsIncome') }}</p>
              </div>
              <div class="col-sm-3 col-12">
                <h4 class="margin-0">{{ yearlyRevenue | formatPrice }} </h4>
                <p class="text-muted">{{ $t('statisticsForClinic.yearsIncome') }}</p>
              </div>
            </div>
            <AmChart v-if="chartBodyData" element="revenueChart" type="revenueStats" :option="chartBodyData" />
            <!-- <apex-chart type="bar" height="350" :options="revenueChartOptions" :series="revenueChartSeries"></apex-chart> -->
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:headerTitle>
            <div class="row pt-3">

            <b-form-group class="ml-3 mr-3 sm-w-100">
              <v-select class="patients" v-model="periodSelect" label="text"
                :clearable="false" :reduce="period => period.value"
                :options="periodSelectOptions" @input="onPeriodChange">
              </v-select>
            </b-form-group>

            <b-form-group label-for="exampleInputdate" class="mr-3 date-group">
              <label style="padding-top: 8px;">From:</label>
                <b-form-input style="line-height: normal" class="date" id="exampleInputdate" type="date" v-model="fromdate" @change="onFromChange"></b-form-input>
              </b-form-group>
            <b-form-group label-for="exampleInputdate" class="mr-3  date-group">
              <label style="padding-top: 8px;">To:</label>
              <b-form-input style="line-height: normal" class="date" id="exampleInputdate" type="date" v-model="todate" @change="onToChange"></b-form-input>
            </b-form-group>
              <b-form-group class="mr-3  sm-w-100" style="width: 15%">
                <v-select class="patients" v-model="countrySelect" label="text"
                          :clearable="false" :reduce="period => period.value"
                          :options="countrySelectOptions" @input="onCountryChange">
                </v-select>
              </b-form-group>
            </div>
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:body>
           <div class="row justify-content-between mb-2 pl-3 pr-3">
             <h5 class="card-title">{{ $t('reportingEmazing.servicesSummary') }}</h5>
             <a href="#" ref="excel-table1" class="btn btn-primary" @click="exportReportToExcel('table1')">Download Excel</a>
           </div>
            <b-table-simple ref="table1" id="table1" class="table-t">
              <thead>
              <tr>
                <th v-for="(item,index) in servicesSummaryColumns" :key="index" :class="item.key === 'item' ? 'text-left' : ''" class="text-center">{{ item.label }}</th>
              </tr>
              </thead>
              <tbody class="text-center">
              <template v-for="(body,bodyKey ) in getServicesSummary" >
                <tr :key="bodyKey" class="main-row">
                  <td style="max-width: 200px"><span class="font-weight-bold">{{ bodyKey }}</span></td>
                  <td><span class="font-weight-bold">{{ body.group_count }}</span></td>
                  <td><span class="font-weight-bold">{{ formatNumber(Math.trunc(body.group_amount)) }} &#8364;</span></td>
                  <td><span class="font-weight-bold">{{ formatNumber(Math.trunc(body.group_fee)) }} &#8364;</span></td>
                </tr>
                  <template v-for="(item, index) in body" >
                   <tr :key="Math.random(index + 1000)">
                     <td  style="max-width: 200px">{{ item.service_title }}</td>
                     <td class="td-count">{{ item.count }}</td>
                     <td>{{ formatNumber(Math.trunc(item.sum)) }} &#8364;</td>
                     <td>{{ formatNumber(Math.trunc(item.fee_sum)) }} &#8364;</td>
                   </tr>
                  </template>
              </template>
              <tr v-if="servicesSummaryTotalCount">
                <td><span class="font-weight-bold"> Total: </span></td>
                <td><span class="font-weight-bold">{{formatNumber(Math.trunc(servicesSummaryTotalCount))}}</span></td>
                <td><span class="font-weight-bold">{{formatNumber(Math.trunc(servicesSummaryTotalAmount))}} &#8364;</span></td>
                <td><span class="font-weight-bold">{{formatNumber(Math.trunc(servicesSummaryTotalFee))}} &#8364;</span></td>
              </tr>
              </tbody>
            </b-table-simple>
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:body>
            <div class="row justify-content-between mb-2 pl-3 pr-3">
              <h5 class="card-title">{{ $t('reportingEmazing.servicesList') }}</h5>
              <a href="#" ref="excel-table2" class="btn btn-primary" @click="exportReportToExcel('table2')">Download Excel</a>
            </div>
<!--            <b-table small :items="servicesListItems" :fields="servicesListColumns" class="mb-0"></b-table>-->
            <b-table-simple ref="table2" id="table2" class="table-t">
              <thead>
              <tr>
                <th v-for="(item,index) in servicesListColumns" :key="index" :class="item.key === 'item' ? 'text-left' : ''" class="text-center">{{ item.label }}</th>
              </tr>
              </thead>
              <tbody class="text-center">
              <template v-for="(body, bodyKey) in servicesListItems" >
                <tr :key="bodyKey" class="main-row">
                  <td><span class="font-weight-bold">{{ bodyKey }}</span></td>
                  <td><span class="font-weight-bold"></span></td>
                  <td><span class="font-weight-bold"></span></td>
                  <td><span class="font-weight-bold">{{formatNumber(Math.trunc(body.group_price))}} &#8364;</span></td>
                  <td><span class="font-weight-bold">{{formatNumber(Math.trunc(body.group_fee))}} &#8364;</span></td>
                  <td><span class="font-weight-bold"></span></td>
                  <td><span class="font-weight-bold"></span></td>
                  <td><span class="font-weight-bold"></span></td>
                  <td><span class="font-weight-bold"></span></td>
                </tr>
                <template v-for="(item, index) in body" >
                  <tr :key="Math.random(index + 1000)">
                    <td class="text-center"><span >{{ item.doctor }}</span></td>
                    <td class="text-center"><span >{{ item.service_title}}</span></td>
                    <td class="text-center"><router-link tag="span" :to="'/patients/'+ item.enquiry_id" class="clickable">{{ item.name }} {{ item.last_name}}  </router-link></td>
                    <td class="text-center"><span>{{ formatNumber(Math.trunc(item.price))}} &#8364;</span></td>
                    <td class="text-center"><span>{{ formatNumber(Math.trunc(item.fee))}} &#8364;</span></td>
                    <td class="text-center"><span >{{ formatDateString(item.date) }} </span></td>
                    <td class="text-center"><span >{{ item.country}}</span></td>
                    <td class="text-center"><span >{{ item.region}}</span></td>
                    <td class="text-center"><span >{{ item.municipality}}</span></td>
                  </tr>
                </template>
              </template>
              <tr v-if="servicesSummaryTotalCount">
                  <td><span class="font-weight-bold"> Total: </span></td>
                  <td><span class="font-weight-bold"></span></td>
                  <td><span class="font-weight-bold"></span></td>
                  <td> <span class="font-weight-bold">{{formatNumber(Math.trunc(servicesListTotalCount))}} &#8364;</span></td>
                  <td> <span class="font-weight-bold">{{formatNumber(Math.trunc(servicesListTotalFee))}} &#8364;</span></td>
              </tr>
              </tbody>
            </b-table-simple>
          </template>
        </iq-card>
    </div>
</template>

<script>
import IqCard from '../../components/xray/cards/iq-card.vue'
import { xray } from '../../config/pluginInit'
import { getCountryList, getEmazingServicesReport, getServiceList, getClinicStatistics } from '../../services/reporting'
import _ from 'lodash'
import XLSX from 'xlsx'
import AmChart from '@/components/AmChart'
// import moment from 'moment'

export default {
  components: {
    IqCard,
    AmChart,
  },
  name: 'Emazing',
  data: function () {
    return {
      chartBodyData: null,
      fromdate: null,
      todate: null,
      servicesSummaryTotalCount: 0,
      servicesSummaryTotalAmount: 0,
      servicesListTotalCount: 0,
      servicesListTotalFee: 0,
      countrySelectOptions: [
        { value: null, text: this.$t('reportingEmazing.countrySelect') },
      ],
      periodSelectOptions: [
        { value: null, text: this.$t('reportingEmazing.periodSelect') },
        { value: '1', text: this.$t('reportingEmazing.currentMonth') },
        { value: '2', text: this.$t('reportingEmazing.lastMonth') },
        { value: '3', text: this.$t('reportingEmazing.thisYear') },
        { value: '4', text: this.$t('reportingEmazing.lastYear') },
      ],
      countrySelect: null,
      periodSelect: null,
      servicesSummaryColumns: [
        { label: this.$t('reportingEmazing.servicesSummaryColumn.serviceTitle'), key: 'service_title', class: 'text-left' },
        { label: this.$t('reportingEmazing.servicesSummaryColumn.serviceCount'), key: 'count', class: 'text-left' },
        { label: this.$t('reportingEmazing.servicesSummaryColumn.serviceAmount'), key: 'sum', class: 'text-left' },
        { label: this.$t('reportingEmazing.servicesSummaryColumn.serviceFee'), key: 'fee', class: 'text-left' },
      ],
      servicesSummaryItems: [],
      servicesListColumns: [
        { label: this.$t('reportingEmazing.servicesListColumn.serviceDoctor'), key: 'doctor', class: 'text-left' },
        { label: this.$t('reportingEmazing.servicesListColumn.serviceTitle'), key: 'service_title', class: 'text-left' },
        { label: this.$t('reportingEmazing.servicesListColumn.serviceLeadName'), key: 'name', class: 'text-left' },
        { label: this.$t('reportingEmazing.servicesListColumn.serviceAmount'), key: 'price', class: 'text-left' },
        { label: this.$t('reportingEmazing.servicesListColumn.serviceFee'), key: 'fee', class: 'text-left' },
        { label: this.$t('reportingEmazing.servicesListColumn.serviceDate'), key: 'date' },
        { label: this.$t('reportingEmazing.servicesListColumn.serviceCountry'), key: 'fee', class: 'text-left' },
        { label: this.$t('reportingEmazing.servicesListColumn.serviceRegion'), key: 'fee', class: 'text-left' },
        { label: this.$t('reportingEmazing.servicesListColumn.serviceMunicipality'), key: 'fee', class: 'text-left' },
      ],
      servicesListItems: [],
      revenueList: [],
      totalRevenue: 0,
      monthlyRevenue: 0,
      weeklyRevenue: 0,
      yearlyRevenue: 0,
      todayRevenue: 0,
      revenueChartSeries: [{
        name: 'Revenue',
        data: [],
      }],
      revenueChartOptions: {
        chart: {
          type: 'bar',
          height: 350,
          toolbar: {
            show: false,
          },
        },
        plotOptions: {
          bar: {
            colors: {
              ranges: [{
                from: -100,
                to: -46,
                color: '#F15B46',
              }, {
                from: -45,
                to: 0,
                color: '#FEB019',
              }],
            },
            columnWidth: '80%',
          },
        },
        dataLabels: {
          enabled: false,
        },
        yaxis: {
          title: {
            text: 'EUR',
          },
        },
        xaxis: {
          type: 'datetime',
          categories: [],
          labels: {
            rotate: -90,
          },
        },
      },
    }
  },
  watch: {
    'servicesSummaryItemsJSON'() {
    },
  },
  methods: {
    initChart(data, revenue) {
      this.chartBodyData = {
        colors: ['#4c9cac'],
        xAxis: ['date'],
        yAxis: ['revenue'],
        labels: ['Revenue'],
        revenue: revenue,
        data: data,
      }
    },
    formatNumber(num) {
      return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.')
    },
    exportReportToExcel(tableName) {
      var elt = document.getElementById(tableName)
      let documentName = ''
      if (tableName === 'table1') {
        documentName = 'Services Summary export'
      } else {
        documentName = 'Services List export'
      }

      var wb = XLSX.utils.table_to_book(elt, { sheet: documentName, raw: true })

      return XLSX.writeFile(wb, (documentName + '.xlsx'))

      // let table = this.$refs[tableName]
      // console.log('Table')
      // console.log(table)
      // let euro = /€/gi
      // let html = table.$el.outerHTML.replace(euro, '&euro;')
      // this.$refs[`excel-${tableName}`].href = 'data:application/vnd.ms-excel,' + encodeURIComponent(html)
      // let documentName = ''
      // let date = new Date().toLocaleString()
      // if (tableName === 'table1') {
      //   documentName = 'Services Summary export'
      // } else {
      //   documentName = 'Services List export'
      // }
      // this.$refs[`excel-${tableName}`].download = documentName + ' ' + date
      // return true
    },
    formatPrice(price) {
      return this.$options.filters.formatPrice(price)
    },
    getClinicStats() {
      this.chartBodyData = null
      getClinicStatistics().then(response => {
        this.setRevenueData(response)
      }).catch(error => {
        console.log(error)
      })
    },
    async setRevenueData(data) {
      this.revenueList = []
      const weekly = data.weekly
      const monthly = data.monthly
      const yearly = data.yearly
      const sixtyWeeks = data.sixtyWeeks
      const today = data.today
      if (today && Array.isArray(today)) {
        this.todayRevenue = 0
        today.forEach(item => {
          this.todayRevenue += Number(item.revenue)
        })
      }
      if (weekly && Array.isArray(weekly)) {
        this.weeklyRevenue = 0
        weekly.forEach(item => {
          this.weeklyRevenue += Number(item.revenue)
        })
      }
      if (monthly && Array.isArray(monthly)) {
        this.monthlyRevenue = 0
        monthly.forEach(item => {
          this.monthlyRevenue += Number(item.revenue)
        })
      }
      if (yearly && Array.isArray(yearly)) {
        this.yearlyRevenue = 0
        yearly.forEach(item => {
          this.yearlyRevenue += Number(item.revenue)
        })
      }
      if (sixtyWeeks && Array.isArray(sixtyWeeks)) {
        let datesArray = []
        this.totalRevenue = 0
        sixtyWeeks.forEach(item => {
          this.revenueList.push(item.revenue)
          datesArray.push(item.date)
          this.totalRevenue += Number(item.revenue)
        })

        this.initChart(sixtyWeeks, this.totalRevenue)
        // this.revenueChartSeries = [{
        //   data: this.revenueList,
        // }]

        // let self = this

        // this.revenueChartOptions = {
        //   xaxis: {
        //     categories: [...datesArray],
        //   },
        //   yaxis: {
        //     labels: {
        //       formatter: function (y) {
        //         return self.$options.filters.formatPrice(y)
        //       },
        //     },
        //     title: {
        //       text: this.formatPrice(this.totalRevenue),
        //     },
        //   },
        //   tooltip: {
        //     y: {
        //       formatter: function (value, { series, seriesIndex, w }) {
        //         const numb = String(value).match(/\d/g).join('')
        //         return self.$options.filters.formatPrice(numb)
        //       },
        //     },
        //   },
        // }
      }
    },
    onFromChange() {
      this.getServicesReport()
      this.getServicesList()
      this.getCountryList()
    },
    onToChange() {
      this.getServicesReport()
      this.getServicesList()
      this.getCountryList()
    },
    onPeriodChange() {
      if (this.periodSelect === '1') {
        let today = new Date()
        let firstThisMonth = new Date()
        firstThisMonth.setDate(1)
        this.fromdate = this.formatDate(firstThisMonth)
        this.todate = this.formatDate(today)
      } else if (this.periodSelect === '2') {
        let lastLastMonth = new Date()
        lastLastMonth.setDate(1)
        lastLastMonth.setDate(lastLastMonth.getDate() - 1)
        let firstLastMonth = new Date()
        firstLastMonth.setMonth(firstLastMonth.getMonth() - 1)
        firstLastMonth.setDate(1)
        this.fromdate = this.formatDate(firstLastMonth)
        this.todate = this.formatDate(lastLastMonth)
      } else if (this.periodSelect === '3') {
        let today = new Date()
        let firstThisYear = new Date()
        firstThisYear.setMonth(0)
        firstThisYear.setDate(1)
        this.fromdate = this.formatDate(firstThisYear)
        this.todate = this.formatDate(today)
      } else if (this.periodSelect === '4') {
        let lastLastYear = new Date()
        lastLastYear.setMonth(0)
        lastLastYear.setDate(1)
        lastLastYear.setDate(lastLastYear.getDate() - 1)
        let firstLastYear = new Date()
        firstLastYear.setMonth(0)
        firstLastYear.setDate(1)
        firstLastYear.setYear(1900 + firstLastYear.getYear() - 1)
        this.fromdate = this.formatDate(firstLastYear)
        this.todate = this.formatDate(lastLastYear)
      } else {
        return
      }
      this.getServicesReport()
      this.getServicesList()
      this.getCountryList()
    },
    onCountryChange() {
      this.getServicesReport()
      this.getServicesList()
      this.getCountryList()
    },
    getServicesReport() {
      getEmazingServicesReport(this.fromdate, this.todate, this.countrySelect).then(response => {
        if (typeof response !== 'string') {
          let res = _.groupBy(response, 'group')
          let totalCount = 0
          let totalAmount = 0
          let totalFee = 0
          for (let group in res) {
            res[`${group}`].group_count = 0
            res[`${group}`].group_amount = 0
            res[`${group}`].group_fee = 0
            res[group].map(item => {
              res[`${group}`].group_count = res[`${group}`].group_count + Number(item.count)
              res[`${group}`].group_amount = res[`${group}`].group_amount + Number(item.sum)
              res[`${group}`].group_fee = res[`${group}`].group_fee + Number(item.fee_sum)
              totalCount += Number(item.count)
              totalAmount += Number(item.sum)
              totalFee += Number(item.fee_sum)
            })
          }
          this.servicesSummaryItems = res
          this.servicesSummaryTotalCount = totalCount
          this.servicesSummaryTotalAmount = totalAmount
          this.servicesSummaryTotalFee = totalFee

          let arr = []
          if (this.servicesSummaryItems) {
            for (let group in this.servicesSummaryItems) {
              arr[group] = [...this.servicesSummaryItems[group]]
              arr[group].group_amount = this.servicesSummaryItems[group].group_amount
              arr[group].group_count = this.servicesSummaryItems[group].group_count
              arr[group].group_fee = this.servicesSummaryItems[group].group_fee
            }
          }
        } else {
          console.error(response)
        }
      })
    },
    getServicesList() {
      getServiceList(this.fromdate, this.todate, this.countrySelect).then(response => {
        if (typeof response !== 'string') {
          this.servicesListTotalCount = 0
          this.servicesListTotalFee = 0
          let res = _.groupBy(response, 'doctor')
          for (let doc in res) {
            res[doc].country = doc.country
            res[doc].region = doc.region
            res[doc].municipality = doc.municipality
            res[doc].group_price = 0
            res[doc].group_fee = 0
            res[doc].map(item => {
              res[doc].group_price = res[doc].group_price + Number(item.price)
              res[doc].group_fee = res[doc].group_fee + Number(item.fee)
              this.servicesListTotalCount += Number(item.price)
              this.servicesListTotalFee += Number(item.fee)
            })
          }
          this.servicesListItems = res
        } else {
          console.error(response)
        }
      })
    },
    getCountryList() {
      getCountryList(this.fromdate, this.todate).then(response => {
        if (typeof response !== 'string') {
          this.countrySelectOptions = []
          for (var cnt in response) {
            if (response[cnt].id) {
              var cntEnt = { value: response[cnt].id, text: response[cnt].name }
              this.countrySelectOptions.push(cntEnt)
            }
          }
        } else {
          this.countrySelectOptions = []
        }
        this.countrySelectOptions.push({ value: null, text: this.$t('reportingEmazing.countrySelect') })
        if (!this.countrySelectOptions.some(e => e.value === this.countrySelect)) {
          this.countrySelect = null
        }
      })
    },
    formatDate(date) {
      var ye = new Intl.DateTimeFormat('en', { year: 'numeric' }).format(date)
      var mo = new Intl.DateTimeFormat('en', { month: '2-digit' }).format(date)
      var da = new Intl.DateTimeFormat('en', { day: '2-digit' }).format(date)
      return (`${ye}-${mo}-${da}`)
    },
    formatDateString(dateString) {
      var date = Date.parse(dateString)
      var ye = new Intl.DateTimeFormat('en', { year: 'numeric' }).format(date)
      var mo = new Intl.DateTimeFormat('en', { month: 'numeric' }).format(date)
      var da = new Intl.DateTimeFormat('en', { day: 'numeric' }).format(date)
      return `${da}/${mo}/${ye}`
    },
  },
  computed: {
    getServicesSummary() {
      return this.servicesSummaryItems
    },
    getServicesSummaryJSON() {
      return this.servicesSummaryItemsJSON
    },
  },
  mounted() {
    xray.index()
    var today = new Date()
    var firstThisMonth = new Date()
    firstThisMonth.setDate(1)
    this.fromdate = this.formatDate(firstThisMonth)
    this.todate = this.formatDate(today)
    this.getClinicStats()
    this.getServicesReport()
    this.getServicesList()
    this.getCountryList()
  },
}
</script>
<style lang="scss">
.clickable {
   cursor: pointer;
}

.date-group {
  margin-right:20px;

  &:nth-child(1){
    margin-right: 30px;
  }
  div {
    display: flex;
    label {
      margin-right: 15px;
    }
  }
}
.hidden_header {
  display: none;
}
.date {
  height: 35px !important;
}

.main-row {
    background-color: #F4F4F4;
}

@media(max-width: 701px) {
 .iq-card  .row .sm-w-100 {
    width: 100% !important;
   padding-left: 0 !important;
  }
}
</style>
