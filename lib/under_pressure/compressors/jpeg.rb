module UnderPressure
  class Jpeg
    def initialize
      # nothing...
    end

    def file_types
      ["jpg", "jpeg"]
    end
    
    def compress(in_file, out_file)
      # HACK
      out_file = File.dirname(out_file)
      cmd = "jpegoptim #{in_file} --max=100 -d #{out_file} -o 2>&1"
      `#{cmd}`
      $?.exitstatus < 1 ? true : false
    end
  end
end