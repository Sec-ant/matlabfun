function [X, f] = fft1d(x, bound)
  arguments
    x double
    bound (1, 1) double {mustBePositive, mustBeInteger} = floor(size(x, 1) / 2 + 1)
  end
  L = size(x, 1);
  f = (0 : L / 2)';
  X = fft(x) / L;
  X = X(1 : L / 2 + 1, :);
  X(2 : ceil(L / 2), :) = 2 * X(2 : ceil(L / 2), :);
  bounded_range = 1 : max(min(bound, floor(L / 2 + 1)), 1);
  f = f(bounded_range);
  X = X(bounded_range, :);
end
