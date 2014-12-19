(require 'rails-new)

(ert-deftest test-rails-new ()
  "Test `rails-new' functions well."
  (let ((temp-dir (expand-file-name "dummy" temporary-file-directory)))
    (unwind-protect
        (progn
          (make-directory temp-dir)
          (rails-new temp-dir nil nil nil nil t nil nil nil
                     nil nil nil nil nil nil) ;; skip git only
          (should (string= rails-new--last-rails-dir temp-dir))
          (should (string= rails-new--last-rails-new-command
                           (format "rails new %s --skip-git " temp-dir)))
          (should (bufferp (get-buffer "*rails-new*")))
          (should (buffer-contains-substring
                   (format "rails new %s --skip-git" temp-dir)
                   (get-buffer "*rails-new*"))))
      (progn
        (delete-directory temp-dir t)))))
