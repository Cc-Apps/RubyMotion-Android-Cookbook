class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super

    toastList = Android::Widget::ListView.new(self)
    toastList.adapter = Android::Widget::ArrayAdapter.new(self, Android::R::Layout::Simple_list_item_1, toasts)
    toastList.onItemClickListener = self

    self.contentView = toastList
  end

  def onItemClick(parent, view, position, id)
    case id
    when 0
      toast.show
    when 1
      custom_toast.show
    end
  end

  def toasts
    ["Toast Dialog", "Custom Toast Dialog"]
  end

  def toast
    Android::Widget::Toast.makeText(self, "This is a toast", Android::Widget::Toast::LENGTH_SHORT)
  end

  def custom_toast
    custom_toast = Android::Widget::Toast.new(self)
    custom_toast_layout = getLayoutInflater.inflate(R::Layout::Custom_toast, findViewById(R::Id::Custom_toast_container))

    toast_text_view = custom_toast_layout.findViewById(R::Id::Toast_message)
    toast_text_view.setText("Toast msg 2")

    custom_toast.setGravity(Android::View::Gravity::CENTER_VERTICAL, 0, 0)
    custom_toast.setDuration(Android::Widget::Toast::LENGTH_LONG)
    custom_toast.setView(custom_toast_layout)
  end
end
