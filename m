Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ACD3D331D
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435550; cv=none; b=SohvZE+jro1CaZ1VrpUlAqhisM5yOtbFNoiMwpesxW73hgYQANrva5KTs5O6FoOQqokwhdPIgK8vB1+s/EC2B0d7V0aBIxVurik7xFwhOMSvDKcyVC44qkZecA/BoSglNmS7xKfc7pX6DDad6lGM8ost7UP10Kamgvd03/p9Xeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435550; c=relaxed/simple;
	bh=5yfrb4REjla72hyuadKvBD65CovUyvEY7fUSzyt+1JE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o5Fn9ihkXwLaDO3EU6jqBo/O/2l6Nlldu1h/LItb5W/GwXMI628pXo+bpuhjPAyAjmOxpJ4cjyxIvZk408SXF/aEE8o88rRyMr0rstFV0U481OmImJC8h0iCAwTnVp3HJacHoIrAXhuyfDTs2wQcMkiehW6FdvTj3typ0CSI5IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Tdb07EKE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Tdb07EKE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso24421885e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773435543; x=1774040343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUlmk5Uej4Q4zAW57SpQCMgrWe47+shWlWuNt0RZn1k=;
        b=Tdb07EKEWDRIoh1bQToLzd4cD8nKezLZqPgVgGVxU1NuWDRNK57GQuUNtija/U1p28
         ePlcdg5WNMV7cl3/HIjHMIrY+ye8NkaskvMGLNezYTfAtRdpS9yuTZ9R1uXgrChyN4E/
         yR5FZkzL3qs2RXUmY+lu9PX+FM4VG7A6fVw+GcXfxYtex46TCv5ZOQlGmi2PFKhOzhUB
         4+/hWNqoG/HZGvUj8dy2k5nPlF0y5hRrHTRR5N83bpya3KKFDFZMr9nxBs9z3IpxmiE/
         d8L25cnL/iA23W5t7M8yy3uBe+KFPfQATMIfEL2pKZCNaXt0grrGZWJdo7pRQBhYHB0T
         dk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435543; x=1774040343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JUlmk5Uej4Q4zAW57SpQCMgrWe47+shWlWuNt0RZn1k=;
        b=i07PROFRYdSf86OtxBNRdC5r6+swiEvSEQOphrFdusTEZF+rag3bZfS/O2MN3CBlzx
         WPaW38FvpJYuL0er00CHhbm38edlZij7MjJFYHM0jUFIjm7iPklIGd/ZoNCI+HwxjLVA
         Sc59TLriTfEtpJH8KAmp0hESIipjJPB8JRh7+vN0bTOw9ll422ba9ZT0K3y+9z46xKH2
         VGe7dIavuw9GQqOTAru/+8JC2Jq1xF++4SauVIcWQm/aNLhjeQobqCNUyBGQtTxyYR/s
         ppkk3OPcT10lDar80DYplZglFGZAsDAlJIyTCofh1D/S/hNMNX3n0c48lIFc1FiXXo2s
         UmNA==
X-Forwarded-Encrypted: i=1; AJvYcCUdxsIt0YlK6aCHuCrzNegAeFZ5/wfbpIXC5Jb+yBCBE9Wv+jqHFU0DUKCCj8FiE0CuCLGe8wvE+STj8P+HCx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZdv0X41Pb9FZSC/GdNB8Z97hJUphm+0Evcg9blHfb6/LxO2Jh
	+E3/ux9awB37VfD8pC5/GsaJwgsxg42vrCKSo8utVfbb3lkoo7iLMVTM3knTmtb5xpM7CLtS400
	IIkJhLSM=
X-Gm-Gg: ATEYQzxlxkHg4q7vNPp9jAJN4x+DOSphBZ1fSIEhqr+rX5uYVHf+TjZfPwSBO/9hZXy
	b5rkrd5IZmNS0o9+qMm3LUhyYzaS9WCPhpmWTcG0fPCisk0idBYtZSX3YvGyVztzhPpqMlVHQo/
	Y9WtbQiG43y49k252fDdkV79B3ov9JzkOWHz3hmR+DADEh37zQqbsBdEnkY2n0pcEHt6u/pmSEC
	G1bfx0jRIvquJpjSuu+gKN9tdqPcxy2V57k8IkVQSxRTn+dqBuyO08Vaya1HGjHwoqlTYKuDLnu
	uLybhZaFvGluMFq4xQPjhNjS3j6dfzWZRUrD5B6jOhEFzTzsbtw31X7KJcIZ9z9A7LU/LRKQB3A
	BHNU49ChrXGCRDwPiwR9tMZ1uDAOWneEACMosCnRibYLdTaNOM0SEqhk2Anwo2zMfmlLrnGyGtR
	D28Bcu9qH5sN3KW8tviica
X-Received: by 2002:a05:600c:3b90:b0:485:345b:ccb1 with SMTP id 5b1f17b1804b1-48556720f86mr72676115e9.27.1773435542687;
        Fri, 13 Mar 2026 13:59:02 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:834:1300:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d3csm4042611eec.18.2026.03.13.13.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:59:01 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 13 Mar 2026 17:58:36 -0300
Subject: [PATCH 5/8] selftests: livepatch: sysfs: Split tests of replace
 attribute
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lp-tests-old-fixes-v1-5-71ac6dfb3253@suse.com>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
In-Reply-To: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773435515; l=6599;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=5yfrb4REjla72hyuadKvBD65CovUyvEY7fUSzyt+1JE=;
 b=IqJehXZ8pHnYEfwizMu/gVOB6kUw2ak2avpUcTUa8h9svETYAo3obiieKHnthJ1fojDANuMtN
 UEnxmJijSNAATMeixB7B1zX3mHBE87dfSXPfQcl7GdNhlH2MQbBDTHS
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

In order to run the selftests on older kernels, split the sysfs tests to
another file, making it able to skip the tests when the attributes
don't exists.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/Makefile         |  1 +
 .../selftests/livepatch/test-sysfs-replace-attr.sh | 75 ++++++++++++++++++++++
 tools/testing/selftests/livepatch/test-sysfs.sh    | 48 --------------
 3 files changed, 76 insertions(+), 48 deletions(-)

diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
index a080eb54a215d..b95aa6e78a273 100644
--- a/tools/testing/selftests/livepatch/Makefile
+++ b/tools/testing/selftests/livepatch/Makefile
@@ -10,6 +10,7 @@ TEST_PROGS := \
 	test-state.sh \
 	test-ftrace.sh \
 	test-sysfs.sh \
+	test-sysfs-replace-attr.sh \
 	test-syscall.sh \
 	test-kprobe.sh
 
diff --git a/tools/testing/selftests/livepatch/test-sysfs-replace-attr.sh b/tools/testing/selftests/livepatch/test-sysfs-replace-attr.sh
new file mode 100755
index 0000000000000..d1051211fe320
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test-sysfs-replace-attr.sh
@@ -0,0 +1,75 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2022 Song Liu <song@kernel.org>
+
+. $(dirname $0)/functions.sh
+
+MOD_LIVEPATCH=test_klp_livepatch
+
+setup_config
+
+# - load a livepatch and verifies the sysfs replace attribute exists
+
+start_test "check sysfs replace attribute"
+
+load_lp $MOD_LIVEPATCH
+
+check_sysfs_exists "$MOD_LIVEPATCH" "replace"
+file_exists=$?
+
+disable_lp $MOD_LIVEPATCH
+
+unload_lp $MOD_LIVEPATCH
+
+if [[ "$file_exists" == "0" ]]; then
+	skip "sysfs attribute doesn't exists."
+fi
+
+start_test "sysfs test replace enabled"
+
+MOD_LIVEPATCH=test_klp_atomic_replace
+load_lp $MOD_LIVEPATCH replace=1
+
+check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
+check_sysfs_value  "$MOD_LIVEPATCH" "replace" "1"
+
+disable_lp $MOD_LIVEPATCH
+unload_lp $MOD_LIVEPATCH
+
+check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=1
+livepatch: enabling patch '$MOD_LIVEPATCH'
+livepatch: '$MOD_LIVEPATCH': initializing patching transition
+livepatch: '$MOD_LIVEPATCH': starting patching transition
+livepatch: '$MOD_LIVEPATCH': completing patching transition
+livepatch: '$MOD_LIVEPATCH': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
+livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
+livepatch: '$MOD_LIVEPATCH': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH': completing unpatching transition
+livepatch: '$MOD_LIVEPATCH': unpatching complete
+% rmmod $MOD_LIVEPATCH"
+
+start_test "sysfs test replace disabled"
+
+load_lp $MOD_LIVEPATCH replace=0
+
+check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
+check_sysfs_value  "$MOD_LIVEPATCH" "replace" "0"
+
+disable_lp $MOD_LIVEPATCH
+unload_lp $MOD_LIVEPATCH
+
+check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=0
+livepatch: enabling patch '$MOD_LIVEPATCH'
+livepatch: '$MOD_LIVEPATCH': initializing patching transition
+livepatch: '$MOD_LIVEPATCH': starting patching transition
+livepatch: '$MOD_LIVEPATCH': completing patching transition
+livepatch: '$MOD_LIVEPATCH': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
+livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
+livepatch: '$MOD_LIVEPATCH': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH': completing unpatching transition
+livepatch: '$MOD_LIVEPATCH': unpatching complete
+% rmmod $MOD_LIVEPATCH"
+
+exit 0
diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index 58fe1d96997cd..0865a7959496a 100755
--- a/tools/testing/selftests/livepatch/test-sysfs.sh
+++ b/tools/testing/selftests/livepatch/test-sysfs.sh
@@ -20,7 +20,6 @@ check_sysfs_rights "$MOD_LIVEPATCH" "" "drwxr-xr-x"
 check_sysfs_rights "$MOD_LIVEPATCH" "enabled" "-rw-r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "enabled" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "force" "--w-------"
-check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
 check_sysfs_rights "$MOD_LIVEPATCH" "stack_order" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "transition" "-r--r--r--"
@@ -88,53 +87,6 @@ test_klp_callbacks_demo: post_unpatch_callback: vmlinux
 livepatch: 'test_klp_callbacks_demo': unpatching complete
 % rmmod test_klp_callbacks_demo"
 
-start_test "sysfs test replace enabled"
-
-MOD_LIVEPATCH=test_klp_atomic_replace
-load_lp $MOD_LIVEPATCH replace=1
-
-check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "replace" "1"
-
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
-
-check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=1
-livepatch: enabling patch '$MOD_LIVEPATCH'
-livepatch: '$MOD_LIVEPATCH': initializing patching transition
-livepatch: '$MOD_LIVEPATCH': starting patching transition
-livepatch: '$MOD_LIVEPATCH': completing patching transition
-livepatch: '$MOD_LIVEPATCH': patching complete
-% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
-livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
-livepatch: '$MOD_LIVEPATCH': starting unpatching transition
-livepatch: '$MOD_LIVEPATCH': completing unpatching transition
-livepatch: '$MOD_LIVEPATCH': unpatching complete
-% rmmod $MOD_LIVEPATCH"
-
-start_test "sysfs test replace disabled"
-
-load_lp $MOD_LIVEPATCH replace=0
-
-check_sysfs_rights "$MOD_LIVEPATCH" "replace" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "replace" "0"
-
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
-
-check_result "% insmod test_modules/$MOD_LIVEPATCH.ko replace=0
-livepatch: enabling patch '$MOD_LIVEPATCH'
-livepatch: '$MOD_LIVEPATCH': initializing patching transition
-livepatch: '$MOD_LIVEPATCH': starting patching transition
-livepatch: '$MOD_LIVEPATCH': completing patching transition
-livepatch: '$MOD_LIVEPATCH': patching complete
-% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
-livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
-livepatch: '$MOD_LIVEPATCH': starting unpatching transition
-livepatch: '$MOD_LIVEPATCH': completing unpatching transition
-livepatch: '$MOD_LIVEPATCH': unpatching complete
-% rmmod $MOD_LIVEPATCH"
-
 start_test "sysfs test stack_order value"
 
 load_lp $MOD_LIVEPATCH

-- 
2.52.0

