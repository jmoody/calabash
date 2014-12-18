module Calabash
  module CLI
    module Sim
      def handle_sim_argument(argument)
        case argument
          when nil
            print_sim_usage
          else
            fail("Invalid sim command #{argument}.\n  For help use 'calabash help sim'")
        end
      end
    end
  end
end