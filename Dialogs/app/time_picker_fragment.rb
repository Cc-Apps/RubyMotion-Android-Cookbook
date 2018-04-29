class TimePickerFragment < Android::App::DialogFragment
  def onCreateDialog(savedInstanceState)
    calendar = Java::Util::Calendar.getInstance
    hour = calendar.get(Java::Util::Calendar::HOUR_OF_DAY)
    minute = calendar.get(Java::Util::Calendar::MINUTE)
    is_24_hour_format = Android::Text::Format::DateFormat.is24HourFormat(getActivity)

    Android::App::TimePickerDialog.new(getActivity, self, hour, minute, is_24_hour_format)
  end

  def onTimeSet(view, hourOfDay, minute)
    puts "Selected time: #{hourOfDay}:#{minute}"
  end
end