Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6B433E345
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771432788; cv=none; b=EPyuRulaCierKPYqi6gQqbwikYYv888vhI+7uu21+sPHV3nrRGTZzmM1z+Mx5Bdu9Ll73VFkRaq2G2Hv8Aek+9mr3N7Or3WA+g/BhVKncpkMlEfQZg/skt9nZOMmOrq91zE10DxHOv8HWFMbZiYBML7VS0HCltSpFEk8VhL88QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771432788; c=relaxed/simple;
	bh=G5ahE1YG8/6veiWOLrKMcA8+v9Y7YNyYq/qP7R6+8YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GsuO+JmeeO+ycemmN4QEORETGzDMpHeRF2zfgLcR8Q7tdJ5dc4hcdwrd0mmMr4JDMKN16unB0ymUNjJreH82zEM+2+k8C5rtRgaTe131E/0THjk6beMy/bGRo19vri2OpoFNh/XjcaX7rFTlloWDq/BitUxoeS5x+qVvDc4L5mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fblwAMgR; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fblwAMgR"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-895071c5527so12880756d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 08:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771432785; x=1772037585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8IaEyL0dKDQs6FVsnUlq2M4sAODAnf58W8FA0XnDWIs=;
        b=fblwAMgRsOugRdK2X6b46pmEiFdc9lvN4OIHfxLTcEGdfeOR5FAsWecLrykaqEQcZi
         07kneLKL1LxEaSlcyj+NJa9QKPoOiQXZkxvHPzPEQcGLTr9WUs5wE9XS6gMsrtrLCj/R
         CZ0dyjnDWwdQ0d9lR1Mo0VRWmXFyVxnhsTFpXGrM/8dA/ObxjM5o0eBZAkBh20DTHPMZ
         UIbI9Azqtr+FiAaNdXxrfiZswoL1YHQK8jlFKQ45YUkPReQKnwTHYlS5MoFnvgqdx8oq
         W1SpJ3X5ecoYrOlYYON1x44boJCeiQ86x7wMvUYNzHkaaGQ+3iMUmv+uOxZLyzcvmcUF
         zUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771432785; x=1772037585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IaEyL0dKDQs6FVsnUlq2M4sAODAnf58W8FA0XnDWIs=;
        b=F34nJE8KBYJdFbqgsifzFN4vRBa2nvU/9YFk6uZi6Sg2vNRwvJ27TdkDCBrxFnvJ1C
         zQxxfevHOtrDew4/4HlkHKRTbzEegYpz3va58BwYEjElIziXGU7/+SVCPoqLelUppapX
         vRZBEe07l0A93Og81rz55zLYk2o3lFsjblzoXytxL7wgBrlTVECsABIwcab8ifCzEWsm
         joIYvl9DWHySVZfuEscom4RCAI/CxMZ2nGmmPd1ex/X2NJ320Azzj/4zXsJQnaz6hR0J
         6bRqSoI7/2NJ/8zOnH2/MC4bzvIIsafNJBh0HdXGi77p7UjC2nigcV2vqSVVFzeP8Lz8
         yuHg==
X-Forwarded-Encrypted: i=1; AJvYcCUXdYNs3hToBpaTfkPy1Birb0cSunyr6FE6yveQcKzX243P3sUeXEtoCBr2NKWMXk3fo/CmwAZC0TDCHTUJjy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlnTwAjcuuYjZo3iPy1O3q0Zuyy3po8Ux4P/OWv8loOQIjxpMe
	bkc5cUzngldAsV2gW3mrPGwcfOe5QIP9bFTFKDU8wP1g6ECVmRKnQ+1d
X-Gm-Gg: AZuq6aJQwLPJLNmeFqPyE9i3zO5DOw3sBilSMBkTw9bbHXdVSi0AEFFMLnQJd3AbcoD
	Zsaa6VEnNR0/KGWr/n81G0uNqChFiD1SZibdWs8pOzJVx3bvywxgQ83/ET//oUrl+VRxnSjzLc2
	cok9VYwx8hwb4OwJXyRzL4vuiKIAvbwxEp59pxI68nuK66qD5K8pCG0x8HJwT3GOr5ykeyqBnZr
	y3eZy3ypxFix3Tvy0ZqAFgbKm/9kEwFF/yPFdwcrKcojf61fGGoQvkn54L/rYGEM64oUscPI/+J
	f2enBnmrHg4NI7eSUG5XK7FGLIpJL97JTn1wgBZAnaP8ZAK7D/m7YzVslxoF9/v4RzdtoIsnG/s
	1+SeoHyXu3j5pZ+zJxMx5W2MReX2j44KWlQCmjyUF0OLoDO7QEZUMfH3ytuGKaZhRcezJSKCVCH
	ATHauyDbFrLaW/R7hbT0GY/dz/
X-Received: by 2002:a05:6214:4109:b0:896:f50e:b6c4 with SMTP id 6a1803df08f44-897402e07d8mr217890716d6.19.1771432785370;
        Wed, 18 Feb 2026 08:39:45 -0800 (PST)
Received: from ubuntu ([76.38.17.53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb39da3dc6sm1769869585a.51.2026.02.18.08.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 08:39:45 -0800 (PST)
From: AnishMulay <anishm7030@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AnishMulay <anishm7030@gmail.com>
Subject: [PATCH] selftests/mm: skip migration tests if NUMA is unavailable
Date: Wed, 18 Feb 2026 11:39:41 -0500
Message-ID: <20260218163941.13499-1-anishm7030@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the migration test asserts that numa_available() returns 0.
On systems where NUMA is not available (returning -1), such as certain
ARM64 configurations or single-node systems, this assertion fails and
crashes the test.

Update the test to check the return value of numa_available(). If it
is less than 0, skip the test gracefully instead of failing.

This aligns the behavior with other MM selftests (like rmap) that
skip when NUMA support is missing.

Signed-off-by: AnishMulay <anishm7030@gmail.com>
---
 tools/testing/selftests/mm/migration.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index ee24b88c2b248..60e78bbfc0e3e 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -36,7 +36,8 @@ FIXTURE_SETUP(migration)
 {
 	int n;
 
-	ASSERT_EQ(numa_available(), 0);
+	if (numa_available() < 0)
+		SKIP(return, "NUMA not available");
 	self->nthreads = numa_num_task_cpus() - 1;
 	self->n1 = -1;
 	self->n2 = -1;
-- 
2.51.0

