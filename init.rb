module UnderPressure
  class Compressor
    @@compressors = []

    # Require all the compressors
    Dir[File.expand_path("under_pressure/*.rb", File.dirname(__FILE__))].each do |f|
      puts f
      require f
      f = File.basename(f, ".rb")
      @@compressors << UnderPressure.const_get(f.capitalize).new
    end

    def self.compress(in_path, out_path, out_file=nil)
      extname = File.extname(in_path).sub(/^\./, "")

      if !File.directory?(out_path)
        raise "'#{out_path}' is not a direcotry"
      end

      out_file ||= File.basename(in_path)
      out_file_path = File.join(out_path, out_file)

      puts "@@compressors=#{@@compressors}"
      # Find a valid compressor
      @@compressors.each do |compressor|
        #puts compressor.file_types
        if compressor.file_types.include?(extname)
          # Compress
          return compressor.compress(in_path, out_file_path)
        end
      end
      #puts "No compressor for #{extname} found"
      false
    end
  end
end

