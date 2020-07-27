//
//  ViewController.swift
//  SwiftLesson
//
//  Created by sari oba on 2020/06/23.
//  Copyright © 2020 Swift-Biggners. All rights reserved.

import UIKit
import RxSwift

class ViewController: UIViewController {
    private let viewModel: SampleApiViewModel = SampleApiViewModel()
    private let disposeBag: DisposeBag = DisposeBag()
   
    let weight: Int = 60
    let height: Int = 170
  

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        bind()
    }

    public func initViews() {
      viewModel.setPrams(weight: weight, height: height)
    }

    private func bind() {
        viewModel
            .loadFinishTrigger
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                dump(self.viewModel.sampleResponseModel)
                }, onError: { _ in
            }).disposed(by: disposeBag)
        viewModel.callApi()
    }

}


