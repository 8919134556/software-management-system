
        function validateuser(){  
        var name=document.myform.name.value;           
        var email=document.myform.email.value;
        var mobile=document.myform.phone.value;
        // var postalcode=document.myform.postalcode.value;
        var password=document.myform.password.value;  
        // var conpassword=document.myform.conpassword.value; 
        
        var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id
        var letter = /[a-z]/;
        var upper = /[A-Z]/;
        var number = /[0-9]/;

        if (name==""){  
          alert("Name can't be blank");           
          return false;  
        }
        if (email==""){
            alert("Email cannot be blank");            
            return false;
        }
        if(!email.match(emailpattern)){
            alert("Invalid Email format");             
            return false;
        }
        if(isNaN(mobile)){
            alert("Invalid Mobile number");
            return false;
        }
        if(mobile=="" || mobile.length!=10){
            alert("Invalid Mobile number");
            return false;
        }
        // if (postalcode=="" || postalcode.length!=6){
        //     alert("postalcode should not be empty");          
        //     return false;
        //     }
        // if(isNaN(postalcode)){
        //     alert("Invalid postalcode");
        //     return false;
        // }
        if (password==''){
            alert("password should not be empty");          
            return false;
            }
        
        if (!letter.test(password)) {
            alert("Please make sure password includes a lowercase letter.");
                return false;
            }
        if (!number.test(password)) {
            alert("Please make sure Password Includes a Digit");
                return false;
            }
        if (!upper.test(password)) {
            alert("Please make sure password includes an uppercase letter.");
                return false;
            } 
        // if(conpassword!=password){
        //     alert("password and confirm password must match");            
        //     return false;
        // }
    }  
   