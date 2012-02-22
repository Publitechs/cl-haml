(in-package :cl-haml)

(defvar *stylesheet-root-dir* "/style/")
(defvar *javascript-root-dir* "/script/")
(defvar *i18n-dir* nil)
(defvar *txt-tree* nil)

(defun stylesheet-link-tag (name &key media)
  (ppcre:register-groups-bind (head extension)
      ("^(https?://)?.*(\\.s?css)?$" name)
    (concatenate 'string
                 "<link rel='stylesheet' type='text/css' href='"
                 (unless head *stylesheet-root-dir*)
                 name
                 (unless extension ".css")
                 "'"
                 (when media (format nil " media='~A'" media))
                 " />")))

(defun javascript-include-tag (name &optional cache-p)
  (format nil "<script type='text/javascript' src='~A~A~A~A'></script>"
          (if (ppcre:scan "^https?://" name) "" *javascript-root-dir*)
          name
          (if (ppcre:scan "\\.js" name) "" ".js")
          (if cache-p "" "?")
          (if cache-p "" (random most-positive-fixnum))))

(defun link-to (text &key url (ctrl *current-controller*)
                              (act *current-action*)
                              id)
  (if url
      (format nil "<a href='~A'>~A</a>" url text)
      (format nil "<a href='/~A/~A~A'>~A</a>"
              ctrl act (if id (format nil "/~A" id) "") text)))
