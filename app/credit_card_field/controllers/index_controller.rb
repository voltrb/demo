module CreditCardField
  class IndexController < ::ModelController
    def initialize(data)
      puts "INIT1"
      super

      @data = data

      puts "Data: " + data.inspect
      @input = nil
      @changed_listener = @data.value.on('changed') do
        text = @data.value.cur
        `self.input.val(text)`
      end
    end

    def dom_ready
      %x{
        this.input = $('input.cc-num');
        this.input.payment('formatCardNumber');

        this.input.on('input.ccfield, keyup.ccfield', function() {
          self.$update();
        });
      }
    end

    def dom_removed
      %x{
        this.input.off('.ccfield');
        delete this.input;
      }

      @changed_listener.remove
    end

    def update
      text = `this.input.val()`
      @data.value.cur = text
    end
  end
end