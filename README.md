# bs-react-error-boundary

BuckleScript binding for [react-error-boundary](https://github.com/bvaughn/react-error-boundary)

## Install

```bash
yarn add react-error-boundary bs-react-error-boundary

## or
pnpm add react-error-boundary bs-react-error-boundary
```

And add it into your `bsconfig.json`

```json
  "bs-dependencies": [
    "bs-react-error-boundary"
  ]
```

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
