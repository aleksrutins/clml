(in-package :clml)

(defun render-attribute (name val)
  (concatenate 'string
               (symbol-name name) "=\"" val "\" "))

(defun render-children (children)
  (apply #'concatenate 'string
         (mapcar (lambda (c)
                   (if (stringp c)
                       c
                       (render-element c)))
                 children)))

(defun render-element (el)
  (let* ((name (car el))
         (properties (cdr el))
         (children (getf properties :children)))
    (concatenate 'string
                 "<" 
                 (string-trim " " 
                              (concatenate 'string
                                           (symbol-name name) " "
                                           (apply #'concatenate 'string
                                                  (loop for (name val) on properties by #'cddr
                                                        if (not (eq name :children))
                                                        collect (render-attribute name val)))))
                 ">"
                 (render-children children)
                 "</" (symbol-name name) ">")))
