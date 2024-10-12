function similarity = cosine_similarity(vec1, vec2)
  norm1 = norm(vec1);
  norm2 = norm(vec2);
  produs_scalar = dot(vec1, vec2);
  similarity = produs_scalar / (norm1 * norm2);
end