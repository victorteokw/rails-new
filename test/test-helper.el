(defvar test-dir (file-name-directory load-file-name))
(defvar root-dir (append test-dir ".."))

(mapc (lambda (p)
        (add-to-list 'load-path p))
      (list test-dir root-dir))

(load "rails-new-test")

(if noninteractive
    (ert-run-tests-batch-and-exit)
  (ert t))
