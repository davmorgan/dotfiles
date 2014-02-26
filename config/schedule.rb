every 1.day, :at => '7:30 am' do
  command "/usr/local/bin/brew update"
end

every 1.day, :at => '7:45 am' do
  command "/usr/local/bin/brew outdated"
end
