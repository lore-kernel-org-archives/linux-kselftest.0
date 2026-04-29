Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5762376BD0
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473357; cv=none; b=ppFMo+G9sg0Nh7YkvZKDPjLNRAw+TNi1eGEmj+O5YP85Ql5Y87hgvU8U8kiKPtTrPIuJ7VcA1FGv+Rf3OfgpXfaH2Xt7Newbpuv0aWaCF83sQ8kyz7a9wOjI5DJ/xE4V5fgzMqi5Tw329hl0No5DYUYk4KuZBbd3ArHZovOLliM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473357; c=relaxed/simple;
	bh=q5j+MBRO9EiSUEyD1ouDADHu0UZgT7yndU3RT5A6jPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzhfkEzyx3cQi+gz/RYrojJL0miywbaFxKnoDp0KnHVxN5rvIJRQ75iz4FJp4wwAzIF6ApaCx632bCezUlYRKZ/IYdbfIemEA2z6MHSxd97vRqbokujiEhTQk0UWLlWALKqkSVFkQAqDYZt/vqo+qKHRPdmQFlNLGH7oe2UAiuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bTvQLWEf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bTvQLWEf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso111414385e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473354; x=1778078154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTyr/enfNhvA23qY+Ogypltm/UtUUOhWDEUIvxA+akU=;
        b=bTvQLWEfaBR7Tc/Sz+JsUnVLYyphk9QGQk0CUWqOt0DiDYxG8A2DjeEVF4O6flqc+0
         GrFZAUTcp7mGumPLwStKAd9H1N1p/09lWySd3bBuH+CWUR/EntIU6HKto3tGb+8BmXwd
         Cg5tMszUG4oqEOoYtf0FZbTNiZ+W18UnzA8lFKJuW3raLKFS8qZodliuC4x183rYZRi/
         VAKlHfwgeB7hrnhEQF2ne3qfpy/U1wmzYIBISTnLPW3dU+PNSG27VjKWZ0Qm9GLG3ckz
         ndOtKrGAsovUNOUQn4M5U5h0jFTgx5vlW7H80VEoEPDPak2QXpPB61pFA87RU3zo0+zs
         iS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473354; x=1778078154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BTyr/enfNhvA23qY+Ogypltm/UtUUOhWDEUIvxA+akU=;
        b=c6BHs0NmL9DUeX4BGInZi4lBZ/0IfBgRQamylnVSz62E0r9cJe5zT3coAaYPyx2C7Q
         6zykkR5Gh+MFch6+fkLOR9z15HKi6MgJW55VWV/fmKlKNcpEKiH4gR1ddqft5r+ZF/Zo
         0aZmeTnB8l+SCzoLaOr2qoBrnet3Jnz4GuUnUnGxmGbpA6KSOTbz2+g2B+/VtDd9TKAc
         Z58KaHLlhHXhbK7ybM+s9ITg2EI0OBDjo9CiMaNNfAliJM/dl/pI0hp8YDdbc3oeZJm9
         IHZAfIfjbeDVsPzall4ogH1O9Q9vwWOZz/77G7qpfOiyxqUHrdxehl9gmdzzjppeZybR
         rKWA==
X-Forwarded-Encrypted: i=1; AFNElJ/ApwKoCDWV6WYUlmp/oS+qy9sMXoJFyRG335HAoCWZto4Zv/wsR1Fm8wmju6Mbyjo66YiSfrPO+I3XRqj7Jb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG2kji76kwXHhE40KboHCnEU3bO3WsB7+M8/vDtPq70JkMg2EU
	ZGg95nNIAoAQ2W0fn2BNUxaUOueUd2iMVfikuFA0cFZ7MS8DGK5Kpvzgkpe1Dqlgx+2+87ArTZe
	gCj6wOTg=
X-Gm-Gg: AeBDietjGN8ZSjgr7f9awqT3U6XiZhxCpefyj5RlaR0B5bBCTfnuXHEzR88z6O608OI
	QgPp/bKBazaKJT07DGAX8Yoq46PaAfkIuVBon/jvTGGga+ddZ75/Aw0qIQP3dG1pe2l1YRBXgYF
	MT3yPE2oNaBkRXZ6JEmUCHUq2lY/FZo6CjkYnmPOtIuN2Xe2CCbp2sJRkgz4TaYjeg2XYOpxalA
	wWxt+WcvI2jhje1gkWxnZBfhpKaDIqQwgzOE+/YOiNRW1hbUZ5+oCm2GYLp7GAOVr8X80Z3d9OR
	dW61onGtR5izkkwSLJCngpabYJQKuywCxKQNE7Kujex7/Fw0fCeaJpj3HXkgDnOlTP/cMyFu6A1
	i44JpuHZh8Q0sHo+NFwkTPdhJHJCY39IhM4oG4dIK3LcxBWl07vEyIEuWpzK2M6cwnuqMmrYGKd
	E5U/L51dROP+6GLGhcaXrKFAGy0YChmeOQKQ==
X-Received: by 2002:a05:600c:8590:b0:48a:58e1:6d17 with SMTP id 5b1f17b1804b1-48a77b19b69mr84220995e9.20.1777473354068;
        Wed, 29 Apr 2026 07:35:54 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c305371sm19982835e9.18.2026.04.29.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:35:53 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Wed, 29 Apr 2026 11:35:20 -0300
Subject: [PATCH v4 6/6] selftests: livepatch: Check if stack_order sysfs
 attribute exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-lp-tests-old-fixes-v4-6-59b9741989d0@suse.com>
References: <20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com>
In-Reply-To: <20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777473323; l=7838;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=q5j+MBRO9EiSUEyD1ouDADHu0UZgT7yndU3RT5A6jPY=;
 b=JEFGM1eKq41Ddh4vD84jBCKrmu/uUMlBVU/BE2NRwMO3n63VtlLeJqCtsRqbwH8nD3r0EUziu
 X9HvtDh0uX5CwPOcFXNGUCQ7m/2JAx8gfMxU3Nzd9dH72JrssAc02IF
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The commit 3dae09de4061 ("livepatch: Add stack_order sysfs attribute"),
merged in v6.14, introduced a new sysfs attribute.

In order to run the selftests on older kernels, check if given kernel
has support for the attribute. If the attribute is not supported, skip
the checks.

Moving the test up since the other checks change the default values
for MOD_LIVEPATCH and other variables.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-sysfs.sh | 145 +++++++++++++-----------
 1 file changed, 76 insertions(+), 69 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index 744c612a90d3..4185e2f489f3 100755
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
@@ -56,6 +61,75 @@ livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
 
+if [[ "$HAS_STACK_ORDER_ATTR" == "1" ]]; then
+	start_test "sysfs test stack_order value"
+
+	load_lp $MOD_LIVEPATCH
+
+	check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
+
+	load_lp $MOD_LIVEPATCH2
+
+	check_sysfs_value  "$MOD_LIVEPATCH2" "stack_order" "2"
+
+	load_lp $MOD_LIVEPATCH3
+
+	check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "3"
+
+	disable_lp $MOD_LIVEPATCH2
+	unload_lp $MOD_LIVEPATCH2
+
+	check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
+	check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "2"
+
+	disable_lp $MOD_LIVEPATCH3
+	unload_lp $MOD_LIVEPATCH3
+
+	disable_lp $MOD_LIVEPATCH
+	unload_lp $MOD_LIVEPATCH
+
+	check_result "% insmod test_modules/$MOD_LIVEPATCH.ko
+livepatch: enabling patch '$MOD_LIVEPATCH'
+livepatch: '$MOD_LIVEPATCH': initializing patching transition
+livepatch: '$MOD_LIVEPATCH': starting patching transition
+livepatch: '$MOD_LIVEPATCH': completing patching transition
+livepatch: '$MOD_LIVEPATCH': patching complete
+% insmod test_modules/$MOD_LIVEPATCH2.ko
+livepatch: enabling patch '$MOD_LIVEPATCH2'
+livepatch: '$MOD_LIVEPATCH2': initializing patching transition
+$MOD_LIVEPATCH2: pre_patch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': starting patching transition
+livepatch: '$MOD_LIVEPATCH2': completing patching transition
+$MOD_LIVEPATCH2: post_patch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': patching complete
+% insmod test_modules/$MOD_LIVEPATCH3.ko
+livepatch: enabling patch '$MOD_LIVEPATCH3'
+livepatch: '$MOD_LIVEPATCH3': initializing patching transition
+livepatch: '$MOD_LIVEPATCH3': starting patching transition
+livepatch: '$MOD_LIVEPATCH3': completing patching transition
+livepatch: '$MOD_LIVEPATCH3': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH2/enabled
+livepatch: '$MOD_LIVEPATCH2': initializing unpatching transition
+$MOD_LIVEPATCH2: pre_unpatch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH2': completing unpatching transition
+$MOD_LIVEPATCH2: post_unpatch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': unpatching complete
+% rmmod $MOD_LIVEPATCH2
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH3/enabled
+livepatch: '$MOD_LIVEPATCH3': initializing unpatching transition
+livepatch: '$MOD_LIVEPATCH3': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH3': completing unpatching transition
+livepatch: '$MOD_LIVEPATCH3': unpatching complete
+% rmmod $MOD_LIVEPATCH3
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
+livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
+livepatch: '$MOD_LIVEPATCH': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH': completing unpatching transition
+livepatch: '$MOD_LIVEPATCH': unpatching complete
+% rmmod $MOD_LIVEPATCH"
+fi
+
 if [[ "$HAS_PATCH_ATTR" == "1" ]]; then
 	start_test "sysfs test object/patched"
 
@@ -150,71 +224,4 @@ livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
 fi
 
-start_test "sysfs test stack_order value"
-
-load_lp $MOD_LIVEPATCH
-
-check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
-
-load_lp $MOD_LIVEPATCH2
-
-check_sysfs_value  "$MOD_LIVEPATCH2" "stack_order" "2"
-
-load_lp $MOD_LIVEPATCH3
-
-check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "3"
-
-disable_lp $MOD_LIVEPATCH2
-unload_lp $MOD_LIVEPATCH2
-
-check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
-check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "2"
-
-disable_lp $MOD_LIVEPATCH3
-unload_lp $MOD_LIVEPATCH3
-
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
-
-check_result "% insmod test_modules/$MOD_LIVEPATCH.ko
-livepatch: enabling patch '$MOD_LIVEPATCH'
-livepatch: '$MOD_LIVEPATCH': initializing patching transition
-livepatch: '$MOD_LIVEPATCH': starting patching transition
-livepatch: '$MOD_LIVEPATCH': completing patching transition
-livepatch: '$MOD_LIVEPATCH': patching complete
-% insmod test_modules/$MOD_LIVEPATCH2.ko
-livepatch: enabling patch '$MOD_LIVEPATCH2'
-livepatch: '$MOD_LIVEPATCH2': initializing patching transition
-$MOD_LIVEPATCH2: pre_patch_callback: vmlinux
-livepatch: '$MOD_LIVEPATCH2': starting patching transition
-livepatch: '$MOD_LIVEPATCH2': completing patching transition
-$MOD_LIVEPATCH2: post_patch_callback: vmlinux
-livepatch: '$MOD_LIVEPATCH2': patching complete
-% insmod test_modules/$MOD_LIVEPATCH3.ko
-livepatch: enabling patch '$MOD_LIVEPATCH3'
-livepatch: '$MOD_LIVEPATCH3': initializing patching transition
-livepatch: '$MOD_LIVEPATCH3': starting patching transition
-livepatch: '$MOD_LIVEPATCH3': completing patching transition
-livepatch: '$MOD_LIVEPATCH3': patching complete
-% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH2/enabled
-livepatch: '$MOD_LIVEPATCH2': initializing unpatching transition
-$MOD_LIVEPATCH2: pre_unpatch_callback: vmlinux
-livepatch: '$MOD_LIVEPATCH2': starting unpatching transition
-livepatch: '$MOD_LIVEPATCH2': completing unpatching transition
-$MOD_LIVEPATCH2: post_unpatch_callback: vmlinux
-livepatch: '$MOD_LIVEPATCH2': unpatching complete
-% rmmod $MOD_LIVEPATCH2
-% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH3/enabled
-livepatch: '$MOD_LIVEPATCH3': initializing unpatching transition
-livepatch: '$MOD_LIVEPATCH3': starting unpatching transition
-livepatch: '$MOD_LIVEPATCH3': completing unpatching transition
-livepatch: '$MOD_LIVEPATCH3': unpatching complete
-% rmmod $MOD_LIVEPATCH3
-% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
-livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
-livepatch: '$MOD_LIVEPATCH': starting unpatching transition
-livepatch: '$MOD_LIVEPATCH': completing unpatching transition
-livepatch: '$MOD_LIVEPATCH': unpatching complete
-% rmmod $MOD_LIVEPATCH"
-
 exit 0

-- 
2.54.0

