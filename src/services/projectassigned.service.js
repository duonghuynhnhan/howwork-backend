const knex = require('../database/knex')

class ProjectAssignedService {
    constructor() {
        this.projectassigneds = knex('projectassigned')
    }

    #getProjectAssigned(payload) {
        const projectAssigned = { ...payload }
        const projectAssignedProperties = [
            'id',
            'project',
            'user',
        ]

        Object.keys(projectAssigned).forEach(function (key) {
            if (projectAssignedProperties.indexOf(key) == -1) {
                delete projectAssigned[key]
            }
        })

        return projectAssigned
    }

    async all(username) {
        return await this.projectassigneds.where('user', username).select('project')
    }

    // async create(payload) {
    //     const job = this.#getProjectAssigned(payload)
    //     const [id] = await this.jobs.insert(job)
    //     return { id, ...job }
    // }

    // async findById(id) {
    //     return await this.jobs.where('id', id).select('*').first()
    // }
}

module.exports = ProjectAssignedService
