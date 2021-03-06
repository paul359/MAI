(defun whitespace-char(ch)
	(member ch '(#\Space #\Tab #\Newline))
)

(defun count-words-starting-with-char(ch str)
	(let
		(
			(res 0)
			(cur-ch nil)
			(word? T)
		)
		
		(loop for i from 0 to (- (length str) 1) do
			(setq cur-ch (char str i))
			
			(if (not (whitespace-char cur-ch))
				(progn
					(if (and word? (char= ch cur-ch))
						(setq res (+ res 1))
					)
					
					(setq word? nil)
				)
				
				(setq word? T)
			)
		)
		
		res
	)
)

(print (count-words-starting-with-char #\t "This is test"))
(print (count-words-starting-with-char #\t "This is test,to"))
(print (count-words-starting-with-char #\w "Word0??,	word2..   word3!
word4ooh		word5!!1"))
(print (count-words-starting-with-char #\f "Another string for testing"))
(print (count-words-starting-with-char #\a "A lot of aaa aaaa aaaaaaaa a"))
(print (count-words-starting-with-char #\z "Zero?"))
(print (count-words-starting-with-char #\L "Last"))
(print (count-words-starting-with-char #\п "Сказать по правде, я не люблю весну."))
(print (count-words-starting-with-char #\т "Проверка русского текста"))
(print (count-words-starting-with-char #\а "Много ааа ааааааааааа аааа"))
(print (count-words-starting-with-char #\ы "Ничего не найдется"))
(print (count-words-starting-with-char #\р "Разный регистр"))
