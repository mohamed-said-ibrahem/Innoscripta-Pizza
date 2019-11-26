<header id="header"><!--header-->
    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <div class="mainmenu pull-left">
                            <h1 style="font-family:Calistoga"><a href="/pizza">Pizza</a></h1>
                        </div>
                    </div>
                </div>

                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a style="font-family:Pacifico;font-size:1.875em;padding-top: 14px" href="{{url('/viewcart')}}"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                            @if(Auth::check())
                                <li><a style="font-family:Pacifico;font-size:1.875em;padding-top: 14px" href="{{url('/myaccount')}}"><i class="fa fa-user"></i> My Account</a></li>
                                <li><a style="font-family:Pacifico;font-size:1.875em; padding-top: 14px"  href="{{ url('/logout') }}"><i class="fa fa-lock"></i> Logout </a>
                                </li>
                            @else
                                <li><a style="font-family:Pacifico;font-size:1.875em; padding-top: 14px" href="{{url('/login_page')}}"><i class="fa fa-lock"></i> Login</a></li>
                            @endif
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->
</header><!--/header-->