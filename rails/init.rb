require 'rails/active_record'
require 'aegis'
require 'aegis_extension'
 
ActiveRecord::Base.class_eval do
	#	override validates_role_name
  extend AegisExtension::HasRole
end
Aegis::Permissions.send(:include, AegisExtension::Permissions )

