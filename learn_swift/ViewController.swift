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
   
    let bmi: String = ""
    let suitable_weight: String = ""
    let degree_of_obesity: String = ""
  

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        bind()
    }

    public func initViews() {
      viewModel.setPrams(bmi: bmi, suitable_weight: suitable_weight, degree_of_obesity: degree_of_obesity)
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


