function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
    mat = read_mat(path);
    mat = preprocess(mat, min_reviews);
    [Ur, Sr, Vr] = svds(mat, num_features);
    liked_vector = Vr(liked_theme, :);
    num_themes = size(Vr, 1);
    similarities = zeros(num_themes, 1);
    
    for i = 1:num_themes
        similarities(i) = cosine_similarity(liked_vector, Vr(i, :));
    end
    [~, sorted_indices] = sort(similarities, 'descend');

    sorted_indices(sorted_indices == liked_theme) = [];
    recoms = sorted_indices(1:num_recoms);
    recoms = recoms';
end
