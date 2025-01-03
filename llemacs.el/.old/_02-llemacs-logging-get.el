;;; -*- lexical-binding: t -*-
;;; Author: 2024-12-31 16:22:15
;;; Time-stamp: <2024-12-31 16:22:15 (ywatanabe)>
;;; File: /home/ywatanabe/.dotfiles/.emacs.d/lisp/llemacs/llemacs.el/_02-llemacs-logging-get.el

(require '02-llemacs-logging-db)

(defun llemacs--logging-get-project-logs (project-id &optional limit)
  "Get logs for PROJECT-ID with optional LIMIT."
  (emacsql llemacs--logging-db-connection
           [:select * :from projects
                    :where (= project-id $s1)
                    :order-by [(desc timestamp)]
                    :limit $s2]
           project-id (or limit 50)))

(defun llemacs--logging-get-milestone-logs (milestone-id &optional limit)
  "Get logs for MILESTONE-ID with optional LIMIT."
  (emacsql llemacs--logging-db-connection
           [:select * :from milestones
                    :where (= milestone-id $s1)
                    :order-by [(desc timestamp)]
                    :limit $s2]
           milestone-id (or limit 50)))

(defun llemacs--logging-get-task-logs (task-id &optional limit)
  "Get logs for TASK-ID with optional LIMIT."
  (emacsql llemacs--logging-db-connection
           [:select * :from tasks
                    :where (= task-id $s1)
                    :order-by [(desc timestamp)]
                    :limit $s2]
           task-id (or limit 50)))

(defun llemacs--logging-get-step-logs (step-id &optional limit)
  "Get logs for STEP-ID with optional LIMIT."
  (emacsql llemacs--logging-db-connection
           [:select * :from steps
                    :where (= step-id $s1)
                    :order-by [(desc timestamp)]
                    :limit $s2]
           step-id (or limit 50)))

(provide '02-llemacs-logging-get)

(message "%s was loaded." (file-name-nondirectory (or load-file-name buffer-file-name)))