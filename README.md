# rescript-react-error-boundary

[![NPM Package](https://img.shields.io/npm/v/rescript-react-error-boundary)](https://www.npmjs.com/package/rescript-react-error-boundary)
[![LICENSE - MIT](https://img.shields.io/github/license/cometkim/rescript-react-error-boundary)](#LICENSE)

ReScript binding for [react-error-boundary](https://github.com/bvaughn/react-error-boundary)

## Installation

```bash
yarn add rescript-react-error-boundary
```

And add it into your `bsconfig.json`

```json
  "bs-dependencies": [
    "rescript-react-error-boundary"
  ]
```

## Example

```re
open RescriptReactErrorBoundary;

@react.component
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

## LICENSE

MIT
