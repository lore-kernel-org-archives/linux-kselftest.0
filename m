Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1A737D11F
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671898; cv=none; b=LLvM/AVU7++y3jfLGzKa3/HjpbN1OUJ+u5/jpzrF6GqBcaMpucpRkUx83BprJUx0uYBeRnQ2pf2um8szQhMaj7q1xpeB4TtGZqSSqzqEIdh10HKQjfq7a/A1+NMUxZ2TAARa7xG4/vWfFqSHdVgQWZeSE2wyU6K5j21zEnQn0ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671898; c=relaxed/simple;
	bh=Y6op64SH3HVRwLLGtoxME3mldm3/W0c1FqQmgPaP16k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtHQGjaCd8H6WLUp2+SlrHQ4W3kryk9HMcUgkpZD8HGioVrDvAVBzDfFxnu1QZj8evnNjZW0WHxelhYQjkylEuZfLB/R5pTpd71VpPXHowxspdw7DvD93jtECtcwvjQGfdfLSenfIYgBK1e84T4gebdOnj4huaIXg88zW9AhPd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqlKmiu4; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqlKmiu4"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4042f55de3aso477087fac.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 23:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671895; x=1770276695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
        b=JqlKmiu42rjPUESJkCQLR0nL1cfkRQZxEWu8YU9SnBmhGtGtxpWO9sG50N/Fs8JdlL
         bHK+Muh4OQA6UFUYwmEt7sTrqbGlPQZrYmSBhsW0PrV2om8wBy4vr/KjX5+JnaXE76yL
         nNQq7xVS5RHvk00X6v9auGJ3IletGgRAGHXiCzNEJ87uKhm37GYygRKR7Q7CX1kVJN6c
         umgPZIIlK33OrWGFHQfAQAAM8fVjzbdHFS7LIwQ56oS9PEj8KELOgR7n9Ll6AAVAWZJv
         02RCgQB0/RX7c7eIAgz8MoDWYBNEL6gycEnByJzGIawSHp7U7zbIPS83PfHQ7MXznXJW
         CqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671895; x=1770276695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
        b=ujDwZkA+5IC5Xt/mQNvztnOFT4yk3bWuWBDu07UDfJbNCYpIJ1Plhxo2p5gormQGa/
         3mYYl6/O9OhjimZlUlUxZPcEAN0sO/JVAP4JBUSfOvxGZe3XnpmSxvsh7mf21fbgTSWu
         CU7Zhh6sARGoiPK/q5Oauy8IgjuLzTJn/F8E20hun6Y0XCUAioteL4vwGIBaSAPeCLz+
         FfB2IlvtB7rQB8DVVlXJ8uNVPuUPEpaxTZWQR7bW+PEPF+3yd5gssn8WyOkqLGUB3QOF
         L7HyXzkZoZxqi+XZNLPPxnJl6/M0sAg0CxIuTqoF35Org8sxJhQxXj/PjEM1+FHrTD1c
         d1rw==
X-Forwarded-Encrypted: i=1; AJvYcCWfQ5EIckGIBNUHhFrZYXfioUpCK7ha4mBVuWSUPyloZefN/ffTHJGd5xwkQg5yQWN3P4/1Fwv5mO/SyQv8T30=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI1Vtywi31e7a2vvW2K+oblWdrXpy4K3pwJqAr0JtBbNCzV+zG
	a+jhtD8VXAw8LOQILNebfv6I5q1LWuk8+35OT8VJtStMtuTgkRTufSuB
X-Gm-Gg: AZuq6aK2KgrV6ZdE6kEh4TIEDxmAheiuTwNgSE03hDp4KEc8rTOnkRhM0G7Ufl0qLpg
	RNoD1p1IK3ZWsplq8ufD5ObTxeKERa3qnJodmXEPMMLaxzPvlZ0wwijGTB36xadH0+wJ62BdqQW
	bqzSYgAbJU/xfWeuEfPh3WuQT8V1GxIkUarMZCp+A18bp4c8aJqGlWYpAYlYAlcdud12genPWQU
	JGk5AH18kioB/37BiGjXKHpWNHqvZBbB+Z0YwJZh1ZpgbbWPVd6nPrIyHKkFJiA27ZceUzq4Ljm
	wkD7YLls+sqQvQMevDW3HIjai172fK3xbEc+j83uuQhimOFbON//MvsD6IgNrSTRVVIwBujK9iZ
	Jy636zTiqdHKRyhCwaXT+xGvMUO7gSlq+PHDwPItV2YsMxgLivckO7a36xdosZ+5CXI8yCPeH6R
	09tQcn96Q+6j4hS318hkcgu1O53rVx82zjANf3zXvrzrgtAagMmSU=
X-Received: by 2002:a05:6871:b10:b0:409:6148:e23e with SMTP id 586e51a60fabf-4097fb7cc1dmr1086285fac.10.1769671895554;
        Wed, 28 Jan 2026 23:31:35 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-409570f1413sm3442581fac.2.2026.01.28.23.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:31:35 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 29/32] selftests-dyndbg: add test_mod_submod
Date: Thu, 29 Jan 2026 00:29:15 -0700
Message-ID: <20260129072932.2190803-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new test-fn runs 3 module/submodule modprobe scenarios, variously
using both the generic dyndbg=<queries> modprobe arg, and the
test-module's classmap-params to manipulate the test-mod*'s pr_debugs.
In all cases, the current flag-settings are counted and tested vs
expectations.

The 3rd scenario recapitulates the DRM_USE_DYNAMIC_DEBUG=y failure.

1. 2 modprobes (super then sub), with separate dyndbg=class-settings
   check module specific flag settings

2. modprobe submod, supermod is auto-loaded
   set supermod class-params
   check expected enablements in super & submod

3. modprobe super, with param=setting (like drm.debug=0x1ef)
   modprobe submod
   validate submod's class'd pr_debugs get properly enabled

The test uses multi-queries, with both commas and percents (to avoid
spaces and quoting).  This is the main reason the test wasn't earlier
in the patchset, closer to the classmap patches its validating.

With some tedium, the tests could be refactored to split out early
tests which avoid multi-cmds, and test only the class-params.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 513f6cb1db1d..09937dca3056 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -279,10 +279,83 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+
+    # modprobe with class enablements
+    modprobe test_dynamic_debug \
+	dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    modprobe test_dynamic_debug_submod
+    check_match_ct test_dynamic_debug_submod 23 -r
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct test_dynamic_debug 46 -r
+
+    # no enablements propagate here
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    # change classes again, this time submod too
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    #  submod changed too
+    check_match_ct =mf 1
+    check_match_ct =lt 1
+    check_match_ct =ml 1
+
+    # now work the classmap-params
+    # fresh start, to clear all above flags (test-fn limits)
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    modprobe test_dynamic_debug_submod # get supermod too
+
+    echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( V1-3 + D2_CORE )
+    check_match_ct =p 8
+    echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_CORE, D2_DRIVER )
+    check_match_ct =p 4
+    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
+    check_match_ct =p 6
+
+    # recap DRM_USE_DYNAMIC_DEBUG regression
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    # set super-mod params
+    modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
+    check_match_ct =p 7
+    modprobe test_dynamic_debug_submod
+    # see them picked up by submod
+    check_match_ct =p 14
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
+    # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
+    test_mod_submod
 )
 
 # Run tests
-- 
2.52.0

