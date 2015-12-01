class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.project.subject
  #
  def creation_confirmation(restaurant)
    @project = project

    mail(
      to:       @project.user.email,
      subject:  "Project #{@project.name} created!"
    )
  end

end
