//
//  FlexWrap.swift
//  KarrotFlex
//
//  Created by Geektree0101 on 2022/01/10.
//

import Foundation

public enum FlexWrapDirection {
  case vertical
  case horizontal
}

@discardableResult
public func FlexWrap(_ flex: Flex,
                     direction: FlexWrapDirection,
                     children: [UIView],
                     childDefine: ((Flex) -> Void)? = nil) -> Flex {
  switch direction {
  case .horizontal:
    return FlexHStack(flex) { flex in
      children.forEach { child in
        childDefine?(child.flex)
        FlexItem(flex, view: child)
      }
    }.wrap(.wrap)
  case .vertical:
    return FlexVStack(flex) { flex in
      children.forEach { child in
        childDefine?(child.flex)
        FlexItem(flex, view: child)
      }
    }.wrap(.wrap)
  }
}
