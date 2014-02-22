require 'spec_helper'

$module = 'oracle_java_jdk'

describe $module, :type => 'class' do

  context 'On a Debian OS with no version or release specified' do
    let :facts do
      {
        :osfamily  => 'Debian',
        :lsbdistid => 'debian',
      }
    end

    it {
      should contain_package($module).with({ 'name' => 'oracle-java7-installer' })
      should contain_package("${module}_installer").with({ 'name' => 'oracle-java7-set-default' })
    }
  end

  context 'On a Ubuntu OS with no version or release specified' do
    let :facts do
      {
        :osfamily  => 'Debian',
        :lsbdistid => 'ubuntu',
      }
    end

    it {
      should contain_package($module).with({ 'name' => 'oracle-java7-installer' })
      should contain_package("${module}_installer").with({ 'name' => 'oracle-java7-set-default' })
    }
  end

  context 'On any other OS with no version or release specified' do
    let :facts do
      {
        :osfamily => 'Darwin'
      }
    end

    it {
      expect{ should rais_error(Puppet::Error) }
    }
  end

end
