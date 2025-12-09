return {
  s('if err', {
    t({
			'if err != nil {',
			'\t'}), i(0), t({'',
			'}'
		}),
  }),

  s('if asign err', {
    t('if '), i(1, 'err'), t(' := '), i(2, 'expr'), t({'; err != nil {',
      '\t'}), i(0), t({'',
      '}'
		}),
  }),

  s('iife', {
    t('func() '), i(1), t({' {',
      '\t'}), i(0),t({'',
      '}()'
		}),
  })
}
