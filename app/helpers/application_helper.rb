module ApplicationHelper

    def time_zone
        request.env['ipinfo'].timezone if request.env['ipinfo'].timezone
    end
end
