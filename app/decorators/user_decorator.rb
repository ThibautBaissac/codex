class UserDecorator < SimpleDelegator
  def fullname
    "#{firstname&.capitalize} #{lastname&.capitalize}"
  end

  def name_or_email
    fullname.present? ? fullname : email
  end
end
