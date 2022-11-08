package apis.auth;

import com.intuit.karate.junit5.Karate;

class createtokenRunner {

    @Karate.Test
    Karate testCreateToken() {
        return Karate.run("createtoken").relativeTo(getClass());
    }
}
