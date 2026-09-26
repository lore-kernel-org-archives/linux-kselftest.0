Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEE43451C8
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790438145; cv=none; b=gMsxpVmnsz7Qko0wzzy65wZWmk8Pdx0NpvBlF0ies2/AVINOGpdtLUfqObowNQdnCZbHzr1g2xKW3M70Lw92/AR1YLhJYD5M0wTUlGHpWPQ8qKPuMvoIhUpQoWZHIKBiG1mkyCXFrnPkvMj9yHUo9Jf5ieXhlDk/uQqwI2PDLu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790438145; c=relaxed/simple;
	bh=pz7lKiug+kfyw4RvUQK+q1wYZURn+2I5w2W1ivVBNlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmujMusb5OU1kLAaNA7zJMOhusVxDYhD2hfGW2z2DmY8nXOCuuRE4chD788Mz7tj+4+Q8mTGGjzlv5XwmDZs0SII95WyohZ2UAarUe7J7S20ncBsLnncTVFcYhhtZeqSw8aUFtE0NL2el42DFyQUjdec/qUyA+15Wjv77rF+7SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKucldy0; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKucldy0"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-49386210e98so1012251fac.3
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790438143; x=1791042943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/X8WtMKO+kM8/RymoeclZdtD8nVgAtWR81xquL6WA4=;
        b=AKucldy0BSWrP7oNT8dckrFs2XKr+kPsLDTCwO5aTwfn9ZM6ypppS8GYXHvn6yFHIy
         alTTkc2FsgwFb1fSNIc9kg/cc7j9pzJ57JYZ4g0AB7KJFclLMz9hVpyuCKDU08BqBRjk
         7Q7ZdQHftrltt6VeVumPpfqMvLVjoqfVUukh+Zc4FjDCloK92TLr1WEDRQmUV1KcwnLM
         D9qoq9MG4Xxyr2mkp6G08qz6CAJUg+zf6dJNuWVQ+ZG0jYy6S+6upo2sKCGVcBch2CMr
         St9eoBvZnlT3sGRddYiCvEM79jH0ezgVCLOdTCOYweMj/P/0xMH1Ct3NbXNS+RI8kZBY
         mnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438143; x=1791042943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/X8WtMKO+kM8/RymoeclZdtD8nVgAtWR81xquL6WA4=;
        b=pFLbfp0o9UAj5+pyod339zAfa32/2CTjrEzU4rNroccZHBKSS2/KpBLR37dGk5Hk41
         7dHQmFADFx3GSSs1D44KcaadQ0l2EaFjS/1ppmIdkp/6S8uw5cZznTqvLdrhkcVz5WrS
         881YGpYhuil8ffTkQ8p4pLDPyjZzUBdRaI+OPiNVg0gk4oed7yBHQ8rHvqSCQrovz05a
         rAe2gL+M5xcJVPh64U0HRNZ8Vl/AjdoywCMGiKw7hc8selVUK7n9ItcSHSqNH1vpq7YE
         zCQ67yG4JHMywLumkB82co57Vs9APnZ7ppkqOHulTGBhLzfIMrkxC8e+bq/EzESNWyAv
         7vxA==
X-Forwarded-Encrypted: i=1; AKwUvBxZOnsuK2+y9VLkeAjImVGQvtyp4T0bWZ9VyD/EmOTkXloP8qJiFPCJNluoVJjpz/qjq8xs1jx1kc99K+NAzhk=@vger.kernel.org
X-Gm-Message-State: AFuF++kw+ZI0VWf/OqRTbjWHp+S8PFmf4GqdXIdqEz56ka7PQr92iECL
	U83UIXQNYmGiZxI8NIGkGamGc87ppOSJLQVGmDZvFsIAU/S0ODrx6IeL
X-Gm-Gg: AYBFou0jPxESQ3qXlzZ2heoJO/zKWbZsqKkcJWiUR/AX99e8onymehw1zq7qg7wzwGh
	ATViymzGfwVIgr99921WR1kWVlYQkRxt286kv946GcMeLjpN7ihJAhj7QNkRFXHUag4sNFbovQj
	Dv5KRXmPdzNWFTtXJSge5Wo0VMGYhyRt6kLp7tk6RTi4a/qvQi6X7oJD+2dQHbV12XyZ3ivRlkv
	BFo8DAlEderTPh1jyG3hEZNLTdawvXn1nfBe8zhrlRPWlLgtQ0fLUes1WPCp6IRKpPMyGadu3Lk
	xk6+PmGdz+b8V2WEyORQj5+Qeg17jHHSiBj0oy/EIGG6CouIZTpglWCk4wdPChXBJ+GyOwDEw3u
	zXAZnOMIi8nhRtAI1OoGdWeKJW97zXRkawxWC7L9P5z0mv1k3kO6QlKC3srMksPmdZ9rA5SYwXY
	5tqIZmGjuTZ3+MiBzIq/FO4Eryn8W90+CUi6qNrXOuXtW2OxG9B+rkN8/WokdRN6smyqJD7c1Nz
	gNE4oqbVtWmll1cwuFHN6/+D+tvQz8ueihvhrK3vGegg+x+zA0=
X-Received: by 2002:a05:6808:23ce:b0:4c0:9d00:b46d with SMTP id 5614622812f47-4d72be38df9mr8255004b6e.13.1790438143549;
        Sat, 26 Sep 2026 08:55:43 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74e99sm4577446b6e.4.2026.09.26.08.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:55:42 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/2] selftests: riscv: vector: Fix the check for children exiting with -1
Date: Sat, 26 Sep 2026 10:55:35 -0500
Message-ID: <20260926155535.306111-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926155535.306111-1-danishkhateeb03@gmail.com>
References: <20260926155535.306111-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vstate_exec_nolibc and launch_test() look for a child which failed with
exit(-1) by checking WEXITSTATUS(status) == -1. But WEXITSTATUS() only
returns the low 8 bits of the exit code, so the check never matches.

vstate_exec_nolibc then returns ctrl as if the child had succeeded,
which is the value the harness expects. So when a child finds that its
vstate_ctrl differs from its parent's, it prints an error, but the test
still passes.

Compare the exit status with 255 instead. A successful child exits with
its vstate_ctrl, which is at most 0x1f. launch_test() already failed
the test on 255, but now reports it as an abnormal exit.

Fixes: 7cf6198ce22d ("selftests: Test RISC-V Vector prctl interface")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/riscv/vector/v_helpers.c          | 2 +-
 tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/v_helpers.c b/tools/testing/selftests/riscv/vector/v_helpers.c
index de6da7c8d2f1..8942ddf2b52b 100644
--- a/tools/testing/selftests/riscv/vector/v_helpers.c
+++ b/tools/testing/selftests/riscv/vector/v_helpers.c
@@ -81,7 +81,7 @@ int launch_test(char *next_program, int test_inherit, int xtheadvector)
 		return -3;
 	}
 
-	if ((WIFEXITED(status) && WEXITSTATUS(status) == -1) ||
+	if ((WIFEXITED(status) && WEXITSTATUS(status) == 255) ||
 	    WIFSIGNALED(status)) {
 		printf("child exited abnormally\n");
 		return -4;
diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
index 5f53e5e8ac52..05f18b13a36a 100644
--- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
@@ -74,7 +74,7 @@ int main(int argc, char **argv)
 		exit(-1);
 	}
 
-	if (WIFEXITED(status) && WEXITSTATUS(status) == -1) {
+	if (WIFEXITED(status) && WEXITSTATUS(status) == 255) {
 		puts("child exited abnormally\n");
 		exit(-1);
 	}
-- 
2.55.0

