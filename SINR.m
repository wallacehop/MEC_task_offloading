%最优信噪比计算

%基站与第m个CUE的信道增益
[hmb,hmb_big]=loss_all_big_CUE(500,8);
%基站与第k个DUE的信道增益
[hkb,hkb_big]=loss_all_big_CUE(500,8);
%第k个DUE之间的信道增益
[hk,hk_big]=loss_all_big_DUE(v,3);
%第m个DUE与第k个CUE之间的信道增益
[hmk,hmk_big]=loss_all_big_DUE(v,3);
%CUE最优信噪比计算
rmc_mat=zeros(M,K);
for i=1:M
  %rmc_mat(i,:)=PMC_best_dbm(i)*1e-3+hmb-(N0_dbm*1e-3+PKD_best_dbm'.*hkb);
  %rmc_mat(i,:)=PMC_best_dbm(i).*hmb./(N0_dbm+PKD_best_dbm'.*hkb);
  %转化为常数单位进行计算
  rmc_mat(i,:)=power(10,PMC_best_dbm(i)/10).*1e-3.*power(10,hmb/10)./(power(10,N0_dbm/10).*1e-3+(power(10,PKD_best_dbm/10).*1e-3)'.*power(10,hmb/10));
end
%DUE最优信噪比
rkd_mat=zeros(M,K);
for i=1:M
  %rkd_mat(i,:)=PKD_best_dbm(i).*hkb./(N0_dbm+PMC_best_dbm'.*hmk);
  %转化为常数单位进行计算
  rmc_mat(i,:)=power(10,PKD_best_dbm(i)/10)*1e-3.*power(10,hkb/10)./(power(10,N0_dbm/10).*1e-3+(power(10,PKD_best_dbm/10).*1e-3)'.*power(10,hmk/10));
end
