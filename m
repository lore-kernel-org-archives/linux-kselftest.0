Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4845B21A;
	Sun,  5 Apr 2026 19:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418471; cv=none; b=I5pheYwtCwYhg6QyBEz326gOBLKvAtGqV9gPX/DEjoX5SXNYal4Ch56rpDtJBmp8/J2KmP8Gb+JmdDi9BPMk0h63RdVz2tGBn0qYBFgs5tegjK8ZYmL/Xhu5KgLA6/mEBM3Aw8y1YUientBI9gx3xQS0eLDkZvwlVzrDSFa8RyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418471; c=relaxed/simple;
	bh=yXB9A3upCBSuVn1B69ZCkUfUz3pMogxQTwBPPSKq7NM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rZh4olfs3B6tfT0XXikMb4M6eb056/ayxTY3hpvitGspOxUv9ihF7dsaoOo/2dttvRkkonytHCHZPmz4QzHmOp4JLKzWNX6KqWPI+zRiZ0Hk9JEgu4YLAAM+krzwKu/KakdPsv1GBRBRjU/b/7q7P6uDfC+pKw/SoOi+/JmE4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=daTTzxKX; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="daTTzxKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=a1
	v6SBEW7jZZiNgfw9iPh4ktsxTNNEqcra3qAv6zZ9U=; b=daTTzxKXaJaZ33L8LJ
	p343hehtYXZw8BfAG/r56ypsZ27oQbHk5UNt7CD0K9VcLsoVnBRAqFGGRlhzqakM
	l3ztCe7lemnr1YFI4+S9sDWZTxqSWG7MpvTmTJZt1x1f0ujkeOg06KOf76Yh7U21
	NAXV9SefEH8Dv7si2VIYFpEqA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCHMbAUvNJpqEGECA--.186S2;
	Mon, 06 Apr 2026 03:46:33 +0800 (CST)
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
Subject: [PATCH] selftests: mm: capture write_hugetlb_memory.sh exit status
Date: Mon,  6 Apr 2026 03:46:23 +0800
Message-Id: <20260405194623.84218-1-create0818@163.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCHMbAUvNJpqEGECA--.186S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw13GF4xKrWkZFWktr1DJrb_yoW8AF1kp3
	4fKFn0kryvyFZrJr4kJF4UZr4DuF4SvrW2qFW8t3y7ur13Gw42gF1jgFy7Zr4furWfJ3yf
	ZF4jv3WkC3WDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRR6wJUUUUU=
X-CM-SenderInfo: pfuht3jhqyimi6rwjhhfrp/xtbC6BlEfWnSvBknIQAA3Q

charge_reserved_hugetlb.sh backgrounds write_hugetlb_memory.sh and immediately stores $? in write_result.

That only records whether the background job was started successfully, not whether write_hugetlb_memory.sh itself later failed. As a result, the test can miss reservation failure and OOM-kill outcomes that are inferred from the writer exit status.

Redirect the writer output straight to the temporary log file and wait for the background process before inspecting write_result, so the test records the actual exit status.

Signed-off-by: CaoRuichuang <create0818@163.com>
---
 tools/testing/selftests/mm/charge_reserved_hugetlb.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
index 447769657..2f52ad7c8 100755
--- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
+++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
@@ -193,9 +193,9 @@ function write_hugetlbfs_and_get_usage() {
     [[ "$private" == "-r" ]] && [[ "$expect_failure" != 1 ]]; then
 
     bash write_hugetlb_memory.sh "$size" "$populate" "$write" \
-      "$cgroup" "$path" "$method" "$private" "-l" "$reserve" 2>&1 | tee $output &
+      "$cgroup" "$path" "$method" "$private" "-l" "$reserve" \
+      >"$output" 2>&1 &
 
-    local write_result=$?
     local write_pid=$!
 
     until grep -q -i "DONE" $output; do
@@ -223,6 +223,8 @@ function write_hugetlbfs_and_get_usage() {
       sleep 0.5
     fi
 
+    wait "$write_pid"
+    local write_result=$?
     echo write_result is $write_result
   else
     bash write_hugetlb_memory.sh "$size" "$populate" "$write" \
-- 
2.39.5 (Apple Git-154)

