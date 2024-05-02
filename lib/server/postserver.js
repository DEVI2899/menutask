// server.js
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const PORT = 3000;

app.use(bodyParser.json());

let menus = [];

// GET /todos
app.get('/menus', (req, res) => {
    res.json(todos);
});

// POST /todos
app.post('/menus', (req, res) => {
    const todo = req.body;
    menus.push(todo);
    res.status(201).json(todo);
});

// PUT /todos/:id
app.put('/menus/:id', (req, res) => {
    const id = parseInt(req.params.id);
    const updatedTodo = req.body;
    todos = todos.map(todo => (todo.id === id ? { ...todo, ...updatedTodo } : todo));
    res.json({ message: 'Todo updated' });
});

// DELETE /todos/:id
app.delete('/todos/:id', (req, res) => {
    const id = parseInt(req.params.id);
    todos = todos.filter(todo => todo.id !== id);
    res.json({ message: 'Todo deleted' });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});