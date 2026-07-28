final: prev: {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev: {
      patool = python-prev.patool.overridePythonAttrs (_: {
        doCheck = false;
      });
    })
  ];
}
