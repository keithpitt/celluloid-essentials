module Celluloid
  module Internals
    module CPUCounter
      class << self
        def cores
          @cores ||= count_cores
        end

        private

        def count_cores
          result = from_env || from_sysdev || from_java || from_proc || try_win32ole
        rescue LoadError
          result = Integer `sysctl -n hw.ncpu 2>/dev/null` rescue nil
        ensure
          return Integer(result.to_s[/\d+/], 10) if result
          1
        end

        def from_env
          ENV["NUMBER_OF_PROCESSORS"]
        end

        def from_sysdev
          ::IO.read("/sys/devices/system/cpu/present").split("-").last.to_i + 1
        rescue Errno::ENOENT
          result = Dir["/sys/devices/system/cpu/cpu*"].count { |n| n =~ /cpu\d+/ }
          result unless result.zero?
        end

        def from_java
          Java::Java.lang.Runtime.getRuntime.availableProcessors if defined? Java::Java
        end

        def from_proc
          File.read('/proc/cpuinfo').scan(/^processor\s*:/).size if File.exist?('/proc/cpuinfo')
        end

        # Rescue this if it fails, in `count_cores`
        def try_win32ole
          require 'win32ole'
          WIN32OLE.connect("winmgmts://").ExecQuery("select * from Win32_ComputerSystem").NumberOfProcessors
        end
      end
    end
  end
end
