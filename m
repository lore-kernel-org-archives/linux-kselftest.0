Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEA0361DDE
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 17:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776101206; cv=none; b=qx8buA8Jo3dkMtxQamgRMUCKl8lwUcU70MXl8j/dXobHPwYX/M1Puz2szrZ6Vt7i+nPyDhTAVy7VhFi78Tn0eRUd5IkugwgCW7Sx03hS3kgI/rywo50i8EMVHX2GS2mjW3CqGI9aAK1D3G+VIC0RCqZkdfrMQpqUhPWw3IRkupo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776101206; c=relaxed/simple;
	bh=6ReFlyvGzXzUCafoIGtDH3q4ySU8bPRHczfokrsszrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FOaixYGTAyQArWO3Ah2I+akhvBzArICcIZlrs1+AJaeESS0vLNV01CWmT9XJTq9lVkd86aXUd7T3ZZxC12Q148MYd5HVsjfgrwJbPDcRqFN1PzPOsTmQVB4bI0+aJYtdPjM1/A2Ggd18rPC0DZOfi6oYotKu4iM1uwnJf6m8+A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Gc9Fi0E9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Gc9Fi0E9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so51602735e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 10:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776101201; x=1776706001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+AJJ/Q5Rc6YFzJLqVkyhH/nYiW7ogrRYDhpSnoYYWk=;
        b=Gc9Fi0E9t57eYIQRnNTVd8PorF6UoOOJse0B/hFk7W3mwfmG1S9VgHaM79fRi0xC9U
         WQeIzvVZPwBUz9+OtgElLvwqRxYHhMBiT+R0tZW77WFmA9nJ5sdrSi60ldz2sLm9gl9H
         5PExFGfzEAVnBIDG/+f8IpfGMBfEVKGdYf5YEhgjlD+jHLdGwA4IRMVecGk9aKrywwuz
         6rSHJzMEfl2AX4NabrD3I4WzpbiR3P3J2MjFDTl9RzFdtcqvbP75is5Pk3AcngkCIq2J
         8v4l+fr0Nb4ghMH1ut9DOcnPBnvknm0Zu4SG5oN0boyj3G6N6pBKB+g8KsaxC2GqyUna
         wQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776101201; x=1776706001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+AJJ/Q5Rc6YFzJLqVkyhH/nYiW7ogrRYDhpSnoYYWk=;
        b=LClT88+dffPzuYiTOgAQcwi/ZcqvoL5xhVrBHmjAorkwrE9lP4Qd0b2yPWzAnxZp5m
         DCIY/1wFw9FtIp3rvDlLvvkYE2g6jROHpZySrwWsUDgYRWtnf2UYtl6l4jSOm333o/TL
         4H0gHB3VQvDGV2/bRL3g/f8Y+d2XWyWCNFSILjSaSxM71RRMDN5elFdENXffghv88GG+
         UrNF7HW7XwQio9gVCfPzcduYR3lchM9WKEDsPEowpMElrj9WLfSlYzPmtXkUpPtokvND
         0cHDE62nUEZ1O7EgQKFh7d5V0aMbDJKggcSG6xymMfucbKTXIQvh0SCvrgIztdZi/cdq
         +j5w==
X-Forwarded-Encrypted: i=1; AFNElJ+xy7aXGkeVzioeMvmRpBdB4Y4SaQiJw22wJpi9o6MnVQ6H7e8XUSiHsU20Gr2hywPiMEWg66tkXys1E5GSuSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF00q6QfzzbBJ4TkTI71nnujs5WvaV6xdJ4mvQ3vWX42g+8XuO
	tjqH5gh6JkBPq+W8TPOyh74BYuHr1m6BRH3y6OrTkwp/3mBJ8MWRuRsi3FW5h8fHciQ=
X-Gm-Gg: AeBDieua6c1gPSM9hcKDyaPFpG7tzNLZQ6JYStjHAx9pQyO2HhihQoNeOKG1TIxGE7n
	3p/qVhXb7+bKd7zlECVLiRMk/7XeqQ2WUjz7P71/F1aAZMnaRjEXfmFYNhnorq5n+2+RW/XLfD3
	a1AKm3bqpbGY2HuwLHlxo2aRnlr55Lx6i0saAJALtmGPX9JpVcR//36yYKy8F9mrm7v7XYFnehm
	og0PE+FVhhZ6HWf+MVEfh/UeYS3rXgwAm4eeRPTbZK/6uqFE4at1hYWakCF0Ef8hieOMI9YA3Yp
	LhNZBBkImnXd7AidgeSyTwP7oeQW+T0+CTXEnU4FYifF7c9cQE2MndCmjJRLmufTZJAdjzurVpz
	hTRKlZ3WQpDv5Zezs5X42HLEBoOMx8w+n4AwetXo2mRne7C4RSjYZVYN3d8ADUvEwSrNa+avLGA
	GlBThK/HukFwiv8vjfIgpmSi9mfzui0UftTw==
X-Received: by 2002:a05:600c:800f:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-488d67b8d81mr189094775e9.5.1776101200774;
        Mon, 13 Apr 2026 10:26:40 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5734a94sm298657835e9.0.2026.04.13.10.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:26:40 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 13 Apr 2026 14:26:17 -0300
Subject: [PATCH v2 6/6] selftests: livepatch: Check if stack_order sysfs
 attribute exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-lp-tests-old-fixes-v2-6-367c7cb5006f@suse.com>
References: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
In-Reply-To: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776101176; l=3509;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=6ReFlyvGzXzUCafoIGtDH3q4ySU8bPRHczfokrsszrs=;
 b=7mb/+qSN7QPVFL9r2CbQslH6NyjmQ1Kc3ZDLHqKzrykSfcBDIlOcpMSrm1KgYWMdNt6lKLlKV
 b/sxwXOmmChClWXI5E7SRC0KLvJ4n/sYBv24cbOkC4xQ18AFQOw06rJ
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

In order to run the selftests on older kernels, check if given kernel
has support for the attribute. If the attribute is not supported, skip
the checks.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-sysfs.sh | 43 ++++++++++++++-----------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index 0cdaeef00983..77f515529646 100755
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
 
@@ -39,6 +38,12 @@ if does_sysfs_exists "$MOD_LIVEPATCH" "replace"; then
 	HAS_REPLACE_ATTR=1
 fi
 
+if does_sysfs_exists "$MOD_LIVEPATCH" "stack_order"; then
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
2.52.0

