function [x] = ifft2d(X)
  L1 = size(X, 1);
  L2 = size(X, 2);
  end_pos = L1 - 1;
  L1 = 2 * L1 - 2;
  if mod(L2, 2) == 1
    X = [X(:, (L2 + 1) / 2 : end), X(:, 1 : (L2 + 1) / 2 - 1)];
  else
    X = [X(:, L2 / 2 + 1 : end), X(:, 1 : L2 / 2)];
  end
  X(2 : end_pos, :) = X(2 : end_pos, :) / 2;
  X = [X; [conj(X(end_pos : -1 : 2, 1)), conj(X(end_pos : -1 : 2, end : -1 : 2))]];
  X = X * L1 * L2;
  x = real(ifft2(X));
end
