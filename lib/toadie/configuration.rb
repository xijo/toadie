module Toadie
  module Configuration
    def output_path
      output_path = File.join(root, output_dir)
      FileUtils.mkdir_p output_path
      output_path
    end

    def assets_path(filename = '')
      File.join(Toadie.output_path, 'assets', Toadie.version, filename)
    end

    def file_extensions=(values)
      @file_extensions = Array(values)
    end

    def file_extensions
      @file_extensions
    end

    def output_dir
      'toadie'
    end

    def root
      File.expand_path(Dir.getwd)
    end

    def version
      Toadie::VERSION
    end

    def test?
      @test
    end

    def test=(value)
      @test = value
    end
  end
end
