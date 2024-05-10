<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jspro</title>
    <style>
   h1 {text-align: center;}
   .search-bar {
            text-align: center;
            margin-bottom: 20px; 
        }
     
    </style>
   
</head>
<body>
    <h1>Note Book</h1>
    <div class="search-bar">
        <label for="searchNote">Search Note:</label>
        <input type="text" id="searchNote">
    </div>
    <p id="totalNotes"  style="text-align: center;">Total notes: 0</p>
    <p id="showingNotes"  style="text-align: center;">Showing: 0</p>
    <form onsubmit="addnote(event)">
  <label for="NoteTitle">NoteTitle:</label>
  <input type="text" id="NoteTitle" name="NoteTitle">
  <br>
  <label for="NoteDesc">NoteDesc:</label><br>
  <textarea id="NoteDesc" name="NoteDesc" rows="10" cols="20"></textarea><br>
  <button type="submit">Add To Book</button>
    </form>
    <ul style="list-style: none;" id="addnotee" ></ul>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.6.8/axios.min.js"></script>
    <script src="index.js"></script>
</body>
</html>
