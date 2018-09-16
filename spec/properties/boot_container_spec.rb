require './spec/spec_helper'

RSpec.describe Properties::BootContainer do
  subject { ::Container }

  describe 'objects from own component' do
    it { expect { subject['properties.factories.collection'] }.to_not raise_error }
    it { expect { subject['properties.factories.item'] }.to_not raise_error }

    it { expect { subject['properties.repositories.property'] }.to_not raise_error }

    it { expect { subject['properties.services.search'] }.to_not raise_error }
    it { expect { subject['properties.services.validate'] }.to_not raise_error }

    it { expect { subject['properties.validators.search_params'] }.to_not raise_error }
  end
end