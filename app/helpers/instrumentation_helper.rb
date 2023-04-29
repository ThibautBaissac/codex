module InstrumentationHelper
  def instrumentation_options(work)
    instrumentations = Work.instrumentation_keys.map{|instrument| [t("intrumentation.#{instrument.downcase}"), instrument.upcase] }
    select_tag 'work[instrumentation]',
      options_for_select(instrumentations, work.instrumentation),
      multiple: true,
      class: "d-block mt-3",
      placeholder: "Instrumentation"
  end


  def element_instrumentation_options(element)
    instrumentations = Work.instrumentation_keys.map{|instrument| [t("intrumentation.#{instrument.downcase}"), instrument.upcase] }
    select_tag 'element[instrumentation]',
      options_for_select(instrumentations, element&.instrumentation),
      multiple: true,
      class: "d-block",
      placeholder: "Instrumentation"
  end
end
