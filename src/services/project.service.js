const knex = require('../database/knex')
class ProjectService {
    constructor() {
        this.projects = knex('projects')
    }

    #getService(payload) {
        const project = { ...payload }
        const projectProperties = [
            'id',
            'name',
            'description',
            'job',
            'start',
            'end',
            'time',
            'createddate',
            'completeddate',
            'updateddate',
            'leader',
            'completedstate',
            'state',
            'note',
        ]

        Object.keys(project).forEach(function (key) {
            if (projectProperties.indexOf(key) == -1) {
                delete project[key]
            }
        })

        return project
    }

    async all() {
        return await this.projects.select('*')
    }
}

module.exports = ProjectService
