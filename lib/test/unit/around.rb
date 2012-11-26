
require "test/unit/around/version"
require "test/unit"

module Test
  module Unit
    module Around
      def self.included(base)
        base.class_eval do
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

          def run_with_around(result, &block)
            if respond_to?(:around)
              orig = :"orig_#{method_name}"

              unless respond_to?(orig)
                singleton = class << self; self; end

                singleton.send :define_method, method_name do
                  around { super }
                end
              end
            end

            run_without_around result, &block
          end

          alias_method :run_without_around, :run
          alias_method :run, :run_with_around
        end
      end
    end
  end
end

if defined?(ActiveSupport::TestCase)
  # ActiveSupport::TestCase itself already overwrites run.
  # Thus, we need to redefine run there as well.

  ActiveSupport::TestCase.send :include, Test::Unit::Around
end

Test::Unit::TestCase.send :include, Test::Unit::Around
