module Calabash
  module CLI
    module Helpers
      HELP = {
          help: 'help',
          gen: 'gen <platform>',
          run: 'run [application] [cucumber options]',
          console: 'console [application]',
          version: 'version',
          setup: 'setup',
          resign: 'resign <apk>',
          build: 'build <apk>',
          :'sim locale' => 'sim <lang> [region]',
          :'sim location' => 'sim location <{on|off}> [application]',
          :'sim reset' => 'sim reset',
          :'sim acc' => 'sim acc',
          :'sim device' => 'sim device {iPad|iPad_Retina|iPhone|iPhone_Retina|iPhone_Retina_4inch}'
      }

      def print_usage_for(command, output=STDOUT)
        if HELP[command].nil?
          output.write <<EOS
No such command '#{command}'
EOS
        else
          output.write <<EOS
Usage:
  calabash [options] #{HELP[command]}
EOS
        end
      end

      def print_usage(output=STDOUT)
        output.write usage
      end

      def usage
        <<EOS
Usage: calabash [options] <command-name> [command specific options]
<command-name> can be one of
  #{HELP[:help]} [command]
    print help information.

  #{HELP[:gen]}
    generate a features folder structure based on the specified platform.
    can be either 'android', 'ios' or 'cross-platform'

  #{HELP[:run]}
    runs Cucumber in the current folder with the environment needed.
    the cucumber options will be passed unchanged to cucumber

  #{HELP[:console]}
    starts an interactive console to interact with your app via Calabash

  #{HELP[:version]}
    prints the gem version

  Android specific commands
    #{HELP[:setup]}
      sets up a non-default keystore to use with this test project.

    #{HELP[:resign]}
      resigns the app with the currently configured keystore.

    #{HELP[:build]}
      builds the test server that will be used when testing the app.

  iOS specific commands
    setup <path>
      setup your XCode project for calabash-ios (EXPERIMENTAL)

    check <{path to .ipa|<path to .app}>
      check whether an app or ipa is linked with calabash.framework (EXPERIMENTAL)

    download
      install latest compatible version of calabash.framework

    check <{path to .ipa|path to .app}>
      check whether an app or ipa is linked with calabash.framework

#{sim_usage.lines.map{|s| s.prepend('    ')}.join}

  [options] can be
    -v, --verbose
      Turns on verbose logging
EOS
      end

      def print_sim_usage(output=STDOUT)
        output.write <<EOS
Usage calabash sim <sim command> [arguments]
#{sim_usage.lines.map{|s| s.prepend('  ')}.join}
EOS
      end

      def sim_usage
        usage = <<EOS
#{HELP[:'sim locale']}
  change locale and regional settings in all iOS Simulators

#{HELP[:'sim location']}
  set allow location on/off for current project or app

#{HELP[:'sim reset']}
  reset content and settings in all iOS Simulators

#{HELP[:'sim acc']}
  enable accessibility in all iOS Simulators

#{HELP[:'sim device']}
  change the default iOS Simulator device.
EOS
        lines = usage.lines
        lines.last.chomp!
        lines.join
      end

      def help
        file_name = File.join(File.dirname(__FILE__), '..', 'doc', 'calabash_help.txt')
        system("less \"#{file_name}\"")
      end

      def fail(reason, command=nil)
        STDERR.write("#{reason}\n")

        if command != nil
          print_usage_for(command)
        end

        exit(1)
      end
    end
  end
end

# Removed commands
=begin
iOS:
    update [target]
      updates one of the following targets: hooks



=end
