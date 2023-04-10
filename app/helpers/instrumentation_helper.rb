module InstrumentationHelper
  def instrumentation_options(work)
    instrumentations = Work.instrumentation_keys.map{|instrument| [t("intrumentation.#{instrument.downcase}"), instrument.upcase] }
    select_tag 'work[instrumentation]',
      options_for_select(instrumentations, work.instrumentation),
      multiple: true,
      class: "d-block mt-3",
      placeholder: "Instrumentation"
  end


  def quote_instrumentation_options(quote)
    instrumentations = Work.instrumentation_keys.map{|instrument| [t("intrumentation.#{instrument.downcase}"), instrument.upcase] }
    select_tag 'quote[instrumentation]',
      options_for_select(instrumentations, quote&.instrumentation),
      multiple: true,
      class: "d-block mt-3",
      placeholder: "Instrumentation"
  end
end
