Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7E437D113
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 07:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671896; cv=none; b=j56UWTsz+lkjDlDrFPGFR8h01x/KCfnmGdCZVv0PD2GLaQEBWc/IULrnbEE78Q8eka3iksASXe+fjFWMhzAx6UkTNhufX8LNWtcV6kZpQqJDXoi/CkUoMEXsrc4oMVQpodm9kXv1Azl1dtANCdTtaSttSIdzyYouCxgdnCKRC3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671896; c=relaxed/simple;
	bh=9Qhvx7vJdRtG15sgDwXLo0r/z/Gr9Hzz1GSkhg9RflA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuIal3maEVjUOsHruAt/oJ9Crl74JVu1AFmVM4PSZnG5PC+LzJlj6t8CYmdn05+Hnvo2jI1RJnDPzLkM52vpbG/hnYPZRj9b7CWUhC5gjgyp5Re1/1xfM3NyElV7d4S6sKVACWR/vh+Fbie4X/260XPl2UMoXyWsBvxeur7obMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNwI5y13; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNwI5y13"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40427db1300so393435fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 23:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671892; x=1770276692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLcZNaRkQY/d+FYEr9TpNpPuAc7QSA/DtioB93EdW3A=;
        b=kNwI5y13Kx9k7BENXIG23SOdlrQxC/gvABfSvhVGWGVdl8osxGaPiQl2E+zPBZTVMA
         OF8Xbf15QkGyrSAOxEAp/oIuDGnnvo8ef28x4CWdFotLbb+Yv2JP5cDsPhSIxz1LitJw
         iUc7i9kNgSvLX1+GpCBBVtwo7IQF53w/rsa94qA2TYAodpRw975PJ9rPxsAeu5k15vnh
         /F2qNVgPWJvv4uHC6anUPD8zFpsPMLQJmPx9eVzm5++fIgpbZLsuyqaWmqAEcp1+TKQo
         Rnf6HnkbIgPjVwrZr4cn3L7krhKfdI1zHbFqDo8wPBwXAVGQU5dhzgrL3auVooPXmxpS
         ukyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671892; x=1770276692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RLcZNaRkQY/d+FYEr9TpNpPuAc7QSA/DtioB93EdW3A=;
        b=MkRYzbfrRybDlUFI3FkOIrgaumArsh5Fctbi90WMWOZFv+lpqoxwOn0WF9Fv0s6wNx
         Zf3TutaUF5YbfinnYIyRw+/x95tTj/IMV9RyHIjXNWOrlaF30Y3p9DgXCyW8E5tjq1iG
         7leRg/xZ/ATZe8W5LcY96p6LKamyY6jV2Lx3DEFmWxiGUsUYVwnzr/HkhjFAQpuZhE6Z
         qO+P2kvMdRCPjhN3Tc51q+teWNgKpIPepsg3vdYIHZASPBRuX5HRcjSnyXyKYr1XzeOs
         qsd5+8uVg3uyVpZmwOp9fNUZvZbnNZaXoE6oqYBWGj36QIRye4tJQ4SPuuDlnTZQrv5A
         SRNA==
X-Forwarded-Encrypted: i=1; AJvYcCXFGCRBslPw5MTbWdlIh8YR5N2KXo/StnGCA+NMqfBNyJ3EsfuktM5ClZYrtDU1Aqj24vqYD3E3yUc0My1C9mo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/Plk/Hue2t9ZzR93Qx98fNDHPFur4PtIi+9tNE+/fZ4sykof
	7Hpw4T8S4Ubl2SMh0FJj3HoVKvgJySi1rwNersg5DyICsH9/b7QrpMAR
X-Gm-Gg: AZuq6aLZXFV+71OsU8QefUQHhUVShDXS+th1O4XAuqqVw/HiL0S6lOHAZyx92BpKcaf
	I5fqcX7E8fnue2L0DgocmgiTwRUhGEGghZa/+59nmJGlaq3dEZz9G7NR25Sg/DbPJCDn/XowvF0
	Edyjdn9H9V4pLc84Spr2iR77bE2Fi/NgrOnVQ+z3I/Zc5geCxOP5Mu3xPn8J6ee7xi0QVofAFrk
	tbGwXSMdYKHD1AhESm7rFEVU53c4MljxrQ4MyaKpM7/XXEumuB7CcIf2pmYHSAqRiKkDNop/jNE
	mBSGSLpg43klEf1Fm/5ylxFbLA++y+1Wo44HpeCoqeXDvLm3QNN5uSeqSYgqUHAXdmYVObRr6WE
	P1WpNWEaq8C10pT19KPaygt5TfGpLJPCBb7Bb8ARLB63xWRTdKDOqPe9V9SZ7cOVK49vu4r6Ddm
	wWuCNJfy0O6ZCFv3nioHfsfj8AuEkxV/KXLhDoXxqx
X-Received: by 2002:a05:6871:7418:b0:329:7f93:2b6 with SMTP id 586e51a60fabf-4093fefe874mr4607827fac.29.1769671892377;
        Wed, 28 Jan 2026 23:31:32 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4095716cc6esm3355185fac.7.2026.01.28.23.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:31:31 -0800 (PST)
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
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Ye Bin <yebin10@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v9 28/32] dyndbg: split multi-query strings with %
Date: Thu, 29 Jan 2026 00:29:14 -0700
Message-ID: <20260129072932.2190803-29-jim.cromie@gmail.com>
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

Since commit
85f7f6c0edb8 ("dynamic_debug: process multiple debug-queries on a line")

Multi-query commands have been allowed:

  modprobe drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_KMS +p"
  modprobe drm dyndbg=<<EOX
     class DRM_UT_CORE +p
     class DRM_UT_KMS +p
  EOX

More recently, the need for quoting was avoided by treating a comma
like a space/token-terminator:

  modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

That works, but it needs the escaped semicolon, which is a shell
special-char (one of the bash control operators), so it is brittle
when passed in/down/around scripts.  In particular, it fails when
passed to vng (virtme-ng).

So this patch adds '%' to the existing ';' and '\n' multi-command
separators, which is more shell-friendly, so you can more fully avoid
quoting and escaping hassles.

NOTE: it does break format matching on '%' patterns:

bash-5.2# ddcmd 'format "find-me: %foo" +p'
[  203.900581] dyndbg: read 26 bytes from userspace
[  203.900883] dyndbg: query 0: "format "find-me: " mod:*
[  203.901118] dyndbg: unclosed quote: find-me:
[  203.901355] dyndbg: tokenize failed
[  203.901529] dyndbg: query 1: "foo" +p" mod:*
[  203.901957] dyndbg: split into words: "foo"" "+p"
[  203.902243] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[  203.902458] dyndbg: expecting pairs of match-spec <value>
[  203.902703] dyndbg: query parse failed
[  203.902871] dyndbg: processed 2 queries, with 0 matches, 2 errs
bash: echo: write error: Invalid argument

The '%' splits the input into 2 queries, and both fail.  Given the
limited utility of matching against the working parts of a format
string "foo: %d bar %s", nothing is actually lost here.

selftests-dyndbg: test_percent_splitting

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  8 ++++---
 lib/dynamic_debug.c                           |  2 +-
 .../dynamic_debug/dyndbg_selftest.sh          | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index dbf901150587..0a42b9de55ac 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -85,10 +85,12 @@ by spaces, tabs, or commas.  So these are all equivalent::
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
   :#> ddcmd file,svcsock.c,line,1603,+p
 
-Command submissions are bounded by a write() system call.
-Multiple commands can be written together, separated by ``;`` or ``\n``::
+Command submissions are bounded by a write() system call.  Multiple
+commands can be written together, separated by ``%``, ``;`` or ``\n``::
 
-  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd func foo +p % func bar +p
+  :#> ddcmd func foo +p \; func bar +p
+  :#> ddcmd "func foo +p ; func bar +p"
   :#> ddcmd <<"EOC"
   func pnpacpi_get_resources +p
   func pnp_assign_mem +p
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cec054ef7d64..08ad3f8a2172 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -627,7 +627,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index c7bf521f36ee..513f6cb1db1d 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -256,9 +256,33 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+function test_percent_splitting {
+    echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+    modprobe test_dynamic_debug dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+    check_match_ct test_dynamic_debug 23 -r
+    # add flags to those callsites
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    check_match_ct test_dynamic_debug 23 -r
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
     comma_terminator_tests
+    test_percent_splitting
 )
 
 # Run tests
-- 
2.52.0

