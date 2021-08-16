
(cl:in-package :asdf)

(defsystem "mur_common-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "actuation_msg" :depends-on ("_package_actuation_msg"))
    (:file "_package_actuation_msg" :depends-on ("_package"))
    (:file "cone_msg" :depends-on ("_package_cone_msg"))
    (:file "_package_cone_msg" :depends-on ("_package"))
    (:file "diagnostic_msg" :depends-on ("_package_diagnostic_msg"))
    (:file "_package_diagnostic_msg" :depends-on ("_package"))
    (:file "path_msg" :depends-on ("_package_path_msg"))
    (:file "_package_path_msg" :depends-on ("_package"))
    (:file "timing_msg" :depends-on ("_package_timing_msg"))
    (:file "_package_timing_msg" :depends-on ("_package"))
  ))