import greet from "./main"

describe("greeter", () => {
  it("greets", () => {
    const subject = greet("Foo")
    expect(subject).toEqual("Hello, Foo!")
  })
})
