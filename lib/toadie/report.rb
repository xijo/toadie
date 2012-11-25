module Toadie
  class Report
    def self.publish(scope, started_at)
      publish_assets

      File.open(File.join(Toadie.output_path, "index.html"), "w+") do |file|
        file.puts Slim::Template.new(File.join(File.dirname(__FILE__), '../../views/report.slim')).render(scope)
      end

      STDOUT.puts "Toadie report generated to toadie/index.html in #{Time.now - started_at} seconds."
    end

    def self.publish_assets
      FileUtils.mkdir_p Toadie.assets_path
      Dir.glob(File.join(File.dirname(__FILE__), '../../assets/*')) do |file|
        FileUtils.cp file, Toadie.assets_path
      end
    end
  end
end
