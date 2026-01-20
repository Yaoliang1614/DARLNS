function Z = TNNfromPython(G_tensor, rho)
% G_tensor的格式为[n1,n2,n3]，其中n3必须为视图的个数
[n1, n2, n3] = size(G_tensor);

% 对输入张量 G_tensor 进行第0维傅里叶变换
G_hat = fft(G_tensor, [], 1);
 
% 对每个傅里叶模式进行核范数最小化
for i = 1:n1
    % 对每个傅里叶模式进行SVD
    [U, S, V] = svd(squeeze(G_hat(i, :, :)), 'econ');
    %%
    % 对奇异值进行软阈值处理
    S_diag = diag(S);
    S_thresh = soft_thresholding(S_diag, rho);
   
    % 重构矩阵
   G_hat(i, :, :) = U * diag(S_thresh) * V';
end

% 逆傅里叶变换回原空间
Z = real(ifft(G_hat, [], 1));

% 将Z展平为一维数组
Z = Z(:);
end

function S_thresh = soft_thresholding(S, tau)
S_thresh = sign(S) .* max(abs(S) - tau, 0);
end
