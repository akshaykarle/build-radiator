class ProjectsController < ApplicationController
  def index
    server_config_json = JSON.parse(File.read('config/build_server_config.json'))
    c = CiStatus::CruiseControl.new(server_config_json['server_url'])
    @projects = c.projects.sort_by {|project| project.status }
  end
end
