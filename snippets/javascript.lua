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

  s('named import', {
    t('import {'), i(0), t("} from '"), i(1), t("';"),
  }),

  s('default import', {
    t('import '), i(0, 'placeholder'), t(" from '"), i(1), t("';"),
  }),

  s('unpack variable', {
    t('const { '), i(0), t(' } = '), i(1), t(';'),
  }),

  s('unpack argument', {
    t('{ '), i(0), t(' }: '), i(1),
  }),

  s('use state', {
    t('const ['), i(1, 'state'), t(', '), f(computeSetter, {1}), t('] = useState('), i(0, 'value'), t(')')
  })

}
