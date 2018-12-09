require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  $date = Date.today.to_s

  $csp_closed = "2018-07-15"
  $rc_closed = "2018-07-22"
  $roar_closed = "2019-05-01"
  $cphc_closed = "2018-08-9"
end
