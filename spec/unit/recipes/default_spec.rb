#
# Cookbook Name:: chefweb
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chefweb::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes the apache package' do
      expect(chef_run).to install_package('httpd')
    end 

    it 'includes the fwrules recipe' do
      expect(chef_run).to include_recipe('chefweb::fwrules')
    end

    it 'enables the apache service' do
      expect(chef_run).to enable_service('httpd')
    end

  end
end
