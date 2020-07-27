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

  public func setPrams(weight: String, height: String) {
    if let createPram = SampleRequestModel(weight: weight, height: height).dictionary {
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

