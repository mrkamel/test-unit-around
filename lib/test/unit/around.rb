
require "test/unit/around/version"
require "test/unit"

class Test::Unit::TestCase
  def self.around(&block)
    define_method :around do |&blk| 
      unless blk.respond_to?(:run)    
        def blk.run
          call
        end
      end

      instance_exec blk, &block
    end
  end

  alias_method :orig_run, :run

  def run(result, &block)
    if respond_to?(:around)
      name = method_name

      orig = :"orig_#{name}"

      unless respond_to?(orig)
        singleton = class << self; self; end

        singleton.send :alias_method, orig, name

        singleton.send :define_method, name do
          around { send orig }
        end
      end
    end

    orig_run result, &block
  end
end

