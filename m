Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795743A3E9B
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408243; cv=none; b=QgruZk6x8sFN02H9nt6pjcEjE26tQkBLkQkWHzGRCLUE5Un2pQqa1m5A4O28QoyWPS+liiCqcag6MhuB6Rg7pF6YSK8vpTxtOSE6dDyEfTPh4dXTaEoet3cEnyxU5SgY/z3hMxoV8SVeyNoIqZOD2cJTwTEbR8iuHnCEqgX037A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408243; c=relaxed/simple;
	bh=o9XAvjSs/yDZQc7WmR2T+j5cz0yKThRjVBgsLtPQWN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQ6A+VDCjmhQhthOMJH/R+/BeIlcYJv8JTUPrDBcWAYpsmktjNAP+OHmczdFYrxx7NrrtXnEDImtDht7kZIxKEOM7qPvYM6wP3QrpJNx4n49UtXvtZ9oy8dnvG6xumpdU/riKMmO63Z7IM8D55Zol3NieLjHEjZ3ScRP1PxCo8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ef1I09q3; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ef1I09q3"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-46704177508so1465609b6e.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773408240; x=1774013040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxTkOltoVAiRQNIiLPEo11+229bHMC78x0TMXlU2wIM=;
        b=Ef1I09q3wzQpb2D+oRp91ZPkPNEOXCI7EWd9mq+NvYnxmmFe2XQ3LEov6SiA+1GBZr
         lKFvlEyyjzG9OB45gkw2xD5yXk9aoG+TDyVxyAFaa9/HPHR+2yB9AVDikW9VCz31Fi9F
         +anpfJhQgPNzVV/MIjBUi7K7p/NO2ncUTGJzQiu4vSF90Y7JHOzjVQIGr1d0gIkK/XTD
         Wv/tgYm0rvQgZ6pN3hF042fzAup3JnVdAr8bRq1w+DVi3L6a+rh8WaB48L9+TB4D28DM
         FXekQ/kk6lkUnV3iNfKqpebRVJhx9CincBOff3U0u4L1+yhW3JZSvdcY3Fac/q9dnnMU
         POJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408240; x=1774013040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZxTkOltoVAiRQNIiLPEo11+229bHMC78x0TMXlU2wIM=;
        b=bLlEWU44lI8Xpd0+VhFgRuRwyn9chMOFUcKLl7jaXzuN4gXS0XFdNah25S3tQ5/1fi
         IIVLiEmtE0lxbojhe3aBYyUB/pZyijd+PCWJVyzr29xwoj+5KaIrSMN21PK+xHqKV1a0
         uk0NHBxzYQizN/20fNgYXe3ZEYYSEBATSq9t4ofyL4mq86ItP5+S5hz/1LxGxZM4WtLi
         qf9jwQe27/IkGjyw3FZbE0x6igdy019mZrFQ2A83xJS2hHOU3AEGd6SxcHEHVL/m8oAG
         aCR5poaDnnlmrYVIVRnQu0mE2+oJBPej83OQ3gC31zOxFZZpRZ8PUgrPb/QLfS2xByLP
         0b0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtMFcbFXG5cMl0osId08zI3yrBZq5QJhBog/lJI41PPV7XiH83GR+8ux/lsqkQm6VgdJAmwnizLAq/GcZd6I4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/l3rfDcsqwSwOiGlEUGw2ccmOVC0Emw6MX17JuY5ebdddTFV4
	r/Z7hI+U92Udya3Y+dwaP9ghwscMb2Qxv/mkdJoKFrWKiSOHo/o9LI4D
X-Gm-Gg: ATEYQzxZ4LTEu1f/5aHhpafYlRD1G/4J4RWB03k7Jy/L6pAxPN14QRiDdi+hpPCu8H6
	9grEe99XmrVrLqpm8ke2e4AQ18637d7Mf26/2suA0bz4QfqH59HMb/LmMYUrMvjbDxWpYuLYXqk
	WgKJwOTrtQmt6CtuGVJo9cnsqS51INrqq6T/h0DHDnzvOYBs+25dXstwxF3Ba1APgYsxTzuXCln
	NrgiF5AL/qtPIMfX0IFVMWtkYOyozhpaNm1c3LGjrZ1ca7t3RhDhq5ojyFHW99a1n2WpLJ+Icd/
	s35pxzG5dFsCHBiTO2uYDjvWJytVlhFN3ns6IGMhBcKJS6Frv/F+hIcOivfR5C21zRTN7M4vX/u
	1merfgQu/qVCJvl82x8Fegv/dVFKBG4XRKyS2zEev/HzOuNGTodDQW1hfekevLnptBFIngHhhBp
	cENSJyYDNVUL+W1UMmavn/lMG+U7uQyc2CCdwZWZkXyTnalpT1
X-Received: by 2002:a05:6808:5292:b0:45e:bfe0:21f2 with SMTP id 5614622812f47-467570ecc8fmr1454885b6e.10.1773408240480;
        Fri, 13 Mar 2026 06:24:00 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:23:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	Jim Cromie <jim.cromie@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	christian.koenig@amd.com,
	matthew.auld@intel.com,
	arunpravin.paneerselvam@amd.com,
	louis.chauvet@bootlin.com,
	skhan@linuxfoundation.org,
	pmladek@suse.com,
	ukaszb@chromium.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 29/65] selftests-dyndbg: add test_mod_submod
Date: Fri, 13 Mar 2026 07:19:54 -0600
Message-ID: <20260313132103.2529746-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
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
2.53.0

