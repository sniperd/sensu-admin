describe "Event", ->
  it "can be initialized", ->
    expect(-> new SensuEvents.Event()).not.toThrow(new TypeError("undefined is not a function"));
