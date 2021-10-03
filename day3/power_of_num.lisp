; cerner_2tothe5th_2021
; Program to find the power of a number
; You can also find the value of 2 ^ 5

(defun power-num(num power)
    (defvar result 1)
    (dotimes (n power)
    (setf result (* result num)))
    (write result))

(print "Enter Number: ")
(terpri)
(setq num (read))
(print "Enter Power: ")
(terpri)
(setq power (read))

(write num)
(princ " ^ ")
(write power)
(princ "=")

(power-num num power)
