<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height:100%;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="https://www.mycollab.com/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="https://www.mycollab.com/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${defaultUrls.app_url}assets/css/cssVelocityPage.css">
<style media="screen" type="text/css">
#container {
    background-image: url('${defaultUrls.cdn_url}footer-clouds.png');  background-repeat: no-repeat;  background-position: bottom right;
}

</style>
<title>Accept invitation page</title>
</head>
<body style="height: 100%; margin: 0; padding: 0; width: 100%;">
	<div id="container" style="height:100%;">
		#parse("templates/page/pageHeader.mt")
		<div id="body" >
			<div id="spacing" "></div>
			<div id="mainBody">
				<div id="title">
					<h1>Welcome <span style="font-style:italic; font-size:22px;">$!email</h1>
				</div>
				<hr size="1">
				<div>
					<table>
					 	<tr>
					 		<td style="width: 350px; vertical-align:top; padding-top:12px;font-size: 18px; color: #616161;">Thank you for accepting the invitation!<br> Please enter your password</td>
					 		<td style="width: 400px; display: inline-block; vertical-align: top;">
								<div id="mainContent">
					  				 <div>
										<form>
										<table border="0">
										<tbody>
										<tr>
											<td style="padding-top:8px;"><label for="password"><span style="font-size:14px;color:#616161;">New Password:</span></label></td>
										</tr>
										<tr>
											<td><input id="password" maxlength="45" name="password" type="password" style="width:365px;height:25px;border: 1px solid rgb(169, 169, 169); border-radius: 3px;"/></td>
										</tr>
										<tr>
											<td style="height:10px;"></td>
										</tr>
										<tr>
											<td><label for="password"><span style="font-size:14px;color:#616161;">Confirm New Password:</span></label></td>
										</tr>
										<tr>
											<td><input id="repassword" maxlength="45" name="password" type="password" style="width:365px;height:25px;border: 1px solid rgb(169, 169, 169); border-radius: 3px;"/></td>
										</tr>
										</tbody></table>
										</form>
									</div>
									<div style="padding-top: 15px; padding-left:200px;">
										<button style="width:80px;" class="v-button-bluebtn" type="button" onclick="return createAccount();"><span style="font-family: 'verdana';font-size: 15px;">Create</span></button>&nbsp&nbsp&nbsp
										<button style="width:80px;" class="v-button-bluebtn" type="button" onclick="return cancel();"><span style="font-family: 'verdana';font-size: 15px;">Cancel</span></button>
									</div>
								</div>
							</td>
					 	</tr>
					</table>
				</div>
				#parse("templates/page/pageFooter_en_US.mt")
			</div>			
		</div>
	</div>
	<input type="hidden" id="handelCreateAccountURL" value="$!handelCreateAccountURL">
	<input type="hidden" id="projectId" value="$!projectId">
	<input type="hidden" id="sAccountId" value="$!sAccountId">
	<input type="hidden" id="email" value="$!email">
	<input type="hidden" id="roleId" value="$!roleId">
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	});
	function createAccount(){
		$('#requireMsg').html("").hide();
		if ($('#password').val() == ""){
			alert("Please enter password");
			return;
		}
		if($('#repassword').val()==""){
			alert("Please retype password");
			return;
		}
		if($('#password').val() != $('#repassword').val()){
			alert("You enter password mismatch with retype password, please re-enter");
			return;
		}
		var url = encodeURI($('#handelCreateAccountURL').val());
		 $.ajax({
		      type: 'POST',
		      url: url,
		      data : { email : $('#email').val().trim(),
		      			password : $('#password').val().trim(), 
		      			roleId : $('#roleId').val().trim(), 
		      			projectId : $('#projectId').val().trim(),
		      			sAccountId : $('#sAccountId').val()},
		      success: function(data){
		      	 if(data!=null){
		      	 	if(data.length > 0){
		      	 		alert(data);
		      	 	}else{
		      	 		alert("Your account has been created.");
		      	 		window.location.assign("$!projectLinkURL");
		      	 	}
		      	 }
		      }
		});
	}
	function cancel(){
		window.location.assign("$!projectLinkURL");
	}
</script>				
</html>