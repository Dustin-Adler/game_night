module ApplicationHelper
  def time_zone
    request.env['ipinfo'].ip == "127.0.0.1" ? 'America/Chicago' : request.env['ipinfo']&.timezone
  end

  def readable_time(time)
    time.strftime('%b %d, %I:%M%P')
  end
end
