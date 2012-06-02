require 'popen4'

module UnderPressure
  class Png
    def initialize
      # nothing...
    end

    def file_types
      ["png"]
    end
    
    def compress(in_file, out_file)
      # options -brute -rem gAMA -rem cHRM -rem iCCP -rem sRGB -reduce
      cmd = "pngcrush -rem gAMA -rem cHRM -rem iCCP -rem sRGB -reduce #{in_file} #{out_file} 2>&1"
      `#{cmd}`
      return $?.exitstatus < 1 ? true : false
    end
  end
end