from flask import Flask, request, jsonify
import PyPDF2

app = Flask(__name__)

@app.route("/")
def home():
    return "ChatWithDoc is running 🚀"

@app.route("/read-pdf", methods=["POST"])
def read_pdf():
    if 'file' not in request.files:
        return jsonify({"error": "No file uploaded"}), 400

    pdf_file = request.files['file']
    reader = PyPDF2.PdfReader(pdf_file)
    text = ""

    for page in reader.pages:
        text += page.extract_text()

    return jsonify({
        "pages": len(reader.pages
