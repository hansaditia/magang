{{-- <nav
      class="
        navbar navbar-expand-lg navbar-dark
        ftco_navbar
        ftco-navbar-light
      "
      id="ftco-navbar"
    >
      <div class="container">
        <a class="navbar-brand" href="{{route('/')}}">Ecolar</a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#ftco-nav"
          aria-controls="ftco-nav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="oi oi-menu mr-2"></span>{{$page}}
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item 
              @if ($page == 'home')
                active  
              @endif
            ">
              <a href="{{route('/')}}" class="nav-link text-white h-5"><h6>Home</h6></a>
            </li>
            <li class="nav-item 
              @if ($page == 'product')
                active  
              @endif
            ">
              <a href="{{route('products.index')}}" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link text-white dropdown-toggle"><h6>Product</h6></a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li>
            <li class="nav-item 
              @if ($page == 'about')
                active  
              @endif
            ">
              <a href="{{route('about')}}" class="nav-link text-white"><h6>About</h6></a>
            </li>
          </ul>
        </div>
      </div>
</nav> --}}
@php
    $categories = \App\Models\Category::all()
@endphp

<nav
class="
  navbar navbar-expand-lg navbar-dark
  ftco_navbar
  bg-dark
  ftco-navbar-light
"
id="ftco-navbar"
>
  <div class="container">
    <a class="navbar-brand" href="{{route('/')}}">Toko Pot Hendra
    </a>
    <button
      class="navbar-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#ftco-nav"
      aria-controls="ftco-nav"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="oi oi-menu"></span> Menu
    </button>

    <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a href="{{route('/')}}" class="nav-link text-light font-weight-bolder">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle text-light font-weight-bolder"
            id="dropdown04"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
            href="{{route('products.index')}}"
            >Products</a
          >
          <div class="dropdown-menu" aria-labelledby="dropdown04">
            <a class="dropdown-item" href="{{route('products.index')}}">All</a>
            @foreach ( $categories as $category )
              <a class="dropdown-item" href="{{route('products_category', $category->id)}}">{{$category->name}}</a>
            @endforeach
          </div>
        </li>
        <li class="nav-item">
          <a href="{{route('about')}}" class="nav-link text-light font-weight-bolder">About</a>
        </li>
      </ul>
    </div>
  </div>
</nav>