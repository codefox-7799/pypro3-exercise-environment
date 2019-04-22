require 'spec_helper'

apt_packages = %w{
  build-essential
  python3-dev
  libsqlite3-dev
  libreadline6-dev
  libgdbm-dev
  zlib1g-dev
  libbz2-dev
  sqlite3
  tk-dev
  zip
  libssl-dev
}

apt_packages.each do |apt_package|
  describe package(apt_package) do
    it { should be_installed }
  end
end

describe command('/opt/python3.6.4/bin/python3.6 -V') do
  its(:stdout) { should match /^Python 3.6.4$/ }
end

describe file('/usr/local/bin/python3.6') do
    it { should be_linked_to '/opt/python3.6.4/bin/python3.6' }
end

describe file('/usr/local/bin/pip') do
    it { should be_linked_to '/opt/python3.6.4/bin/pip3.6' }
end
