@extends('layout.app')



@section('style')

  <style>

      #item-product {

        max-width: 200px;

        max-height: 500px;

        object-fit: contain;

      }

  </style>

@endsection



@section('content')

@php

$key = 1;

@endphp

<section class="ftco-section ftco-no-pt ftco-no-pb">

    <div class="container">

      <div class="my-3">

        <div class="accordion" id="accordionExample">

          @foreach ($categories as $category)

            <div class="card my-3 border border-dark">

              <a href="{{route('products_category', $category->id)}}">

                <div class="card-header bg-black" id="headingOne">

                  <h2 class="mb-0">

                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">

                      <span class="text-uppercase font-weight-bolder text-light">{{$category->name}}</span>

                    </button>

                  </h2>

                </div>

              </a>

          

              <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">

                <div class="card-body">

                  <div class="row container">

                    {{-- @php ($ambil3 = App\Models\Product::where('category_id',$key) ->take(3)) --}}

                    @php ($ambil3 = App\Models\Product::all()->where('category_id',$key++)->take(3))

                    @foreach ($ambil3 as $product)

                    {{-- {{$product}} --}}

                    <div class="col-sm-6 col-md-6 col-lg-4 ftco-animate d-flex">

                      <div class="product d-flex flex-column border border-black">

                        <a href="{{route('products.show', $product->id)}}" class="img-prod"

                          ><img

                            id="img-product"

                            class="img-fluid w-100"

                            src="{{env('APP_URL_FILE')}}/images/product/{{$product->photo}}"

                            alt="Responsive image Colorlib Template"

                            width="200" 

                            height="500"

                          />

                          <div class="overlay"></div>

                        </a>

                        <div class="text py-3 pb-4 px-3">

                          <div class="d-flex">

                            <div class="cat">

                              <span>{{$product->category->name}}</span>

                            </div>

                          </div>

                          <h3><a href="#">{{$product->name}}</a></h3>

                          <div class="pricing">

                            <p class="price"><span>Rp. {{$product->price}}</span></p>

                          </div>

                          <p class="bottom-area d-flex px-3">

                            <a href="{{route('products.show', $product->id)}}" class="add-to-cart text-center py-2 mr-1"

                              ><span

                                >Detail<i class="ion-ios-arrow-dropright-circle ml-1"></i></span

                            ></a>

                            <a href="https://www.tokopedia.com/rekomendasi/2065300901?ref=googleshopping&c=12266693939&m=379158253&p=2065300901&txsc=google&gclid=EAIaIQobChMIrfnNx_ue9AIVzyMrCh1wqwXGEAQYASABEgJcsfD_BwE&gclsrc=aw.ds" class="buy-now text-center py-2"

                              >Buy now<span><i class="ion-ios-cart ml-1"></i></span

                            ></a>

                          </p>

                        </div>

                      </div>

                    </div>

                  @endforeach

                </div>

                </div>

              </div>

            </div>

          @endforeach

        </div>

      </div>

        <div class="row no-gutters ftco-services">

  <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">

    <div class="media block-6 services p-4 py-md-5">

      <div class="icon d-flex justify-content-center align-items-center mb-4">

            <span class="flaticon-bag"></span>

      </div>

      <div class="media-body">

        <h3 class="heading">Free Shipping</h3>

        <p></p>

      </div>

    </div>      

  </div>

  <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">

    <div class="media block-6 services p-4 py-md-5">

      <div class="icon d-flex justify-content-center align-items-center mb-4">

            <span class="flaticon-customer-service"></span>

      </div>

      <div class="media-body">

        <h3 class="heading">Support Customer</h3>

        <p></p>

      </div>

    </div>    

  </div>

  <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">

    <div class="media block-6 services p-4 py-md-5">

      <div class="icon d-flex justify-content-center align-items-center mb-4">

            <span class="flaticon-payment-security"></span>

      </div>

      <div class="media-body">

        <h3 class="heading">Secure Payments</h3>

        <p></p>

      </div>

    </div>      

  </div>

</div>

    </div>

</section>

@endsection