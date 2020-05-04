type renderProp('a) = [
  | `string(string)
  | `render(React.component('a))
  | `element(React.element)
];

type onError = (Js.Exn.t, string) => unit;

[@bs.obj]
external makeErrorBoundaryProps:
  (
    ~children: 'children=?,
    ~fallbackComponent: 'union_rttf=?,
    ~onError: onError=?,
    unit
  ) =>
  _;

let makeProps =
    (
      ~children: option('children)=?,
      ~fallbackComponent: option(renderProp('a))=?,
      ~onError: option(onError)=?,
      (),
    ) =>
  makeErrorBoundaryProps(~children?, ~fallbackComponent?, ~onError?, ());

[@bs.module "react-error-boundary"]
external make: React.component('a) = "default";
