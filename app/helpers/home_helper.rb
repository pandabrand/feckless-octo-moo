# Helper methods defined here can be accessed in any controller or view in the application

module Darksidetwo
  class App
    module HomeHelper
      def lift_gate_helper(dates, compareTime)
        return false if dates.nil?
        dates_arr = dates.split ","
        return dates_arr.any? {|date| compareTime == Date.parse(date)}
      end
    end

    helpers HomeHelper
  end
end
