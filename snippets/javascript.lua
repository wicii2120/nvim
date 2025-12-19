local function computeSetter(args)
  local name = args[1][1]
  return 'set' .. name:sub(1,1):upper() .. name:sub(2)
end

return {
  s('iife', {
    t({
			';(() => {',
			'  '}), i(0), t({'',
			'})()'
		}),
  }),

  s('aiife', {
    t({
      'await (async () => {',
      '  '}), i(0), t({ '',
      '})()',
    }),
  }),

  s('import statement', {
    t('import '), i(0, 'placeholder'), t(" from '"), i(1), t("';"),
  }),

  s('unpack variable', {
    t('const { '), i(0), t(' } = '), i(1), t(';'),
  }),

  s('use state', {
    t('const ['), i(1, 'state'), t(', '), f(computeSetter, {1}), t('] = useState('), i(0, 'value'), t(')')
  }),

  s('jsdoc', {
    t({
      '/**',
      ' * '}), i(0), t({'',
      ' */',
    }),
  }),

  s('jsdoc type cast', {
    t({'/** @type {'}), i(1), t('} */ ('), i(0), t(')'),
  })
}
