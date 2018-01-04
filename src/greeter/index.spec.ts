import greet from '.'

describe("greeter", () => {
  it('greets', () => {
    const subject = greet("John Doe")
    expect(subject).toEqual("Hello, John Doe!")
  })
})
