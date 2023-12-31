//
// PackageDependency.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import PackageDescription

protocol PackageDependency: Dependency {
  var packageName: String { get }
  var dependency: _PackageDescription_PackageDependency { get }
}

extension PackageDependency {
  var productName: String {
    "\(Self.self)"
  }

  var packageName: String {
    switch dependency.kind {
    case let .sourceControl(name: name, location: location, requirement: _):
      return name ?? location.packageName ?? productName
    case let .fileSystem(name: name, path: path):
      return name ?? path.packageName ?? productName
    case let .registry(id: id, requirement: _):
      return id
    @unknown default:
      return productName
    }
  }

  var targetDepenency: _PackageDescription_TargetDependency {
    switch dependency.kind {
    case let .sourceControl(name: name, location: location, requirement: _):
      let packageName = name ?? location.packageName
      return .product(name: productName, package: packageName)

    @unknown default:
      return .byName(name: productName)
    }
  }
}
