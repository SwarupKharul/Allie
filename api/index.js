const express = require('express')
const minter = require('./minter')
const getTotal = require('./totsupply')
const app = express()
const port = 3000

app.get('/', (req, res) => {
    res.send('Success 2022')
})

app.get('/mint', async (req, res) => {
    await minter()
    res.send('Success')
})

app.get('/getTotal', async (req, res) => {
    const resp = await getTotal()
    res.send(resp)
})


app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})