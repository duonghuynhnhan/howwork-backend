const JobService = require('../services/job.service')
const ApiError = require('../api-error')

exports.create = async (req, res, next) => {
    try {
        const jobService = new JobService()
        const job = await jobService.create(req.body)
        return res.send(job)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while creating the job')
        )
    }
}

exports.detail = async (req, res, next) => {
    try {
        
        const jobService = new JobService()
        const job = await jobService.findById(req.params.job_id)
        if (!job) {
            return next(new ApiError(404, 'job not found'))
        }
        return res.send(job)
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Error retrieving job with id=${req.params.job_id}`
            )
        )
    }
}

exports.update = async (req, res, next) => {
    if (Object.keys(req.body).length === 0) {
        return next(new ApiError(400, 'Data to update can not be empty'))
    }

    try {
        const jobService = new JobService()
        const updated = await jobService.update(req.params.job_id, req.body)
        if (!updated) {
            return next(new ApiError(404, 'job not found'))
        }
        return res.send({ message: 'job was updated successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, `Error updating job with id=${req.params.job_id}`)
        )
    }
}

exports.delete = async (req, res, next) => {
    try {
        const jobService = new JobService();
        const deleted = await jobService.delete(req.params.job_id)
        if (!deleted) {
            return next(new ApiError(404, 'job not found'))
        }
        return res.send({ message: 'job was deleted successfully' })
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(
                500,
                `Could not deleted job with id=${req.params.id}`
            )
        )
    }
}

exports.all = async (req, res, next) => {
    let jobs = []

    try {
        const jobService = new JobService()
        jobs = await jobService.all()
    } catch(error) {
        console.log(error)
        return next(
            new ApiError(500, 'An error occurred while retrieving jobs')
        )
    }

    return res.send(jobs)
}
