describe Number::Component do
  let(:component) { described_class.new(value: value) }

  describe 'to_wh' do
    subject { component.to_wh }

    context 'when small number (< 100 kWh)' do
      let(:value) { 12_345.67 }

      it 'renders kWh with decimal' do
        is_expected.to eq '<span><strong class="font-medium">12</strong><small>,3</small>&nbsp;<small>kWh</small></span>'
      end
    end

    context 'when large number (>= 100 kWh)' do
      let(:value) { 123_456.78 }

      it 'renders kWh without decimal' do
        is_expected.to eq '<span><strong class="font-medium">123</strong>&nbsp;<small>kWh</small></span>'
      end
    end

    context 'when very large number (>= 1000 kWh)' do
      let(:value) { 1_234_567.89 }

      it 'renders MWh' do
        is_expected.to eq '<span><strong class="font-medium">1</strong><small>,2</small>&nbsp;<small>MWh</small></span>'
      end
    end
  end

  describe 'to_w' do
    subject { component.to_w }

    context 'when small number (< 100 kW)' do
      let(:value) { 12_345.67 }

      it do
        is_expected.to eq '<span><strong class="font-medium">12</strong><small>,3</small>&nbsp;<small>kW</small></span>'
      end
    end

    context 'when large number (>= 100 kW)' do
      let(:value) { 123_456.78 }

      it do
        is_expected.to eq '<span><strong class="font-medium">123</strong>&nbsp;<small>kW</small></span>'
      end
    end

    context 'when very large number (>= 1000 kW)' do
      let(:value) { 1_234_567.89 }

      it do
        is_expected.to eq '<span><strong class="font-medium">1.235</strong>&nbsp;<small>kW</small></span>'
      end
    end
  end

  describe 'to_eur' do
    subject { component.to_eur }

    context 'when positive' do
      let(:value) { 1.234 }

      it do
        is_expected.to eq '<span class="text-green-500"><strong class="font-medium">1</strong><small>,23</small>&nbsp;<small>€</small></span>'
      end
    end

    context 'when negative' do
      let(:value) { -1.234 }

      it do
        is_expected.to eq '<span class="text-red-500"><strong class="font-medium">-1</strong><small>,23</small>&nbsp;<small>€</small></span>'
      end
    end
  end
end
