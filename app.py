import os
from flask import Flask, jsonify, request
from flask_cors import CORS
from supabase import create_client, Client

app = Flask(__name__)
CORS(app)

supabase_url = os.environ.get("SUPABASE_URL")
supabase_key = os.environ.get("SUPABASE_ANON_KEY")
supabase: Client = create_client(supabase_url, supabase_key)

@app.route('/api/videos', methods=['GET'])
def get_videos():
    try:
        response = supabase.table('videos').select('*').order('id', desc=True).execute()
        return jsonify(response.data)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/videos', methods=['POST'])
def add_video():
    try:
        data = request.json
        response = supabase.table('videos').insert({
            'title': data['title'],
            'thumbnail': data['thumbnail'],
            'url': data['url'],
            'views': 0
        }).execute()
        return jsonify({'status': 'success', 'data': response.data}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy'}), 200

if __name__ == '__main__':
    app.run(debug=True, port=5000)
