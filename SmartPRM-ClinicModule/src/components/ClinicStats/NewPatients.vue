<template>
  <b-row>
    <b-col sm="12">
      <iq-card class-name="iq-card-block iq-card-stretch iq-card-height">
        <template v-slot:headerTitle>
          <div class="d-flex align-items-center justify-content-between">
            <h4 class="card-title">New Patients ({{ totalPatients | formatNumber }})</h4>
            <vue-excel-xlsx
              :data="dataToExport"
              :columns="excelColumns"
              :filename="fileName"
              :sheetname="'New Patients'"
              class="btn btn-primary"
            >
              Download Excel
            </vue-excel-xlsx>
          </div>
          <!-- <h4 class="card-title mt-3">Leads Statistics</h4>
            <b-form @submit.prevent>
              <b-row align-v="center">
                <b-col cols="12" sm="6" md="4" lg="3">
                  <b-form-group>
                    <label style="padding-top: 8px;">From:</label>
                    <b-form-input style="line-height: normal" class="date" id="exampleStartdate" type="date" v-model="leadStartDate" @change="onLeadDateChange"></b-form-input>
                  </b-form-group>
                </b-col>
                <b-col cols="12" sm="6" md="4" lg="3">
                  <b-form-group>
                    <label style="padding-top: 8px;">End:</label>
                    <b-form-input style="line-height: normal" class="date" id="exampleEnddate" type="date" v-model="leadEndDate" @change="onLeadDateChange"></b-form-input>
                  </b-form-group>
                </b-col>
                <b-col cols="12" sm="6" md="4" lg="3" offset-lg="3" class="text-right" v-if="dataToExport && dataToExport.length">
                  <vue-excel-xlsx
                    :data="dataToExport"
                    :columns="excelColumns"
                    :filename="'Lead Statistics'"
                    :sheetname="'Lead Statistics'"
                    class="btn btn-primary"
                    >
                    Download Excel
                  </vue-excel-xlsx>
                </b-col>
              </b-row>
            </b-form> -->
        </template>
        <template v-slot:body>
          <div class="mt-3" v-if="!loading && !noData">
            <AmChart v-if="chartBodyData" element="newPatientsChart" type="newPatients" :option="chartBodyData" />
            <!-- <apex-chart type="bar" :series="series" :options="chartOptions" /> -->
          </div>
          <div class="mt-3 text-center" v-if="loading">
            <div class="text-center text-primary my-2">
                <b-spinner class="align-middle"></b-spinner>
                <strong class="loading">Loading...</strong>
            </div>
          </div>
          <div class="mt-3 text-center" v-if="!loading && noData">
            <p>No data found in this date range...</p>
          </div>
        </template>
      </iq-card>
    </b-col>
  </b-row>
</template>

<script>
import IqCard from '../../components/xray/cards/iq-card'
import { getNewEnquiries } from '../../services/statistics'
import moment from 'moment'
import AmChart from '@/components/AmChart'

export default {
  name: 'NewPatients',
  components: { IqCard, AmChart },
  props: {
    start: String,
    end: String,
    client: String,
  },
  watch: {
    start(val) {
      if (val) {
        this.startDate = val
        this.onDateChange()
      }
    },
    end(val) {
      if (val) {
        this.endDate = val
        this.onDateChange()
      }
    },
  },
  created() {
    if (this.start && this.end) {
      this.startDate = this.start
      this.endDate = this.end
      this.onDateChange()
    }
  },
  methods: {
    initChart(data) {
      this.chartBodyData = {
        colors: ['#e64141', '#00ca00', '#ffd400'],
        labels: ['New Patients'],
        xAxis: ['date'],
        yAxis: ['count'],
        data: data,
      }
    },
    onDateChange() {
      if (this.startDate && this.endDate) {
        this.getNewPatients(this.startDate, this.endDate)
      }
    },
    getNewPatients(start, end) {
      this.loading = true
      this.noData = false
      this.dataToExport = []
      this.totalPatients = 0
      getNewEnquiries(start, end)
        .then(async (response) => {
          if (response && response.length && Array.isArray(response)) {
            this.noData = false
            await this.setDataForChart(response)
            this.loading = false
          } else {
            this.noData = true
            this.loading = false
          }
        })
        .catch(() => {
          this.noData = false
          this.loading = false
        })
    },
    async setDataForChart(data) {
      let datesArray = []
      let seriesData = []
      this.dataToExport = []
      let amChartData = []
      this.totalPatients = 0
      await data.forEach(async (item, index) => {
        const itemDate = item.date.split('T')[0]
        const itemAt = amChartData.findIndex(dItem => dItem.date.split('T')[0] === itemDate)
        if (itemAt < 0) {
          const obj = {
            date: itemDate,
            count: 1,
          }
          amChartData.push(obj)
        } else {
          amChartData[itemAt].count = Number(amChartData[itemAt].count) + 1
        }
        this.totalPatients += 1
        // const dateIndex = datesArray.findIndex((date) => date === itemDate)
        // if (dateIndex < 0) {
        //   datesArray.push(itemDate)
        //   seriesData.push(1)
        // }
        // if (dateIndex > -1) {
        //   seriesData[dateIndex] = seriesData[dateIndex] + 1
        // }
      })

      this.initChart(amChartData)

      let self = this

      this.series = [
        {
          name: 'New Patients',
          data: seriesData,
        },
      ]

      this.chartOptions = {
        dataLabels: {
          enabled: false,
        },
        chart: {
          type: 'bar',
          height: 350,
          stacked: false,
          toolbar: {
            show: false,
            export: {
              csv: {
                filename: 'Leads Statistics',
                dateFormatter(timestamp) {
                  return new Date(timestamp).toDateString()
                },
              },
            },
          },
        },
        plotOptions: {
          bar: {
            horizontal: false,
          },
        },
        yaxis: {
          title: {
            text: 'New Patients',
          },
          labels: {
            formatter: function (y) {
              return y.toLocaleString()
            },
          },
        },
        xaxis: {
          type: 'datetime',
          categories: datesArray,
          labels: {
            formatter: function (value, timestamp) {
              return moment(timestamp).format('ll')
            },
          },
        },
        legend: {
          position: 'right',
          offsetY: 40,
        },
        fill: {
          opacity: 1,
        },
        tooltip: {
          y: {
            formatter: function (value, { series, seriesIndex, w }) {
              const numb = String(value).match(/\d/g).join('')
              return self.$options.filters.formatNumber(numb)
            },
          },
        },
      }

      this.prepareDataForExport(data)
    },

    prepareDataForExport(data) {
      // Get Data for export
      this.fileName = `SmartPRM_${this.client}_Clinic_Statistics_Revenue_by_doctor_(${moment(this.start).format('DD/MM/YYYY')} - ${moment(this.end).format('DD/MM/YYYY')})`
      data.forEach((item) => {
        const obj = {
          first_name: item.name,
          last_name: item.last_name,
          phone: item.phone,
          email: item.email,
          created_at: moment(item.date).format('DD/MM/YYYY'),
        }
        this.dataToExport.push(obj)
      })
    },
  },
  data() {
    return {
      chartBodyData: null,
      totalPatients: 0,
      startDate: null,
      endDate: null,
      loading: true,
      noData: false,
      dataToExport: [],
      fileName: '',
      excelColumns: [
        { label: 'First Name', field: 'first_name' },
        { label: 'Last Name', field: 'last_name' },
        { label: 'Email', field: 'email' },
        { label: 'Phone', field: 'phone' },
        { label: 'Created At', field: 'created_at' },
      ],
      series: [
        {
          name: 'Leads By Day',
          data: [],
        },
      ],
      chartOptions: {
        // xaxis: {
        //   type: 'datetime',
        //   categories: [],
        //   labels: {
        //     formatter: function(value, timestamp) {
        //       return moment(timestamp).format('ll')
        //     },
        //   },
        // },
        // legend: {
        //   position: 'right',
        //   offsetY: 40,
        // },
        // fill: {
        //   opacity: 1,
        // },
      },
    }
  },
}
</script>
