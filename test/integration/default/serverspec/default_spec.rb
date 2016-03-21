require 'spec_helper'

describe 'simple_apache_setup::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'installs packages' do
    case :family
      when "ubuntu"
        expect(package('apache2')).to be_installed
      when "centos"
        expect(package('httpd')).to be_installed
    end
  end

  it "is listening on port 80" do
    expect(port(80)).to be_listening
  end

  it "has a running service of apache2/httpd" do
    case :family
      when "ubuntu"
        expect(service("apache2")).to be_running
      when "centos"
        expect(service("httpd")).to be_running
    end
  end
end
