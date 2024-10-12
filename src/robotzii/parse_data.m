function [x, y] = parse_data(filename)
    fisier = fopen(filename, 'r');
    n = fscanf(fisier, '%d', 1); % citesc n
    x = fscanf(fisier, '%d', n+1); % citesc x
    y = fscanf(fisier, '%d', n+1); % citesc y
    fclose(fisier);
end