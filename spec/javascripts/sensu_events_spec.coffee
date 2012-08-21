describe "SensuEvents", ->
  it "passes a sanity test", ->
    app = new SensuEvents()
    expect(app.sanity()).toEqual(true)
