type onerror = (~error: Js.Exn.t, ~componentStack: string) => unit;

type componentProp = [
  | `str(string)
  | `render(unit => React.element)
  | `element(React.element)
];

[@bs.obj]
external makeErrorBoundaryProps:
  (
    ~children: 'children=?,
    ~fallbackComponent: 'union_rttf=?,
    ~onError: onerror=?,
    unit
  ) =>
  _;

let makeProps =
    (
      ~children: option('children)=?,
      ~fallbackComponent: option(componentProp)=Some(
                                                   `render(
                                                     ErrorBoundaryFallbackComponent.make,
                                                   ),
                                                 ),
      ~onError: option(onerror)=?,
      (),
    ) =>
  makeErrorBoundaryProps(~children?, ~fallbackComponent?, ~onError?, ());

[@bs.module "react-error-boundary"]
external make: React.component('a) = "default";
