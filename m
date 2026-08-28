Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8F3A3E8C
	for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 03:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888268; cv=none; b=BLRA7ke7ki7C029CLZbK+yyiXOgpo+jItZWhyiun6La+QBfKFMU6XyfqTzr2ODt2RmptxfGFI1BBhaDnh6pNPyaZbi2JbPRXSA24+G102oVobo4+minPp7FGb+MW0caQJRkJ/Xtm5Ooi5yk99Zgn3oBMRbB3SGXrxET0Nmyz4kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888268; c=relaxed/simple;
	bh=l2+Ioatpx8Fd2KX3RL9q3h55NEr8mLQK0l6eefsKUYU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mubXJsGl58pRY+hISqXKRXjZ6hn1DUEZXt+9gQsBD3Vmhu3AvbVtnEPnIC3B0nsmruLwWTufFVKcydo9/DkhVyo6oEOyjmoW2iTa+UzTKO56Dp8juq7uz+UyaoJJjQdNV6kyIuv0laI87NXwKyowv+/l8jeAzfzaLTGYQq+P0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPLrqmJB; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPLrqmJB"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso508642a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 20:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787888266; x=1788493066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O24jMU37BkcwnSlc1N2v2/+qg0Mt9kUORAX9UPQ3I1U=;
        b=WPLrqmJB3AhHNfhkPEWUmYwpsKufqdrdkZAkfDaxVD32C0gCvFDozuvMpZgSFaePr8
         36hB5Mi0Ig0Dt2jzqGLDERDHBFX/uzykGanjo81E56iYM0n4pLwjJwDWz9+XjY4CSvvd
         Vh9eExyXoCRyu7jfVpfUZI4qcNCJ73xKyPTEkFNTSPPIm4GsuKa4D8JMg70Dd7D8QCss
         52UhSI5n/qECVQm7h38Q/wYrhx9F8mAHH9SSYI8qhMK+S+HOnNpiHw/prwzUG1lHrpsa
         Kba8f97HzbiyvCUIrbmSZrTGzMxLfPn0S+3lSMSizYTKdLJ1c5A1KoQPJdLEFkbvGr6Z
         btnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888266; x=1788493066;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O24jMU37BkcwnSlc1N2v2/+qg0Mt9kUORAX9UPQ3I1U=;
        b=d7VpLGbw2q81mT2uN3Vbgev/+rA6VN/nD22FV5Qw5GEa3qdUPRAjPBSdS1O6As9ybY
         TJUvBdiJw1uOj42eUSMLfHUhmvdbh9c2ln5toEHbkhljiOvvMGDy/yX8e3cSmVWL1Qtx
         avwNERWsYihHBoASMOxdw7cJWoj2G0APvcHtguW0Vn0Zw0SVRy+8jF+vDnOZjH5ilopx
         vA5IagR0bU0NzohKTjIgrfQM/ttACXbQZfbWeolbjOodwWpgwBU3nBxA0W0pETyEr9Fp
         rSz9Xj+KIP8BRFAtDP9SS1vxfam2J2MThrR10xPKOHn1+46VW3a4RBKJVSbNdcvy5I7W
         oCHA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2owRyxpsdJN5HSN01SyL9gGLfOhIii2KszY8Wq2lHHnramBK1hLA2FWfT3FutnNVTRmhZSQXN9u+AOGzjof8=@vger.kernel.org
X-Gm-Message-State: AFuF++mWuZ2ynykAVuB8/XGGJG8Np8iYDhwZZu6koy2qkhmeNn7D3z/k
	amhcVKhsk+JwogiX5CrxasxWTGdfeSAt8/lkFdTNeJJvQxyO8uhBrfxr3O0VR6V5LPOSi3iT1HC
	f8H/4W0QD1A==
X-Received: from pgnd2.prod.google.com ([2002:a63:7342:0:b0:c92:3cad:b6c5])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4842:b0:3d2:82a5:f539
 with SMTP id adf61e73a8af0-3d282a67cd9mr5391975637.7.1787888265644; Thu, 27
 Aug 2026 20:37:45 -0700 (PDT)
Date: Fri, 28 Aug 2026 03:37:31 +0000
In-Reply-To: <20260828033741.2184560-1-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828033741.2184560-1-wfelipe@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828033741.2184560-2-wfelipe@google.com>
Subject: [PATCH v4 1/2] selftests/cgroup: test_zswap: wait for cgroup to
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
index f7b4c4370db6..1d3c410252e4 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -408,6 +408,8 @@ static int test_zswap_writeback(const char *root, bool =
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
2.55.0.897.gb25b4bd76c-goog

