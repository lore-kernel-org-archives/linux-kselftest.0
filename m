Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACE91A262D;
	Sun,  5 Apr 2026 21:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775424747; cv=none; b=BRejW16p+kqq9Txmog6gHkaGAc2aYn27/73iIZ12RFtQeYx8ekmgTi29MgrcqLac9iiMPdQD0a1LU5jjAc4vVqv7SjhQ4Y63K20O33Qa7yvE/uCd1p9fl5Az3jll0PkdQVd4L03LgBybImde0MoD0S2tBGSfsmpkGLAJtYn5eJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775424747; c=relaxed/simple;
	bh=4NEpxaG0yuBI7jkY+PpJhA+sLQ+oK9WXnFxmX5SW7j8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mm3FL8mysvbiPEVqxgXlJJIwkKTV7x5LPv01YDhzX73P2DORLg+xn9ZonNZZRcCdw2/gInyw+XMaXXBpqjLsI32RxPWPBhH41zTLcnJvZ4dZ0sGew2xs6t0HLQ0wyueSKAnfDqMwEN/t5HsQnbXpyHqfxCmzCRjNlSGkExkPThU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mj0ITPIW; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mj0ITPIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fT
	m8Ymb+Z1XqMTFD8Vp9OWwDvEBHALKL1c3yKJxhXAE=; b=mj0ITPIWmn/Oo/KYTd
	BB06VyFwUBQSIie+Djgp6+w0psQewnDP+VYPP2J/uAIoNPqQ2QEEAUbA1v+138B5
	feQoSFc7z5qyqWcZkJpmqVeKhRRx/c7UPurwy2W79bgVQ0dU1kFNBQsSMvrkEz2q
	W+I2JdkVfYsbFjbmw7tKnT3JE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCn_iy01NJpqzIwDg--.39331S2;
	Mon, 06 Apr 2026 05:31:34 +0800 (CST)
From: CaoRuichuang <create0818@163.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	CaoRuichuang <create0818@163.com>
Subject: [PATCH] selftests: mm: stop relying on killall in charge_reserved_hugetlb
Date: Mon,  6 Apr 2026 05:31:26 +0800
Message-Id: <20260405213126.1161-1-create0818@163.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCn_iy01NJpqzIwDg--.39331S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWDWr1xGFWDXr4rKw4xCrg_yoW5Zr1rp3
	4xK3Z8Gryrtr9rJr4kGF4UZrn7Gw4kXFyIqF4Fkr97Zr13GwsrKF1j9Fy7XrWxurWaqrWf
	uw4Fvw4v93WUAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_zuWDUUUUU=
X-CM-SenderInfo: pfuht3jhqyimi6rwjhhfrp/xtbC6BdxqmnS1Lce3gAA38

charge_reserved_hugetlb.sh tears down background writers with
killall -2 --wait write_to_hugetlbfs. That depends on killall from
psmisc, which is not installed on minimal Ubuntu images, so the test
fails in cleanup with "killall: command not found".

Track the writer PIDs we start ourselves and signal them directly
during cleanup instead. Make write_hugetlb_memory.sh exec
write_to_hugetlbfs so the recorded PID names the long-lived test
process, and redirect async output straight to the temporary log file
instead of going through a tee pipeline.

Signed-off-by: CaoRuichuang <create0818@163.com>
---
 .../selftests/mm/charge_reserved_hugetlb.sh   | 25 +++++++++++++++----
 .../selftests/mm/write_hugetlb_memory.sh      |  2 +-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
index 447769657..757df4878 100755
--- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
+++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
@@ -44,6 +44,8 @@ else
 fi
 export cgroup_path
 
+write_pids=()
+
 function cleanup() {
   if [[ $cgroup2 ]]; then
     echo $$ >$cgroup_path/cgroup.procs
@@ -193,10 +195,12 @@ function write_hugetlbfs_and_get_usage() {
     [[ "$private" == "-r" ]] && [[ "$expect_failure" != 1 ]]; then
 
     bash write_hugetlb_memory.sh "$size" "$populate" "$write" \
-      "$cgroup" "$path" "$method" "$private" "-l" "$reserve" 2>&1 | tee $output &
+      "$cgroup" "$path" "$method" "$private" "-l" "$reserve" \
+      >"$output" 2>&1 &
 
     local write_result=$?
     local write_pid=$!
+    write_pids+=("$write_pid")
 
     until grep -q -i "DONE" $output; do
       echo waiting for DONE signal.
@@ -261,10 +265,21 @@ function write_hugetlbfs_and_get_usage() {
 function cleanup_hugetlb_memory() {
   set +e
   local cgroup="$1"
-  if [[ "$(pgrep -f write_to_hugetlbfs)" != "" ]]; then
-    echo killing write_to_hugetlbfs
-    killall -2 --wait write_to_hugetlbfs
-    wait_for_hugetlb_memory_to_get_depleted $cgroup
+  local write_pid
+
+  if (( ${#write_pids[@]} )); then
+    for write_pid in "${write_pids[@]}"; do
+      if kill -0 "$write_pid" 2>/dev/null; then
+        echo killing write_to_hugetlbfs pid "$write_pid"
+        kill -2 "$write_pid"
+        wait "$write_pid"
+      fi
+    done
+    write_pids=()
+
+    if [[ -n "$cgroup" ]]; then
+      wait_for_hugetlb_memory_to_get_depleted "$cgroup"
+    fi
   fi
   set -e
 
diff --git a/tools/testing/selftests/mm/write_hugetlb_memory.sh b/tools/testing/selftests/mm/write_hugetlb_memory.sh
index 3d2d2eb9d..49164bbfc 100755
--- a/tools/testing/selftests/mm/write_hugetlb_memory.sh
+++ b/tools/testing/selftests/mm/write_hugetlb_memory.sh
@@ -19,5 +19,5 @@ echo $$ > ${cgroup_path:-/dev/cgroup/memory}/"$cgroup"/cgroup.procs
 echo "Method is $method"
 
 set +e
-./write_to_hugetlbfs -p "$path" -s "$size" "$write" "$populate" -m "$method" \
+exec ./write_to_hugetlbfs -p "$path" -s "$size" "$write" "$populate" -m "$method" \
       "$private" "$want_sleep" "$reserve"
-- 
2.39.5 (Apple Git-154)

