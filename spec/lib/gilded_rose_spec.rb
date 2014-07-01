require_relative '../../lib/gilded_rose.rb'

require "rspec"

describe GildedRose do
  let(:item) { Item.new(description, sell_in, quality) }
  let(:description) { 'Made up' }
  let(:sell_in) { 10 }
  let(:quality) { 20 }

  before do
    subject.items = [item]
    subject.update_quality
  end

  context 'Aged Brie' do
    let(:description) { 'Aged Brie' }

    it 'counts sell_in down' do
      expect(subject.first.sell_in).to eq(9)
    end

    it 'increases quality' do
      expect(subject.first.quality).to eq(21)
    end

    context 'maximum quality' do
      let(:quality) { 50 }

      it 'cannot increase any further' do
        expect(subject.first.quality).to eq(50)
      end
    end

    context 'sell_in at zero' do
      let(:sell_in) { 0 }

      it 'increaes quality twice as fast' do
        expect(subject.first.quality).to eq(22)
      end
    end
  end

  context 'Backstage passes' do
    let(:description) { 'Backstage passes to a TAFKAL80ETC concert' }
    let(:sell_in) { 11 }

    it 'counts sell_in down' do
      expect(subject.first.sell_in).to eq(10)
    end

    it 'increases quality' do
      expect(subject.first.quality).to eq(21)
    end

    context 'less than 10 days' do
      let(:sell_in) { 10 }

      it 'increases quality twice as fast' do
        expect(subject.first.quality).to eq(22)
      end
    end

    context 'less than 5 days' do
      let(:sell_in) { 5 }

      it 'increases quality three times as fast' do
        expect(subject.first.quality).to eq(23)
      end
    end

    context 'maxmimum quality' do
      let(:sell_in) { 5 }
      let(:quality) { 49 }

      it 'increases quality three times as fast' do
        expect(subject.first.quality).to eq(50)
      end
    end

    context 'after the concert' do
      let(:sell_in) { 0 }

      it 'loses all quality' do
        expect(subject.first.quality).to eq(0)
      end
    end
  end

  context 'Sulfuras Hand of Ragnaros' do
    let(:description) { 'Sulfuras, Hand of Ragnaros' }
    let(:sell_in) { 0 }
    let(:quality) { 30 }

    it 'never changes quality' do
      expect(subject.first.quality).to eq(30)
    end
  end

  context 'All other items' do
    let(:sell_in) { 10 }
    let(:quality) { 20 }

    it 'counts sell_in down' do
      expect(subject.first.sell_in).to eq(9)
    end

    it 'reduces quality' do
      expect(subject.first.quality).to eq(19)
    end

    context 'quality at zero' do
      let(:quality) { 0 }

      it 'cannot reduce quality any further' do
        expect(subject.first.quality).to eq(0)
      end
    end

    context 'sell_in at zero' do
      let(:sell_in) { 0 }

      it 'reduces quality twice as fast' do
        expect(subject.first.quality).to eq(18)
      end
    end
  end

  it "" do
    subject.update_quality
  end
end
