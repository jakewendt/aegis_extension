require 'rails/active_record'
require 'aegis'
require 'aegis_extension'
 
ActiveRecord::Base.class_eval do
	#	override validates_role_name
  extend Aegis::HasRoleExtension
end