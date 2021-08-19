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

const getFreeSlots = (request, response, prm_client_id) => {
    let statement = "SELECT * FROM appointment_slots WHERE prm_client_id = " + prm_client_id
    /* statement += "WHERE '[:from, :to]':: daterange @> starts_at:: date "
    statement = statement.replace(":from", from).replace(":to", to) */
    pool.query(statement, (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

const createFreeSlots = (request, response, slot, prm_client_id) => {
    let time = moment(slot.start).format('YYYY-MM-DDTHH:mm')
    let statement = "INSERT INTO appointment_slots ("
    if(slot.location) statement += "location,"
    statement += "doctor_name,"
    if(slot.start) statement += "starts_at,"
    statement += "created_at, prm_client_id) VALUES ("
    if(slot.location) statement += "'" + slot.location + "',"
    if (slot.doctor) statement += "'" + slot.doctor + "',"
    else statement += "'Vsi zdravniki',"
    if(slot.start) statement += "'" + time + "',"
    statement += "NOW(), " + prm_client_id + ")"
    pool.query(statement, (error, results) => {
    if (error) {
        throw error
    }
     response.status(200).json("OK")
 })
}

const deleteFreeSlot = (request, response, id) => {
    pool.query("DELETE FROM appointment_slots WHERE id = $1", [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json("OK")
    })
}


module.exports = {
    getFreeSlots,
    createFreeSlots,
    deleteFreeSlot
}