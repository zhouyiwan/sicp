; (car ''abracadabra); '

; 因为 'abc 是(quote abc)的缩写所以''abracadabra是(quote (quote abracadabra))的缩写
(display (quote (quote abracadabra))); (quote abracadabra)
; 所以 (car (quote abracadabra)) 的结果是 quote