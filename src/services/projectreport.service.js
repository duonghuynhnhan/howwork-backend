const knex = require('../database/knex')
const moment = require("moment")

class ProjectReportService {
    constructor() {
        this.projectreports = knex('projectreport')
    }

    #getProjectReport(payload) {
        const projectReport = { ...payload }
        const projectReportProperties = [
            'project',
            'file',
            'uploadeddate',
        ]

        Object.keys(projectReport).forEach(function (key) {
            if (projectReportProperties.indexOf(key) == -1) {
                delete projectReport[key]
            }
        })

        return projectReport
    }

    async create(payload) {
        const projectReport = this.#getProjectReport(payload)
        await this.projectreports.insert(projectReport)
        return { ...projectReport }
    }

    async findByProject(project_id) {
        return await this.projectreports.where('project', project_id).select('*').first()
    }

    async delete(project_id) {
        return await this.projectreports.where('project', project_id).del()
    }
}

module.exports = ProjectReportService
