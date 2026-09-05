# Docker lab

```
app/           a tiny Flask service
Dockerfile     deliberately bad — fix it
ANSWERS.md     do not open until you have written Dockerfile.fixed
```

## The task

```bash
cd labs/docker

# 1. baseline
time docker build -t app:bad -f Dockerfile .
docker images app:bad

# 2. prove the cache problem: change one line of code, rebuild
echo "# a comment" >> app/main.py
time docker build -t app:bad -f Dockerfile .

# 3. write Dockerfile.fixed, then compare
time docker build -t app:good -f Dockerfile.fixed .
docker images
```

Compare three numbers: **first build**, **rebuild after a code change**, and **image size**.
