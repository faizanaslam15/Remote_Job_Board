module Api
  module V1
    class JobsController < ApplicationController
      before_action :authorize_request
      def index
        jobs = Job.all
        render json: jobs
      end

      def create
        job = @current_user.jobs.build(job_params)
        if job.save
          render json: job, status: :created
        else
          render json: { errors: job.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def job_params
        params.require(:job).permit(:title, :company, :location, :description, :remote)
      end
    end
  end
end
