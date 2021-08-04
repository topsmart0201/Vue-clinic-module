require('dotenv').config();
const Pool = require('pg').Pool
const pool = new Pool({
    user: process.env.POSTGRES_USER,
    host: process.env.POSTGRES_HOST,
    database: process.env.POSTGRES_DB,
    password: process.env.POSTGRES_PASSWORD,
    port: process.env.POSTGRES_PORT || 5432,
})
let moment = require('moment');

const getAppointmentSlots = (request, response) => {
    let statement = "SELECT * FROM appointment_slots "
    /* statement += "WHERE '[:from, :to]':: daterange @> starts_at:: date "
    statement = statement.replace(":from", from).replace(":to", to) */
    pool.query(statement, (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

const createAppointmentSlots = (request, response, slot) => {
    let time = moment(slot.start).format('YYYY-MM-DDTHH:mm')
    let statement = "INSERT INTO appointment_slots ("
    if(slot.location) statement += "location,"
    if(slot.doctor) statement += "doctor_name,"
    if(slot.start) statement += "starts_at,"
    statement += "created_at) VALUES ("
    if(slot.location) statement += "'" + slot.location + "',"
    if(slot.doctor) statement += "'" + slot.doctor + "',"
    if(slot.start) statement += "'" + time + "',"
    statement += "NOW() )"
    pool.query(statement, (error, results) => {
    if (error) {
        throw error
    }
     response.status(200).json("OK")
 })
}

module.exports = {
    getAppointmentSlots,
    createAppointmentSlots
}