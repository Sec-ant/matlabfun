function [x, k, g] = calculateplacementmultiplier(k, g, q, p)

  arguments
    k {mustBeInteger, mustBePositive(k)}
    g {mustBeInteger, mustBePositive(g)}
    q {mustBeInteger, mustBePositive(q)}
    p {mustBeInteger, mustBePositive(p)}
  end

  if mod(k, 2) == 0
    k = g * lcm(2, k);
    g = 1 / 2;
    while mod(k, 2) == 0
      k = k / 2;
      g = g * 2;
    end
  end

  if g > 1
    h = 2 * g * k;
  else
    h = k;
  end

  x = calculateplacementmultiplierfromh(h, q, p);

end

%% 位置因子计算函数（接收与组数和相数相关的一个 h 作为参数）
function x = calculateplacementmultiplierfromh(h, q, p)

  arguments
    h {mustBeInteger, mustBePositive(h)}
    q {mustBeInteger, mustBePositive(q)}
    p {mustBeInteger, mustBePositive(p)}
  end

  [d, a, ~] = gcd(p, q);

  if mod(q, h * d) ~= 0
    x = nan;
    return
  end

  x = mod(a * q / h / d, q / d) * h / q;

  if x == 0
    x = nan;
  end

end