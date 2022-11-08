package apis.petstore.create;

import com.intuit.karate.junit5.Karate;

class postpetstoreRunner {

    @Karate.Test
    Karate testPostPetStore() {
        return Karate.run("postpetstore").relativeTo(getClass());
    }
}
