function m = trivialmask(x, tol)
  arguments
    x double
    tol (1, 1) double {mustBeNonnegative, mustBeLessThanOrEqual(tol, 1)} = 1e-3
  end
  m = x < max(abs(x), [], 'all') * tol;
end
