type props

type resetKeys<'a> = array<'a>

type componentInfo = {componentStack: string}

type onResetKeysChange<'a> = (option<resetKeys<'a>>, option<resetKeys<'a>>) => unit
type onReset<'a> = resetKeys<'a> => unit
type onError = (Js.Exn.t, componentInfo) => unit

type fallbackProps<'a> = {
  error: Js.Exn.t,
  resetErrorBoundary: resetKeys<'a> => unit,
}
type fallbackElement = React.element
type fallbackComponent<'a> = React.component<fallbackProps<'a>>
type fallbackRender<'a> = fallbackProps<'a> => React.element

type fallback<'a> =
  | Element(fallbackElement)
  | Component(fallbackComponent<'a>)
  | Render(fallbackRender<'a>)

@obj
external makeErrorBoundaryPropsWithElement: (
  ~children: 'children=?,
  ~fallback: React.element,
  ~resetKeys: resetKeys<'a>=?,
  ~onError: onError=?,
  ~onReset: onReset<'a>=?,
  ~onResetKeysChange: onResetKeysChange<'a>=?,
  unit,
) => props = ""

@obj
external makeErrorBoundaryPropsWithComponent: (
  ~children: 'children=?,
  ~\"FallbackComponent": fallbackComponent<'a>=?,
  ~resetKeys: resetKeys<'a>=?,
  ~onError: onError=?,
  ~onReset: onReset<'a>=?,
  ~onResetKeysChange: onResetKeysChange<'a>=?,
  unit,
) => props = ""

@obj
external makeErrorBoundaryPropsWithRender: (
  ~children: 'children=?,
  ~fallbackRender: fallbackProps<'a> => React.element,
  ~resetKeys: resetKeys<'a>=?,
  ~onError: onError=?,
  ~onReset: onReset<'a>=?,
  ~onResetKeysChange: onResetKeysChange<'a>=?,
  unit,
) => props = ""

@obj
external makeErrorBoundaryPropsWithoutFallback: (
  ~children: 'children=?,
  ~resetKeys: resetKeys<'a>=?,
  ~onError: onError=?,
  ~onReset: onReset<'a>=?,
  ~onResetKeysChange: onResetKeysChange<'a>=?,
  unit,
) => props = ""

let makeProps = (
  ~children=?,
  ~fallback: option<fallback<'a>>=?,
  ~resetKeys: option<resetKeys<'a>>=?,
  ~onError: option<onError>=?,
  ~onReset: option<onReset<'a>>=?,
  ~onResetKeysChange: option<onResetKeysChange<'a>>=?,
  (),
) => {
  switch fallback {
  | Some(Element(fallback)) =>
    makeErrorBoundaryPropsWithElement(
      ~children?,
      ~fallback,
      ~resetKeys?,
      ~onError?,
      ~onReset?,
      ~onResetKeysChange?,
      (),
    )
  | Some(Component(\"FallbackComponent")) =>
    makeErrorBoundaryPropsWithComponent(
      ~children?,
      ~\"FallbackComponent",
      ~resetKeys?,
      ~onError?,
      ~onReset?,
      ~onResetKeysChange?,
      (),
    )
  | Some(Render(fallbackRender)) =>
    makeErrorBoundaryPropsWithRender(
      ~children?,
      ~fallbackRender,
      ~resetKeys?,
      ~onError?,
      ~onReset?,
      ~onResetKeysChange?,
      (),
    )
  | None =>
    makeErrorBoundaryPropsWithoutFallback(
      ~children?,
      ~resetKeys?,
      ~onError?,
      ~onReset?,
      ~onResetKeysChange?,
      (),
    )
  }
}

@module("react-error-boundary")
external make: React.component<'a> = "ErrorBoundary"
