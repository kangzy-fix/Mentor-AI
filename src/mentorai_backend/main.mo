import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Float "mo:base/Float";

actor {
  type Student = {
    id: Text;
    name: Text;
    totalCredits: Nat;
    completedCredits: Nat;
    gpa: Float;
  };

  stable var studentData: [Student] = [
    { id = "240367BSIT"; name = "Rayshons"; totalCredits = 120; completedCredits = 90; gpa = 3.2 }
  ];

  public query func ask(question: Text) : async Text {
    let q = Text.toLowercase(question);
    let s = studentData[0];

    if (q == "hi" or q == "hello" or q == "hey") {
      return "Hello there! I'm MentorAI. How can I assist you today?";
    } else if (q == "bye" or q == "goodbye") {
      return "Goodbye! Keep pushing forward. AIU believes in you!";
    } else if (Text.contains(q, #text "time management")) {
      return "Tip: Use a weekly planner. Break big tasks into smaller chunks. Prioritize what matters most.";
    } else if (Text.contains(q, #text "career")) {
      return "Explore your passions early. ICT, business, theology, and healthcare are promising fields in Kenya!";
    } else if (Text.contains(q, #text "study tips")) {
      return "Study consistently. Review past papers. Teach someone else to reinforce your learning.";
    } else if (Text.contains(q, #text "mental health") or Text.contains(q, #text "stress")) {
      return "You're not alone. Talk to someone. Breathe. Journal your feelings. Even Jesus rested.";
    } else if (Text.contains(q, #text "scholarship")) {
      return "Find AIU scholarship info here:\n🔗 https://www.aiu.ac.ke/financial-aid-scholarships/\nAlso check HELB and departmental offers.";
    } else if (Text.contains(q, #text "clubs")) {
      return "Join a club that excites you — drama, worship team, coding, journalism. Make the most of AIU!";
    } else if (Text.contains(q, #text "faith")) {
      return "Philippians 4:13 — I can do all things through Christ who strengthens me. Keep believing! 🙏";
    } else if (Text.contains(q, #text "moodle") or Text.contains(q, #text "odel") or Text.contains(q, #text "e-learning")) {
      return "Access your online classes here:\nhttps://elearning.aiu.ac.ke — use your student credentials.";
    } else if (Text.contains(q, #text "credit completion")) {
      let percent = (Float.fromInt(s.completedCredits) / Float.fromInt(s.totalCredits)) * 100.0;
      return s.name # ", you’ve completed " # Nat.toText(s.completedCredits) # "/" # Nat.toText(s.totalCredits) # " credits (" # Float.toText(percent) # "%). Keep going strong!";
    } else if (Text.contains(q, #text "gpa projection")) {
      let proj = if (s.completedCredits >= 100) { 3.4 } else { 3.25 };
      return s.name # ", your current GPA is " # Float.toText(s.gpa) # ". Projected GPA: " # Float.toText(proj) # ". Stay focused!";
    } else if (Text.contains(q, #text "performance alert")) {
      if (s.gpa < 2.5) {
        return s.name # ", ALERT: Your GPA is below 2.5. Please consult academic counseling soon.";
      } else {
        return s.name # ", your academic performance is solid. Keep up the great work!";
      }
    } else if (Text.contains(q, #text "exam tips") or Text.contains(q, #text "pass exams")) {
      return "📝 Exam Tip: Start revision early, use flashcards, form a study group, and sleep well before the paper.";
    } else if (Text.contains(q, #text "assignment") or Text.contains(q, #text "late submission")) {
      return "📚 Always check deadlines on Moodle. If you're late, talk to your lecturer early — honesty helps.";
    } else if (Text.contains(q, #text "aiu location") or Text.contains(q, #text "where is aiu")) {
      return "AIU is located on Karen Dagoretti Road, Nairobi. 🌍 It's a serene, green campus perfect for learning.";
    } else if (Text.contains(q, #text "canteen") or Text.contains(q, #text "food")) {
      return "🍛 Visit the AIU canteen for snacks and meals. You can also try nearby options like Java or Galleria.";
    } else if (Text.contains(q, #text "wifi") or Text.contains(q, #text "internet")) {
      return "📶 AIU has campus WiFi. Ask IT support if you're facing connection issues.";
    } else if (Text.contains(q, #text "chapel") or Text.contains(q, #text "church")) {
      return "🙏 Chapel is every Tuesday and Thursday. Worship, fellowship, and grow spiritually.";
    } else if (Text.contains(q, #text "library") or Text.contains(q, #text "books")) {
      return "📖 The AIU library offers thousands of physical and digital books. Visit: https://library.aiu.ac.ke";
    } else if (Text.contains(q, #text "hostel") or Text.contains(q, #text "accommodation")) {
      return "🏠 AIU hostels are safe and clean. Contact the housing office for room allocations and policies.";
    } else if (Text.contains(q, #text "health") or Text.contains(q, #text "clinic") or Text.contains(q, #text "nurse")) {
      return "🩺 The campus clinic is available for basic health issues. Always report sickness early.";
    } else if (Text.contains(q, #text "volunteer") or Text.contains(q, #text "community service")) {
      return "🌱 Join AIU community outreach or sign up for volunteering through the student affairs office.";
    } else if (Text.contains(q, #text "ict help") or Text.contains(q, #text "computer issues")) {
      return "💻 Reach out to the ICT helpdesk near the library for any tech-related issues.";
    } else if (Text.contains(q, #text "fees") or Text.contains(q, #text "payment") or Text.contains(q, #text "finance")) {
      return "💰 Contact the finance office for fee structure, balances, or payments. Avoid late fees!";
    } else if (Text.contains(q, #text "results") or Text.contains(q, #text "grades")) {
      return "📊 Log into your student portal to view your results: https://student.aiu.ac.ke";
    } else if (Text.contains(q, #text "aiu portal") or Text.contains(q, #text "student login")) {
      return "🔗 Access your student portal here: https://student.aiu.ac.ke — use your registration number to login.";
    } else if (Text.contains(q, #text "exam timetable") or Text.contains(q, #text "exam schedule")) {
      return "🕒 Exam timetables are posted on the notice board and portal. Check regularly to stay updated.";
    } else if (Text.contains(q, #text "graduation") or Text.contains(q, #text "graduate")) {
      return "🎓 Graduation details are posted by the registrar's office. Make sure you've cleared all requirements.";
    } else if (Text.contains(q, #text "transfer credits") or Text.contains(q, #text "credit transfer")) {
      return "🔄 Credit transfers are subject to review. Submit official transcripts to the admissions office.";
    } else if (Text.contains(q, #text "clubs list") or Text.contains(q, #text "student life")) {
      return "🎉 AIU Clubs: Drama, Debate, AI Club, Coding Club, Worship Team, Red Cross, and more. Explore and join!";
    } else if (Text.contains(q, #text "lecturer contact") or Text.contains(q, #text "teacher email")) {
      return "📩 You can find lecturer emails on Moodle or the departmental board.";
    } else {
      return "Hmm… I'm still learning! 🤖 Try asking about GPA, scholarships, exam tips, stress, food, or library.";
    }
  }
}
