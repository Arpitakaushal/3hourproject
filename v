let totalNotes = 0;
let showingCount = 0;
const searchInput = document.getElementById("searchNote");
function addnote(event){
   event.preventDefault(); 
  const note = {
    NoteTitle: event.target.NoteTitle.value,
    NoteDesc: event.target.NoteDesc.value,

  };

  axios
  .post("https://crudcrud.com/api/dd811a23225c406fa3ccad1d23ba1677/addnote",note)
 
  .then((response)=>{
    displayUserOnScreen(response.data)
    updateShowingCount(1);
  })
  .catch((err)=>{
    console.log(err)
  })
  document.getElementById("NoteTitle").value = "";
  document.getElementById("NoteDesc").value = "";

}
function displayUserOnScreen(note) {
    
    const userItem = document.createElement("li");
    
    const titleH2 = document.createElement("h2");
    titleH2.textContent = note.NoteTitle;
    userItem.appendChild(titleH2);
    const descParagraph = document.createElement("p");
  descParagraph.textContent = note.NoteDesc;
  userItem.appendChild(descParagraph);

    const deleteBtn = document.createElement("button");
    deleteBtn.appendChild(document.createTextNode("Delete"));
    userItem.appendChild(deleteBtn);


  const userList = document.querySelector("ul");
  userList.appendChild(userItem);

  deleteBtn.addEventListener("click", function (event) {
    const userToDeleteId = note._id;
    userList.removeChild(event.target.parentElement);
    
    updateShowingCount(-1); 
    axios
    .delete(`https://crudcrud.com/api/dd811a23225c406fa3ccad1d23ba1677/addnote/${userToDeleteId}`)
    .then((result)=>{
     console.log(result)
     userItem.remove();
    })



  })

}
function updateShowingCount(change) {
    totalNotes += change;
    showingCount += change
    document.getElementById("totalNotes").textContent = `Total notes: ${totalNotes}`;
    document.getElementById("showingNotes").textContent = `Showing: ${showingCount}`;
}
searchInput.addEventListener("keyup", filterNotes);
function filterNotes() {
    const searchTerm = searchInput.value.toLowerCase(); 
    const notesList = document.getElementById("addnotee");
    const notes = notesList.querySelectorAll("li"); 
    showingCount = 0;

    for (let i = 0; i < notes.length; i++) {
      const note = notes[i];
      const noteTitle = note.querySelector("h2").textContent.toLowerCase();
      if (noteTitle.includes(searchTerm) ) {
        note.style.display = "block"; 
        showingCount++;
      } else {
        note.style.display = "none"; 
      }
    }
    document.getElementById("showingNotes").textContent = `Showing: ${showingCount}`;
  }
  
