require 'spec_helper'

describe 'mcollective::server' do
  let(:pre_condition) { 
    'class { "mcollective":
      hosts           => ["middleware.example.net"],                                                                                                                                                         
      client_password => "fakeTestingClientPassword",
      server_password => "fakeTestingServerPassword",
      psk_key         => "fakeTestingPreSharedKey",
    }'
  }

  context 'with defaults for all parameters' do
    it { should contain_package('mcollective') }

    it { should compile.with_all_deps }
  end

  context "With a package name specified" do
    let :params do
      {
        :package => 'mcollectived'
      }
    end

    it {
      should contain_package('mcollectived').with( { 'name' => 'mcollectived' } )
    }
  end
end