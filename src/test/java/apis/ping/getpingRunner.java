package apis.ping;

import com.intuit.karate.junit5.Karate;

class getpingRunner {
    @Karate.Test
    Karate testGetPing() {
        return Karate.run("getping").relativeTo(getClass());
    }
}
