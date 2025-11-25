(defsystem "clml"
  :description "HTML generation for Common Lisp"
  :serial t
  :components ((:module "src"
                :components ((:file "package")
                             (:file "render-element")
                             (:file "render")))))
