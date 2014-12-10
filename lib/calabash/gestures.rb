module Calabash
  module Gestures

    # Performs the `tap` gesture on the (first) view that matches
    # query `query`.
    #
    # By default, taps the center of the view.
    #
    # @param [String] query query describing view to tap.
    # @param [Hash] options options for modifying the details of the touch
    # @option options [Hash] :offset (nil) optional offset to touch point.
    #   Offset supports an `:x` and `:y` key and causes the touch to be
    #   offset with `(x,y)` relative to the center
    #   wait, time, x, y
    # @option [Number] wait_before (0) how many seconds to wait before
    #   issuing the touch after the view is found.
    # @option [Hash] foobar 
    #
    # @raise [ViewNotFoundError] If the `query` returns no results.
    def tap(query, options={})
      _tap(query, options)
    end


:gesture_position
:relative_position
:at
:at_intercept
:at_position
:using_coordinates


        ├────────────── 400 px ───────────────┤

   ┬    ╔═════════════════════════════════════╗
   |    ║2                                   3║
   |    ║                  4                  ║
   |    ║                                     ║
200 px  ║                  1                  ║
   |    ║                                     ║
   |    ║              7     5                ║   6
   |    ║                                     ║
   ┴    ╚═════════════════════════════════════╝

1. tap("view marked:'email'")
2. tap("view marked:'email'", foobar:  {x: 0, y: 0})
3. tap("view marked:'email'", foobar:  {x: 100, y: 0})
4. tap("* marked:'email'", offset: {y: -40})
5. tap("* marked:'email'", offset: {x: 20, y: 40})
6. tap("* marked:'email'", foobar: {x: 100, y: 75}, offset: {x: 80})
7. tap("* marked:'email'", foobar: {x: 50, y: 100}, offset: {x: -80, y: -40})
    private

    # @!visibility private
    def _tap(query, options={})
      abstract_method!
    end
  end
end
