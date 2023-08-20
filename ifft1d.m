function [x] = ifft1d(X)
  L = size(X, 1);
  end_pos = L - 1;
  L = 2 * L - 2;
  X(2 : end_pos, :) = X(2 : end_pos, :) / 2;
  X = [X; conj(X(end_pos : -1 : 2, :))];
  X = X * L;
  x = real(ifft(X));
end
