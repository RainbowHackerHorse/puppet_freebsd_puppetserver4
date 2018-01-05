# ruby_majverson.rb

Facter.add('ruby_majversion') do
  setcode do
    Facter::Core::Execution.exec('/usr/local/bin/ruby --version | /usr/bin/cut -c 6- | /usr/bin/cut -c -3')
  end
end