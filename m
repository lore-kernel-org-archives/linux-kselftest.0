Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39B03D411B
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 07:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787123156; cv=none; b=gzROeDu+no+I3rYtNzpXr4mNnd26qISLywOyBVtucQ8QAXHeIX3adRaHjVt0VpJNkddpc3tm9ggMyLxcl/HTqO2M5SnFD0FkY31QKsI8NzLRbwWoom73p9heGQVBHhdEBPK8luBtBosy8LVi4LEQjHKoLA/95mNhKPMSneEWh/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787123156; c=relaxed/simple;
	bh=YYBG7r4hTYfwDkA04iF02M3b5ik0rkl+GUdJDpc7JyM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fsn1FlDx3ZKY+4AXXbsAGQ4VAdA9wd/sc/M9JU4zlsW/8H18C9paWKD2a83Z+R/cp0J1m+XWLviMxcZpR/ncLdX7E2rGaHE88qsRoiwOCawwbT4lcRFtnGBnAXVvPHIysM5yNbWC4U2T4UVid7XxkRicMH9hGwanaTluXc3zOOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jasonmiu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jyhrmk+p; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jasonmiu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jyhrmk+p"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1597374a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 00:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787123154; x=1787727954; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E95q1x2DT6McfvZlrwH4oQfSk4gruvw+vn9eniPurXw=;
        b=Jyhrmk+pWhWdfb+L3NT4vnH3k9ipUUroDji0U181dzzWDHcvAHZR2/uyNnMRBqvwL2
         OTa5EKh7ZyMXVgrH9oc++8euFQo2z06wF7usMm3O8SqtoFkSzF32y6wi6kEYR/lEY+pT
         14sHoDf57kjcSNDEBo87SpNdSsnqAjZq+9/u1li0wC74bh3QtP1CkMP9o9ehZk9q8ZNS
         UxxGN6DcYmlgvwXWYNHipfeIBcVXJ/2ietpn1B5R4IdeuVUqR+8KZRiiDY5l5AEbulny
         QXxUAMY225JYPd3R6q5q0WMrhmcpqkG49O0dkGPzRHJy3TOffE5aghDO8H1DE1Z8aPO8
         ng5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123154; x=1787727954;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E95q1x2DT6McfvZlrwH4oQfSk4gruvw+vn9eniPurXw=;
        b=mW9gHmKVP96c848T7gcTBQgp05IsiLFVStO+QxXyj5lFKci/apVqTkFpOhwx+wHipg
         woYNlFRSjC0LSldfNv85sBDaG9+pSpBSr67lxzqi4PI2xBTdawR5X56gJqxoxb4UllVn
         DKARtpvtbe7TrprsH5FxR9j3zqEtyDH92tgeH6jxbeG7hfWKBHQYkjaFWXX1ZCkefWVn
         wNoFTjvAk8nRg7hSiLrFerSY4pOrFbHhGF2icj8IwbK/V+vdnscLP3O5Eh00ouoCgVrC
         GlPrALCtkqnRsGOxOIpolN8H3JVooamOoLE2j8+5TAOzjiW7jNNd+VURZcOItsLTZMWW
         6PVw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2ZosVah3OKDT5yN/Evgn7TqqeXZbkZxDI0/i992vuZeiN+WOqS5F8Jjihy1ayGo2e32wmujlPBI2gr/KUI/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiiyBexk+LEtmOOF6xmHf0bRn9G3hs9dTWDbW5F4pV1T3+VQd
	GnexCVCovLERRzCwAB3K+bsR2Y+8noEzAmW5LOgn2VTyruleCUF/sharWtEbykP3gMXMxR4oxAG
	UaxP2/pm5xUMJ0Q==
X-Received: from dyctz24.prod.google.com ([2002:a05:7301:9f18:b0:327:b132:c5a9])
 (user=jasonmiu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5250:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3958125375amr5159730a91.14.1787123154083;
 Wed, 19 Aug 2026 00:05:54 -0700 (PDT)
Date: Wed, 19 Aug 2026 00:05:37 -0700
In-Reply-To: <20260819070538.2404983-1-jasonmiu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260819070538.2404983-1-jasonmiu@google.com>
X-Mailer: git-send-email 2.55.0.737.g08866a6d13-goog
Message-ID: <20260819070538.2404983-3-jasonmiu@google.com>
Subject: [PATCH 2/3] selftests: mm: add script to induce userspace memory contention
From: Jason Miu <jasonmiu@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, David Rientjes <rientjes@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Greg Thelen <gthelen@google.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Jason Miu <jasonmiu@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce page_alloc_stall_pressure.py, a userspace workload generator
designed to saturate available system memory and force high-frequency
page swapping.

Implement a dual-process architecture:
1. Map a specified percentage of system memory into a primary memory
   hogger process to establish a low-watermark state.
2. Spawn concurrent worker processes to continuously overcommit the
   remaining memory and touch anonymous pages, driving rapid page
   replacement activity.

Provide this script to orchestrate artificial userspace memory demands.

Note: Execution requires the external memtoy binary
(https://github.com/kosaki/memtoy) to handle underlying anonymous memory
block mappings.

Signed-off-by: Jason Miu <jasonmiu@google.com>
---
 .../selftests/mm/page_alloc_stall_pressure.py | 235 ++++++++++++++++++
 1 file changed, 235 insertions(+)
 create mode 100644 tools/testing/selftests/mm/page_alloc_stall_pressure.py

diff --git a/tools/testing/selftests/mm/page_alloc_stall_pressure.py b/tools/testing/selftests/mm/page_alloc_stall_pressure.py
new file mode 100644
index 000000000000..5e95a2355198
--- /dev/null
+++ b/tools/testing/selftests/mm/page_alloc_stall_pressure.py
@@ -0,0 +1,235 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+page_alloc_stall_pressure.py
+
+Executes a multi-threaded userspace workload to consume and touch anonymous
+memory. It serves as a workload generator to create system memory contention.
+
+Mechanism:
+1. Instantiates a primary memory hogger process to occupy a predetermined
+   percentage of system memory, mimicking a low-watermark memory state.
+2. Spawns multiple concurrent worker processes to intentionally overcommit the
+   remaining memory, generating high-frequency page replacement and swapping
+   activity.
+
+Parameters:
+ - hog_percent:      Percentage of available system memory to lock strictly
+                     inside the primary memory hogger process. (Default: 50.0)
+ - num_workers:      Number of concurrent worker processes mapping anonymous
+                     memory. (Default: 64)
+ - overcommit_ratio: Ratio of remaining free memory intentionally overcommitted
+                     and mapped across all workers. (Default: 2.5)
+ - memtoy_path:      Local filesystem path to the compiled memtoy binary.
+                     (Source available at: https://github.com/kosaki/memtoy)
+                     The binary is operated via stdin and must support commands
+                     to allocate, map, and continuously touch anonymous memory
+                     regions. (Default: "memtoy/memtoy")
+
+Usage:
+ python3 page_alloc_stall_pressure.py <hog_percent> <num_workers> \
+          <overcommit_ratio> <memtoy_path>
+"""
+
+import os
+import sys
+import subprocess
+import time
+import threading
+
+def get_mem_free_bytes():
+    with open("/proc/meminfo") as f:
+        for line in f:
+            if line.startswith("MemFree:"):
+                return int(line.split()[1]) * 1024
+    return 0
+
+def get_cgroup_root():
+    # Check for both v2 and v1.
+    if os.path.exists("/sys/fs/cgroup/cgroup.controllers"):
+        return "/sys/fs/cgroup"
+    if os.path.exists("/sys/fs/cgroup/memory"):
+        return "/sys/fs/cgroup/memory"
+    if os.path.exists("/dev/cgroup/memory"):
+        return "/dev/cgroup/memory"
+
+    raise FileNotFoundError("Neither Cgroup v1 nor v2 controllers found.")
+
+def create_memcg(cg_name):
+    cg_root = get_cgroup_root()
+    path = os.path.join(cg_root, cg_name)
+    try:
+        os.makedirs(path, exist_ok=True)
+    except Exception as e:
+        print(f"Failed to create cgroup {path}: {e}")
+
+def remove_memcg(cg_name):
+    cg_root = get_cgroup_root()
+    path = os.path.join(cg_root, cg_name)
+    try:
+        os.rmdir(path)
+    except Exception as e:
+        print(f"Failed to remove cgroup {path}: {e}")
+
+def run_mem_hogger(cg_name, size_bytes, memtoy_path):
+    cg_root = get_cgroup_root()
+    try:
+        full_cg_path = os.path.join(cg_root, cg_name)
+        def assign_memcg():
+            pid = os.getpid()
+            with open(os.path.join(full_cg_path, "cgroup.procs"), "w") as f:
+                f.write(str(pid))
+            # Protect it from the OOM killing
+            with open(f"/proc/{pid}/oom_score_adj", "w") as f:
+                f.write("-1000")
+
+        p = subprocess.Popen([memtoy_path],
+                             preexec_fn=assign_memcg,
+                             stdin=subprocess.PIPE, stdout=subprocess.PIPE, universal_newlines=True)
+
+        size_mb = int(size_bytes / 1024 / 1024)
+
+        p.stdin.write(f"anon region {size_mb}m\n")
+        p.stdin.write("map region\n")
+        p.stdin.write("lock region\n") # Do not swap out the hogged memory
+        p.stdin.write("touch region write 1\n")
+        p.stdin.flush()
+
+        for line in p.stdout:
+            if "touched" in line:
+                print(f"Mem Hogger (PID {p.pid}) allocated {size_mb} MB RAM.")
+                break
+
+        return p
+    except Exception as e:
+        print(f"Failed to run Mem Hogger: {e}")
+
+class WorkerThread(threading.Thread):
+    def __init__(self, name, cg_name, size_bytes, memtoy_path):
+        super().__init__(name=name)
+        self.cg_name = cg_name
+        self.size_bytes = size_bytes
+        self.process = None
+        self.daemon = True
+        self.should_stop = False
+        self.memtoy_path = memtoy_path
+
+    def run(self):
+        full_cg_path = os.path.join(get_cgroup_root(), self.cg_name)
+        def assign_memcg():
+            with open(os.path.join(full_cg_path, "cgroup.procs"), "w") as f:
+                f.write(str(os.getpid()))
+
+        # Allocating a region of memory with size_bytes.
+        while not self.should_stop:
+            try:
+                self.process = subprocess.Popen([self.memtoy_path],
+                                                preexec_fn=assign_memcg,
+                                                stdin=subprocess.PIPE, stdout=subprocess.PIPE,
+                                                universal_newlines=True)
+                size_mb = int(self.size_bytes / 1024 / 1024)
+
+                self.process.stdin.write(f"anon region {size_mb}m\n")
+                self.process.stdin.write("map region\n")
+                self.process.stdin.write("touch region write 1\n")
+                self.process.stdin.flush()
+
+                print(f"Worker {self.name} (PID {self.process.pid}) allocated {size_mb} MB RAM.")
+
+                while True:
+                    try:
+                        # Access the newly allocated memory continuously.
+                        # If it get killed during stdin write, it is ok.
+                        self.process.stdin.write("touch region read\n")
+                        self.process.stdin.flush()
+                    except (BrokenPipeError, ValueError):
+                        break
+
+                    for line in self.process.stdout:
+                        if "touched" in line:
+                            break
+
+                    if self.process.poll() is not None:
+                        break
+
+            except Exception as e:
+                print(f"Worker {self.name} process terminated: {e}. Respawning.")
+                if self.process:
+                    try:
+                        self.process.terminate()
+                    except Exception:
+                        pass
+                self.process = None
+                time.sleep(0.1) # Don't respawn too fast
+
+def main(hog_percent, num_workers, overcommit_ratio, memtoy_path):
+    free_mem_bytes = get_mem_free_bytes()
+    hogger_bytes = int(free_mem_bytes * (hog_percent / 100))
+    remain_bytes = free_mem_bytes - hogger_bytes
+
+    hogger_memcg_name = "mem_hogger"
+
+    print(f"Allocating {hogger_bytes} for the memory hogger.")
+
+    create_memcg(hogger_memcg_name)
+    hogger_process = run_mem_hogger(hogger_memcg_name, hogger_bytes, memtoy_path)
+
+    worker_size_bytes = int(remain_bytes / num_workers * overcommit_ratio)
+    print(f"Spawning {num_workers} with {worker_size_bytes} memory allocation each.")
+
+    threads = []
+    for i in range(num_workers):
+        worker_cg_name = f"worker_cg_{i}"
+        create_memcg(worker_cg_name)
+        t = WorkerThread(f"Worker_{i}", worker_cg_name, worker_size_bytes, memtoy_path)
+        threads.append(t)
+        t.start()
+        time.sleep(0.05)
+
+    try:
+        print("All memory loads are created. Will run for 10mins, or Ctrl-C to exit.")
+        start_time = time.time()
+        while time.time() - start_time < 600:
+            time.sleep(10)
+    except KeyboardInterrupt:
+        print("Got Ctrl-C. Exiting.")
+    finally:
+        print("Cleaning the processes and cgroups...")
+
+        if hogger_process:
+            try:
+                hogger_process.terminate()
+                if hogger_process.stdin: hogger_process.stdin.close()
+                if hogger_process.stdout: hogger_process.stdout.close()
+                hogger_process.wait()
+            except Exception:
+                pass
+
+        for t in threads:
+            t.should_stop = True
+            if t.process:
+                try:
+                    t.process.terminate()
+                    if t.process.stdin: t.process.stdin.close()
+                    if t.process.stdout: t.process.stdout.close()
+                    t.process.wait()
+                except Exception:
+                    pass
+
+        # let the kernel settle down
+        time.sleep(1)
+
+        remove_memcg(hogger_memcg_name)
+        for i in range(num_workers):
+            remove_memcg(f"worker_cg_{i}")
+
+        print("Cleanup done.")
+
+        return 0
+
+if __name__ == "__main__":
+    hog_percent = float(sys.argv[1]) if len(sys.argv) > 1 else 50.0
+    num_workers = int(sys.argv[2]) if len(sys.argv) > 2 else 64
+    overcommit_ratio = float(sys.argv[3]) if len(sys.argv) > 3 else 2.5
+    memtoy_path = sys.argv[4] if len(sys.argv) > 4 else "memtoy/memtoy"
+    sys.exit(main(hog_percent, num_workers, overcommit_ratio, memtoy_path))
-- 
2.55.0.691.gc56d675ccc-goog

