từ_vựng(c_Hoàng,0).
từ_vựng(c_Nga,0).
từ_vựng(c_Tuấn,0).
từ_vựng(em,2).
từ_vựng(anh,2).
từ_vựng(mua,2).
từ_vựng(bạn,2).
từ_vựng(giỏi,1).
từ_vựng(con_mèo,1).
từ_vựng(con_mèo_mun,1).
từ_vựng(con_chó,1).
từ_vựng(học_sinh,1).


hằng(X):-từ_vựng(X,0).
hằng(c_con_mèo).
hằng(c_mèo_mun).
hằng(c_con_chó).
học_sinh(c_Hoàng).
học_sinh(c_Nga).

giỏi(c_Nga).
em(c_Nga,c_Hoàng).
anh(X,Y):-em(Y,X).

con_mèo_mun(c_mèo_mun).
con_mèo(c_con_mèo).
con_mèo(X):-con_mèo_mun(X).
con_chó(c_con_chó).

mua(c_Nga,c_con_chó).
mua(c_Tuấn,c_con_mèo).
mua(c_Hoàng,c_mèo_mun).

bạn(c_Hoàng,c_Tuấn).
bạn(X,Y):-bạn(Y,X).









