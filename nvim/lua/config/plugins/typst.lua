return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  dependencies_bin = { ['tinymist'] = 'tinymist' },
  opts = {}, -- lazy.nvim will implicitly calls `setup {}`
}
