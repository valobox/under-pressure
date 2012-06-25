module UnderPressure
  class Compressor
    @@compressors = []

    # Require all the compressors
    Dir[File.expand_path("compressors/*.rb", File.dirname(__FILE__))].each do |f|
      require f
      f = File.basename(f, ".rb")
      @@compressors << UnderPressure.const_get(f.capitalize).new
    end

    def self.compress(in_path, out_path=nil)
      extname = File.extname(in_path).sub(/^\./, "")
      
      out_path = in_path if out_path.nil?

      supported_file_types = @@compressors.map{|compressor| compressor.file_types}.uniq.flatten

      # First copy the file to the out path location
      # If a compressor can't compress this will be the fallback
      # Note that jpgoptim won't output anything if it can't improve the file
      FileUtils.cp in_path, out_path

      if supported_file_types.include?(extname)
        # Find a valid compressor
        @@compressors.each do |compressor|
          if compressor.file_types.include?(extname.downcase)
            # Compress
            puts "compressing #{in_path}"
            if compressor.compress(in_path, out_path)
              # puts "compression complete"
            else
              puts "!!!!!!!!!!! compression failed"
            end
          end
        end
      else
        puts "No compressor for #{extname} found"
      end
    end
  end
end

