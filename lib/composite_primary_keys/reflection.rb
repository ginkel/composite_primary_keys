module ActiveRecord
  module Reflection
    class AssociationReflection
      def cpk_primary_key
        # Make sure the returned key(s) are an array
        @cpk_primary_key ||= [derive_primary_key_name].flatten
      end

      def derive_primary_key_name_with_cpk
        result = derive_primary_key_name_without_cpk

        # CPK
        if result.is_a?(Array)
          result.to_composite_keys.to_s
        else
          result
        end
      end
      alias_method_chain :derive_primary_key_name, :cpk
    end
  end
end
