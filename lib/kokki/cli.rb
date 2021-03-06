# frozen_string_literal: true

module Kokki
  class CLI
    def self.start(input)
      if input
        begin
          print Kokki.flagize(input.chomp)
        rescue Kokki::InvalidInputError => e
          puts e.message
        end
      else
        puts "Input not found: please give a word to convert."
      end
    end
  end
end
