sample = """first line
second line
third  line
fourth line
fifth  line
sixth  line
"""

def get_next_lines(it, prev_nl):
  if len(prev_nl) == 2:
    prev_nl.pop(0)
    try:
      l = next(it)
    except StopIteration:
      return prev_nl
    prev_nl.append(l)
    return prev_nl
  try:
    l1 = next(it)
  except StopIteration:
    return []
  try:
    l2 = next(it)
  except StopIteration:
    return [l1]
  return [l1, l2]

if __name__ == "__main__":
  i = iter(sample.splitlines())
  j = iter(sample.splitlines())
  next(j)
  current_offset = 1
  prev_lines = []
  next_lines = []
  for line in i:
    next_lines = get_next_lines(j, next_lines)
    print("""
    %s
    %i %s
    %s
    """ %(
      "\n    ".join(prev_lines),
      current_offset, line,
      "\n    ".join(next_lines)
      ))
    current_offset+=1
    if len(prev_lines) == 2:
      prev_lines.pop(0)
    prev_lines.append(line)