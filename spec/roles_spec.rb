require_relative 'spec_helper'
require 'json'

describe 'Test of roles service ' do
    before do
      Role.dataset.delete
      User.dataset.delete
    end

    it 'should create a role' do
        new_role = {
          name: "Chef"
        }
        role = CreateRole.call(new_role)
        role.id.wont_be_nil
    end

    it 'should check that roles are not empty' do
      CreateSeedData.call()
      roles = GetRoles.call()
      roles.wont_be_empty
    end
end
