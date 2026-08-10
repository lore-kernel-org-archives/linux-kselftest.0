Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD860382371
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 20:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786395381; cv=none; b=D2BS5GeRCarnXijpKqTMb1GC4ThheGRLFk+tCQ+Ne1iQxOfXbsS/beEgcxibKzFivDLu74We8c16p7os7JfK7tg6fdPlwv+2rQaWeY8Rwevxt3neDPgo3L1F+OgBCDdvKijyaueHGy07e68KDi9I6CQ1/jeZm0uOB0nJgCvTldE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786395381; c=relaxed/simple;
	bh=g1qunPZef/v32X6gsoYph7lKJyJHMnhVcr3SRaJB95E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rzIvo4Nz6t9wmWtWkkShJCUGglxVhq/dzyjhtxfmYAi8F/evk3IKOBcjjhF2dHChF35XHba++7VGSpePGZZmTvyq0LAv4IP1tlWzWFHM0nbRXP05t78CbKb8BDpPq9nod5Xd2nVg9e+/pu00IaDWNrvaRhP4jLImOwy46P62gy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=dPGGCOlz; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="dPGGCOlz"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7eb34c17b96so1751911a34.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 13:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786395377; x=1787000177;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fM9gXkFDf6Q4+fK1aOhq3yZ+OMkHmF++pbE357q8/Ag=;
        b=aL1VsCAMRBgtDANWaLsKVJIpIyrDOSjiQNGurgpBeHrUQGLbPJ63ZZ3gMiExHSRHcX
         xwSviHSy7SRKTgR3rWZtfIKqJO2WlJ4Ys+nV5OrX1ou8Zb7P9UPET1v3uIqmm+qEpoqn
         30R4Mc0eRwQM5mGpHPsb/tlTDVqyOOIZWjCvwSNu7BNotj/8+OarXck6q1swkOD8D7KV
         KlZYP7h8EJLU/XhAHazEKC8YD6IwV6GSPOLLuT7+OguLEUQ1lP67OI8Ppuqa2YcdyrUU
         Vy0x+dCQKZJNek4qjCqBEsVPiuwrjCVSIVhw1kdWESslTNaEf9JsBoJEMscV56JaOIAn
         p86w==
X-Gm-Message-State: AOJu0YyHQt9NLHe1/ZucIW8sqp7Tg7Ax5JPRmZAgVqcCVuWoVbRv1uJM
	XFtz5FFK0PM+fP4sSbjDiZBzHUB+yX59C9+IPFuuFp9X0ELJmGzA+JXz8Ju+oQ==
X-Gm-Gg: AR+sD10zFyBr2u8BFVEROjImVlrTidFBeE7LmGXZOtNJ5alrAdgoC6jcF/RintPBUQO
	tMFacSiBNEdCFxXI8P933fqHmYbHmgZkd6cXx3H83cNEs+cAe4g64OKo36ucHMWg9O0DGoDfwdN
	sjGVQe96AcFfpwUXZPZERdamh+x6/Ms18CB90y7+F29+jInAneC3ePkb96B0KsodOBJ5FIh9x4g
	ikSn9TF9EmeL2oL/R5ETQhBNPLhhX0DEsL5NyufVAxgd9xKMCLveAeBwOHpkYoFTyQUI7V/JXml
	OMEIpUnB3+o3hfjOOvcNCCgg1eVb/TXZJ1RumtUz1/GtOu8fbBCXwr0UNaHUjqkwl3waTG9qMGf
	CYubI6DIlzL+Y+X3giqZm7uToX3p9p/5KGyMxUqbkc6Z5wcf8a4bIq3s3Y6BYKgv2aey0oX6PtW
	ZtI8vKe6H629x7SNb+uBDUahQKdOeGI/TZ6y5CevY3qLjSTjKqDa07Rp2WIOs9YiZz2fmDNLWQX
	/heBLewAX2lDdpfzJMdtWYCFh4dx7Dki9VmkvsaFhqe9nE4Pj+RKZOLkLtvCCfCvA==
X-Received: by 2002:a05:6830:82b4:b0:7dc:c7aa:22bd with SMTP id 46e09a7af769-7f39a8737d9mr2644284a34.6.1786395377534;
        Mon, 10 Aug 2026 13:56:17 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b76ff90sm7895965a34.17.2026.08.10.13.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:56:17 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FA5F609A3;
	Mon, 10 Aug 2026 20:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1786395374;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fM9gXkFDf6Q4+fK1aOhq3yZ+OMkHmF++pbE357q8/Ag=;
	b=dPGGCOlzRdGU2WcnHIHOvfP0QJl7wrvolJ4HRzXORzaFweoi8lZnT7JloqnId43klKBuBd
	To74ncsbXhTeU6xTMwO89Gph7auVIpcP52tnjNbrLqjqGfv9lcSYcaSsjh2BtfRLn0XGp7
	YEgAtwy1IHyUMcXgU0Ay3ViuW3BY9+I1iDmvjR6LYKeN6bfKvWdGvKnxxFSyYadOugm19s
	gt+vE2AYojSYu7BM40Xr5eP8zCB+oyLV36J0YLRyDSKp5pxAU7Iif9iI02s089+lu/YCCV
	NYEflydrl8vSE1KlFV9akULxRO9wXSID9He/A+Sn13ojf73x3h9yvjxPPGVxNQ==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Mon, 10 Aug 2026 17:56:00 -0300
Subject: [PATCH] selftests/namespaces: Fix racy pipe handshake in timens
 and pidns_separate
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-selftests-namespaces_race-v1-1-4307e833783e@marliere.net>
X-B4-Tracking: v=1; b=H4sIAN86emoC/yWMUQrCMBBEr1L222CaokavIiJJumlXbFp2owild
 zfRn4E3zLwVBJlQ4NKswPgmoTkVaHcNhNGlARX1hcFoc9S21UrwGTNKFpXchLK4gHLnkqq3MZ5
 t7A6nzkD5L4yRPj/39fZnefkHhlyFdeGdoPLsUhhrNTMNlPaTk4wM2/YFsZpOwZ0AAAA=
X-Change-ID: 20260810-selftests-namespaces_race-d8ff98f35732
To: Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1786395368; l=2194;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=g1qunPZef/v32X6gsoYph7lKJyJHMnhVcr3SRaJB95E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOs44UoOC8IHm8sHncVOo0uzlpdK135oaMR7BDAgcXqbV1k43rehmo2d/uoprp4XUzp6CX2vud8
 +gDm3xPQ+GQo=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

In timens_separate and pidns_separate both the child and the grandchild
write a 'Y' readiness byte to the same pipe, but the parent expects a
single 'Y' followed by the grandchild's pid. If the grandchild's byte
arrives first, the parent takes it for the child's and reads the pid
misaligned, ending up with a garbage value.

The parent stores that pid in self->grandchild_pid so that
FIXTURE_TEARDOWN() can kill the grandchild. A garbage pid leaves the real
grandchild alive in pause(), holding the test runner's TAP pipe open and
hanging the whole collection.

The grandchild has nothing to report, so drop its write() and leave the
child as the sole writer.

Fixes: fdb48976b637 ("selftests/namespaces: Kill grandchild in nsid fixture teardown")
Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
Hi,

Please consider merging this simple fix. The error has been found through
openSUSE CI, which hits it sometimes:

https://openqa.opensuse.org/tests/6132140#step/kselftests_run/107

Thanks!
---
 tools/testing/selftests/namespaces/nsid_test.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/testing/selftests/namespaces/nsid_test.c b/tools/testing/selftests/namespaces/nsid_test.c
index 46dc838cba82..a16f31f41d38 100644
--- a/tools/testing/selftests/namespaces/nsid_test.c
+++ b/tools/testing/selftests/namespaces/nsid_test.c
@@ -649,8 +649,6 @@ TEST_F(nsid, timens_separate)
 		/* Fork a grandchild to actually enter the new namespace */
 		pid_t grandchild = fork();
 		if (grandchild == 0) {
-			/* Grandchild is in the new namespace */
-			write(pipefd[1], "Y", 1);
 			close(pipefd[1]);
 			pause();
 			_exit(0);
@@ -771,8 +769,6 @@ TEST_F(nsid, pidns_separate)
 		/* Fork a grandchild to actually enter the new namespace */
 		pid_t grandchild = fork();
 		if (grandchild == 0) {
-			/* Grandchild is in the new namespace */
-			write(pipefd[1], "Y", 1);
 			close(pipefd[1]);
 			pause();
 			_exit(0);

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260810-selftests-namespaces_race-d8ff98f35732

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

