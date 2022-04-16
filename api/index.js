const express = require('express')
const minter = require('./minter')
const app = express()
const port = 3000

app.get('/', (req, res) => {
    res.send('Success 2022')
})

app.get('/test', async (req, res) => {
    await minter()
    res.send('Success')
})


app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})