let totalNotes = 0;
let showingCount = 0;
function addnote(event){
    event.preventDefault();
  const note = {
    NoteTitle: event.target.NoteTitle.value,
    NoteDesc: event.target.NoteDesc.value,

  };

  axios
  .post("https://crudcrud.com/api/ef939f5b5b0345f7991b7abb8eafbcf4/addnote",note)
 
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
    const searchTerm = document.getElementById("searchNote").value.toLowerCase();
    const noteTitle = note.NoteTitle.toLowerCase();
    const noteDesc = note.NoteDesc.toLowerCase();
    if (searchTerm === '' || noteTitle.includes(searchTerm) || noteDesc.includes(searchTerm)){

    
    const userItem = document.createElement("li");
    
    userItem.appendChild(
      document.createTextNode(
       ` ${note. NoteTitle} - ${note.NoteDesc}`
      )
    )
    const deleteBtn = document.createElement("button");
    deleteBtn.appendChild(document.createTextNode("Delete"));
    userItem.appendChild(deleteBtn);

  const userList = document.querySelector("ul");
  userList.appendChild(userItem);

  deleteBtn.addEventListener("click", function (event) {
    userList.removeChild(event.target.parentElement);
    updateShowingCount(-1); 
  })
}
}
function updateShowingCount(change) {
    totalNotes += change;
    showingCount += change;
    document.getElementById("totalNotes").textContent = `Total notes: ${totalNotes}`;
    document.getElementById("showingNotes").textContent = `Showing: ${showingCount}`;
}