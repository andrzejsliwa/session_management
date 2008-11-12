module SessionManagement

  # This Exception class is used for
  # raising exception when session variable
  # is defined allready.
  class DefinedException < Exception
  end

  # This Exception class is user for
  # raising exception when param is
  # not Symbol for instance method sess 
  # of object created from Session class is
  class ParamTypeException < Exception
  end
  
end