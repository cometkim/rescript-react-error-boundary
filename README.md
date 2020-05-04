# bs-react-error-boundary

BuckleScript binding for [react-error-boundary](https://github.com/bvaughn/react-error-boundary)

## Example

```re
open BsReactErrorBoundary;

[@react.component]
let make = () => {
  <div>
    <ErrorBoundary
      onError={(error, _) =>
        Js.Console.error(
          switch (error->Js.Exn.message) {
          | Some(message) => message
          | None => "Unknown error occured while rendering"
          },
        )
      }>
      <App/>
    </ErrorBoundary>
  </div>;
};
```
