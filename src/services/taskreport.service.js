const knex = require('../database/knex')
const moment = require("moment")

class TaskReportService {
    constructor() {
        this.taskreports = knex('taskreport')
    }

    #gettaskReport(payload) {
        const taskReport = { ...payload }
        const taskReportProperties = [
            'task',
            'file',
            'uploadeddate',
        ]

        Object.keys(taskReport).forEach(function (key) {
            if (taskReportProperties.indexOf(key) == -1) {
                delete taskReport[key]
            }
        })

        return taskReport
    }

    async create(payload) {
        const taskReport = this.#gettaskReport(payload)
        await this.taskreports.insert(taskReport)
        return { ...taskReport }
    }

    async findBytask(task_id) {
        return await this.taskreports.where('task', task_id).select('*').first()
    }

    async delete(task_id) {
        return await this.taskreports.where('task', task_id).del()
    }
}

module.exports = TaskReportService
