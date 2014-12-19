(defvar test-dir (file-name-directory load-file-name))
(defvar root-dir (append test-dir ".."))

(mapc (lambda (p)
        (add-to-list 'load-path p))
      (list test-dir root-dir))

(load "rails-new-test")

(defun buffer-contains-substring (string &optional buffer)
  (with-current-buffer (or buffer (current-buffer))
    (save-excursion
      (save-match-data
        (goto-char (point-min))
        (search-forward string nil t)))))

(if noninteractive
    (ert-run-tests-batch-and-exit)
  (ert t))
