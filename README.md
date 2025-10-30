# shorter
web api shorter.me
# Example
```nim
import asyncdispatch, shorter, json, strformat, strutils

echo "🔗 Сокращатель ссылок"
echo "═".repeat(40)

stdout.write "Введите URL для сокращения: "
let url = stdin.readLine().strip()

if url.len > 0:
  try:
    echo "⏳ Сокращаем..."
    let result = waitFor short_link(url)
    let short_url = result["data"].getStr()
    
    echo ""
    echo "✅ Ссылка успешно сокращена!"
    echo "═".repeat(40)
    echo &"🔗 Исходная: {url}"
    echo &"🎯 Сокращенная: {short_url}"
    echo "═".repeat(40)
    
  except Exception as e:
    echo "❌ Ошибка: ", e.msg
else:
  echo "❌ Вы не ввели URL"
```
# Launch (your script)
```
nim c -d:ssl your_app.nim
```
