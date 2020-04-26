[@react.component]
let make = () => {
  <div> <ErrorBoundary> {React.string("Succeed!")} </ErrorBoundary> </div>;
};
