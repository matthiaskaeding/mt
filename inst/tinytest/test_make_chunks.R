x = LETTERS
cs = 5L
chunks = make_chunks(x, cs)
chunk_sizes = vapply(chunks, length, integer(1))

expect_true(
  sum(chunk_sizes != cs) %in% c(0L, 1L)
)

x = 1:1e3
cs = 7L
chunks = make_chunks(x, cs)
chunk_sizes = vapply(chunks, length, integer(1))

expect_true(
  sum(chunk_sizes != cs) %in% c(0L, 1L)
)
