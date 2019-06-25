module ApplicationHelper
    def render_starts(value)
        output = ''
        if (1..5).include?(value)
            value.times ({output += '*'})
        end
        output
    end
end


