Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF98397E91
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 07:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787123161; cv=none; b=AwLUSp4DVdsJwnAzbykhTdJxd9e2qZ69502HG6XbGwm7Ih28TSj+2eBG53vEPDibS7F6mT0uULQZH33os0RIiwgyiD8IAoCvRdKlms8JnQJWoluF7NLPg+oQLByPkbkL1N94SkrDTImxAC7oMq81mk6/kkhwrUKVBZ7+XWDqvn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787123161; c=relaxed/simple;
	bh=3vd1riOKO040WnRWKoxbpwmzVP+Y/Z51qvCLfNFRGWQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GGg0ti4OzXrUNiO0cfwzshoqK8m8whzHhrMUZayF2Y7zl8a38tCx/am2JCYlpwQ8eCxO+h+iN8Q9lJD/De8zOwc2867MHCsLvasj1I6hY4o2Io24YZVtKOGOUfzyyT003efgVArvLQr025TW02aegnv+2AyMstonywhvDLS3HHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jasonmiu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vH5UcqO6; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jasonmiu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vH5UcqO6"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so1304350a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 00:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787123160; x=1787727960; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ts4aq9qFq6CIZlsiXvQuHpSHiQajqVM1hB12vxK4HZs=;
        b=vH5UcqO6XPjQBMaHe4Wm9s5qQ4bqH84sX08qee+X9fFhuUCBUioQkYIh+WXFfanrYL
         ugERQIf7Uxrg3n1kemecq8A/r6omQMsZpSsVI0CqaKTkmtyjOAPPj7t0uA02buu+sfZt
         3buGw+MSjq9RmtUscNc+ff1M77G9e+3RYn7cl9A4yyp6VV3owf2L5dULfa0r5TNFrQ1N
         4OpBibmzV1aFa3NK4DtXpbHHhQlgQvFrxEv6V0HNQeSm3r8S/HM4rjcqK9wPSyZygWKD
         6kgeigGKM24g/vH74xvChTb3mO7y79kJuUuR1Dm9HdAGRyvEWl5ifoOI93Lvmr339vEH
         lhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123160; x=1787727960;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ts4aq9qFq6CIZlsiXvQuHpSHiQajqVM1hB12vxK4HZs=;
        b=LcXKZVrPBGed3IONotqWhN2rsQOq0SOIho3XSAfxwj+imFL41x0s9BZ/jgzbVUV8Vz
         +7zi52TnNeGSSuUfCZ/ylmb/vMylyO3wAdu+9zLl+eFLbqfS1kVMPSpQ5ey9GmGfL+hn
         xlCLXRx72HVA8IOuMaXrhBjLo1vVe9jUChD3vfo9+14/qFsRp5yarAxULzkFN9Fjb7xa
         ijHEOkrH3/hW8YT39tQc+SU09oWXdA+s7TW8ndGWuSZS7VT/nvbJ7n7Ofv/WW0XYVriQ
         n/v3nSDH2s3vbW79FYQhjb+VU30rFcMTIsW8QDOp6Uu7blPXVQ0QlKp9CaHyOS5JrOMc
         U3pA==
X-Forwarded-Encrypted: i=1; AHgh+RoWvRclX5ha5PlICDaJuTpOpTiX3UJqDJL45rrU8HNcVjnht9o/ut0DIruqaiAlXYei04v8Zd1SmvZCv/d+C/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzraqQ1QPxxwn8xr/29xSFrDqQ8mLiROmMfAZ/E7NbKOt86SDcf
	guMCMQ+6D4oma0zMz++3djQCNSUR2+YSFLJwrMSRNnxOYMwu+S3Z1E+xvfoXdxIkNmxh1vzTweZ
	ggwUWQy/BQcT81A==
X-Received: from dyjt7.prod.google.com ([2002:a05:7300:7b07:b0:311:7d79:c37f])
 (user=jasonmiu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c8d:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-39580a4c6aamr4886911a91.4.1787123159758;
 Wed, 19 Aug 2026 00:05:59 -0700 (PDT)
Date: Wed, 19 Aug 2026 00:05:38 -0700
In-Reply-To: <20260819070538.2404983-1-jasonmiu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260819070538.2404983-1-jasonmiu@google.com>
X-Mailer: git-send-email 2.55.0.737.g08866a6d13-goog
Message-ID: <20260819070538.2404983-4-jasonmiu@google.com>
Subject: [PATCH 3/3] selftests: mm: add script for memory allocation stall test
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

Integrate page_alloc_stall.sh, a script to synchronize userspace and
kernelspace workloads to reproduce page allocation stalls.

Provision a synthetic loopback zswap block device, inject the
test_mempress_timer.ko module to generate atomic page allocations
inside kernel timers, and execute the page_alloc_stall_pressure.py
payload to induce system-wide swap activity.

Signed-off-by: Jason Miu <jasonmiu@google.com>
---
 .../testing/selftests/mm/page_alloc_stall.sh  | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 tools/testing/selftests/mm/page_alloc_stall.sh

diff --git a/tools/testing/selftests/mm/page_alloc_stall.sh b/tools/testing/selftests/mm/page_alloc_stall.sh
new file mode 100644
index 000000000000..3ece026fd680
--- /dev/null
+++ b/tools/testing/selftests/mm/page_alloc_stall.sh
@@ -0,0 +1,80 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# page_alloc_stall.sh
+#
+# Orchestrator script to generate concurrent userspace and kernelspace
+# memory allocation pressure over a synthetic zswap backing block device
+# to artificially induce systemic memory contention.
+#
+# Dependencies:
+# - External memtoy binary (Source: https://github.com/kosaki/memtoy)
+#
+# Usage:
+# ./page_alloc_stall.sh [hog_percent=80] [workers=64] [overcommit=2.5] \
+#                       [swap_gb=10%_RAM] [memtoy_path="memtoy/memtoy"]
+
+set -e
+
+SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
+PYTHON_CMD=${PYTHON_CMD:-python3}
+
+HOG_PERCENT=${1:-80}
+NUM_WORKERS=${2:-64}
+OVERCOMMIT=${3:-2.5}
+TARGET_SWAP_GB=$4
+MEMTOY_PATH=${5:-"memtoy/memtoy"}
+
+function total_mem_gb()
+{
+    awk '/MemTotal/ {print int($2 / 1024 / 1024)}' /proc/meminfo
+}
+
+function enable_zswap_file()
+{
+    local swap_size_gb=$1
+
+    fallocate -l ${swap_size_gb}G "$SCRIPT_DIR/swap.img"
+
+    LOOP_DEV=$(losetup -f --show "$SCRIPT_DIR/swap.img")
+    mkswap $LOOP_DEV
+    swapon $LOOP_DEV
+
+    echo 1 > /sys/module/zswap/parameters/enabled
+}
+
+function cleanup()
+{
+    echo "Tearing down the test..."
+    if lsmod | grep -q test_mempress_timer; then
+        rmmod test_mempress_timer || echo "Failed to rmmod mempress_timer"
+    fi
+
+    # Check if loop dev was actually created before trying to destroy it
+    if [ -n "$LOOP_DEV" ]; then
+        swapoff $LOOP_DEV 2>/dev/null || true
+        losetup -d $LOOP_DEV 2>/dev/null || true
+    fi
+    rm -f "$SCRIPT_DIR/swap.img"
+}
+
+trap cleanup EXIT
+
+if [ -z "$TARGET_SWAP_GB" ]; then
+    # use 10% of the total mem for zswap file by default.
+    TARGET_SWAP_GB=$(($(total_mem_gb) / 10))
+fi
+
+enable_zswap_file $TARGET_SWAP_GB
+
+KROOT=$(cd "$SCRIPT_DIR/../../../.." && pwd)
+KO_PATH="$KROOT/lib/test_mempress_timer.ko"
+
+if [ "$KO_PATH" ]; then
+    insmod "$KO_PATH"
+else
+    echo "WARNING: $KO_PATH not found! Aborting the test."
+    exit 1
+fi
+
+"$PYTHON_CMD" "$SCRIPT_DIR/page_alloc_stall_pressure.py" $HOG_PERCENT $NUM_WORKERS $OVERCOMMIT $MEMTOY_PATH
-- 
2.55.0.691.gc56d675ccc-goog

