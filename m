Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B166434F49F
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 17:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776101190; cv=none; b=mQsXvC0/Rcmm4G0uPNc64gS/0WtQ+rqYC+D0gt8i3HteHu2lWf6rxt/hmwuVi3OticW5MNjpjdzwZa8Ein86FB+pQDLDc+7voO9nz9S+4m6XCZxeqtXwSsP/pdUl/WfThpsqGrlJNQkXnC8QeHvdE/RWi+gspACx6upgAqaeD5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776101190; c=relaxed/simple;
	bh=Fi4+7AICroGl4vhocOQqTHqCQjKzyOoENh0mx4bHYLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lzAuBT9k0Uf5Am8MJmpL1tTdeEEAunb+dhkd10B3sIRObkDPoHfRHwZlfgOI94kSYaSrqphbI7lm2CNL5CD2COaMr6Nq9CuvkeN+z9mh/ybujbMTbEtkKCCMgq478hJDePZc7Atdv1wsHIcEJU/jdfM5IrLI7bnu0dlv75cTnlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XsYaF6E5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XsYaF6E5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso44857355e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 10:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776101187; x=1776705987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaP2vHabUvVwwJ9A/fhi80sDXR9MK/2TXs2XnT7TBVQ=;
        b=XsYaF6E5lcETkbYwezzYRorO4hkuye+gcuxfj5r+6jPmGBTDnruQdsvvpTCuh9SiTe
         JpRL0ns5u5KeUvlU/Yv6Bbt6Wl7QawnwNeon9u5U1vuqXyuMPAp4NkrARlCI4E2iTM2m
         dwNoLPGOZuDGreHEv6Fb1Rt815bWpc7ni72Ni2i1d9ajYi29+/i2lDidjucKzcaleplo
         zSned0zgRFqtsvFaaShPzxdvSAWN/DtEnxYAD284Pd7FEOE8XxfWcBAiHQehEI60QBJH
         QmyafC/HGZ2AfODe5TwmeCTnGFTur9s3XVBijvpEtWnkmTfmBmJhmiulDMn3HRrEka7c
         S0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776101187; x=1776705987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VaP2vHabUvVwwJ9A/fhi80sDXR9MK/2TXs2XnT7TBVQ=;
        b=eon6y3OXMWVyeX/RddPuJR7hATJ3u1DN5aettm1cyITFqx8Rc/Dd42Z8tMu7OoEO+4
         x43D35BNmfctbT0nRVroon6GGsZbaLoYSb7EKs07MIXj3Kud5fax+fBYGssRdH7MxCEB
         1eTVh4r9t2WWrhy4vp2FSf0u0DlQhwDj9uJ3PYtwWmAUiPHI8hiDPkMcc1xydshuR1lc
         TK0k69VDmYXAyKpcVaAPoQAHcZjadfTSYIdyu4R2IonAr8bAIRUbmOt33SKwSz5VEvFN
         b6MqJUIzhGfDYuP75V7TkfVc9ikl1qi06A50RnlWVyZLxBpHSy4b88eYoa+j5sPs3ihT
         tP8g==
X-Forwarded-Encrypted: i=1; AFNElJ8nwJZkMhkpnRUtS8fzXcle54GCswNCkAlfsPQzAfwXEVapADQVt2XG4Tfqyuf6lfpcIu3IqIHqU9ayjGkQeqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSKjMdzYMCbykCk9rAzGsdgRtdb8wqV6GstumMyuwRoYzoi0l
	WD12GlG9F8TFTM8XkHeLzH+kheqclVw5sEq+8Zgs9H2CDb0GCDx+F7GVnl9+vP4Y0ZU=
X-Gm-Gg: AeBDiesnndQ3MK2KBCT14S/OVG2PIbo6Szcy6rjwG5CC9Fsdso8BxyWXTxb9Rh8vYoh
	4unAwP50ZQ4yzHUMoSg0MbBNb3FFEcrUi1NrdAIDS5bdl3ysjanBAJvqwHs7UyPCTKr7gn55C5r
	xk8xJjaqt7WBLrBNk5XQakblXtcrbqetbZHk3rxNn3q57gbLCUOcUQCPgGfCHHUMnMS3CeyiVLp
	j0msqYzcYCBTE9Di4kiqOETyejxn9Xao11WIxq4emKDspEZTnOcuLgbKnEffOqD/9CkHE5wWfYf
	PAmfWWtlc/iY2srLTrMhlc9YEj7SYF8NFql1coivSUjW7Sp0wsKFoF//u9qxBYKCCxJFsBaFeKx
	ImSpHVM2i77KF8TfsH65zPR3MwR3Hi5a/BXoiBr+5j8Vbi+INlozojHwqvGLDO48yDVga+GAsXa
	LTutzCOc7bPBjjwSFp5hQv4Z0=
X-Received: by 2002:a05:600c:19cf:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-488d67ebc6emr178850855e9.4.1776101187020;
        Mon, 13 Apr 2026 10:26:27 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5734a94sm298657835e9.0.2026.04.13.10.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:26:26 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 13 Apr 2026 14:26:13 -0300
Subject: [PATCH v2 2/6] selftests: livepatch: Replace true/false module
 parameter by y/n
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-lp-tests-old-fixes-v2-2-367c7cb5006f@suse.com>
References: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
In-Reply-To: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776101176; l=2032;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=Fi4+7AICroGl4vhocOQqTHqCQjKzyOoENh0mx4bHYLw=;
 b=JCSHLKl+cUG5/m3NOooT543BR/62amPmAKcy+Xsn7J91nX5HLQ2/4uwjmsVJXIet6d2T2D/xm
 /eyCINyZ7G2Bziq+545E6lk1yDwTvdavsP8dBeadjlgI95ajuau8qA5
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Older kernels don't support true/false for boolean module parameters
because they lack commit 0d6ea3ac94ca
("lib/kstrtox.c: add "false"/"true" support to kstrtobool()"). Replace
true/false by y/n so the test module can be loaded on older kernels.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-kprobe.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-kprobe.sh b/tools/testing/selftests/livepatch/test-kprobe.sh
index b67dfad03d97..7ced4082cff3 100755
--- a/tools/testing/selftests/livepatch/test-kprobe.sh
+++ b/tools/testing/selftests/livepatch/test-kprobe.sh
@@ -20,11 +20,11 @@ start_test "livepatch interaction with kprobed function with post_handler"
 
 echo 1 > "$SYSFS_KPROBES_DIR/enabled"
 
-load_mod $MOD_KPROBE has_post_handler=true
+load_mod $MOD_KPROBE has_post_handler=y
 load_failing_mod $MOD_LIVEPATCH
 unload_mod $MOD_KPROBE
 
-check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=true
+check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=y
 % insmod test_modules/$MOD_LIVEPATCH.ko
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition
@@ -39,14 +39,14 @@ insmod: ERROR: could not insert module test_modules/$MOD_LIVEPATCH.ko: Device or
 
 start_test "livepatch interaction with kprobed function without post_handler"
 
-load_mod $MOD_KPROBE has_post_handler=false
+load_mod $MOD_KPROBE has_post_handler=n
 load_lp $MOD_LIVEPATCH
 
 unload_mod $MOD_KPROBE
 disable_lp $MOD_LIVEPATCH
 unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=false
+check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=n
 % insmod test_modules/$MOD_LIVEPATCH.ko
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition

-- 
2.52.0

