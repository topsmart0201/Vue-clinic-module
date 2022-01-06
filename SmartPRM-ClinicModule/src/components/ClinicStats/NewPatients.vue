<template>
    <b-row>
        <b-col sm="12">
        <iq-card class-name="iq-card-block iq-card-stretch iq-card-height">
          <template v-slot:headerTitle>
            <div class="d-flex align-items-center justify-content-between">
                <h4 class="card-title">New Patients</h4>
                <vue-excel-xlsx
                    :data="dataToExport"
                    :columns="excelColumns"
                    :filename="'New Patients'"
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
              <apex-chart type="bar" :series="series" :options="chartOptions" />
            </div>
            <div class="mt-3 text-center" v-if="loading">
                <p>Loading New Patients...</p>
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

export default {
  name: 'LeadsChart',
  components: { IqCard },
  props: {
    start: String,
    end: String,
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
    onDateChange() {
      if (this.startDate && this.endDate) {
        this.getNewPatients(this.startDate, this.endDate)
      }
    },
    getNewPatients(start, end) {
      this.loading = true
      this.noData = false
      getNewEnquiries(start, end).then(response => {
        this.loading = false
        if (response && response.length && Array.isArray(response)) {
          this.noData = false
          this.setDataForChart(response)
        } else {
          this.noData = true
        }
      }).catch(() => {
        this.noData = false
        this.loading = false
      })
    },
    setDataForChart(data) {
      let datesArray = []
      let seriesData = []
      this.dataToExport = []
      data.forEach((item, index) => {
        const itemDate = item.date.split('T')[0]
        const dateIndex = datesArray.findIndex(date => date === itemDate)
        if (dateIndex < 0) {
          datesArray.push(itemDate)
          seriesData.push(1)
        }
        if (dateIndex > -1) {
          seriesData[dateIndex] = seriesData[dateIndex] + 1
        }
      })

      this.series = [{
        name: 'New Patients',
        data: seriesData,
      }]

      this.chartOptions = {
        chart: {
          toolbar: {
            show: true,
            tools: {
              download: true,
              selection: false,
              zoom: false,
              zoomin: false,
              zoomout: false,
              pan: false,
            },
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
        legend: {
          position: 'right',
        },
        xaxis: {
          type: 'datetime',
          categories: datesArray,
        },
      }

      this.prepareDataForExport(data)
    },

    prepareDataForExport(data) {
      // Get Data for export
      data.forEach(item => {
        const obj = {
          id: item.id,
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
      startDate: null,
      endDate: null,
      loading: true,
      noData: false,
      dataToExport: [],
      excelColumns: [
        { label: 'ID', field: 'id' },
        { label: 'First Name', field: 'first_name' },
        { label: 'Last Name', field: 'last_name' },
        { label: 'Email', field: 'email' },
        { label: 'Phone', field: 'phone' },
        { label: 'Created At', field: 'created_at' },
      ],
      series: [{
        name: 'Leads By Day',
        data: [],
      }],
      chartOptions: {
        chart: {
          type: 'bar',
          height: 350,
          stacked: true,
          toolbar: {
            show: true,
            tools: {
              pan: false,
              zoom: false,
            },
          },
        },
        plotOptions: {
          bar: {
            horizontal: false,
            borderRadius: 10,
          },
        },
        yaxis: {
          title: {
            text: 'New Patients',
          },
          labels: {
            formatter: function(y) {
              return y.toLocaleString()
            },
          },
        },
        xaxis: {
          type: 'datetime',
          categories: [],
          labels: {
            formatter: function(value, timestamp) {
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
      },
    }
  },
}
</script>