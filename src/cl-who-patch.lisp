(in-package :cl-who)

(defmethod convert-tag-to-string-list (tag attr-list body body-fn)
  (declare (optimize speed space))
  (let ((tag (string tag)))
    (nconc (when *indent*
             (list +newline+ (n-spaces *indent*)))
           (list "<" tag)
           (convert-attributes attr-list)
           (case (length body)
             (0 (if (member tag *html-empty-tags* :test #'string-equal)
                  (list " />")
                  (list "></" tag ">")))
             (1 (if (and (listp (car body)) (keywordp (car body)))
                    (append (list ">")
                            (let ((*indent* (+ 2 (or *indent* 0))))
                              (funcall body-fn body))
                            (list +newline+ (n-spaces *indent*))
                            (list "</" tag ">"))
                    (append (list ">")
                            (let ((*indent* nil))
                              (funcall body-fn body))
                            (list "</" tag ">"))))
             (t (append (list ">")
                        (let ((*indent* (+ 2 (or *indent* 0))))
                          (funcall body-fn body))
                        (list +newline+ (n-spaces *indent*))
                        (list "</" tag ">")))))))
