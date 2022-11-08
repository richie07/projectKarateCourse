package apis.booking.delete;

import com.intuit.karate.junit5.Karate;

class deletebookingRunner {
    @Karate.Test
    Karate testDeleteBooking() {
        return Karate.run("deletebooking").relativeTo(getClass());
    }
}
