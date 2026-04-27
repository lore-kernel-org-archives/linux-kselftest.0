Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3153EC2EF
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314690; cv=none; b=OLMIaUED+LkUODn45lP14bgjUmYuRizS4JLi9nQkYJcHuiqrkBnVRTTOSHsxqK2pI9i+Ah3o2oQp37iFp3GTmETV2BSOAAeA15kEAqDBvDJbKqjBWB8K7DKk/+5PFHPkLeyCl2H2J9JOoN5dHATignLNBe8DPthcyFsWX5Hhbxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314690; c=relaxed/simple;
	bh=F9d6PBr1+/K4ckE8UJhOXONnbp2b82hTORgGVjrcAuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Io/Nij1xl4no2RRlFtN1CSX78PPaLEEfPSiYAIooAfZB3KL/efitnLLllML4simzRc/4nyZUfBUX56Ene7nIjoilvvN/o/UAb8UKBYAli9yShKr8jwYaA6gWPweaPoyVY1ZJ6639zJzFw5HfLMMb8l2cHp7CAUcT0Z6hepREqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=esKtUfa9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="esKtUfa9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891f625344so95611325e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777314687; x=1777919487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjtkWRBFA/1Gy4WW9Vb+jxm+URT45UeeL62kECqzZxA=;
        b=esKtUfa9aFarEBAknLOyrg+h0DxoUCjIYioRW1SPtVgKzq4sIA1QK98AA/S+nO6pvK
         68Hur9JS0Pm6ISvhmor47ZKcf7vaYrrrwV6TSZdHd2hIUvC2vg3IVSmxprTlVve+/9AN
         bt80B5PNE9zrGGbhk5vJtX8h1t01WEQTt0gayW5B2CqQ0JIOmBvPU6W6zPN4i6+sUPUR
         p4P8Y4Rl5Bf0oXGoReK1lR7pnShOi9jaKzhJfVAPSrWIieV5jVE/Q1X8S8BfTQ7YrMLj
         CcpZasabug7frFLqfbtCWcBYtqvqPfdN8AzZmUGA7ei18zQy7qCSRQKKadaMpcO5YXa+
         eovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314687; x=1777919487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UjtkWRBFA/1Gy4WW9Vb+jxm+URT45UeeL62kECqzZxA=;
        b=UCd+HDVzAEBnNLzVtfGraKLyJLwGpBYKI+qBNttgIHEEmlXPWfv9AdJ233c+Xxl4WK
         vH1w0WRYcDHYUJYBjX35Dcjx/Q2U0zC0RbkZxp8Kx+kS9wuNjp0gDOmV2CcA6YilE+cX
         3nRBq7lE+nYHnx2+WnR9c40j77ikcV6Vg30dJY2mJgc9YMHJvM97/92wkwB+htcEjuLV
         jZFDlB24F94Iegw5SKVhxIPBMZhjv53B/27/5TuicUZg4luWC9nkl/z6B5nmz21Uoj1Y
         OZ7XACDeF7ZIkq98Sa97dJkFnwGURNxYJ3nVmmUP4DEbAJ+VUGRiLzKoN96gk80wOzr5
         ybog==
X-Forwarded-Encrypted: i=1; AFNElJ/1EwpU9KLs4pSXAV6kR3aAcricIfxrbEHURxXwbbXZXPZprlFObcclvff9MnNwH3QxUmC2wbFB6H5aOVozTcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+SKv97iOMqhfiomQowIKjxaBgyzEQnQSLZ0yPhNu6va1oENE/
	fb2PH9UO7ypd2lm0tRWaaH2DH84IpjfUL1LPBZKgfKiwZvxECtUt6p8cnHvCUp3l3iDaGol7sOw
	VpviZyh0=
X-Gm-Gg: AeBDiev5+1OP0i7HGOnrScYxTAjJBcCogHrNG0+m+sYgNgGw4aZUp1HPcNLi2odyVam
	+8D0NnSeEq2cmBsF23W9fcPBACZz43+vw9QseRN1Ps1lsRCHUAakw7TtYDYXv2r+tayiqhxo/Pd
	ZyzGCwGfD7VX7yA+CMV3ZBShKe8by70ChRdOvjDrquRXspJL686EFjqMVqmMZseeSLHto+ccGbw
	W61uQeZZBKxUtomUSdpEznctDEKuFaFL3w5TlUfysZszcfbcfcoue8IG24Tnup7UbCwtIQdLg/H
	V/GQUygJPbbcGYys+Ha3C2HVonnUZuAOtxZfdAQ8FjlnK4UD2KKJIdxpEW1IaqJgQX846cbDm53
	ufMj2U0snWGWB+W9mH7LvzluxTtZQpXjsnwwoTxjQfrf+Z4tT+R0LBAcpbU2oOVjijghdO/cX62
	Q6L0KhKZS/01jk1ifu8ic94Wxoflj/M2EoKg==
X-Received: by 2002:a05:600c:1c1b:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48a7763cb34mr2682085e9.9.1777314687237;
        Mon, 27 Apr 2026 11:31:27 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7749cabdsm1182065e9.9.2026.04.27.11.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:31:26 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 27 Apr 2026 15:31:02 -0300
Subject: [PATCH v3 6/6] selftests: livepatch: Check if stack_order sysfs
 attribute exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-lp-tests-old-fixes-v3-6-ccf3c90f744c@suse.com>
References: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
In-Reply-To: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777314662; l=3634;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=F9d6PBr1+/K4ckE8UJhOXONnbp2b82hTORgGVjrcAuU=;
 b=dFnpCs2V4iZjjH921Uun2jOYSBmBjt2A650cuRcFLbWx3CAphw9odj2L2W2DVcgAEraJS8HHn
 Ird6vvqQxbLCp0coplJ12QM63W7b8HghUh8w+tLIbBd8X63lV2kSMAQ
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
index 744c612a90d3..ce67a2b770d0 100755
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
@@ -150,33 +155,34 @@ livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
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
@@ -216,5 +222,6 @@ livepatch: '$MOD_LIVEPATCH': starting unpatching transition
 livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
+fi
 
 exit 0

-- 
2.54.0

