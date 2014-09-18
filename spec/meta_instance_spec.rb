require 'spec_helper'

describe MetaInstance do
  let(:original){"bar"}
  let(:f){ Foo.new }

  it "returns the original value" do
    expect(f.bar).to eq original
  end

  context "instance_define" do

    context "without args" do

      before(:each) do
        f.instance_define(:bar) do
          "foo"
        end
      end

      it "redefines the method" do
        expect(f.bar).to eq "foo"
      end

      it "returns the redefined value on another instance" do
        expect(Foo.new.bar).to_not eq "foo"
      end

    end

    context "with args" do

      before(:each) do
        f.instance_define(:bar) do |number|
          number * 2
        end

        it "takes an argument" do
          expect(f.bar(3)).to eq 6
        end
      end
    end
  end

  context "backup_instance_method" do
    before(:each) do
      f.backup_instance_method(:bar)
    end

    it "has the original method accessible" do
      name = "#{MetaInstance::METHOD_BACKUP_KEY}bar"
      expect(f.send(name)).to eq original
    end
  end

  context "restore_instance_method" do
    before(:each) do
      f.backup_instance_method(:bar)
      f.instance_define(:bar) { "different" }
      f.restore_instance_method(:bar)
    end

    it "returns the original" do
      expect(f.bar).to eq original
    end

    it "doesn't respond_to the backup method" do
      expect(f).to_not respond_to "#{MetaInstance::METHOD_BACKUP_KEY}bar"
    end

    it "doesn't remove a method that isn't there" do
      expect(f).to_not respond_to(:foobar)
      expect(f.restore_instance_method(:foobar)).to be_nil
    end
  end

  context "instance_override" do
    before(:each) do
      f.instance_override(:bar) do
        4
      end
    end

    it "returns the new value" do
      expect(f.bar).to eq 4
    end

    it "has the original method accessible" do
      name = "#{MetaInstance::METHOD_BACKUP_KEY}bar"
      expect(f.send(name)).to eq original
    end

    it "returns the redefined value on another instance" do
      expect(Foo.new.bar).to_not eq "foo"
    end

    context "second call on instance_override" do
      before(:each) do
        f.instance_override(:bar) do
          0
        end
      end

      it "does not re-backup the method" do
        name = "#{MetaInstance::METHOD_BACKUP_KEY}bar"
        expect(f.send(name)).to eq original
      end

      it "returns the new value" do
        expect(f.bar).to eq 0
      end

    end

  end

end
