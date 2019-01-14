#! /usr/bin/env bash

BASE_URL="https://raw.githubusercontent.com/rime-aca/dictionaries/master/luna_pinyin.dict"

curl -O "$BASE_URL/luna_pinyin.cn_en.dict.yaml"
curl -O "$BASE_URL/luna_pinyin.custom.yaml"
curl -O "$BASE_URL/luna_pinyin.extended.dict.yaml"
curl -O "$BASE_URL/luna_pinyin.hanyu.dict.yaml"
curl -O "$BASE_URL/luna_pinyin.poetry.dict.yaml"

mv luna_pinyin.custom.yaml luna_pinyin_simp.custom.yaml
