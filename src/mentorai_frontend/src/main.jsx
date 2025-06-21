import { Actor, HttpAgent } from "@dfinity/agent";
import { idlFactory, canisterId } from "../../declarations/mentorai_backend";

// Initialize the HTTP Agent (you can skip local network config if already default)
const agent = new HttpAgent();

// This is optional, only needed in development (removes certificate check)
agent.fetchRootKey();

// Create the actor for calling your backend canister
const mentorAI = Actor.createActor(idlFactory, {
  agent,
  canisterId,
});

// DOM interaction
document.getElementById("askBtn").addEventListener("click", async () => {
  const input = document.getElementById("questionInput");
  const chatBox = document.getElementById("chatBox");
  const spinner = document.getElementById("loadingSpinner");

  const question = input.value.trim();
  if (!question) return;

  spinner.style.display = "inline-block";

  try {
    const response = await mentorAI.ask(question);

    chatBox.innerHTML += `
      <div class="bot-msg bg-primary text-white p-2 my-2 rounded">
        ${response}
      </div>`;
  } catch (err) {
    chatBox.innerHTML += `
      <div class="bot-msg bg-danger text-white p-2 my-2 rounded">
        ❌ Error: ${err.message}
      </div>`;
  } finally {
    spinner.style.display = "none";
    input.value = "";
  }
});
