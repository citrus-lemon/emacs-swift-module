import EmacsModule

private class DefnImplementation {
  let function: (Environment, [EmacsValue]) throws -> EmacsValue
  let arity: Int

  init<R: EmacsConvertible>(_ original: @escaping () throws -> R) {
    function = { (env, args) in
      try original().convert(within: env)
    }
    arity = 0
  }
  init<R: EmacsConvertible>(
    _ original: @escaping (Environment) throws -> R
  ) {
    function = { (env, args) in
      try original(env).convert(within: env)
    }
    arity = 0
  }
  init(_ original: @escaping () throws -> Void) {
    function = { (env, args) in
      try original()
      return env.Nil
    }
    arity = 0
  }
  init(
    _ original: @escaping (Environment) throws -> Void
  ) {
    function = { (env, args) in
      try original(env)
      return env.Nil
    }
    arity = 0
  }

  init<T: EmacsConvertible, R: EmacsConvertible>(_ original: @escaping (T) throws -> R)
  {
    function = { (env, args) in
      try original(T.convert(from: args[0], within: env)).convert(within: env)
    }
    arity = 1
  }
  init<T: EmacsConvertible, R: EmacsConvertible>(
    _ original: @escaping (Environment, T) throws -> R
  ) {
    function = { (env, args) in
      try original(env, T.convert(from: args[0], within: env)).convert(within: env)
    }
    arity = 1
  }
  init<T: EmacsConvertible>(_ original: @escaping (T) throws -> Void) {
    function = { (env, args) in
      try original(T.convert(from: args[0], within: env))
      return env.Nil
    }
    arity = 1
  }
  init<T: EmacsConvertible>(
    _ original: @escaping (Environment, T) throws -> Void
  ) {
    function = { (env, args) in
      try original(env, T.convert(from: args[0], within: env))
      return env.Nil
    }
    arity = 1
  }

  init<T1: EmacsConvertible, T2: EmacsConvertible, R: EmacsConvertible>(
    _ original: @escaping (T1, T2) throws -> R
  ) {
    function = { (env, args) in
      try original(
        T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env)
      ).convert(within: env)
    }
    arity = 2
  }
  init<T1: EmacsConvertible, T2: EmacsConvertible, R: EmacsConvertible>(
    _ original: @escaping (Environment, T1, T2) throws -> R
  ) {
    function = { (env, args) in
      try original(
        env, T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env)
      ).convert(within: env)
    }
    arity = 2
  }
  init<T1: EmacsConvertible, T2: EmacsConvertible>(
    _ original: @escaping (T1, T2) throws -> Void
  ) {
    function = { (env, args) in
      try original(
        T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env)
      )
      return env.Nil
    }
    arity = 2
  }
  init<T1: EmacsConvertible, T2: EmacsConvertible>(
    _ original: @escaping (Environment, T1, T2) throws -> Void
  ) {
    function = { (env, args) in
      try original(
        env, T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env)
      )
      return env.Nil
    }
    arity = 2
  }

  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible,
    R: EmacsConvertible
  >(_ original: @escaping (T1, T2, T3) throws -> R) {
    function = { (env, args) in
      try original(
        T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env)
      ).convert(within: env)
    }
    arity = 3
  }
  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible,
    R: EmacsConvertible
  >(_ original: @escaping (Environment, T1, T2, T3) throws -> R) {
    function = { (env, args) in
      try original(
        env, T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env)
      ).convert(within: env)
    }
    arity = 3
  }
  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible
  >(_ original: @escaping (T1, T2, T3) throws -> Void) {
    function = { (env, args) in
      try original(
        T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env)
      )
      return env.Nil
    }
    arity = 3
  }
  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible
  >(_ original: @escaping (Environment, T1, T2, T3) throws -> Void) {
    function = { (env, args) in
      try original(
        env, T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env)
      )
      return env.Nil
    }
    arity = 3
  }

  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible,
    T4: EmacsConvertible, R: EmacsConvertible
  >(_ original: @escaping (T1, T2, T3, T4) throws -> R) {
    function = { (env, args) in
      try original(
        T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env),
        T4.convert(from: args[0], within: env)
      ).convert(within: env)
    }
    arity = 4
  }
  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible,
    T4: EmacsConvertible, R: EmacsConvertible
  >(_ original: @escaping (Environment, T1, T2, T3, T4) throws -> R) {
    function = { (env, args) in
      try original(
        env, T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env),
        T4.convert(from: args[0], within: env)
      ).convert(within: env)
    }
    arity = 4
  }
  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible,
    T4: EmacsConvertible
  >(_ original: @escaping (T1, T2, T3, T4) throws -> Void) {
    function = { (env, args) in
      try original(
        T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env),
        T4.convert(from: args[0], within: env)
      )
      return env.Nil
    }
    arity = 4
  }
  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible,
    T4: EmacsConvertible
  >(_ original: @escaping (Environment, T1, T2, T3, T4) throws -> Void) {
    function = { (env, args) in
      try original(
        env, T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env),
        T4.convert(from: args[0], within: env)
      )
      return env.Nil
    }
    arity = 4
  }

  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible,
    T4: EmacsConvertible, T5: EmacsConvertible, R: EmacsConvertible
  >(_ original: @escaping (T1, T2, T3, T4, T5) throws -> R) {
    function = { (env, args) in
      try original(
        T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env),
        T4.convert(from: args[0], within: env),
        T5.convert(from: args[0], within: env)
      ).convert(within: env)
    }
    arity = 5
  }
  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible,
    T4: EmacsConvertible, T5: EmacsConvertible, R: EmacsConvertible
  >(_ original: @escaping (Environment, T1, T2, T3, T4, T5) throws -> R) {
    function = { (env, args) in
      try original(
        env, T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env),
        T4.convert(from: args[0], within: env),
        T5.convert(from: args[0], within: env)
      ).convert(within: env)
    }
    arity = 5
  }
  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible,
    T4: EmacsConvertible, T5: EmacsConvertible
  >(_ original: @escaping (T1, T2, T3, T4, T5) throws -> Void) {
    function = { (env, args) in
      try original(
        T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env),
        T4.convert(from: args[0], within: env),
        T5.convert(from: args[0], within: env)
      )
      return env.Nil
    }
    arity = 5
  }
  init<
    T1: EmacsConvertible, T2: EmacsConvertible, T3: EmacsConvertible,
    T4: EmacsConvertible, T5: EmacsConvertible
  >(_ original: @escaping (Environment, T1, T2, T3, T4, T5) throws -> Void) {
    function = { (env, args) in
      try original(
        env, T1.convert(from: args[0], within: env),
        T2.convert(from: args[0], within: env),
        T3.convert(from: args[0], within: env),
        T4.convert(from: args[0], within: env),
        T5.convert(from: args[0], within: env)
      )
      return env.Nil
    }
    arity = 5
  }
}

extension Environment {
  //
  // Make function
  //
  public func defn<
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping () throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn(
    named name: String,
    with docstring: String = "",
    function: @escaping () throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }

  public func defn<
    T: EmacsConvertible,
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (T) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T: EmacsConvertible,
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment, T) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (T) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment, T) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }

  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (T1, T2) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment, T1, T2) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (T1, T2) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment, T1, T2) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }

  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible,
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (T1, T2, T3) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible,
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment, T1, T2, T3) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (T1, T2, T3) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment, T1, T2, T3) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }

  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible,
    T4: EmacsConvertible,
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (T1, T2, T3, T4) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible,
    T4: EmacsConvertible,
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment, T1, T2, T3, T4) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible,
    T4: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (T1, T2, T3, T4) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible,
    T4: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment, T1, T2, T3, T4) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }

  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible,
    T4: EmacsConvertible,
    T5: EmacsConvertible,
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (T1, T2, T3, T4, T5) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible,
    T4: EmacsConvertible,
    T5: EmacsConvertible,
    R: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment, T1, T2, T3, T4, T5) throws -> R
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible,
    T4: EmacsConvertible,
    T5: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (T1, T2, T3, T4, T5) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }
  public func defn<
    T1: EmacsConvertible,
    T2: EmacsConvertible,
    T3: EmacsConvertible,
    T4: EmacsConvertible,
    T5: EmacsConvertible
  >(
    named name: String,
    with docstring: String = "",
    function: @escaping (Environment, T1, T2, T3, T4, T5) throws -> Void
  ) throws {
    let wrapped = DefnImplementation(function)
    try defn(named: name, with: docstring, function: wrapped)
  }

  private func defn(
    named name: String,
    with docstring: String,
    function: DefnImplementation
  ) throws {
    let actualFunction: RawFunctionType = { rawEnv, num, args, data in
      let env = Environment(from: rawEnv!)
      // TODO: unwrap all arguments
      let arg = EmacsValue(from: args?.pointee)
      let impl = Unmanaged<DefnImplementation>.fromOpaque(data!)
        .takeUnretainedValue()
      do {
        let result = try impl.function(env, [arg])
        return result.raw
      } catch(_) {
        // TODO: properly handle all exceptions here
        return env.Nil.raw
      }
    }
    let wrappedPtr = Unmanaged.passRetained(function).toOpaque()
    let funcValue = EmacsValue(
      from: raw.pointee.make_function(
        raw, function.arity, function.arity, actualFunction, docstring,
        wrappedPtr))
    let symbol = try intern(name)
    let _ = try funcall("fset", with: symbol, funcValue)
  }
}