Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25260274B37
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572557; cv=none; b=RPS469N6CAa5ipKNFGmZnd9q6WRpkmBf+ncUZYnyuWIiAWwK9anlEl0yI7Ev/KxCXx0pFhjQmXGMJVbv3VXd7mnXguwv2ypVYRgPx2TmbNmwC8XOgEHhGO6ZLm0Tf7TPv77uPfNfeuWwzPRb/UipvEMXACfXcz5+uAzepxqXhdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572557; c=relaxed/simple;
	bh=KDyps0kcTr7T9J7GuBB29GJhWFeBGQihHTwt+gW0qf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNCQOzZFlYqbLE3KG8shfibHDdH2Iz+frVHOO4MQaNOZ/G7yWV2mrCYgz2EIUYOAYedNuv2gqAU/UgeTHyB2fkTioSGQciyIEFAcFh9CPlCqHUE3LFcAeIIekkRgF/V3Ata4kmp5lHnav88HdYjMzEcGCM4oUviEIqbcJ9sOeps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AJjtFnCh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AJjtFnCh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso42721535e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775572554; x=1776177354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ukt5NWqBecP1NcuRSmjZ7NqX4Lbk2NtstpvbaJriLXk=;
        b=AJjtFnCh76VL8VqUpXONXZ7BpUlGCl+wVkcSE+Aw/04K1VvFrREAvbfhKBlYCjDlfM
         /XxcOPN9dDLhqEWbnMgEdNOa5pvojF8nXdzxmo71n0gM3cBBbSSiLgYEFCsbmZ8HcpVr
         kxlJf4nkFAkyraaPf5EItXh3a0r1EMcHYxrY2EuzejcRaIGLTeR941DWu1chTnMo4q9X
         cbpvQWlOwQSUw0qVyGONYKZcRYdk4PMakEwkJJ8T7gUmHcScluxwA2P7IqgvBO8qyPiE
         m3xajjOXmP179VnyTQsUpw3AvIw7qhscueqHgCF9JSKXvZ7GFimU+vL0abyfAN1KYLrC
         xe7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572554; x=1776177354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ukt5NWqBecP1NcuRSmjZ7NqX4Lbk2NtstpvbaJriLXk=;
        b=skjBaF/tLzE5xlf1VSxXQH7GUYasbYAwYd85FclVEzpcVmJxMAsvtjLQcQmphXIsUK
         wFdRAfr4qdobP/XDNGU0Mj3V5zTnINx8Y1RhCMnEItNTSc7u4No21K6lOTHzg2z5ZnR0
         sq1AqXBPWpqsFkjhsqBIQ542ecOf3AYiUbp+2xxpkf8B3HmrC0Mc+7sJ1X4u2dd6CpEa
         lIXCeA7T8I8/FDZC7BHotYUCgpfiNAnxmU8oFS0hoPPtO7Kw6dVp5jwWCaF6gYy8e316
         f/UgrwhgvpO/p5RAGmaFpkx/etuVPgSSUezseGBVHTBtl5i39D799IFh90+4phOyFdy8
         WzPQ==
X-Gm-Message-State: AOJu0YwVkwYNEcrKaDFOQytC4eMycBJs1woB9cK2LC1s+rBHPIwR6Wnz
	5scxkOXAfFKSfvUBteqC4BrvgGWlLZ6lRqDaLmDNlI5x+vggcYoHIg9S/UxNkUkQa/o=
X-Gm-Gg: AeBDies98tYHwHgq2EiqGlMsMIFnafsGTtcpysM63PIECA3F6wPXMkIitbyHVeNTTVC
	inuO2c4eBHdbmSUEZw2nlCFcBj+oLfYSZUFeLla4SSRqMOS7TDGX8vytp+be1kxA+BdnueK/Y5l
	rLssplm2H+lwTy/Q188F5AWhZXbxQNZ+gTSTCmXnk6OMLHlj2DbRWAiyNFsBBxAmPBe3LisdtUL
	z5VY/paBqa5gJj/Pv3xQPT1xUSLjpBREie0CyhcXwtOQO618MUGJAlxWnTE32Pe/DQ8bkceHBnY
	1/omzxCuhEwpr/6GOnZsx4FBCELRfYqSNIXHyQ/B5/v/IYMaWGqjunixr5gMRRWFG0oieTy9c6R
	SzRnOf4D4rTJsHR3u/U5sXe5gxO0wdajC3EsgCiXcF9shqmTONOJXtmWTdEN9VE7/5GW2f/zCTu
	A7XQ3nvfNCdlP7
X-Received: by 2002:a05:600c:a410:b0:488:b726:6daf with SMTP id 5b1f17b1804b1-488b7266fd9mr68006725e9.24.1775572554508;
        Tue, 07 Apr 2026 07:35:54 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cef60a435dsm8251268eec.10.2026.04.07.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:35:53 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 07 Apr 2026 11:35:45 -0300
Subject: [PATCH 1/3] selftests/namespaces: Kill grandchild in nsid fixture
 teardown
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-selftests-namespaces_fixes-v1-1-59109909d88b@suse.com>
References: <20260407-selftests-namespaces_fixes-v1-0-59109909d88b@suse.com>
In-Reply-To: <20260407-selftests-namespaces_fixes-v1-0-59109909d88b@suse.com>
To: Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775572546; l=2577;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=KDyps0kcTr7T9J7GuBB29GJhWFeBGQihHTwt+gW0qf4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA/grReIxdB2qJIGWyTXSHgCmtk0IfhrJFKsYfdGxLDcCLR7+iNv7TU1f/gn14etaaNhjPhN5S6
 G/5DnxGgM4Qc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The timens_separate and pidns_separate test cases fork a grandchild that
calls pause().  FIXTURE_TEARDOWN only kills the direct child, which is the
init process of the grandchild's namespace.  Once the child (init) exits,
the grandchild is reparented to the host init but remains alive and
continues to hold the inherited write end of the test runner's TAP pipe
open.  tap_prefix never receives EOF and blocks indefinitely, hanging the
entire test collection.

Record the grandchild PID in the fixture struct so that teardown can send
SIGKILL and reap it before dealing with the child.  The grandchild must be
reaped first because the child acts as its PID namespace init; killing the
child first would kill the grandchild without giving us a chance to
waitpid() it.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/namespaces/nsid_test.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/namespaces/nsid_test.c b/tools/testing/selftests/namespaces/nsid_test.c
index b4a14c6693a5..46dc838cba82 100644
--- a/tools/testing/selftests/namespaces/nsid_test.c
+++ b/tools/testing/selftests/namespaces/nsid_test.c
@@ -25,14 +25,24 @@
 /* Fixture for tests that create child processes */
 FIXTURE(nsid) {
 	pid_t child_pid;
+	pid_t grandchild_pid;
 };
 
 FIXTURE_SETUP(nsid) {
 	self->child_pid = 0;
+	self->grandchild_pid = 0;
 }
 
 FIXTURE_TEARDOWN(nsid) {
-	/* Clean up any child process that may still be running */
+	/*
+	 * Kill grandchild first: timens_separate and pidns_separate fork a
+	 * grandchild that calls pause().  It is reparented to init on child
+	 * exit and keeps the test runner's tap pipe open, hanging the runner.
+	 */
+	if (self->grandchild_pid > 0) {
+		kill(self->grandchild_pid, SIGKILL);
+		waitpid(self->grandchild_pid, NULL, 0);
+	}
 	if (self->child_pid > 0) {
 		kill(self->child_pid, SIGKILL);
 		waitpid(self->child_pid, NULL, 0);
@@ -676,6 +686,7 @@ TEST_F(nsid, timens_separate)
 
 	pid_t grandchild_pid;
 	ASSERT_EQ(read(pipefd[0], &grandchild_pid, sizeof(grandchild_pid)), sizeof(grandchild_pid));
+	self->grandchild_pid = grandchild_pid;
 	close(pipefd[0]);
 
 	/* Open grandchild's time namespace */
@@ -797,6 +808,7 @@ TEST_F(nsid, pidns_separate)
 
 	pid_t grandchild_pid;
 	ASSERT_EQ(read(pipefd[0], &grandchild_pid, sizeof(grandchild_pid)), sizeof(grandchild_pid));
+	self->grandchild_pid = grandchild_pid;
 	close(pipefd[0]);
 
 	/* Open grandchild's PID namespace */

-- 
2.53.0

