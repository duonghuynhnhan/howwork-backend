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
        return await this.projectassigneds
                                    .join('projects', 'projects.id', 'projectassigned.project')
                                    .join('accounts', 'projects.leader', 'accounts.username')
                                    .join('persons', 'persons.id', 'accounts.person')
                                    .where('user', username)
                                    .select('persons.fullname', 'projects.id', 'projects.name', 'projects.description', 'projects.start', 'projects.end', 'projects.time', 'projects.createddate', 'projects.completeddate', 'projects.updateddate', 'projects.leader', 'projects.completedstate', 'projects.note',)
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
}

module.exports = ProjectAssignedService
