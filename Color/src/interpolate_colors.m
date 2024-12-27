function color_matrix = interpolate_colors(html_colors)
    % 将HTML颜色转换为RGB小数
    rgb_colors = zeros(length(html_colors), 3);
    for i = 1:length(html_colors)
        rgb_colors(i, :) = hex2rgb(html_colors{i});
    end

    % 对RGB值进行线性插值
    color_matrix = interp1(1:length(html_colors), rgb_colors, linspace(1, length(html_colors), 256));
end

% 辅助函数：将HTML颜色转换为RGB小数
function rgb = hex2rgb(hex_color)
    hex_color = hex_color(2:end); % 去掉'#'
    r = hex2dec(hex_color(1:2)) / 255;
    g = hex2dec(hex_color(3:4)) / 255;
    b = hex2dec(hex_color(5:6)) / 255;
    rgb = [r, g, b];
end
