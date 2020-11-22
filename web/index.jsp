<jsp:include flush="true" page="templates/header.jsp"/>	
<div class="limiter">
    <div class="container-login100">
            <div class="wrap-login100">
                    <div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
                            <span class="login100-form-title-1">
                                    Sign In
                            </span>
                    </div>

                <form class="login100-form validate-form" method="POST" action="Auth">
                            <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                                    <span class="label-input100">Username</span>
                                    <input class="input100" type="text" name="username" placeholder="Enter username">
                                    <span class="focus-input100"></span>
                            </div>

                            <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                                    <span class="label-input100">Password</span>
                                    <input class="input100" type="password" name="password" placeholder="Enter password">
                                    <span class="focus-input100"></span>
                            </div>

                            <div class="flex-sb-m w-full p-b-30">
                                    <div>
                                            <a href="pages/auth/register.jsp" class="txt1">
                                                    Not a member ? Please Sign Up Now !
                                            </a>
                                    </div>
                            </div>

                            <div class="container-login100-form-btn">
                                    <button type="submit" class="login100-form-btn">
                                            Login
                                    </button>
                            </div>
                    </form>
            </div>
    </div>
</div>
<jsp:include flush="true" page="templates/header.jsp"/>	

