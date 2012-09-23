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

      supported_file_types = @@compressors.map(&:file_types).uniq.flatten

      # First copy the file to the out path location
      # If a compressor can't compress this will be the fallback
      # Note that jpgoptim won't output anything if it can't improve the file
      FileUtils.cp in_path, out_path

      if supported_file_types.include?(extname)
        # Find a valid compressor
        @@compressors.each do |compressor|
          if compressor.file_types.include?(extname.downcase)
            if compressor.compress(in_path, out_path)
              log "compressing #{in_path} to #{out_path}"
            else
              log "!!!!!!!!!!! compression of #{in_path} failed. Moving to #{out_path}"
            end
          end
        end
      else
        log "No compressor for #{extname} found, moving #{in_path} to #{out_path}"
      end
    end

    def self.log(str = "")
      puts str if ENV['LIB_VERBOSE'] == true
    end
  end
end

