---@diagnostic disable: undefined-global
return {
  s('template1', {
    -- Simple static text.
    t '//Parameters: ',
    -- function, first parameter is the function, second the Placeholders
    -- whose text it gets as input.
    f(copy, 2),
    t { '', 'function ' },
    -- Placeholder/Insert.
    i(1),
    t '(',
    -- Placeholder with initial text.
    i(2, 'int foo'),
    -- Linebreak
    t { ') {', '\t' },
    -- Last Placeholder, exit Point of the snippet.
    i(0),
    t { '', '}' },
  }),
}
