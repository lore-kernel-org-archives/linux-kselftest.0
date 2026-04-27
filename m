Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7673ECBD6
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314686; cv=none; b=OpSZL4yrwejXrIMYe/zsEjPyojfaGoXRaQLbK8B1paM/fWfSTdsuIysStOeiAUVdBwyocNOPDt09lOZp53c1POeJAyDihQYpkJwjzoBPPJtJXUsNthRbjeqRK0yJCdGna1B06HZyjsgImVncT/dqYRy023gKYkRALnFiJTSDgJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314686; c=relaxed/simple;
	bh=QU8Gtp2Ecj/0+tiSHgBo9A1bT/rtptLfgh2zpMY5Do0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhL6A+90EXKbQcwMbvUCIrcjWitQW/BlxWV07BtPS3BIpQONCy5+Mx1OWSdv4vLrSac7TDMz65+5EwJOOTuHr27NAgCghxAbW88m5DvfyxFYa2TDjYGJh4oA/gofkfRHMDAi/khtmpz6a5EVPNWFWuXZlwYVW/L6c63DieToY1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D0Pq8NKJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D0Pq8NKJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso87528515e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777314683; x=1777919483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKonRafws8Vd91X048+WRAFvNsFSWQAv1Z7gxzcqzL4=;
        b=D0Pq8NKJG2sc9riogzH2vYvufrHsFkcTlcQc+3dB6Uwo+EWglXn80tOrKsiy4/xKfS
         u8zhiEsT3q+9dduJ5HpTof7fDbKqgyDUVuWJIMO/WaGcIXI5Q/4RAYAhZiYfiKfyJXk1
         PcX6Be1tsfvvsNi9IfulfANHWcMw9Gs9Y3e/OR1S1L9pqY2mISW6Qy8/Uo2JMhSDLMVG
         cauEvWzZaNNyqM0m2yfe5Fg4+cttwXRg0hS0kyTfRWSrptMhY8sqfOHb6OArHc31Fw+6
         jdWExfzVd+qvyIKtyNkf+3K4P0ViYPHhVdE4TN8FoGxmTTecITkk0VNz3Hv/KjgF4SiW
         63Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314683; x=1777919483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bKonRafws8Vd91X048+WRAFvNsFSWQAv1Z7gxzcqzL4=;
        b=UK9MXPEIrL8xDKo4UZugopdZ1TK2dzg9F+05liQNQOWRkwnAyAYrWo/LavR8EDA18F
         b55prrubfd5i6xRnXBQbTm2EMevXHJbedcKci5Qjn1NygogS845E55BXy88FInNZW7PF
         yxLAct22DCpiNNaNoTa6zaTfib2dGJOCV2f56bvpVF1Yz56L8TttOD0Sp6SDR14dz90k
         cemEqYvVYAu5OX08aZne0ft9GshLCICWOa1V88N5hvoQN/HAW4nbfL12Zq+IBsf8i/3l
         yeVyXkCGu1XvPAzIbcY73bSeNeDB+0Wyi2g/TpUUdN//GP5mY6LAFu4ZROh4ScYSfKxJ
         2yWw==
X-Forwarded-Encrypted: i=1; AFNElJ/N/GawLoS1N09NcGmJjFQEUicLFo7XH1ldoPi61heDahIFmACyw8fvodcvqC90oFXRALhzxFxkpSVc94qY2+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx65G6ow5mo38+mbt4m0PTltUSjl+NQqX+m4ZQJJDsCSoIxXQU3
	3724FlScxtkOvE/lPmPhFPzhOn7hayVx0MYEsKd0zpk7ZDHArVVWbVycWnr2LARWBh+MzH+tL3V
	A66uL/g0=
X-Gm-Gg: AeBDievkQJUVfRf9Vd281sI3kmY4lf3OPV0kGEibAvfGBh3TBjPBXSNhm1S8pPQ3MWZ
	qcIB7VXUMJIIzHJ1oneS0KMe3qDd5KTXgnBAi2jbf/0DkgTHXHwt/X82qfcmOwDFBilCQC3Y0d7
	xHFPDW0NT2bmr0Vu0pBV8BmkON2c+Cn3+/OO5NrUdHYRVPXtg6GbfYTe2HOwQmyCEyQdlUMMimz
	XWdkUOIYwL85vNhmUbzvWOSpoh2/lbhXEegu6vfpkr0bHxWwaHF5FUwl1gXB6w3pQBOK/VaY6Ih
	6tjehh1uQXznffctBRc3skV4I3CHlYlaVbdfYnagHhlDtKO1bRnQkL1j6Gz+hNbbwUc9cnW00JV
	SgnbawiTvt4ZIIIXPMCgcR3unMVFvLMrWpBzW7idMztoisKY+MD62jrPWgntq/hc7oUzqyJkFk0
	EdRNnX/fgFEIfmlxenRbtYoVT8HofOjQ2JXQ==
X-Received: by 2002:a05:600c:3556:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48a76f7a44fmr6695485e9.19.1777314683233;
        Mon, 27 Apr 2026 11:31:23 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7749cabdsm1182065e9.9.2026.04.27.11.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:31:22 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 27 Apr 2026 15:31:01 -0300
Subject: [PATCH v3 5/6] selftests: livepatch: Check if replace sysfs
 attribute exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-lp-tests-old-fixes-v3-5-ccf3c90f744c@suse.com>
References: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
In-Reply-To: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777314662; l=4029;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=QU8Gtp2Ecj/0+tiSHgBo9A1bT/rtptLfgh2zpMY5Do0=;
 b=0WwirADiU13Rzp8E+ypmtQBuew7fE2ZrK1v5NLOQLh4Gr6jPkASd0CPUf05wNVK7xgp1fiUEr
 2hCBPgp0W1rAlSaFxHeDS/y+FQ5OP10BLYXqB2nfRMDrMbKWGCbL2ec
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The commit adb68ed26a3e ("livepatch: Add "replace" sysfs attribute"),
merged in v6.11, introduced a new sysfs attribute.

In order to run the selftests on older kernels, check if given kernel
has support for the attribute. If the attribute is not supported, skip
the checks.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-sysfs.sh | 39 +++++++++++++++----------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index 394cf3ff99cd..744c612a90d3 100755
--- a/tools/testing/selftests/livepatch/test-sysfs.sh
+++ b/tools/testing/selftests/livepatch/test-sysfs.sh
@@ -9,6 +9,7 @@ MOD_LIVEPATCH2=test_klp_callbacks_demo
 MOD_LIVEPATCH3=test_klp_syscall
 
 HAS_PATCH_ATTR=0
+HAS_REPLACE_ATTR=0
 
 setup_config
 
@@ -22,7 +23,6 @@ check_sysfs_rights "$MOD_LIVEPATCH" "" "drwxr-xr-x"
 check_sysfs_rights "$MOD_LIVEPATCH" "enabled" "-rw-r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "enabled" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "force" "--w-------"
-check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
 check_sysfs_rights "$MOD_LIVEPATCH" "stack_order" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "transition" "-r--r--r--"
@@ -34,6 +34,11 @@ if does_sysfs_exist "$MOD_LIVEPATCH/vmlinux" "patched"; then
 	HAS_PATCH_ATTR=1
 fi
 
+if does_sysfs_exist "$MOD_LIVEPATCH" "replace"; then
+	check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
+	HAS_REPLACE_ATTR=1
+fi
+
 disable_lp $MOD_LIVEPATCH
 
 unload_lp $MOD_LIVEPATCH
@@ -96,18 +101,19 @@ livepatch: 'test_klp_callbacks_demo': unpatching complete
 % rmmod test_klp_callbacks_demo"
 fi
 
-start_test "sysfs test replace enabled"
+if [[ "$HAS_REPLACE_ATTR" == "1" ]]; then
+	start_test "sysfs test replace enabled"
 
-MOD_LIVEPATCH=test_klp_atomic_replace
-load_lp $MOD_LIVEPATCH replace=1
+	MOD_LIVEPATCH=test_klp_atomic_replace
+	load_lp $MOD_LIVEPATCH replace=1
 
-check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "replace" "1"
+	check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
+	check_sysfs_value  "$MOD_LIVEPATCH" "replace" "1"
 
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
+	disable_lp $MOD_LIVEPATCH
+	unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=1
+	check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=1
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition
 livepatch: '$MOD_LIVEPATCH': starting patching transition
@@ -120,17 +126,17 @@ livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
 
-start_test "sysfs test replace disabled"
+	start_test "sysfs test replace disabled"
 
-load_lp $MOD_LIVEPATCH replace=0
+	load_lp $MOD_LIVEPATCH replace=0
 
-check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "replace" "0"
+	check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
+	check_sysfs_value  "$MOD_LIVEPATCH" "replace" "0"
 
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
+	disable_lp $MOD_LIVEPATCH
+	unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=0
+	check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=0
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition
 livepatch: '$MOD_LIVEPATCH': starting patching transition
@@ -142,6 +148,7 @@ livepatch: '$MOD_LIVEPATCH': starting unpatching transition
 livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
+fi
 
 start_test "sysfs test stack_order value"
 

-- 
2.54.0

