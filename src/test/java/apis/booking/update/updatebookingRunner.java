package apis.booking.update;

import com.intuit.karate.junit5.Karate;

class updatebookingRunner {
    @Karate.Test
    Karate testUpdate() {
        return Karate.run("updatebooking").relativeTo(getClass());
    }
}
