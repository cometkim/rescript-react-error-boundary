@react.component
let make = () => {
  <div>
    <ErrorBoundary
      onError={(error, _) =>
        Js.Console.error(
          switch error->Js.Exn.message {
          | Some(message) => message
          | None => "Unknown error occured while rendering"
          },
        )}>
      {React.string("Succeed!")}
    </ErrorBoundary>
  </div>
}
