#!/bin/bash
chmod +x ./scripts/python/message.py
git log -1 HEAD --pretty=format:'proto 已更新，提交信息：%n%n%s%n%nAuthor: %cN%n%nEmail: %ce%n%n' | ./scripts/python/message.py