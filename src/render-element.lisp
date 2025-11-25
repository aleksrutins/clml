(in-package :clml)

(defun render-attribute (name val)
  (concatenate 'string
               (symbol-name name) "=\"" val "\" "))

(defun render-element (el)
  (let* ((name (car el))
         (properties (cdr el))
         (children (getf properties :children)))
    (concatenate 'string
                 "<" (symbol-name name) " "
                 (apply #'concatenate 'string
                        (loop for (name val) on properties by #'cddr
                              if (not (eq name :children))
                              collect (render-attribute name val)))
                 ">"
                 (if children
                     (apply #'concatenate 'string 
                            (mapcar #'render-element children))
                     "")
                 "</" (symbol-name name) ">")))
