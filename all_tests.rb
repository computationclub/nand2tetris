require 'bundler/setup'
require 'minitest/autorun'
require 'open3'

SCRIPT = File.expand_path(File.join('tools', 'HardwareSimulator.sh'))

class HardwareSimulatorTest < Minitest::Test
  Dir['projects/0[1-3]/**/*.tst'].map do |test_file|
    define_method "test_#{File.basename(test_file, '.tst')}" do
      command = "#{SCRIPT} #{test_file}"
      output, status = Open3.capture2e(command)
      assert status.success?, output
    end
  end
end
