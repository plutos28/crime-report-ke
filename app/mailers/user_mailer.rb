class UserMailer < ApplicationMailer
    def crime_reports_email(reports)
      @reports = reports
      users = User.pluck(:email).join(',') # Join email addresses with commas
      mail(to: users, subject: 'Latest Crime Reports')
    end
  end
  