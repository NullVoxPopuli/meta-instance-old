# This is based on a few things from
# http://reference.jumpingmonkey.org/programming_languages/ruby/ruby-metaprogramming.html
#
# allows the adding of methods to instances,
# but not the entire set of instances for a
# particular class
module MetaInstance

  # when a method is stubbed with snapshot data, we stare the
  # original method prixefixed with this:
  METHOD_BACKUP_KEY = "_mata_instance_backup_current_"

  # backs up and overrides a method.
  # but don't override if we already have overridden this method
  def instance_override(name, &block)
    unless self.respond_to?("#{METHOD_BACKUP_KEY}#{name}")
      backup_instance_method(name)
    end
    instance_define(name, &block)
  end

  # Adds methods to a metaclass
  def instance_define(name, &block)
    meta_eval {
      define_method(name, &block)
    }
  end

  # backs up a method in case we want to restore it later
  def backup_instance_method(name)
    meta_eval {
      alias_method "#{METHOD_BACKUP_KEY}#{name}", name
    }
  end

  # the original method becomes reaccessible
  def restore_instance_method(name)
    meta_eval {
      alias_method name, "#{METHOD_BACKUP_KEY}#{name}"
      remove_method "#{METHOD_BACKUP_KEY}#{name}"
    }
  end

  private

  # The hidden singleton lurks behind everyone
  def metaclass
    class << self
      self
    end
  end

  def meta_eval(&block)
    metaclass.instance_eval(&block)
  end

end