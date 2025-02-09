Fork of https://github.com/NJU-PCALab/STAR

## ⚙️ Dependencies and Installation
**VRAM requirement**: Upscaling the provided toy example by 4x, with 72 frames, a width of 426, and a height of 240, requires around 39GB of VRAM using the default settings. If you encounter an OOM problem, you can set a smaller frame_length in inference_sr.sh. We recommend using a GPU with at least 24GB of VRAM to run this project. 

```
## git clone this repository
git clone stable-diffusion-upscale
cd stable-diffusion-upscale

## create an environment
conda create -n stable-diffusion-upscale python=3.10
conda activate stable-diffusion-upscale
pip install -r requirements.txt
sudo apt-get update && sudo apt-get install ffmpeg libsm6 libxext6  -y
```

## 🚀 Inference

### Model Weight
| Base Model | Type | URL |
|------------|--------|-----------------------------------------------------------------------------------------------|
| I2VGen-XL | Light Degradation | [:link:](https://huggingface.co/SherryX/STAR/resolve/main/I2VGen-XL-based/light_deg.pt?download=true) |
| I2VGen-XL | Heavy Degradation | [:link:](https://huggingface.co/SherryX/STAR/resolve/main/I2VGen-XL-based/heavy_deg.pt?download=true) |
| CogVideoX-5B | Heavy Degradation | [:link:](https://huggingface.co/SherryX/STAR/tree/main/CogVideoX-5B-based) |

### 1. I2VGen-XL-based 
#### Step 1: Download the pretrained model STAR from [HuggingFace](https://huggingface.co/SherryX/STAR).
We provide two versions for I2VGen-XL-based model, `heavy_deg.pt` for heavy degraded videos and `light_deg.pt` for light degraded videos (e.g., the low-resolution video downloaded from video websites).

You can put the weight into `pretrained_weight/`.

#### Step 2: Prepare testing data
You can put the testing videos in the `input/video/`.

As for the prompt, there are three options: 1. No prompt. 2. Automatically generate a prompt (e.g., [using Pllava](https://github.com/hpcaitech/Open-Sora/tree/main/tools/caption#pllava-captioning)). 3. Manually write the prompt. You can put the txt file in the `input/text/`.


#### Step 3: Change the path
You need to change the paths in `video_super_resolution/scripts/inference_sr.sh` to your local corresponding paths, including `video_folder_path`, `txt_file_path`, `model_path`, and `save_dir`.


#### Step 4: Running inference command
```
bash video_super_resolution/scripts/inference_sr.sh
```

### 2. CogVideoX-based
Refer to these [instructions](https://github.com/NJU-PCALab/STAR/tree/main/cogvideox-based#cogvideox-based-model-inference) for inference with the CogVideX-5B-based model.

Please note that the CogVideX-5B-based model supports only 720x480 input.

## ❤️ Acknowledgments
This project is based on [I2VGen-XL](https://github.com/ali-vilab/VGen), [VEnhancer](https://github.com/Vchitect/VEnhancer), [CogVideoX](https://github.com/THUDM/CogVideo) and [OpenVid-1M](https://github.com/NJU-PCALab/OpenVid-1M). Thanks for their awesome works.


## 🎓Citations
If our project helps your research or work, please consider citing our paper:

```
@misc{xie2025starspatialtemporalaugmentationtexttovideo,
      title={STAR: Spatial-Temporal Augmentation with Text-to-Video Models for Real-World Video Super-Resolution}, 
      author={Rui Xie and Yinhong Liu and Penghao Zhou and Chen Zhao and Jun Zhou and Kai Zhang and Zhenyu Zhang and Jian Yang and Zhenheng Yang and Ying Tai},
      year={2025},
      eprint={2501.02976},
      archivePrefix={arXiv},
      primaryClass={cs.CV},
      url={https://arxiv.org/abs/2501.02976}, 
}
```


## 📧 Contact
If you have any inquiries, please don't hesitate to reach out via email at `ruixie0097@gmail.com`


## 📄 License
I2VGen-XL-based models are distributed under the terms of the [MIT License](https://choosealicense.com/licenses/mit/).

CogVideoX-5B-based model is distributed under the terms of the [CogVideoX License](https://huggingface.co/THUDM/CogVideoX-5b/blob/main/LICENSE).
