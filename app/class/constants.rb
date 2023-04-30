class Constants
  module Instrumentation
    LIST = %i[
      voice
      soprano
      mezzo_sopprano
      baryton
      violin
      two_violins
      saxo_alto
      alto
      cello
      piano
      two_pianos
      harpsichord
      celesta
      synthesizer
      flute
      small_flute
      oboe
      english_horn
      clarinet_b_flat
      bassoon
      horn
      percussion
      mixed_choir
      harp
      orchestra
    ].freeze
  end

  module Element
    CATEGORIES = %i[musical theme motif phantomatic verbal_mention].freeze
  end
end
