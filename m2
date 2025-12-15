<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>地毯工廠 3：中級任務</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <style>
        :root { --big-sq-color:#ff7675; --rect-color:#55efc4; --small-sq-color:#ffeaa7; --bg-color:#f1f2f6; --panel-bg:white; --btn-color:#6c5ce7; }
        body { font-family:'Segoe UI',sans-serif; background-color:var(--bg-color); margin:0; padding:15px; display:flex; flex-direction:column; align-items:center; touch-action:pan-y; user-select:none; -webkit-user-select:none; -webkit-tap-highlight-color:transparent; }
        h1 { font-size:1.6rem; margin:0 0 10px 0; color:#2d3436; }
        .top-info { width:100%; max-width:1000px; display:flex; flex-direction:column; gap:8px; margin-bottom:15px; }
        .progress-bar { display:flex; gap:5px; font-size:0.9em; justify-content:center; }
        .badge { padding:4px 12px; border-radius:15px; background:#dfe6e9; color:#b2bec3; font-weight:bold; }
        .badge.active { background:#0984e3; color:white; }
        .rule-banner { background-color:#fff3cd; color:#856404; padding:8px; text-align:center; border-radius:8px; border:1px solid #ffeeba; font-weight:bold; }
        .chat-container { width:100%; max-width:1000px; background:#fff; border-radius:12px; border:2px solid #a29bfe; margin-bottom:15px; overflow:hidden; }
        .chat-display { padding:12px; display:flex; gap:12px; background:#fdfdfd; }
        .chat-avatar { font-size:32px; animation:bounce 2s infinite; cursor:pointer; flex-shrink:0; }
        @keyframes bounce { 0%,100%{transform:translateY(0);} 50%{transform:translateY(-3px);} }
        .chat-bubble { background:#f1f2f6; padding:10px 15px; border-radius:0 15px 15px 15px; color:#2d3436; font-size:1em; line-height:1.4; }
        .controls { width:100%; max-width:1000px; display:flex; gap:10px; align-items:center; margin-bottom:15px; flex-wrap:wrap; }
        select { padding:12px; border-radius:8px; border:2px solid #ddd; font-size:16px; flex-grow:1; min-width:200px; background:white; }
        .btn-group { display:flex; gap:10px; flex-grow:1; }
        .controls button { border-radius:8px; border:none; font-weight:bold; cursor:pointer; padding:12px 0; flex-grow:1; }
        .btn-check { background:#00b894; color:white; font-size:18px; box-shadow:0 4px 0 #009476; }
        .btn-check:active { transform:translateY(4px); box-shadow:none; }
        .btn-reset { background:#ff7675; color:white; font-size:16px; max-width:100px; }
        .main-wrapper { display:flex; gap:15px; width:100%; max-width:1000px; align-items:flex-start; }
        .sidebar { width:200px; display:flex; flex-direction:column; gap:15px; flex-shrink:0; }
        .panel { background:white; padding:12px; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.05); }
        .inv-row { display:flex; align-items:center; justify-content:space-between; margin-bottom:10px; background:#f8f9fa; padding:5px; border-radius:10px; border:1px solid #eee; height:50px; }
        .inv-info { display:flex; align-items:center; gap:10px; padding-left:10px; font-size:1.1em; font-weight:bold; color:#2d3436; }
        .inv-preview { display:inline-block; border:1px solid rgba(0,0,0,0.1); vertical-align:middle; }
        .prev-x2 { width:30px; height:30px; background:var(--big-sq-color); }
        .prev-x { width:12px; height:30px; background:var(--rect-color); }
        .prev-1 { width:15px; height:15px; background:var(--small-sq-color); }
        .inv-btn { width:48px!important; height:48px!important; background:#0984e3; color:white; font-size:28px; border-radius:8px; cursor:pointer; border:none; display:flex; align-items:center; justify-content:center; flex-shrink:0; box-shadow:0 3px 0 #076ebc; margin:0; padding:0; }
        .inv-btn:active { transform:translateY(2px); box-shadow:none; background:#74b9ff; }
        .stat-row { display:flex; justify-content:space-between; font-size:16px; margin-bottom:5px; border-bottom:1px dashed #eee; padding-bottom:2px; }
        .stat-val { font-weight:bold; font-size:18px; color:#2d3436; }
        .workspace-container { flex-grow:1; background:white; border:4px solid #b2bec3; border-radius:12px; position:relative; overflow:hidden; min-height:500px; }
        .workspace { width:100%; height:100%; background-image:linear-gradient(rgba(0,0,0,0.03)1px,transparent 1px),linear-gradient(90deg,rgba(0,0,0,0.03)1px,transparent 1px); background-size:20px 20px; touch-action:none; position:absolute; top:0; left:0; }
        .history-section { width:100%; max-width:1000px; margin-top:20px; margin-bottom:50px; background:white; padding:20px; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.05); }
        .history-header { display:flex; justify-content:space-between; align-items:center; margin-bottom:10px; }
        .btn-download { background:var(--btn-color); color:white; padding:8px 16px; border:none; border-radius:8px; font-size:14px; font-weight:bold; cursor:pointer; box-shadow:0 2px 5px rgba(0,0,0,0.2); }
        .btn-download:active { transform:scale(0.95); }
        table { width:100%; border-collapse:collapse; margin-top:10px; }
        th { background:#f8f9fa; padding:10px; color:#636e72; font-weight:bold; border-bottom:2px solid #eee; }
        td { padding:10px; border-bottom:1px solid #eee; text-align:center; }
        .tile { position:absolute; cursor:grab; display:flex; align-items:center; justify-content:center; font-weight:bold; color:rgba(0,0,0,0.4); font-size:18px; box-shadow:2px 2px 5px rgba(0,0,0,0.2); border:1px solid rgba(0,0,0,0.1); z-index:10; touch-action:none; transform:translate3d(0,0,0); }
        .tile.active { z-index:100; box-shadow:4px 4px 10px rgba(0,0,0,0.3); transform:scale(1.05); }
        .tile-x2 { width:100px; height:100px; background:var(--big-sq-color); }
        .tile-x { width:40px; height:100px; background:var(--rect-color); }
        .tile-1 { width:40px; height:40px; background:var(--small-sq-color); }
        .rotated { width:100px!important; height:40px!important; }
        .message-overlay { position:absolute; top:50%; left:50%; transform:translate(-50%,-50%); padding:30px 50px; border-radius:15px; font-size:24px; font-weight:bold; display:none; z-index:200; background:rgba(0,184,148,0.95); color:white; text-align:center; white-space:pre-line; box-shadow:0 10px 30px rgba(0,0,0,0.3); }
        .error-overlay { background:rgba(214,48,49,0.95); }
        @media(max-width:768px){ .main-wrapper{flex-direction:column;} .sidebar{width:100%;flex-direction:row;justify-content:space-between;gap:10px;} .inv-row{flex-direction:column;padding:5px;flex-grow:1;height:auto;gap:5px;justify-content:center;} .inv-info{padding:0;} .inv-btn{width:40px!important;height:40px!important;font-size:24px;} .workspace-container{height:500px;} }
    </style>
</head>
<body>
    <h1>中級任務篇</h1>
    <div class="top-info">
        <div class="progress-bar"><span class="badge active">進度 <span id="progress-text">0/3</span></span></div>
        <div class="rule-banner">⚠️ 規則：紅色(x²)與黃色(1)不可直接相鄰！</div>
    </div>
    <div class="chat-container">
        <div class="chat-display">
            <div class="chat-avatar" onclick="giveHint()">🤖</div>
            <div class="chat-bubble" id="aiBubble">進入中級挑戰！這裡的數字變大了，仔細觀察喔！</div>
        </div>
    </div>
    <div class="controls">
        <select id="levelSelect">
            <option value="custom">-- 選擇任務 --</option>
            <option value="t1">1. x² + 5x + 6</option>
            <option value="t2" disabled>2. x² + 6x + 8 (鎖定)</option>
            <option value="t3" disabled>3. x² + 7x + 12 (鎖定)</option>
        </select>
        <div class="btn-group">
            <button class="btn-reset" onclick="clearWorkspace()">🗑️ 重來</button>
            <button class="btn-check" onclick="verifyCarpet()">✅ 驗收</button>
        </div>
    </div>
    <div class="main-wrapper" id="capture-area">
        <div class="sidebar">
            <div class="panel">
                <h3>📦 材料</h3>
                <div class="inv-row"><div class="inv-info"><span class="inv-preview prev-x2"></span><span>x²</span></div><button class="inv-btn" ontouchstart="spawn('x2');event.preventDefault()" onclick="spawn('x2')">+</button></div>
                <div class="inv-row"><div class="inv-info"><span class="inv-preview prev-x"></span><span>x</span></div><button class="inv-btn" ontouchstart="spawn('x');event.preventDefault()" onclick="spawn('x')">+</button></div>
                <div class="inv-row"><div class="inv-info"><span class="inv-preview prev-1"></span><span>1</span></div><button class="inv-btn" ontouchstart="spawn('1');event.preventDefault()" onclick="spawn('1')">+</button></div>
            </div>
            <div class="panel">
                <h3>📊 統計</h3>
                <div class="stat-row"><span>x²</span><span class="stat-val" id="cnt-x2">0</span></div>
                <div class="stat-row"><span>x</span><span class="stat-val" id="cnt-x">0</span></div>
                <div class="stat-row"><span>1</span><span class="stat-val" id="cnt-1">0</span></div>
            </div>
        </div>
        <div class="workspace-container">
            <div class="workspace" id="workspace"></div>
            <div id="msgOverlay" class="message-overlay"></div>
        </div>
    </div>
    <div class="history-section">
        <div class="history-header">
            <h3 style="margin:0;">📝 學習歷程</h3>
            <button class="btn-download" onclick="takeScreenshot()">📸 下載紀錄</button>
        </div>
        <table id="histTable"><thead><tr><th>任務</th><th>x²</th><th>x</th><th>1</th><th>狀態</th></tr></thead><tbody></tbody></table>
    </div>
    <script>
        const tasks = {
            't1': { label: "x² + 5x + 6", x2:1, x:5, one:6 },
            't2': { label: "x² + 6x + 8", x2:1, x:6, one:8 },
            't3': { label: "x² + 7x + 12", x2:1, x:7, one:12 }
        };
        let completed = new Set();
        const ws = document.getElementById('workspace');
        document.getElementById('levelSelect').addEventListener('change', function(){
            clearWorkspace();
            const t = tasks[this.value];
            if(t) document.getElementById('aiBubble').innerText = `目標：${t.label}。`;
        });
        function spawn(type) {
            const el = document.createElement('div');
            el.className = `tile tile-${type}`;
            el.dataset.type = type;
            el.style.left = (50+Math.random()*100)+'px'; el.style.top = (50+Math.random()*100)+'px';
            el.addEventListener('touchstart', handleStart, {passive:false});
            el.addEventListener('mousedown', handleStart);
            ws.appendChild(el);
            updateStats();
        }
        let sel=null, off={x:0,y:0}, tStart=0;
        function handleStart(e) {
            if(e.type==='touchstart') e.preventDefault();
            sel = e.target;
            const ev = e.type==='touchstart'?e.touches[0]:e;
            const rect = sel.getBoundingClientRect();
            off.x = ev.clientX-rect.left; off.y = ev.clientY-rect.top;
            tStart = Date.now();
            sel.isDragging = false;
            sel.classList.add('active');
            if(e.type==='touchstart') { document.addEventListener('touchmove',move,{passive:false}); document.addEventListener('touchend',end); }
            else { document.addEventListener('mousemove',move); document.addEventListener('mouseup',end); }
        }
        function move(e) {
            if(!sel) return;
            if(e.type==='touchmove') e.preventDefault();
            const ev = e.type==='touchmove'?e.touches[0]:e;
            if(Math.abs(ev.clientX - sel.getBoundingClientRect().left - off.x)>5) sel.isDragging=true;
            const wr = ws.getBoundingClientRect();
            let nx = ev.clientX - wr.left - off.x;
            let ny = ev.clientY - wr.top - off.y;
            nx = Math.round(nx/20)*20; ny = Math.round(ny/20)*20;
            if(nx<0) nx=0; if(ny<0) ny=0;
            if(nx>wr.width-sel.offsetWidth) nx=wr.width-sel.offsetWidth;
            if(ny>wr.height-sel.offsetHeight) ny=wr.height-sel.offsetHeight;
            sel.style.left = nx+'px'; sel.style.top = ny+'px';
        }
        function end(e) {
            if(!sel) return;
            sel.classList.remove('active');
            if((Date.now()-tStart<300 || !sel.isDragging) && sel.dataset.type==='x') sel.classList.toggle('rotated');
            document.removeEventListener('touchmove',move); document.removeEventListener('touchend',end);
            document.removeEventListener('mousemove',move); document.removeEventListener('mouseup',end);
            sel=null; updateStats();
        }
        function updateStats() {
            let c={x2:0,x:0,one:0};
            ws.querySelectorAll('.tile').forEach(t=>{
                if(t.dataset.type==='x2') c.x2++;
                else if(t.dataset.type==='x') c.x++;
                else c.one++;
            });
            document.getElementById('cnt-x2').innerText=c.x2;
            document.getElementById('cnt-x').innerText=c.x;
            document.getElementById('cnt-1').innerText=c.one;
            return c;
        }
        function verifyCarpet() {
            const key = document.getElementById('levelSelect').value;
            const task = tasks[key];
            if(!task) return;
            const c = updateStats();
            if(c.x2!==task.x2 || c.x!==task.x || c.one!==task.one) {
                showMsg("數量不對喔！", false);
                addHist(task.label, c, false);
                return;
            }
            let area=0, minX=Infinity, maxX=-Infinity, minY=Infinity, maxY=-Infinity;
            ws.querySelectorAll('.tile').forEach(t => {
                const type = t.dataset.type;
                const isRotated = t.classList.contains('rotated');
                let w, h;
                if (type === 'x2') { w = 100; h = 100; }
                else if (type === 'x') { w = isRotated ? 100 : 40; h = isRotated ? 40 : 100; }
                else { w = 40; h = 40; }
                const x = parseInt(t.style.left); 
                const y = parseInt(t.style.top);
                area += w * h;
                minX = Math.min(minX, x); maxX = Math.max(maxX, x + w);
                minY = Math.min(minY, y); maxY = Math.max(maxY, y + h);
            });
            const bound = (maxX - minX) * (maxY - minY);
            if(Math.abs(bound - area) < 100 && area > 0) {
                showMsg("太棒了！\n拼出完美長方形！", true);
                unlockNext(key);
                addHist(task.label, c, true);
            } else {
                showMsg("數量對了，但形狀不對！\n要是實心的長方形喔。", false);
                addHist(task.label, c, false);
            }
        }
        function unlockNext(currentKey) {
            completed.add(currentKey);
            document.getElementById('progress-text').innerText = `${completed.size}/3`;
            if(currentKey === 't1') {
                const opt = document.querySelector('option[value="t2"]');
                opt.disabled = false; opt.innerText = "2. x² + 6x + 8";
            } else if(currentKey === 't2') {
                const opt = document.querySelector('option[value="t3"]');
                opt.disabled = false; opt.innerText = "3. x² + 7x + 12";
                document.getElementById('aiBubble').innerText = "太棒了！最後一關解鎖！";
            }
        }
        function showMsg(txt, success) {
            const el = document.getElementById('msgOverlay');
            el.innerText = txt;
            el.className = 'message-overlay ' + (success?'':'error-overlay');
            el.style.display = 'block';
            setTimeout(()=>el.style.display='none', 2000);
        }
        function addHist(name, c, ok) {
            const row = document.createElement('tr');
            row.innerHTML = `<td>${name}</td><td>${c.x2}</td><td>${c.x}</td><td>${c.one}</td><td style="color:${ok?'#00b894':'#d63031'}">${ok?'✅':'❌'}</td>`;
            document.querySelector('#histTable tbody').prepend(row);
        }
        function clearWorkspace() { ws.innerHTML=''; updateStats(); }
        function giveHint() { document.getElementById('aiBubble').innerText = "提示：長方形面積 = 長 × 寬，試著旋轉綠色長條！"; }
        function takeScreenshot() { 
            html2canvas(document.getElementById('capture-area')).then(c=> {
                const a = document.createElement('a'); a.download='record.png'; a.href=c.toDataURL(); a.click();
            });
        }
    </script>
</body>
</html>
