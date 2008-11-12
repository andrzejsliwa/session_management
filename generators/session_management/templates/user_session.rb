require 'session_management/session.rb'

# This class is configuration for session managment.
# Here you can define members or collection managed
# by session.
class UserSession < SessionManagement::Session
  
  # Example of member definition: 
  #   <code>
  #   member :last_action
  #   </code>
  # 
  # Generated methods:
  #   <code>last_action=        # set value on session </code>
  #   <code>last_action         # return value from session </code>
  #   <code>reset_last_action   # this reset value on session (and return value) </code>
  member      :last_action
  
  # Example of collection definition: 
  #   <code>
  #   collection :products
  #   </code>
  # 
  # Generated methods:
  #   <code>add_product=         # set value on session collection </code>
  #   <code>remove_product(prod) # remove value from session collection </code>
  #   <code>products             # return session collection </code>
  #   <code>reset_products       # this reset value on session (and return value) </code>
  # collection :products

end