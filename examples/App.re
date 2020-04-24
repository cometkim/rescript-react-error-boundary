[@react.component]
let make = () => {
  <div>
    <ErrorBoundary fallbackComponent={Some(`str(("Failed!")))}>
      {React.string("Succeed!")}
    </ErrorBoundary>
  </div>;
};
