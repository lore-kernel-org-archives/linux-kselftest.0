Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E593E4C9E
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 18:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919731; cv=none; b=Qoh3ag9R+j4s/htAuhgaHEC7MXQxp6wMToNd03zcfcEFUm2rugSrBtSpFXLkBOdRCVeOmBgVRS3CgmKHHM7uFQAPBsRqPZenIyqwkRrzqiTeME6D+1Keq0Boec5xlOw8q2IQRHwpKxfxQpSB8Psbjw4zjKX9tChtM5PMxeEWQ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919731; c=relaxed/simple;
	bh=ZvTXbQvvVARQQXEwnJaBzX4ewSTwJzx3zawM/8FKYoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cut/0O862G/uattr1ZdKCi7wX3PASceAEcrRYjYNZzgK8za/BWprI0KQ5VbP84MHTBO0emtw5V/wO0BmGKPRhzi0gQQuWbBMP55mlExDZtghwclL9DENWrGE/XeM72frbokWBoK6rO6x48EBpXH6sXCG/z7vln6SbYkLp4jMMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P87wQR3h; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P87wQR3h"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so27501005e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 11:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777919728; x=1778524528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYEFtul8vd0vBjHaC+i5w2P21RsoXDngoLSxAnb1syM=;
        b=P87wQR3hvOACpwTGLleegcbEsY6eNiCD0x5hV7zNWXJXoTINZ4h5iI5O7djvYA5f+A
         KR8ONyRE/LwAIpyEjTxeJWjr/ruzXOI7UmYfx4iVcqPghkcFl0gztdcC0LVOsxTB+8h0
         /x2vG33g2KOHNxykEzcXPCVAILcwB53lCSU5JAcnAVQjULFONfLNvh/s3q/EBvVuaeRs
         U/fbZoS+/VVI9hefQbqPJl0PluqjmraXI7x14ESkEZKMRMKSzNVCEq+F938rJqo95euD
         MOeLzj1rzxvrM4bxwpXrF7ASj9W87JyRXj48pPqNAuYDYy5dPIL/YXFgcWHflQ+er8+x
         gEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919728; x=1778524528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RYEFtul8vd0vBjHaC+i5w2P21RsoXDngoLSxAnb1syM=;
        b=hej/cNaWmkiGp40cNmPUHHZYXbwL4N1lvaFPhSiueTxwucTdLjUmq+yvy8Gj6oPXCs
         qng/OIZuFfsxH/Rkylxs4ZwnVfl9uqld/KnB03kCul9pfRqMED5zJejER4GwoHMTvaQi
         AEjAZjsSe212YPGyUZjhc7vmd3JovEYjwnFuRsjC5ysVma7CyZRE6ibOf8JISW1Ftu7Y
         ItuT2FXtKrWwzeuS+kHh5E7n/De6wF2poE0W78p3kDy5rHMVjkXo1gbt3AWJvEVMkM31
         2QgONfB0dVa+DSiJBrLibGQut7LsODHivJzwUNmMkzVw4dempAHQh+nIOS/3lio4hX2f
         e/SA==
X-Forwarded-Encrypted: i=1; AFNElJ/aelgrI/Z/l0fBdd9z2VWl/Tb8OSHQWjOpxSH+lQx/O4EFAFnhl4VMw0v7PjnJuG2rot3Ap+4HnjvxIXWuLho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/nYWvOZ1YbZezPTTnOj42eZdQW+QV7GjmWUTSesoYk7MQK0e7
	haXeo0Cn8/L0C7nJqTH0s6iz+afCKlXlDViOwlW0HAT1yHqf0+UxWCWivzdexPVtQ5A=
X-Gm-Gg: AeBDietWF5ZlGbRZ589j996TPop4ZbhgyQocfcfYSSg/YqiIIXasczYMyR7cASRaN40
	AN0jlbr1o6jMH4BSbELSozTmXZTQtSjONfcpc6hjffD1qfG5WPCJi8lOFw1rd7dO9uaPZo8Q2Vc
	Nx+kz7bRXVu8riNHSerJ1h/9s3basoz6ZCLOsjWxr7cp5LrBwof0ms+5U/8+OKKwtTkTEsRiSBJ
	z869OmYNucRPrVhWEi2UfVxr5i9pQijhWmuClvtfthIZePszgEi9yaR/st/0KWKLWeeYqQ3hkO0
	vbJkwGMfL9dd5GmCpGE5Ykt8kFI/iiIqj4FEaawp3iK5JA4GNn4+JiqJaRea6i6We2Gc9K/5nD0
	5QmLMZ3bEq0iSTwIyu1VKgnzx/LWxBwYpbUPDVEHFIUskP1bAgLtpEB97EH0mTGrEIuSx88dIyX
	6V7YZEK8kHjEACI791Tomdbzfd2FU6RuN06g==
X-Received: by 2002:a05:600c:c095:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-48a98637de2mr170634125e9.11.1777919728436;
        Mon, 04 May 2026 11:35:28 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76eddsm26745511f8f.34.2026.05.04.11.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:35:28 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 04 May 2026 15:34:47 -0300
Subject: [PATCH v5 6/6] selftests: livepatch: Check if stack_order sysfs
 attribute exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-lp-tests-old-fixes-v5-6-0be26d94ab9a@suse.com>
References: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
In-Reply-To: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 marcos@mpdesouza.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919697; l=3644;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=ZvTXbQvvVARQQXEwnJaBzX4ewSTwJzx3zawM/8FKYoo=;
 b=MXIRvCBUPAt1B8d+Ub66kDeZOy+KYi/sFRWYhXtX4PVbgZDg9tmKGz+KegOVLCLPEnNS7YQ50
 fYgaRWKlDmHA532Wmwp/RnPTr3WHqx47d1Fukc3LM7mobwTBD14ObX8
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The commit 3dae09de4061 ("livepatch: Add stack_order sysfs attribute"),
merged in v6.14, introduced a new sysfs attribute.

In order to run the selftests on older kernels, check if given kernel
has support for the attribute. If the attribute is not supported, skip
the checks.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-sysfs.sh | 43 ++++++++++++++-----------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index fed656021271..3b16285c6e67 100755
--- a/tools/testing/selftests/livepatch/test-sysfs.sh
+++ b/tools/testing/selftests/livepatch/test-sysfs.sh
@@ -10,6 +10,7 @@ MOD_LIVEPATCH3=test_klp_syscall
 
 HAS_PATCH_ATTR=0
 HAS_REPLACE_ATTR=0
+HAS_STACK_ORDER_ATTR=0
 
 setup_config
 
@@ -23,8 +24,6 @@ check_sysfs_rights "$MOD_LIVEPATCH" "" "drwxr-xr-x"
 check_sysfs_rights "$MOD_LIVEPATCH" "enabled" "-rw-r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "enabled" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "force" "--w-------"
-check_sysfs_rights "$MOD_LIVEPATCH" "stack_order" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "transition" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "transition" "0"
 
@@ -39,6 +38,12 @@ if does_sysfs_exist "$MOD_LIVEPATCH" "replace"; then
 	HAS_REPLACE_ATTR=1
 fi
 
+if does_sysfs_exist "$MOD_LIVEPATCH" "stack_order"; then
+	check_sysfs_rights "$MOD_LIVEPATCH" "stack_order" "-r--r--r--"
+	check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
+	HAS_STACK_ORDER_ATTR=1
+fi
+
 disable_lp $MOD_LIVEPATCH
 
 unload_lp $MOD_LIVEPATCH
@@ -149,33 +154,34 @@ livepatch: '$MOD_ATOMIC_REPLACE': unpatching complete
 % rmmod $MOD_ATOMIC_REPLACE"
 fi
 
-start_test "sysfs test stack_order value"
+if [[ "$HAS_STACK_ORDER_ATTR" == "1" ]]; then
+	start_test "sysfs test stack_order value"
 
-load_lp $MOD_LIVEPATCH
+	load_lp $MOD_LIVEPATCH
 
-check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
+	check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
 
-load_lp $MOD_LIVEPATCH2
+	load_lp $MOD_LIVEPATCH2
 
-check_sysfs_value  "$MOD_LIVEPATCH2" "stack_order" "2"
+	check_sysfs_value  "$MOD_LIVEPATCH2" "stack_order" "2"
 
-load_lp $MOD_LIVEPATCH3
+	load_lp $MOD_LIVEPATCH3
 
-check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "3"
+	check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "3"
 
-disable_lp $MOD_LIVEPATCH2
-unload_lp $MOD_LIVEPATCH2
+	disable_lp $MOD_LIVEPATCH2
+	unload_lp $MOD_LIVEPATCH2
 
-check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
-check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "2"
+	check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
+	check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "2"
 
-disable_lp $MOD_LIVEPATCH3
-unload_lp $MOD_LIVEPATCH3
+	disable_lp $MOD_LIVEPATCH3
+	unload_lp $MOD_LIVEPATCH3
 
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
+	disable_lp $MOD_LIVEPATCH
+	unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/$MOD_LIVEPATCH.ko
+	check_result "% insmod test_modules/$MOD_LIVEPATCH.ko
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition
 livepatch: '$MOD_LIVEPATCH': starting patching transition
@@ -215,5 +221,6 @@ livepatch: '$MOD_LIVEPATCH': starting unpatching transition
 livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
+fi
 
 exit 0

-- 
2.54.0

