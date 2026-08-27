Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BC138AC88
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 03:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787802500; cv=none; b=ocdmE2erkpMGHk+2ruKhoWCqScKZDItPMOHVbva2keKZppuSXYu8MIJJXJB1qKNtkLKhpTA+eUuwNO074QF0GFtuOsNN2+FC9uFyMZlk3AJRjcUj0FActyUt6wQ2z5Xwh91PUmt4NRdR/m0MUYM/CHNQrc62qKTkGfkYHFvgLj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787802500; c=relaxed/simple;
	bh=VHwu/0OYCOFCq+Y0DmHKVaBbldT+5j6Hr1vHGunMCW4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V819qDecG1FQUphkGI10LUUWpeEBN/5hXMWi9KT4/TmwfsLQcotduY+eqAKPg1Ksd7IokRffbNKuYQWrRjbHrMG9sErkgh0o6HTpeKyWqr2lXQN1gqemSF5iOmEx9UwN6oBh+idH8hyvm5QTW/KTSrGLNXWg8zdizZCLkxo1HJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=co3tVDw1; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="co3tVDw1"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84857446424so3132761b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 20:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787802498; x=1788407298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c7K4UtYlM5Taecme/MISRV3FY5efo57r9lhFcU8lc7w=;
        b=co3tVDw1yB213HTlqKulPkKCQcFU5x7QDhTQ6zWFqdbgxRoQdDc8f4lPXHvDNN2ySc
         JXXapN2S2JKo3yzdUg/KKLkTDSbFblvcdf2X7ln5whIFB+qGF6VETbtJp9464ZcGTIyc
         i4OL1/QdEI8r67VX5ONLbANndAzMTckBP27JaNickjkWffmfhqlvUNANGRVS1TYGkIu0
         Bls7wERERsoyaE1gHufvR5etRjAcvdO1FxiNK9wqdGo3DmPyphsveslWZPs9761NWMEU
         JaKKmwFOTOx4Vzc+yLajz3EuT9eSboSCGJhrwRCI639wolei81jIzXakkOlJKV5+wC+1
         Y6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787802498; x=1788407298;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7K4UtYlM5Taecme/MISRV3FY5efo57r9lhFcU8lc7w=;
        b=e/VvmlQgerYBNtLzl3JLdzjN1whGT87CsGe3T7wzlan3zuDAhgpU5MEBPLGrovg/q4
         OIp/57YF7URGMBtFpYIBmESA9yxL++UdcsdN8EhFZd/gw9lYkUv54sLM24hdrlhhrWZV
         gLTKLw1FvEGhcOl6C81JxQ9gnjBuRugl1gLHMFGjqhTihmy48qXdcqS9yHHt/BpWPlKy
         Rlqm5/EiXF9wVbn4JMEoMc7cfhH/k132fcEJdWmsxVICxGC9D9ogfpKP8jZRu4xz/Gln
         a+oRxYgxO/K9Z9umOhdVcKPeYQNCN6qLDvsdmsd0N35yTdASH/SxGx6JXGpdHAr3oCVD
         uj9A==
X-Forwarded-Encrypted: i=1; AHgh+Rr9y1TJ+AoLjaFfLLUTDdFGAKnhpM1UmYa8uZRsrugN5hjoCtRTFwLsdzABOOxvOScCOfPYDe8Dhqz/rdP+W3w=@vger.kernel.org
X-Gm-Message-State: AFuF++mXyS4NYaZa0EZdvmWf+BLq5TP0htEHfJmeXwEMm4mSMcgwIQW7
	fTT1oX5RcLYpZ6NP67oKSOao/PbsY1X9QlJ+U2eDBWcXa2h8Dr5iKTeR7uF25AdKER9cyslIfTr
	FGdvULC+4/g==
X-Received: from pgbq7.prod.google.com ([2002:a63:5c07:0:b0:cc1:46df:8c43])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3496:b0:848:77b3:579a
 with SMTP id d2e1a72fcca58-853755c49b3mr22827745b3a.17.1787802498148; Wed, 26
 Aug 2026 20:48:18 -0700 (PDT)
Date: Thu, 27 Aug 2026 03:47:41 +0000
In-Reply-To: <20260827034807.2822234-1-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827034807.2822234-1-wfelipe@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260827034807.2822234-2-wfelipe@google.com>
Subject: [PATCH v3 1/2] selftests/cgroup: test_zswap: wait for cgroup to
 unpopulate in test_zswap_writeback
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When running test_zswap on a single-core VM (-smp 1) with 4GB of RAM,
test_zswap_writeback intermittently fails on the initial run after boot.

In test_zswap_writeback(), after waitpid() reaps the child process created
by test_zswap_writeback_one(), writing "+memory" to cgroup.subtree_control
can fail with -EBUSY. Under cgroup v2, enabling domain subtree controllers
is forbidden while any tasks remain in cgroup.procs.

When a child process exits, exit_notify() wakes the parent process,
allowing waitpid() to return immediately. However, the cgroup populated
task count (nr_populated_csets) is only decremented when the exiting
task is switched away via finish_task_switch() -> cgroup_task_dead(). On
single-core systems, the parent runs before the dead child has been
switched out, causing "+memory" to fail with -EBUSY if written immediately
after waitpid() returns.

Fix this by waiting for cgroup.events to report "populated 0\n" via
cg_read_strcmp_wait() before enabling subtree control.

Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
Acked-by: Michal Koutn=C3=BD <mkoutny@suse.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/se=
lftests/cgroup/test_zswap.c
index 49b36ee79160..a7ff525c1267 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -407,6 +407,8 @@ static int test_zswap_writeback(const char *root, bool =
wb)
 	 * Thus, the parent's setting shall be what's in effect. */
 	if (cg_write(test_group, "memory.zswap.max", "max"))
 		goto out;
+	if (cg_read_strcmp_wait(test_group, "cgroup.events", "populated 0\n"))
+		goto out;
 	if (cg_write(test_group, "cgroup.subtree_control", "+memory"))
 		goto out;
=20
--=20
2.55.0.887.g758fc8c411-goog

