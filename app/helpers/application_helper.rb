module ApplicationHelper
  def time_zone
    request.env['ipinfo'].timezone if request.env['ipinfo'].timezone
  end

  def readable_time(time)
    time.strftime('%b %d, %I:%M%P')
  end
end
