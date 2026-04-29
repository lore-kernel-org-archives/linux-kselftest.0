Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9E3376463
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473353; cv=none; b=et651+1QwZXTk7z9gBZ/7Ejnpfeztn40FF/TedpgaWa5yNKLtyoSQtcDaM/K1AM1iEI03QZtn0J+gz/XjnGS1yJK2wtkbzWltwoqURwbE4ClR2eHxh+xVufQ3gPBRWl4rMzN3WSDxGPk9zoa0wOX9iuFO9B5focdqAHWyDQ4Uj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473353; c=relaxed/simple;
	bh=QU8Gtp2Ecj/0+tiSHgBo9A1bT/rtptLfgh2zpMY5Do0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YifVVbk7dh6vHby15AtJVCmg6h9a1WWs7nqYUiFuKesEspcebFcAWF7Tzx+V7GvE1/PREcDcCVqLXzLz6WZRg+KkWCJe3p7MhOgWx0PbMXlOQLFD3aec59k1OcVc5pby0CmM0DHCj/FjafWrQKaSLhiI2a2OmI5YnI7VsOa7dck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PUq9L9aS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PUq9L9aS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ad135063so116192215e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 07:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473350; x=1778078150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKonRafws8Vd91X048+WRAFvNsFSWQAv1Z7gxzcqzL4=;
        b=PUq9L9aSq8zhpMWWppSsKzIjONfBvuFVOuDgoniLT60yiXemuIbnOs3KeZ6XCiNKOt
         bRNhKW3nxt+RPxEfNRxWRh3vfx+FLWGz2Usk7dxPE0AN1LqEazEWO/Jdyg7LQk+Hb8fN
         wZvcnFYSFgN9r0PQi40RwolRY5WmTbz5SjGQZGh0/anEWbNBajD3gFS9WHSB4CuKZ1xf
         WV+sG2aTFhTGUY7wlZVNVAsSseFfkLPx4vw/SxNtzlYUboego+5y37X29TQtphbTwZMi
         JAfEBNUIIKsn0PEPnZfZHTbBvkqJ8lhzQstZNUPD/ZqOAgNq7Pv6XcmWBPyTM/3TCFEj
         XfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473350; x=1778078150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bKonRafws8Vd91X048+WRAFvNsFSWQAv1Z7gxzcqzL4=;
        b=IU02FZx2SIzmDeyswnzBCOytmhssmZJGNlpsKBbngGAHfeDVLABotymkpMO1K/pbZh
         kXqu0StUg/P16E+uj9OoGZc2xGOqLabhB62DgMF7c2Ya9oxGzBySyk3IlByj3T5GO6Qo
         hwXR1zo6dVKJVLs8aRQ+vr6q730s9zTdQ5dvFHpZh/i0qnDQ3o1IvaCeWYfgl3m/MpCo
         z+F9OQJFVYnFOpbw7696FzstMkOPEGxn/FfIXCaEDE8mzQTf3c4gmUVLjkucs2S0+pAN
         EH3IvKNR8BQg9D3Dm4ydPADNqTTMeYS3xhtODii7wQTvmUEHAVJKVaixVpwpkTogWDnW
         MqBw==
X-Forwarded-Encrypted: i=1; AFNElJ8AgkCvnkJ+1QA9fVy0r6wOFiL4e3lZc1YPUhEDH9oizP4ggRlO7APLTLYXbvH9ML2etJILrTk+yJOnoK1gpJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBYKx7Ozs2RN1UZjnsOBpr66iHBTRqCIcASFTpLrr6ijOOg1Te
	aweCvSTzh00vTd7LEqecCN35Uy2Ln9bViFxr+yBzaAvBQgxkCz7MaS+Uf54Ye/VbL4A4MauIGUu
	hIA9oCGA=
X-Gm-Gg: AeBDiesjp7FiOQ4L1vfLgdgfQDCuSVGyMpJAXyZAVlH3yRf5xMNGRX1qOxhnvcQJXz8
	bN4uENPn9eAyUEFwUGGVrfhCc8ihBhZjkojpDi7R3ku/p5VOidAbnlpd5ZrP/6ATwVO/WfVTSx/
	oCRlDB/ZdkdW7N726cOqN9zA5iJV50yp2sOLny0m473dOjVgkKLtj+fbwW05Oq2cb2QtsflBUJR
	JFJZHk9v9VGGCJoofkf6tYPWwxU1Yf+PAPEPG28oOkNb/4cPMjLchaGHq6NxhAHoYSPOTMBLI65
	pQcNzfAIpU8NdwagrBzrQH0LpL6YYOlRM3KWmdi7Wiq+55PTGT8teyNnEahseNYDFG6u3/3caQv
	b1VOsZgpurqhYllETlvUhxPa+SOox6VNY7jbhrJzemhT3aCuFIX4SZlomSO8P+It9kRLm/PdN1B
	ST1rcXQGJJuXzrqYcaXqUIz30q0j7kDUkLnw==
X-Received: by 2002:a05:600c:470c:b0:48a:7965:b92a with SMTP id 5b1f17b1804b1-48a7b54bf53mr76042645e9.26.1777473349588;
        Wed, 29 Apr 2026 07:35:49 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c305371sm19982835e9.18.2026.04.29.07.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:35:49 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Wed, 29 Apr 2026 11:35:19 -0300
Subject: [PATCH v4 5/6] selftests: livepatch: Check if replace sysfs
 attribute exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-lp-tests-old-fixes-v4-5-59b9741989d0@suse.com>
References: <20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com>
In-Reply-To: <20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777473323; l=4029;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=QU8Gtp2Ecj/0+tiSHgBo9A1bT/rtptLfgh2zpMY5Do0=;
 b=Lycen9BKPhebiEKZl9TSNU987mTmLpYyteRqgP3CTcgN9CiXnSvtJsHnTuX552EMfhHDVA5CV
 Iece6KPnFmpCXsw/Ke/Cefp3DdzK+NbDfHzaLQ/yplv0MfTTqNcig28
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

