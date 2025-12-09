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
    t('import {'), i(2), t("} from '"), i(1), t("';"),
  }),

  s('default import', {
    t('import '), i(2, 'placeholder'), t(" from '"), i(1), t("';"),
  }),

  s('unpack', {
    t('const { '), i(2), t(' } = '), i(1), t(';'),
  }),
}
