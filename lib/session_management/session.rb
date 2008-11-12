require 'session_management/exceptions.rb'

module SessionManagement

  # This class is used for managing objects on session
  # with better controll of using session hash
  #
  # For using this you must extend this class.
  # Example using:
  #    <code>
  #    class UserSession < SessionManagment::Session    
  #    </code>
  #
  class Session
  
    # This is constructor for initializing
    # Session object
    def initialize(session)
      @session = session
    end
  
    # This helper method is for definie new
    # session values ready to use in aplication
    #
    # Example using: 
    #   <code>
    #   member :last_action
    #   </code>
    # 
    # This declaration add new methods helpers for 
    # managing on session:
    #   <code>last_action=        # set value on session </code>
    #   <code>last_action         # return value from session </code>
    #   <code>reset_last_action   # this reset value on session (and return value) </code>
    #
    def self.member(name)
      raise ParamTypeException, "#{name} must be Symbol" unless name.class == Symbol
    
      setter_name = "#{name}=".to_sym
      getter_name = name
      reset_name  = "reset_#{name}".to_sym
     
      defined = instance_method( setter_name ) rescue false
      raise DefinedException, "#{setter_name} is already defined in #{self}" if defined
    
      # define setter method in runtime
      define_method( setter_name ) do |param|
        @session[name] = param
      end
      # define getter method in runtime
      define_method( getter_name ) do
        @session[name]
      end
      # define reset method in runtime
      define_method( reset_name ) do
        orginal_value = @session[name]
        @session[name] = nil
        orginal_value
      end
    end
    
    # This helper method is for definie new
    # session values ready to use in aplication
    #
    # Example using: 
    #   <code>
    #   collection :products
    #   </code>
    # 
    # This declaration add new methods helpers for 
    # managing on session:
    #   <code>add_product(prod)    # set value on session collection </code>
    #   <code>remove_product(prod) # remove value from session collection </code>
    #   <code>products             # return session collection </code>
    #   <code>reset_products       # this reset value on session (and return value) </code>
    #
    def self.collection(name)
      raise ParamTypeException, "#{name} must be Symbol" unless name.class == Symbol
      
      singular_name = name.to_s.singularize
      
      add_name    = "add_#{singular_name}".to_sym
      remove_name = "remove_#{singular_name}".to_sym
      coll_name   = "#{name}".to_sym
      reset_name  = "reset_#{name}".to_sym 

      defined = instance_method( setter_name ) rescue false
      raise DefinedException, "#{add_name} is already defined in #{self}" if defined

      # define add method in runtime
      define_method( add_name ) do |param|
        resolve_collection( name ) << param
      end
      # define remove method in runtime
      define_method( remove_name ) do |param|
        resolve_collection( name ).delete param
      end
      # define get collection in runtime
      define_method( coll_name ) do 
        resolve_collection( name )
      end
      
      # define reset collection method
      define_method( reset_name ) do      
        orginal_value = resolve_collection( name )
        @session[name] = nil
        orginal_value
      end
    end
    
    private
      # helper method - stay DRY ;)
      def resolve_collection(name)
        @session[name] ||= Array.new
      end
    
  end
  
end