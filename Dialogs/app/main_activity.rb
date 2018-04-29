class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super

    dialogList = Android::Widget::ListView.new(self)
    dialogList.adapter = Android::Widget::ArrayAdapter.new(self, Android::R::Layout::Simple_list_item_1, dialogs)
    dialogList.onItemClickListener = self

    self.contentView = dialogList
  end

  def onItemClick(parent, view, position, id)
    case id
    when 0
      alert_dialog.show
    when 1
      time_picker_fragment.show(getFragmentManager, "TimePickerFragment")
    end

  end

  def dialogs
    ["Alert Dialog", "Time Picker Fragment Dialog"]
  end

  def alert_dialog
    alert_dialog = Android::App::AlertDialog.new(self, Android::App::AlertDialog::THEME_HOLO_LIGHT)

    alert_dialog.setTitle("Alert Dialog!")
    alert_dialog.setMessage("This is a message to see if the alert dialog is working")
  end

  def time_picker_fragment
    TimePickerFragment.new
  end
end
