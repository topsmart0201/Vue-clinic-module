require('dotenv').config();
const Pool = require('pg').Pool
const pool = new Pool({
  user: process.env.POSTGRES_USER,
  host: process.env.POSTGRES_HOST,
  database: process.env.POSTGRES_DB,
  password: process.env.POSTGRES_PASSWORD,
  port: process.env.POSTGRES_PORT || 5432,
})

const getAssignments = (request, response, scope, userid) =>  {
    if (scope == "All") {
        var statement = ["SELECT todos.*, enquiries.name AS patientname, enquiries.last_name AS patientlastname, users.name AS todoname, dentists.name AS dentistname FROM todos",
                         "LEFT JOIN enquiries ON todos.enquiry_id = enquiries.id",
                         "LEFT JOIN users ON todos.user_id = users.id",
                         "LEFT JOIN users dentists ON enquiries.prm_dentist_user_id = users.id",
                         "WHERE ( (todos.due_at = now()::date) OR (todos.due_at < now()::date AND todos.completed=false) )",
                         "ORDER BY todos.due_at ASC"].join('\n') 
        pool.query(statement, (error, results) => {
            if (error) {
                throw error
            }
            response.status(200).json(results.rows)
        })
    } else if (scope == "Self") {
        var statement = ["SELECT todos.*, enquiries.name AS patientname, enquiries.last_name AS patientlastname, users.name AS todoname, dentists.name AS dentistname FROM todos",
                         "LEFT JOIN enquiries ON todos.enquiry_id = enquiries.id",
                         "LEFT JOIN users ON todos.user_id = users.id",
                         "LEFT JOIN users dentists ON enquiries.prm_dentist_user_id = users.id",
                         "WHERE ( (todos.due_at = now()::date) OR (todos.due_at < now()::date AND todos.completed=false) )",
                         "AND users.id = $1",
                         "ORDER BY todos.due_at ASC"].join('\n') 
        pool.query(statement, [userid], (error, results) => {
            if (error) {
                throw error
            }
            response.status(200).json(results.rows)
        })  
    } else if (scope == "AllNurses") {
        var statement = ["SELECT todos.*, enquiries.name AS patientname, enquiries.last_name AS patientlastname, users.name AS todoname, dentists.name AS dentistname FROM todos",
                         "LEFT JOIN enquiries ON todos.enquiry_id = enquiries.id",
                         "LEFT JOIN users ON todos.user_id = users.id",
                         "LEFT JOIN users dentists ON enquiries.prm_dentist_user_id = users.id",
                         "WHERE ( (todos.due_at = now()::date) OR (todos.due_at < now()::date AND todos.completed=false) )",
                         "AND ( users.prm_role_id = (SELECT role_id FROM prm_role where role_name = 'Nurse') OR users.prm_role_id = (SELECT role_id FROM prm_role where role_name = 'SuperNurse') )",
                         "ORDER BY todos.due_at ASC"].join('\n') 
        pool.query(statement, [userid], (error, results) => {
            if (error) {
                throw error
            }
            response.status(200).json(results.rows)
        })  
    }
}

module.exports = {
  getAssignments
}