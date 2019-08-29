class MeetingRoomController {
  // ID and names of the meeting rooms.
  var meetingRoomList = [];
  MeetingRoomController() {
    var meetingRoom1 = new Map();
    var meetingRoom2 = new Map();
    meetingRoom1["id"] = 0;
    meetingRoom1["name"] = "Bonzai";
    meetingRoom2["id"] = 1;
    meetingRoom2["name"] = "Palmiye";
    meetingRoomList = new List<Map>();
    meetingRoomList.add(meetingRoom1);
    meetingRoomList.add(meetingRoom2);
  }
}