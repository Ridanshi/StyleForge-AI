---
title: StyleForge AI
emoji: 🎨
colorFrom: purple
colorTo: blue
sdk: docker
pinned: false
---

# StyleForge AI

> Transform any photo into a painting using deep learning.

StyleForge AI is a Neural Style Transfer web application built with PyTorch and Flask. Upload a content image and a style reference image — the model blends them using **Adaptive Instance Normalization (AdaIN)**, producing a stylized output in seconds.

---

## How It Works

1. **VGG19 Encoder** — both content and style images pass through a frozen VGG19 network, extracting deep feature maps at the `relu4_1` layer
2. **AdaIN Layer** — transfers the *mean* and *standard deviation* of the style features onto the content features, blending texture and color statistics
3. **Decoder** — a learned mirrored network reconstructs the final stylized image from the adapted features
4. **Style Strength** — an alpha slider interpolates between the original content features and the AdaIN output, giving full control over how strongly the style is applied

---

## Tech Stack

- **Python** — core language
- **PyTorch** — model architecture and inference
- **VGG19** — pretrained encoder for feature extraction
- **Flask** — web server and REST API
- **HTML / CSS / JS** — custom dark-themed frontend UI

---

## Project Structure

```
StyleForge-AI/
├── NST_Code/
│   ├── app.py                    # Flask web server
│   ├── train.py                  # Training script
│   ├── vgg_normalised.pth        # Pretrained VGG19 weights
│   ├── utils/
│   │   ├── models.py             # VGGEncoder + Decoder architecture
│   │   └── utils.py              # AdaIN function + dataset loader
│   ├── templates/
│   │   └── index.html            # Frontend UI
│   ├── static/uploads/           # Runtime image storage
│   ├── examples/                 # Sample content + style + output images
│   ├── content_data/             # Training content images
│   ├── style_data/               # Training style images
│   └── experiment/final_exp/
│       └── decoder_final.pth     # Trained decoder weights
├── nst_adain_kaggle.ipynb        # Kaggle/Jupyter training notebook
├── Demo_IO_Images/               # Demo input/output samples
└── requirements.txt
```

---

## Installation & Setup

### 1. Clone the repo

```bash
git clone https://github.com/Ridanshi/StyleForge-AI.git
cd StyleForge-AI
```

### 2. Create virtual environment

```bash
python -m venv .venv
# Windows
.venv\Scripts\activate
# Mac/Linux
source .venv/bin/activate
```

### 3. Install dependencies

```bash
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
pip install flask flask-wtf flask-bootstrap pillow
```

### 4. Run the app

```bash
cd NST_Code
python app.py
```

Open `http://localhost:5000` in your browser.

---

## Training

The trained decoder weights are already included (`experiment/final_exp/decoder_final.pth`). To retrain from scratch, use the Kaggle notebook:

**`nst_adain_kaggle.ipynb`** — self-contained notebook designed for Kaggle T4 GPU (free, 30 hrs/week).

Or run the training script locally:

```bash
cd NST_Code
python train.py --content_dir content_data --style_dir style_data --vgg vgg_normalised.pth
```

---

## License

MIT
