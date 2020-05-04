let makeProps = (~componentStack: string, ~error: Js.Exn.t, ()) => {
  "componentStack": componentStack,
  "error": error,
};

[@bs.module "react-error-boundary"]
external make: React.component('a) = "ErrorBoundaryFallbackComponent";
