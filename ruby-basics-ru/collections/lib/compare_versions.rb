# frozen_string_literal: true

# BEGIN
def compare_versions(version1, version2)
  return 0 if version1 == version2

  return -1 if version1.split('.').first == version2.split('.').first && version1[version2.length - 1].to_i < version2[-1].to_i

  version1.to_f > version2.to_f ? 1 : -1
end
# END
