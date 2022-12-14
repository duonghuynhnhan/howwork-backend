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

    async allMember(project_id) {
        return await this.projectassigneds
                                    .join('accounts', 'accounts.username', 'projectassigned.user')
                                    .join('persons', 'persons.id', 'accounts.person')
                                    .where('project', project_id).select('project')
                                    .select('persons.fullname', 'accounts.username')
    }

    async create(payload) {
        const data = this.#getProjectAssigned(payload)
        await this.projectassigneds.insert(data)
        return data
    }

    // async findById(id) {
    //     return await this.jobs.where('id', id).select('*').first()
    // }
}

module.exports = ProjectAssignedService
