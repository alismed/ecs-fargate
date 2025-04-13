const request = require('supertest');
const express = require('express');
const app = express();

app.get('/', (req, res) => res.send('hi!'));

describe('Express App Tests', () => {
  test('GET / should return hi!', async () => {
    const response = await request(app).get('/');
    expect(response.statusCode).toBe(200);
    expect(response.text).toBe('hi!');
  });

  test('GET /nonexistent should return 404', async () => {
    const response = await request(app).get('/nonexistent');
    expect(response.statusCode).toBe(404);
  });
});
