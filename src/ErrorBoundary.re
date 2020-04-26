type renderProp('a) = [
  | `string(string)
  | `render(React.component('a))
  | `element(React.element)
];

type onerror = (~error: Js.Exn.t, ~componentStack: string) => unit;

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
      ~fallbackComponent: option(renderProp('a))=Some(
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
