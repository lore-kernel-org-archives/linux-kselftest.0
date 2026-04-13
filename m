Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA21C35F610
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 17:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776101197; cv=none; b=hvvHFDHb2hzDem0iQ6pP0UipvlLrO1jBrV9EPp836BKlzJtxvZoZkpojhCDTkvyJa5TyS4Cp7HoEL8twHa6smWD//dRP53vN3VB5inhJdgVY3maVadralmL6T/O0pxi1dlfmzN+GRwviP6cxPXtS4JvVNL8NC2SZDLXDUECoCcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776101197; c=relaxed/simple;
	bh=GkImtgPH5yic9Ot61eWgr3BScmsVfGafIFT0QgZX3FM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMpOpAPW3iedJqsUTzxSG16ljg0GDjjs+90DjG2uAdkSxfegfmC4ANXzC24SXPspuoD8yMkP9FowpjkzZ/Pl58qYT1Nlf/ko+i0rtapLvVzm6xrBRU4zu04gIMExtvXt1HM9BWV5NorQFUKusJE2IKl0M7CXsUYU65b3oBZNZgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PAxciVqa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PAxciVqa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso57803045e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 10:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776101194; x=1776705994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ps4HVEOSSbu/h7yu9FHjVcTeRvNxChd6+ToWK5CE2C0=;
        b=PAxciVqaqBHl73RGaP4qaUW8TI/aP1VyCVFqITZytIfh3WxKMXbw/0MclMYjWmVWwT
         1fFbvyyEv8zbS18KVwu6+1Q5tIAPK21Kub34qMu/asgWP+O6WslFAskAbTA74S4eNm2a
         D19PfxPgj0/H5ix3l+XDwt5Wr/yhwQKuvhJe/permnt9XQ3dF2rdtVz82le7zUXQp4IO
         7tLajGse0lINJFI/KxXvWpmMSY236ZWZxdAtodlHjK85bqnSO6yi+I62bPb+UPTwDO17
         2GbE6WC55R48uSPfCxPP4zFHeIcoKcXstHK8unSBSgquHLQeNpPN+BojYS1n9buy7rC4
         Udmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776101194; x=1776705994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ps4HVEOSSbu/h7yu9FHjVcTeRvNxChd6+ToWK5CE2C0=;
        b=ibajZgezkb+bZxY/yIM6Bz2P6ZGswmSH6of+Rewqz8c9MolCMU+CVqyHCif8NoQoMb
         +W0Vgj2qypLuZXs1JBd1zw5R/dWmJ/cbO1YkjD1CZ0s1yqYO7w3uUQ2hH1PmXcW1J8Lr
         6M0z1H4GASTLZu7Hnej660I8T8rboyESggYYVzyE5PO8WEaEVYIdANIMJU8ew9YuZ97v
         kA4iNDhh4Ogat5ARopqLqDN/dnCQkvU5IV7GjCmVS223w+dC4xIgKkE5449kHca5G/bd
         V1hJ9InEz2r+/yM3OVKAgoxH4HMLblaCONYqW6T08SMMNQGlmv6WF3uXXRa+TK/x/I/u
         SjoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KQnwmmdkbLQVljt8ZjBalldumYWqCOS4MmpfFzwyj6E1qjjfKBXqIpkVX2Z3G4uxL4xkoSf+HpfDZ5BQD4J8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCfCL+DcieN6C8pHkns11OlGL3hHxBNCU7DFRFSzL1UfREKqng
	EkZ8y6QesulhxaRwusXAC7BfG6CuJiuTXjekTXKp0DFHhTYoHuOF3vLwFJB5llHnZH4=
X-Gm-Gg: AeBDiestxXQLRhjlr3tq098P+zRpKLll2B4Im95Acii9CXi3O4Hatlu8Gk0PTsQ7u/R
	pnzkoGEsGm/wi4oISNhaJIqtbOWlBgeLENpmo8I9GvQKGQ7NENa65n9AKhugz0qtHAPGA9WsX7Z
	+rbcJ+Wem8VsH8JvnD70q1W6eWT3e3T9nStMEbqh2xKmuQZ0s5VzNGHHaCh+P7sziu+/IfhCP9D
	GvbkMNvsxJXQ6eVbjRSFCJP+q6zaRbB/OjkPCTTNJsdgJI45NRHJhEw6ZLN4gxa4rMH3rgkdYKs
	cshZlO8IadaSBFBwph/JoAZfkdlnvcOmmw0KCmH79eK84gesy9kuBkLFgMnvCLqZm7Za5XVVvsz
	zsyxh7saH22gPfVcvbHmLv25Kc4Jpei5lfCJqWmFjjlP2QnEqPb7Zn5v5o6tXT4mF6bD8uzMZuF
	P3xSOA09a3+ClBLAa56cUsQsE=
X-Received: by 2002:a05:600c:1987:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-488d67bf736mr190320525e9.5.1776101194126;
        Mon, 13 Apr 2026 10:26:34 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5734a94sm298657835e9.0.2026.04.13.10.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:26:33 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 13 Apr 2026 14:26:15 -0300
Subject: [PATCH v2 4/6] selftests: livepatch: Check if patched sysfs
 attribute exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-lp-tests-old-fixes-v2-4-367c7cb5006f@suse.com>
References: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
In-Reply-To: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776101176; l=3362;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=GkImtgPH5yic9Ot61eWgr3BScmsVfGafIFT0QgZX3FM=;
 b=x1Jqnz232Y2Za2WGjjWfQd5sf/VY9g4jnieH3D05KdD08Fl0IZT2uyS7vvQTiJMoyD36/rUmX
 Vw++e7EU4bKD+DegBw3ogKat+B/o2Iu1JOaF6CtLHYRI4C61jPZfyUf
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

In order to run the selftests on older kernels, check if given kernel
has support for the attribute. If the attribute is not supported, skip
the checks.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-sysfs.sh | 38 +++++++++++++++----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index 58fe1d96997c..a2d649404a63 100755
--- a/tools/testing/selftests/livepatch/test-sysfs.sh
+++ b/tools/testing/selftests/livepatch/test-sysfs.sh
@@ -8,6 +8,8 @@ MOD_LIVEPATCH=test_klp_livepatch
 MOD_LIVEPATCH2=test_klp_callbacks_demo
 MOD_LIVEPATCH3=test_klp_syscall
 
+HAS_PATCH_ATTR=0
+
 setup_config
 
 # - load a livepatch and verifies the sysfs entries work as expected
@@ -25,8 +27,12 @@ check_sysfs_rights "$MOD_LIVEPATCH" "stack_order" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "transition" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "transition" "0"
-check_sysfs_rights "$MOD_LIVEPATCH" "vmlinux/patched" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "vmlinux/patched" "1"
+
+if does_sysfs_exists "$MOD_LIVEPATCH/vmlinux" "patched"; then
+	check_sysfs_rights "$MOD_LIVEPATCH" "vmlinux/patched" "-r--r--r--"
+	check_sysfs_value  "$MOD_LIVEPATCH" "vmlinux/patched" "1"
+	HAS_PATCH_ATTR=1
+fi
 
 disable_lp $MOD_LIVEPATCH
 
@@ -45,23 +51,24 @@ livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
 
-start_test "sysfs test object/patched"
+if [[ "$HAS_PATCH_ATTR" == "1" ]]; then
+	start_test "sysfs test object/patched"
 
-MOD_LIVEPATCH=test_klp_callbacks_demo
-MOD_TARGET=test_klp_callbacks_mod
-load_lp $MOD_LIVEPATCH
+	MOD_LIVEPATCH=test_klp_callbacks_demo
+	MOD_TARGET=test_klp_callbacks_mod
+	load_lp $MOD_LIVEPATCH
 
-# check the "patch" file changes as target module loads/unloads
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
-load_mod $MOD_TARGET
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "1"
-unload_mod $MOD_TARGET
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
+	# check the "patch" file changes as target module loads/unloads
+	check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
+	load_mod $MOD_TARGET
+	check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "1"
+	unload_mod $MOD_TARGET
+	check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
 
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
+	disable_lp $MOD_LIVEPATCH
+	unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/test_klp_callbacks_demo.ko
+	check_result "% insmod test_modules/test_klp_callbacks_demo.ko
 livepatch: enabling patch 'test_klp_callbacks_demo'
 livepatch: 'test_klp_callbacks_demo': initializing patching transition
 test_klp_callbacks_demo: pre_patch_callback: vmlinux
@@ -87,6 +94,7 @@ livepatch: 'test_klp_callbacks_demo': completing unpatching transition
 test_klp_callbacks_demo: post_unpatch_callback: vmlinux
 livepatch: 'test_klp_callbacks_demo': unpatching complete
 % rmmod test_klp_callbacks_demo"
+fi
 
 start_test "sysfs test replace enabled"
 

-- 
2.52.0

