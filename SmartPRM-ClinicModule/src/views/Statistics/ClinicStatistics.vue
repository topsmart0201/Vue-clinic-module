<template>
  <b-container fluid>
    <b-row>
      <b-col cols="12">
        <iq-card class-name="iq-card-block iq-card-stretch iq-card-height">
          <template v-slot:headerTitle>
            <b-form @submit.prevent>
              <b-row align-v="center" class="py-2">
                <b-col cols="12">
                  <h3 class="card-title mt-3">
                    {{ $t('statisticsForClinic.statisticsForClinicHeader') }}
                  </h3>
                </b-col>
                <b-col cols="12" sm="6" md="4" lg="3">
                  <b-form-group>
                    <label style="padding-top: 8px">Filter</label>
                    <b-form-select
                      style="line-height: normal"
                      v-model="filterBy"
                      @change="onFilterChange"
                    >
                      <b-form-select-option :value="null"
                        >Select Filter</b-form-select-option
                      >
                      <b-form-select-option :value="30"
                        >Last 30 Days</b-form-select-option
                      >
                      <b-form-select-option :value="91"
                        >Last 91 Days</b-form-select-option
                      >
                      <b-form-select-option :value="180"
                        >Last 180 Days</b-form-select-option
                      >
                      <b-form-select-option :value="365"
                        >Last 365 Days</b-form-select-option
                      >
                      <b-form-select-option :value="2"
                        >Last 2 Years</b-form-select-option
                      >
                      <b-form-select-option :value="1"
                        >Year-To-Date</b-form-select-option
                      >
                    </b-form-select>
                  </b-form-group>
                </b-col>
                <b-col cols="12" sm="6" md="4" lg="3">
                  <b-form-group>
                    <label style="padding-top: 8px">From:</label>
                    <b-form-datepicker
                      v-model="startDate"
                      :date-format-options="{
                        year: 'numeric',
                        month: 'numeric',
                        day: 'numeric',
                      }"
                      @input="onDateChange"
                    >
                    </b-form-datepicker>
                    <!-- <b-form-input
                      style="line-height: normal"
                      class="date"
                      id="exampleStartdate"
                      type="date"
                      v-model="startDate"
                      @change="onDateChange"
                    ></b-form-input> -->
                  </b-form-group>
                </b-col>
                <b-col cols="12" sm="6" md="4" lg="3">
                  <b-form-group>
                    <label style="padding-top: 8px">End:</label>
                    <b-form-datepicker
                      v-model="endDate"
                      :date-format-options="{
                        year: 'numeric',
                        month: 'numeric',
                        day: 'numeric',
                      }"
                      @input="onDateChange"
                    >
                    </b-form-datepicker>
                    <!-- <b-form-input
                      style="line-height: normal"
                      class="date"
                      id="exampleEnddate"
                      type="date"
                      v-model="endDate"
                      @change="onDateChange"
                    ></b-form-input> -->
                  </b-form-group>
                </b-col>
              </b-row>
            </b-form>
          </template>
        </iq-card>
      </b-col>
      <b-col lg="12">
        <b-row>
          <b-col md="6" lg="3">
            <iq-card
              class-name="iq-card-block iq-card-stretch iq-card-height"
              body-class=" rounded"
              class="iq-bg-appointments-card"
            >
              <template v-slot:body>
                <div class="d-flex align-items-top justify-content-between">
                  <div
                    class="rounded-circle iq-card-icon bg-dark"
                    style="min-height: 60px; min-width: 60px"
                  >
                    <i class="ri-calendar-event-line"></i>
                  </div>
                  <div class="text-right">
                    <h2 class="mb-0">
                      <span class="counter text-white">{{
                        appointments | formatNumber
                      }}</span>
                    </h2>
                    <h5 class="pb-3 text-white">Appointments</h5>
                  </div>
                </div>
              </template>
            </iq-card>
          </b-col>
          <b-col md="6" lg="3">
            <iq-card
              class-name="iq-card-block iq-card-stretch iq-card-height"
              body-class="rounded"
              class="iq-bg-attended-card"
            >
              <template v-slot:body>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="rounded-circle iq-card-icon bg-success">
                    <i class="ri-group-fill"></i>
                  </div>
                  <div class="text-right">
                    <h2 class="mb-0">
                      <span class="counter text-white">{{ attended | formatNumber }}</span>
                    </h2>
                    <h5 class="text-white">Attended</h5>
                  </div>
                </div>
              </template>
            </iq-card>
          </b-col>
          <b-col md="6" lg="3">
            <iq-card
              class-name="iq-card-block iq-card-stretch iq-card-height"
              body-class="rounded"
              class="iq-bg-serviced-card"
            >
              <template v-slot:body>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="rounded-circle iq-card-icon bg-danger">
                    <i class="ri-user-star-fill"></i>
                  </div>
                  <div class="text-right">
                    <h2 class="mb-0">
                      <span class="counter text-white">{{
                        serviced_patients | formatNumber
                      }}</span>
                    </h2>
                    <h5 class="text-white">Serviced Patients</h5>
                  </div>
                </div>
              </template>
            </iq-card>
          </b-col>
          <b-col md="6" lg="3">
            <iq-card
              class-name="iq-card-block iq-card-stretch iq-card-height"
              body-class="rounded"
              class="iq-bg-revenue-card"
            >
              <template v-slot:body>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="rounded-circle iq-card-icon bg-info">
                    <i class="ri-money-euro-circle-fill"></i>
                  </div>
                  <div class="text-right">
                    <h2 class="mb-0">
                      <span class="counter text-white">{{ revenue | formatPrice }}</span>
                    </h2>
                    <h5 class="text-white">Revenue</h5>
                  </div>
                </div>
              </template>
            </iq-card>
          </b-col>
        </b-row>
      </b-col>
      <!-- <b-col sm="12">
        <iq-card class-name="iq-card-block iq-card-stretch iq-card-height">
          <template v-slot:headerTitle>
            <div class="d-flex align-items-center justify-content-between">
              <h4 class="card-title">{{ $t('statisticsForClinic.statisticsForClinicHeader') }}</h4>
              <vue-excel-xlsx
                :data="dataToExport"
                :columns="excelColumns"
                :filename="'Revenue By Product'"
                :sheetname="'Revenue By Product'"
                class="btn btn-primary"
                >
                Download Excel
              </vue-excel-xlsx>
            </div>
          </template>
          <template v-slot:body>
            <div class="mt-3">
              <apex-chart type="pie" width="100%" height="500px" :series="series" :options="chartOptions" />
            </div>
          </template>
        </iq-card>
      </b-col> -->
    </b-row>
    <template v-if="startDate && endDate">
      <RevenueByProduct
        :client="clientName"
        :start="startDate"
        :end="endDate"
      />
      <LeadsChart
        :client="clientName"
        :start="startDate"
        :end="endDate"
        :unit="unit"
      />
      <RevenueByDoctor :client="clientName" :start="startDate" :end="endDate" />
      <NewPatients :client="clientName" :start="startDate" :end="endDate" />
      <AppointmentsByProduct :start="startDate" :end="endDate" />
      <RevenueByCategory :start="startDate" :end="endDate" />
    </template>
  </b-container>
</template>
<script>
import { xray } from '../../config/pluginInit'
import IqCard from '../../components/xray/cards/iq-card'
import {
  clinicStatisticsAttendance,
  getClinicStats,
} from '../../services/statistics'
// import { getDatesForCurrentYear } from '../../services/commonCodeLists'
import RevenueByProduct from '@/components/ClinicStats/RevenueByProduct.vue'
import LeadsChart from '@/components/ClinicStats/LeadsChart.vue'
import RevenueByDoctor from '@/components/ClinicStats/RevenueByDoctor.vue'
import NewPatients from '@/components/ClinicStats/NewPatients.vue'
import AppointmentsByProduct from '@/components/ClinicStats/AppointmentsByProduct.vue'
import RevenueByCategory from '@/components/ClinicStats/RevenueByCategory.vue'
import moment from 'moment'
import { sso } from '../../services/userService'

export default {
  name: 'ClinicStatistics',
  components: {
    IqCard,
    RevenueByProduct,
    LeadsChart,
    RevenueByDoctor,
    NewPatients,
    AppointmentsByProduct,
    RevenueByCategory,
  },
  mounted() {
    xray.index()
    this.getLoggedUser()
    this.getStartDates()
    this.getAttendance()
  },
  data() {
    return {
      unit: null,
      clientName: null,
      startDate: null,
      endDate: null,
      filterBy: null,
      revenue: 0,
      appointments: 0,
      attended: 0,
      serviced_patients: 0,
      attendance: 0,
      statistics: [],
      dataToExport: [],
      excelColumns: [
        { label: 'Product', field: 'product' },
        { label: 'Count', field: 'count' },
        { label: 'Sum', field: 'sum', dataFormat: this.priceFormat },
      ],
      slickOptions: {
        centerMode: false,
        centerPadding: '60px',
        slidesToShow: 5,
        slidesToScroll: 1,
        focusOnSelect: true,
        responsive: [
          {
            breakpoint: 992,
            settings: {
              arrows: false,
              centerMode: true,
              centerPadding: '30',
              slidesToShow: 3,
            },
          },
          {
            breakpoint: 480,
            settings: {
              arrows: false,
              centerMode: true,
              centerPadding: '15',
              slidesToShow: 1,
            },
          },
        ],
      },
      series: [],
      chartOptions: {
        labels: [],
        dataLabels: {
          enabled: false,
        },
      },
    }
  },
  methods: {
    getLoggedUser() {
      sso().then((response) => {
        if (response && response.client_name) {
          this.clientName = response.client_name
        }
      })
    },
    onFilterChange(value) {
      const today = moment().format('YYYY-MM-DD')
      if (value && value === 2) {
        // Get Last 2 years Date from now
        const last2YearDate = moment().subtract(2, 'years').format('YYYY-MM-DD')
        this.endDate = today
        this.startDate = last2YearDate
      }
      if (value && value === 1) {
        // Get first date of current year
        const firstDateOfYear = moment().startOf('year').format('YYYY-MM-DD')
        this.endDate = today
        this.startDate = firstDateOfYear
      }
      if (value && value !== 2 && value !== 1) {
        const secondDate = moment().subtract(value, 'days').format('YYYY-MM-DD')
        this.endDate = today
        this.startDate = secondDate
      }
      if (value) {
        this.getUnit()
        this.getStats(this.startDate, this.endDate)
      }
    },
    getStartDates() {
      this.endDate = moment().format('YYYY-MM-DD')
      this.startDate = moment().add(-30, 'days').format('YYYY-MM-DD')
      this.getUnit()
      this.getStats(this.startDate, this.endDate)
      // getDatesForCurrentYear().then(response => {
      //   const start = response[0]
      //   const end = response[response.length - 1]
      //   this.startDate = start['?column?'].split('T')[0]
      //   this.endDate = end['?column?'].split('T')[0]
      //   this.getStats(this.startDate, this.endDate)
      // })
    },
    onDateChange() {
      this.filterBy = null
      this.getUnit()
      this.getStats(this.startDate, this.endDate)
    },

    getUnit() {
      const days = moment
        .duration(moment(this.endDate).diff(moment(this.startDate)))
        .asDays()
      if (days <= 91) {
        this.unit = 'day'
      }
      if (days > 91 && days <= 180) {
        this.unit = 'week'
      }
      if (days > 180) {
        this.unit = 'month'
      }

      console.log('get unit ', this.unit)
    },

    getStats(start, end) {
      console.log('Fetch Stats...')
      getClinicStats(start, end).then((response) => {
        if (response && response.revenue) {
          this.revenue = Number(response.revenue)
          this.appointments = Number(response.appointments)
          this.attended = Number(response.attended)
          this.serviced_patients = Number(response.serviced)
        }
      })
    },
    // getStatistics () {
    //   getClinicStatistics().then(response => {
    //     if (typeof response !== 'string') {
    //       this.statistics = response
    //       this.statistics.forEach(function (item) {
    //         if (item.date !== null) {
    //           dates.push(moment(item.date).format('YYYY-MM-DD'))
    //           totalRevenue.push(parseFloat(item.totalrevenue))
    //         }
    //       })
    //     } else {
    //       console.error(response)
    //     }
    //   })
    // },
    getAttendance() {
      clinicStatisticsAttendance().then((response) => {
        if (typeof response !== 'string') {
          this.attendance = response[0].count
        } else {
          console.error(response)
        }
      })
    },
  },
}
</script>

<style scoped>
.iq-bg-appointments-card {
  background: #67B7DC !important;
  color: white;
}
.iq-bg-attended-card {
  background: #6794DC !important;
  color: white;
}
.iq-bg-serviced-card {
  background: #6771DC !important;
  color: white;
}
.iq-bg-revenue-card {
  background: #8067DD !important;
  color: white;
}
.iq-card-body {
  flex: unset;
}
</style>
