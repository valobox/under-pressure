require 'popen4'

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

    def self.compress(in_path, out_path=nil)
      extname = File.extname(in_path).sub(/^\./, "")
      
      out_path = in_path if out_path.nil?

      # Find a valid compressor
      @@compressors.each do |compressor|
        if compressor.file_types.include?(extname)
          # Compress
          return compressor.compress(in_path, out_path)
        end
      end

      # if no valid compressor then just copy asset
      puts "No compressor for #{extname} found"
      FileUtils.cp in_path, out_path
      false
    end
  end
end

