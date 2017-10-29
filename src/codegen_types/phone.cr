module AST
  class PhonePrimitiveType
    def typescript_decode(expr)
      "#{expr}"
    end

    def typescript_encode(expr)
      "#{expr}.replace(/[^0-9+]/g, \"\")"
    end

    def typescript_native_type
      "string"
    end

    def typescript_check_encoded(expr, descr)
      String.build do |io|
        io << "if (typeof #{expr} !== \"string\" || #{expr}.replace(/[^0-9+]/g, \"\").length < 5 || #{expr}[0] !== \"+\") {\n"
        io << "    failTypeCheck(#{descr}, ctx);\n"
        io << "}\n"
      end
    end

    def typescript_check_decoded(expr, descr)
      String.build do |io|
        io << "if (typeof #{expr} !== \"string\" || #{expr}.replace(/[^0-9+]/g, \"\").length < 5 || #{expr}[0] !== \"+\") {\n"
        io << "    failTypeCheck(#{descr}, ctx);\n"
        io << "}\n"
      end
    end
  end
end
