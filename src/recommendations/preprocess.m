function reduced_mat = preprocess(mat, min_reviews)
  nr_reviews = sum(mat ~= 0, 2);
  randuri_bune = nr_reviews >= min_reviews;
  reduced_mat = mat(randuri_bune, :);
end
