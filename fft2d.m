function [X, f1, f2] = fft2d(x, bound_1, bound_2)
  arguments
    x double
    bound_1 (1, 1) double {mustBePositive, mustBeInteger} = floor(size(x, 1) / 2 + 1)
    bound_2 (1, 1) double {mustBePositive, mustBeInteger} = floor(size(x, 2) / 2)
  end
  [L1, L2] = size(x);
  f1 = (0 : L1 / 2)';
  f2 = (- L2 / 2 : L2 / 2 - 1)';
  X = fft2(x) / L1 / L2;
  X = X(1 : L1 / 2 + 1, :);
  X(2 : ceil(L1 / 2), :) = 2 * X(2 : ceil(L1 / 2), :);
  X = fftshift(X, 2);
  bounded_range_1 = 1 : max(min(bound_1, floor(L1 / 2 + 1)), 1);
  bounded_range_2 = max(floor(L2 / 2 + 1) - bound_2, 1) : min(floor(L2 / 2 + 1) + bound_2, L2);
  f1 = f1(bounded_range_1);
  f2 = f2(bounded_range_2);
  X = X(bounded_range_1, bounded_range_2);
end
