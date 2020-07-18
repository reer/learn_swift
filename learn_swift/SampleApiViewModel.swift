//
//  SampleApiViewModel.swift
/**
 View Model Sample.
 Please refer to this class when making API request using Moya.
 http://zipcloud.ibsnet.co.jp/doc/api
 */

import Alamofire
import RxSwift
import Moya

class SampleApiViewModel {
    let loadFinishTrigger: PublishSubject<Void> = PublishSubject<Void>()
    let provider = MoyaProvider<SampleEndpoint>()
    private let disposeBag: DisposeBag = DisposeBag()

    var params: [String: Any] = [:]
    var sampleResponseModel: SampleResponseModel!

  public func setPrams(bmi: String, suitable_weight: String, degree_of_obesity: String) {
    if let createPram = SampleRequestModel(bmi: bmi, suitable_weight: suitable_weight, degree_of_obesity: degree_of_obesity).dictionary {
            params = createPram
        }
    }

    public func callApi() {
        provider.rx.request(.getHealth(request: params))
            .filterSuccessfulStatusCodes()
            .map(SampleResponseModel.self)
            .subscribe(onSuccess: { (model) in
                self.sampleResponseModel = model
                self.loadFinishTrigger.onNext(())
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
}

