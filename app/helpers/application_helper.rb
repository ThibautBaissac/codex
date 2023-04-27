module ApplicationHelper
  def my_format(text)
    text.gsub!(/(\*)([^*]+?)(\*)/, '<b>\2</b>') # *text* > <b>text</b>
    text.gsub!(/(_)([^_]+?)(_)/, '<em>\2</em>') # _text_ > <em>text</em>
    text.gsub!(/(~)([^~]+?)(~)/, '<s>\2</s>') # ~text~ >  <s>text</s>
    text.gsub!(/\/n/, '<br>') # <br>
    text.html_safe
  end
end
