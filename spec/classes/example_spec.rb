require 'spec_helper'

describe 'devpi' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "devpi class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('devpi::params') }

        it { should contain_class('devpi::install') }
        it { should contain_class('devpi::config') }
        it { should contain_class('devpi::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'devpi class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
