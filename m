Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D9C3822B0
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435534; cv=none; b=JUcLBoHTWBdx7QcXSfu85zOdiEN6g9+mLddh4dx3EiQ12dmGWoJrvhsZJ8X315I1EhM1e15SeTFrP/4Pxiy4YBLl6ZWf2Kz1b/1QtIk5IlyabYKsgmDHD4Ce+fUhaNTv/b01LUZdtdGZhmMwHhn1QmIQJ3arOMT2FJvHmlW32q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435534; c=relaxed/simple;
	bh=1RfbEstq7Ctycg2Jjjbdik5k6wt6QjUzw7dgsIUK4B0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsg6Egiu5W1GBtNn3RWzfVIGiVexQf4L60NglW41EmvZ2p/9qFhiTt//abu6l1nu9JBtI9uvwg5Pcm4LljUUv3N5Gw8eaQ6I719BkrA7geuhETIIayS2W3xMPowC1rQCaLP7dRjM2CHyrrjTWKS1leqwnshBxy8Ii874DZ9viJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Gh01QykV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Gh01QykV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so25193475e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773435529; x=1774040329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iETlcb04uVTRpZaVmkcYa5KMez1NknEs+5aPJ6reEiA=;
        b=Gh01QykVHQt/Jmjc8t4Jh+wE9xEjnw99M9n3Yu2B0QxzcwDWP8AO8ZyKFJ9jxw5Sjn
         39//qw5978H0u1V+IR6BFQbpsiaoar1SWHOAM2y/Zq1IOsvROMeQIENZ7VA7/aXoyD56
         YNnDZR5WcdgCNvLg7J4TaTFqOqZNp5QGxdPW/k12DQ6fMb7KFxGmXmARFpRWR1mh/4cv
         GQ6a43Ag9JsK5bO2C3fWtsdYM8BYNgsTsYhg/2lrxKa0zs7YKPqMFnINYDSUTap9q8eS
         JrD0CBLviiJC1UQugSLEbN/vxFE0qUdwvmoVvLar7cLZLaSuYrwriS+IiDypwFZKmAtw
         LQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435529; x=1774040329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iETlcb04uVTRpZaVmkcYa5KMez1NknEs+5aPJ6reEiA=;
        b=mbRrHInPWrsB7cHGMk2Jfk+U2/RG0i9hH887POHjTRdYl+YjsuJUUShrRg4r9sIeSG
         mIYu4JJF7M7zZ6aCzJ2Tir2iJx+6m2tLgLX3Kig49+kXMd5wsztQl57wr9QQ6z68BzRN
         okZm2Nr/RO7p0cyt2D3EDelzJM0d6GJwHq6Nxqy9NIKnW0oAaWw5GedBq9R376cc2aZG
         +78vEus7hzfXVjJUsACfJXvLv2x1w0CmgH/A/KbWUUwu0DZq8ybBT5MEUSBZ0RBMce0n
         fjTCLTq/JMiWshw1QVgOEwER6nJPUHJQSFJKuYwcIJfeUaNYEybRwUn/dsNtE1ivLi+i
         Z+5g==
X-Forwarded-Encrypted: i=1; AJvYcCUlMCncoewwahOfRlZfuNNwuZH64AEcyn5wiXeH3HtH2cro5us7KWl5vHilf8Ff1D23XjgV4XMUrd1TXmhAxkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/AoxwlEIeC2AY5Ad8PMnTz0w4ykAaQmnVYdmz5N97mY69jL+A
	ZqockN3ZShZkymUfpjp9ZGuTQGM8V/gg23yddCjMezyTTC5z1dMl3Wx1n49q6mJgFwfbvCnAV26
	xVqtD5gM=
X-Gm-Gg: ATEYQzzCAru2iAs7hyBpWXjVzYhvxP54084+plGKECQc+iLSqCKZwScwxuu6IfUsDyb
	BGRDyz+gHIBFam0GkU1T3psFJXN92uqGPLIDV8hNlRvKyUKM9jx3jk74A+3MQdvyIln+jCHtZ71
	yrwGtJtSo6/2GK/RrY1vo6MAdTwjyxwFVe3IJO41o0i1yE3umsd24vuKMX+DOR3BFr/az+6z/M/
	eGRPQePYzBGWjcFP4878G0nfDT1yFqxxU0tDt2RAA1p3xg0icRVyzsfBtIuN0WcMfwp7DSrJTu8
	48/rf/IcdaHglaRcHa6ZOvj/0jCS6qCIZLPGQ74Goc/zhqN0mmo7OPz5s1AsI/Bkk94cvrf+oBf
	c1/AVomHjqe0TUHWKFBYKBsJ4F57PJhZ3BpcA4ah31mOffh3Rd+FU0WU+MccM+bEJUBdFs27W1T
	FE+7kULkjYPYzqiy++8Kyw
X-Received: by 2002:a05:600c:a45:b0:485:4006:960c with SMTP id 5b1f17b1804b1-48556702a7dmr80842015e9.16.1773435528862;
        Fri, 13 Mar 2026 13:58:48 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:834:1300:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d3csm4042611eec.18.2026.03.13.13.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:58:47 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 13 Mar 2026 17:58:33 -0300
Subject: [PATCH 2/8] selftests: livepatch: test-kprobe: Replace true/false
 mod param by 1/0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lp-tests-old-fixes-v1-2-71ac6dfb3253@suse.com>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
In-Reply-To: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773435515; l=2034;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=1RfbEstq7Ctycg2Jjjbdik5k6wt6QjUzw7dgsIUK4B0=;
 b=R/GLdILhXCj8zr9ANzfi18u0WJVrCq1VW4lQo+ZqgoW+db89pYy4Iz86oJs/y0P/+VEgo2FKf
 LOOHZgWkIL8Dsc4KGGsnzlUUdTL2ENdD52Z9KhNOzQydZXdxZIg7thn
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Older kernels don't support true/false for boolean module parameters
because they lack commit 0d6ea3ac94ca
("lib/kstrtox.c: add "false"/"true" support to kstrtobool()"). Replace
true/false by 1/0 so the test module can be loaded on older kernels.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-kprobe.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-kprobe.sh b/tools/testing/selftests/livepatch/test-kprobe.sh
index b67dfad03d97f..cdf31d0e51955 100755
--- a/tools/testing/selftests/livepatch/test-kprobe.sh
+++ b/tools/testing/selftests/livepatch/test-kprobe.sh
@@ -20,11 +20,11 @@ start_test "livepatch interaction with kprobed function with post_handler"
 
 echo 1 > "$SYSFS_KPROBES_DIR/enabled"
 
-load_mod $MOD_KPROBE has_post_handler=true
+load_mod $MOD_KPROBE has_post_handler=1
 load_failing_mod $MOD_LIVEPATCH
 unload_mod $MOD_KPROBE
 
-check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=true
+check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=1
 % insmod test_modules/$MOD_LIVEPATCH.ko
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition
@@ -39,14 +39,14 @@ insmod: ERROR: could not insert module test_modules/$MOD_LIVEPATCH.ko: Device or
 
 start_test "livepatch interaction with kprobed function without post_handler"
 
-load_mod $MOD_KPROBE has_post_handler=false
+load_mod $MOD_KPROBE has_post_handler=0
 load_lp $MOD_LIVEPATCH
 
 unload_mod $MOD_KPROBE
 disable_lp $MOD_LIVEPATCH
 unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=false
+check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=0
 % insmod test_modules/$MOD_LIVEPATCH.ko
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition

-- 
2.52.0

