#!/usr/bin/env node

const http = require('http');
const https = require('https');
const url = require('url');
const fs = require('fs');
const path = require('path');

const PORT = 3000;

// CORS headers
const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization, x-api-key, anthropic-version',
    'Access-Control-Max-Age': '86400'
};

const server = http.createServer((req, res) => {
    const parsedUrl = url.parse(req.url, true);

    console.log(`📥 ${req.method} ${req.url}`);
    console.log(`🎯 Pathname: ${parsedUrl.pathname}`);

    // Handle CORS preflight
    if (req.method === 'OPTIONS') {
        console.log('✅ CORS preflight handled');
        res.writeHead(200, corsHeaders);
        res.end();
        return;
    }

    // Proxy API calls
    if (parsedUrl.pathname === '/api/anthropic') {
        console.log('🔥 Anthropic API call detected!');
        if (req.method !== 'POST') {
            console.log('❌ Method not allowed:', req.method);
            res.writeHead(405, corsHeaders);
            res.end(JSON.stringify({error: 'Method not allowed'}));
            return;
        }

        let body = '';
        req.on('data', chunk => body += chunk);
        req.on('end', () => {
            try {
                const data = JSON.parse(body);
                const apiKey = req.headers['x-api-key'];

                if (!apiKey) {
                    res.writeHead(400, corsHeaders);
                    res.end(JSON.stringify({error: 'API key required'}));
                    return;
                }

                // Proxy to Anthropic API
                const options = {
                    hostname: 'api.anthropic.com',
                    port: 443,
                    path: '/v1/messages',
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'x-api-key': apiKey,
                        'anthropic-version': '2023-06-01',
                        'Content-Length': Buffer.byteLength(body)
                    }
                };

                console.log('📤 Sending request to Anthropic API');
                const proxyReq = https.request(options, (proxyRes) => {
                    console.log(`📨 Anthropic response status: ${proxyRes.statusCode}`);
                    let responseBody = '';
                    proxyRes.on('data', chunk => responseBody += chunk);
                    proxyRes.on('end', () => {
                        console.log(`📋 Response body length: ${responseBody.length}`);
                        if (proxyRes.statusCode >= 400) {
                            console.log('❌ Error response:', responseBody);
                        }
                        res.writeHead(proxyRes.statusCode, {
                            ...corsHeaders,
                            'Content-Type': 'application/json'
                        });
                        res.end(responseBody);
                    });
                });

                proxyReq.on('error', (error) => {
                    console.error('Proxy error:', error);
                    res.writeHead(500, corsHeaders);
                    res.end(JSON.stringify({error: 'Proxy request failed'}));
                });

                proxyReq.write(body);
                proxyReq.end();

            } catch (error) {
                res.writeHead(400, corsHeaders);
                res.end(JSON.stringify({error: 'Invalid JSON'}));
            }
        });
        return;
    }

    // For any other path, return 404
    res.writeHead(404, corsHeaders);
    res.end(JSON.stringify({error: 'Not found'}));
});

server.listen(PORT, () => {
    console.log(`🚀 API Proxy server running on http://localhost:${PORT}`);
    console.log(`📡 Ready to proxy Anthropic API calls`);
    console.log(`🔧 Use endpoint: http://localhost:${PORT}/api/anthropic`);
});