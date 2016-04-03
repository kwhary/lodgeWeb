component accessors=true {
  property greetingService;
  property profileService;
  property quoteService;
  // property securityService;

  function default( struct rc ) {
    param name="rc.name" default="anonymous";
    param name='rc.debugSession' default=0 type='boolean';
    param name='rc.debugApplication' default=0 type='boolean';
    param name='rc.debugRequest' default=0 type='boolean';
    param name='rc.page.title' default='' type='string';

    rc.name = variables.greetingService.greet( rc.name );

    // NOTE: Add Profiles service to the request context.
    rc.profiles = variables.profileService;

    // NOTE: Add Quotes service to the request context.
    rc.quotes = variables.quoteService;

    // NOTE: Add Quotes service to the request context.
    // rc.security = variables.securityService;

    // NOTE: Check to see if we want to debug the app
    if ( rc.debugApplication ) {
      writeDump(var=application, expand=false, label='Application Scope');
    }

    // NOTE: Check to see if we want to debug the request
    if ( rc.debugRequest ) {
      writeDump(var=request, expand=false, label='Request Scope');
    }

    // NOTE: Check to see if we want to debug the session
    if ( rc.debugSession ) {
      lock timeout=20 scope="session" type="exclusive" {
        session.loggedin = false;
        session.UserID = '';
        session.FName = '';
        session.LName = '';
        session.MST = '';
        session.Password = '';
      };

      writeDump(var=session, expand=false, label='Session Scope');
    }
  }









  function formatPhoneNumber(phone_number) {
    if (Len(phone_number) neq 0 ) {
      if (Len(phone_number) eq 10) {
          formattedPhoneNumber = '(' & #MID(phone_number,1,3)# & ') ' & #MID(phone_number,4,3)# & ' - ' & #MID(phone_number,7,4)#;
        }
          else if (len(phone_number) eq 7) {
            formattedPhoneNumber = #MID(phone_number,1,3)# & ' - ' & #MID(phone_number,4,4)#;
        }
    else {
      formattedPhoneNumber = 'Phone ## not found';
    }

    return formattedPhoneNumber;
    }
  }


  function formatZip(zip_code){
    if (Len(zip_code) neq 0) {
      if (len(zip_code) EQ 9) {
        formattedZip = #MID(zip_code,1,5)# & '-' & #MID(zip_code,6,4)#;
      }
      else {
      formattedZip = zip_code;
      }
    }
    else {
    formattedZip = '0000';
    }
    return formattedZip;
  }
}
