require 'spec_helper'

describe package('aptitude') do
  it { should be_installed }
end

describe package('language-pack-ja') do
  it { should be_installed }
end

describe file('/etc/default/locale') do
  its(:content) { should match /^LANG=ja_JP.UTF-8$/ }
end

describe file('/home/vagrant/.bashrc') do
  its(:content) { should match /^export LANGUAGE=ja_JP:ja$/ }
  its(:content) { should match /^export TERM=xterm-256color$/ }
end
