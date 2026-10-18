Received: from mail-wr2-f7.google.com (mail-wr2-f7.google.com [74.125.225.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB75347C6
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 02:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289070; cv=none; b=qyg8NjwnjAe3Rppv/oQSXIDN6kJURxC3SiT1Hl8w2QCF3NjilZ3hUiWQJQlHZJgYraJ8DZSs9k2DzQQvMlVdk+kjg3CAMHmVMTYRqlvW1Q3wd0Bnva9cJ80rHW3oqbdjNpVRXzDg4nZxduoUIFjgGFSE5oRyMLETEjqfA+rsoIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289070; c=relaxed/simple;
	bh=caZTDHt6UILp09QROvQ0YGeBMVOn9q8m9mcI8/xIScg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CCie4OBUVhdVXZRHorkf8MHruqmd9SiYoV9we4OVMBWXG7hUZKe2ULsQiaJnFds+520+zBTt0/VA6O7bzAc45SwkRDM7fI60/wGQXKpb9q5+qJ8bVTYaR/lXhl4BAmSDxC/hRJSV7vVCHxy2b4s1DGOsYFhrE6P8VOyKrwuCgYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCcunluZ; arc=none smtp.client-ip=74.125.225.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCcunluZ"
Received: by mail-wr2-f7.google.com with SMTP id ffacd0b85a97d-48df951fd31so522441f8f.0
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 19:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792289068; x=1792893868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcLGhS41qDyrPASVGx39Zak2pOFp3aGzMbLkGewPdag=;
        b=YCcunluZXmQmIH7LYN2FluxxcbbuP1wT5IE43wlgbMAjAnH2pA3CJO8fhfdhSxolIl
         UPTDHRkP7XXg7jwBV1h/6iJanroaXFzr6//Yv7e28AD2mP+e5LyansN92+of54BYl/rC
         SDkNVxTy5UJi/hbhAMGwxKjXhW77TdcAFkLsTn2X5Xsw3Sjf0Dh4/ZZcOkp69s60TGD0
         eJVluDeIO5451KCNPLRB37ATWpl10heu57Vixa/bOaUVCkmout0XYUade6EHI9sLj6V+
         tj270ACZKj7BJq2KVFRyt2QC7fC68LBeXmgNOwQ4Ky7jbCtc5u4R7HSRlLw5njLwMQqJ
         9j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289068; x=1792893868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcLGhS41qDyrPASVGx39Zak2pOFp3aGzMbLkGewPdag=;
        b=WZ4+Fmsl1sxPqfx/RDgCy2V+nV/fDoa3cgp0B+eXPurnwbcAnoxiodvhaF/OBiFXQ8
         UEKuHbtJnLtPeXm6POPnwX1cfFs9S50aF3ORSkToUh9Z6xNwufOVQxP890RmN0FTz6lr
         fVEsW+CMkigfdybM/pFglXnjX1eMBvV7mVxrFfS9zYIxjS0LU6d+UzKssrdi6CDc3+3Z
         WqGmsPL5XuMVrJJsnQSK5sQY/c/OOG6tPA1b/JtCr7T7lZ01kMfD83gTRG7lt+LHFB7O
         FtzHOJshf4mdUM3laNgzntgvzbhoNc4Zg5XhWcnCbgsWS7y3d652dTAfU9C920fPHKEI
         pMQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYPfvBKp+9y5vOjbd5x7mlRfpqphj2OJRwPD0j+P36q2f85cOdAcOsnnP0YkoIdQoMjGS5p3n+MgEY9SNXmq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8cv3jZNkBCujv7XmGLyNtqEZI3Bc3l+CynNxNWPgz/JsRZmSU
	c6JBsCs7Ddc56xrfxZF3TybyGn3zeccz6xtmtMLhA7CghuOZ/NBPCF1C
X-Gm-Gg: AYBFou0owkW9Ymley9gC6JMLpqVI7ommkGm5Gqn9q6rK15OOIiIBrfu9gR8taMc/cMn
	bsDUncHg5MgDwXgYkxxtHwzqBTYv4+V9ENNchhDM1ynKiJPKDYSZNSwE8Sa5itpyLNhU8SfIQIy
	324J6XpuDgTrPGaFOCoFMIgSFrK7Adr+DlsTxxLUfQLw8BZy/vDK5ypJn+jBWoWXYccUMI9iDz7
	lVU3k3Cry5Q8vetxC624u2YiQ0C8BdXcPw1Rz5waD/IE5cHgPtY1zbsjHwIjoBSHZIXwlEoPu6Q
	N1Hb69ZyJxNX4TyQp2UtYNKEJKI8YqCAOx9dkYd8VRJM5JRT034/KtS+RKz6ZIX9J1E1ZH1JRQf
	4DxraHXi4u1j1pZLo+CzPBEz0+rGRw+A9KLg+dQi4UdP9XTNX5RMsGUCk25vgr11Sqij2+Hch4O
	jph7UDAJLJFrHfBBm6R3o8PIllJEXEc96Pz5HSCiReSAbnyM6vyktnncSc1QUXyYlmFN6T+tzJm
	TXC7LLjcvX2uGtlZgSyrYlWf+sKzHJtcUDvkXGdlOQp7Bm5HdA7Qw2dV7MGxCS3zkuuyW48Fp4V
	ao7ilk9/8Z1nIuHy1/nd4ShEX9f9GKnH0A==
X-Received: by 2002:a05:6000:4381:b0:48c:6955:a603 with SMTP id ffacd0b85a97d-48e07bb5a24mr8947014f8f.13.1792289067693;
        Sat, 17 Oct 2026 19:04:27 -0700 (PDT)
Received: from lima-kernel.telekom.ip (84-115-220-212.cable.dynamic.surfer.at. [84.115.220.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm15001449f8f.25.2026.10.17.19.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:04:26 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: SJ Park <sj@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/damon/sysfs.py: stop obsolete_target shells hanging the test
Date: Sun, 18 Oct 2026 04:04:15 +0200
Message-ID: <20261018020415.35567-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The obsolete_target test spawns three 'sh' processes as monitoring
targets.  The processes inherit stdin from the test.  When the test is
run via 'make run_tests' from an interactive terminal, the kselftest
runner executes it under 'timeout', which puts it in a background
process group.  The 'sh' processes then try to read the terminal, so
the kernel sends SIGTTIN to the whole process group.  This stops the
'sh' processes, and also the child the test has just forked to spawn
the next 'sh', before it can run 'sh'.  The test then waits on that
child forever, until the kselftest runner kills it after 45 seconds.
The test passes when run directly.

Fix this by passing stdin=subprocess.PIPE when spawning the processes.
The processes then read from a pipe that never receives input, so they
stay alive and idle as the test expects.

Assisted-by: LLM
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
 tools/testing/selftests/damon/sysfs.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/damon/sysfs.py b/tools/testing/selftests/damon/sysfs.py
index 66c826189320..ce54fa21c09f 100755
--- a/tools/testing/selftests/damon/sysfs.py
+++ b/tools/testing/selftests/damon/sysfs.py
@@ -390,12 +390,12 @@ def main():
     kdamonds.stop()
 
     # test obsolete_target.
-    proc1 = subprocess.Popen(['sh'], stdout=subprocess.PIPE,
-                             stderr=subprocess.PIPE)
-    proc2 = subprocess.Popen(['sh'], stdout=subprocess.PIPE,
-                             stderr=subprocess.PIPE)
-    proc3 = subprocess.Popen(['sh'], stdout=subprocess.PIPE,
-                             stderr=subprocess.PIPE)
+    proc1 = subprocess.Popen(['sh'], stdin=subprocess.PIPE,
+                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+    proc2 = subprocess.Popen(['sh'], stdin=subprocess.PIPE,
+                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+    proc3 = subprocess.Popen(['sh'], stdin=subprocess.PIPE,
+                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
     kdamonds = _damon_sysfs.Kdamonds(
             [_damon_sysfs.Kdamond(
                 contexts=[_damon_sysfs.DamonCtx(
-- 
2.43.0

