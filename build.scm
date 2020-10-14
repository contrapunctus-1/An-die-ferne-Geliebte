#!/usr/bin/guile -s
!#
(use-modules
 (ice-9 match)
 (srfi srfi-1)
 (ice-9 format)
 (ice-9 regex))

;; (format #t "~2%")

(define *options*
  '("pac" "size"))

(define *project-name*
  (regexp-substitute #f (string-match ".*/" (getcwd)) 'post))

;; Looks through the args list for the first occurrence of each valid
;; option from *options*
(define get-valid-args
  (lambda (cli-args)
    ;; (format (current-error-port) "cli-args - ~s~%" cli-args)
    (map (lambda (opt)
           (find (lambda (cli-word)
                   (string-match
                    (string-append "^" opt)
                    cli-word))
                 cli-args))
         *options*)))

;; changes args into a key-value alist
(define valid-args->alist
  (lambda (valid-args)
    ;; (format (current-error-port) "valid-args - ~s~%" valid-args)
    (map (lambda (arg)
           (and arg
                (string-contains arg "=")
                (cons
                 (regexp-substitute #f (string-match "=" arg) 'pre)
                 (regexp-substitute #f (string-match "=" arg) 'post))))
         valid-args)))

(if (< (length (command-line)) 2)
    (format #t "~a~%" "Usage: build.scm TARGET [ARG=VALUE]*")
    (let* ((cli-args   (command-line))
           (target     (cadr cli-args))
           (valid-args (get-valid-args cli-args))
           (args-alist (valid-args->alist valid-args))
           (size       (match (assoc-ref args-alist "size")
                              ("a4" "-a4")
                              (_ "")))
           (pac        (match (assoc-ref args-alist "pac")
                              ("off" "-dno-point-and-click ")
                              (_ "")))
           (ly-command (string-append "lilypond "
                                      pac
                                      "-o \"output/"
                                      *project-name*
                                      (match target
                                             ("main" "")
                                             (_ (string-append "-" target)))
                                      (match pac
                                             ("" "-pacON")
                                             (_ ""))
                                      (match size
                                             ("" "")
                                             (_ "-"))
                                      size
                                      "\" "
                                      target size ".ly")))
      ;; (format (current-error-port)
      ;;         (string-append
      ;;          "cli-args - ~s~%"
      ;;          "target - ~s~%"
      ;;          "valid-args - ~s~%"
      ;;          "args-alist - ~s~%"
      ;;          "size - ~s~%"
      ;;          "pac - ~s~%")
      ;;         cli-args
      ;;         target
      ;;         valid-args
      ;;         args-alist
      ;;         size
      ;;         pac)
      (format #t "~2%~a~2%" ly-command)
      (system ly-command)))
