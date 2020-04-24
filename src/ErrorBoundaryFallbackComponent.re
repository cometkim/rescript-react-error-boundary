[@bs.obj]
external makeProps:
  (~componentStack: string, ~error: Js.Exn.t) =>
  {
    .
    "componentStack": string,
    "error": Js.Exn.t,
  };

[@bs.module "react-error-boundary"]
external make: React.component('a) = "ErrorBoundaryFallbackComponent";
