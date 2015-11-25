# Helper methods defined here can be accessed in any controller or view in the application

module Darksidetwo
  class App
    module HomeHelper
      def lift_gate_helper(dates, startTime, duration, compareTime)
        return false if dates.nil?
        dates_arr = dates.split ","
        return dates_arr.any? do |date|
          t1 = Date.parse(date).to_time.change(:hour => startTime)
          t2 = Date.parse(date).to_time.change(:hour => t1.hour + duration[0])
          t2 = t2.change(:minute => duration[1]) unless duration[1].nil?
          compareTime.between? t1, t2
        end
      end
    end

    helpers HomeHelper
  end
end
