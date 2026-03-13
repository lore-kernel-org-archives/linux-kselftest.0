Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776673A3E97
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408242; cv=none; b=TjctfNZNs5xqi3h+Oy9clWX+u6+3ubTP4MYM+tk+8KK4BZ1lTXeX4Hin2QpBMQ8CkEP7v+bwI5wmj+lTMrntfVX6ROQcCWJHR7lLJasL9d5oO9XNp3bagCv/eWZyN7cIimA6/94qBIktkZWhYs/XgU/EBs04cmb61I5xGuk4Ook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408242; c=relaxed/simple;
	bh=gePKOP5tnt0R8TPIErv3cmLoJ02zcFPQDivFAVxPdOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMS0/UHJrg8guiRgfdg57bbI2pG05Mm1q+A9iungCgDRy6JEPq9a0klKRjZeOz5IXhOo5QJLkoomitrQcu+x0Vx1NpNza4+4Oj1iskYD/6c8kh7c4kqXcxtbVb+VUz/WS7tj6PYFYOFSW9iwTdaRBV/YjBBEQcE/29jt38p8fho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLOAFyE+; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLOAFyE+"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-466ebbf7ff7so801895b6e.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773408238; x=1774013038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpMXv4qahUc2uiZbMeFCgErFRwXSuQXuET6sVgGMTXM=;
        b=lLOAFyE+/nGkPiUqjMqbbVwfMgf+T6WTq9aH3Q2ZHtb3jPY+9Z/oEAsa+g48KYeVLu
         b6paICTOrf0Ek0jnjpyO1gAd+MDznuuYWc3ia8X7zDbwnt/qX7PkRlOgKw1ciswq/+ic
         N665v96eC94iZB9u1Hay3wR/o+LF9P8jaxKRWRqzj96JILEYN0sx5oTSzTfi7W3KlBrW
         JNA721HSPPeNKfRt4l5m8CqdnqehcAlt0LW1RdTaHpOHahdHquxKynKn07lPNWQfREsV
         A5khXCqFh7CIaD1Bbl2PLTlyrwgPrP3Grslgbf7N69JAJ8OY6uATsD42eJ4raTvrUycP
         efmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408238; x=1774013038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hpMXv4qahUc2uiZbMeFCgErFRwXSuQXuET6sVgGMTXM=;
        b=OGUymqP39MtPEaqVjnkHQXxv1xLcwikbVJzd1llvnZPP3BnWCcy2hNHtUAE0c62PJe
         /XMnHl6D3fuU6qHRAPpAwpS1aXQT8OZE82ZNpSekZLCNCcBO25cMxDBFxgjP60PfLd5d
         D1PpDAOZptYaIpTTyIeCNPp76SDHwFwHwNiY6g4zRChMWU4tcCaTo0E4tVR8zXfUbRy0
         K179zHD5fDKzQhSqKJa3f72ANeYip4BzKWX41zNVtxKeBQ7mcePwylCQZoUItK8Y6Oyv
         oIK6GWOmamHhLN3cag3l2nq+hjE4ty9zlFBSHeoQI1W2D4jbeOqBh/BdCSfbK0EEARHZ
         Thew==
X-Forwarded-Encrypted: i=1; AJvYcCU4uM+roBJ6babVlkTQ3wmxQN09oFgIZmvDeannwLxlqyECMUCE9nycNIaWPac3OTk7K8leX+2d9IzY5vlGmBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQz9fyOUZRR3udr368LrK/0aIXDKUoaQuq95WHO1v/SSQZ13+y
	Gs2u/FyHiDCtv0d3PeFk1nDGNBN3l8OAVu1NrxHUaotTeEu8yL2bhZbv
X-Gm-Gg: ATEYQzxrOOPilcJw66Ytbkr4ywZx8VN7Hsc3idM6hwiZdn1Oqdis29/HEz8AoMIKUzO
	L50dE/6c/RfO+42osvFcj+eyOnCo1XwHDx1gOOMaGy2Z+2HoNyo5zGEx+ZcWbVwI9hMGXZEzLKL
	1SZ2r860moas+4s37AN5gZtM+ycWvZgrYcS/ElruOUIleUDXorpT+iDQVKXyW/b4yjsMl9+a9Fi
	2sqUcMOlgLmMRavWwdTGDA4nTwCvTpvtdzl9h0+Auov/E/WsjfHFe7yncpe0dQVG8c7RloL6leQ
	pnKQoVhZsP/gGElKg3cAP1cpf4JwcPkrxfjEVv6tTrj9ezCUjsSkVayZWZ9mtfPkvnVSuBK4q86
	XcbgPaqwOC1ZU57xJhwAn05E9A0cRU7b7feXzR5QRBY7GSwu9/XE4inwWDgvk+FH90Z/PK1c0dl
	L6Mn8NscvDW+TP04yE3kZ4JYmspxVfl2AAXRoK2h/zDCWwmHMC+J3YUe8/L14=
X-Received: by 2002:a05:6808:1b0b:b0:467:a44:dde2 with SMTP id 5614622812f47-46757583573mr1661703b6e.56.1773408238278;
        Fri, 13 Mar 2026 06:23:58 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:23:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	christian.koenig@amd.com,
	matthew.auld@intel.com,
	arunpravin.paneerselvam@amd.com,
	louis.chauvet@bootlin.com,
	pmladek@suse.com,
	ukaszb@chromium.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 28/65] dyndbg: split multi-query strings with %
Date: Fri, 13 Mar 2026 07:19:53 -0600
Message-ID: <20260313132103.2529746-29-jim.cromie@gmail.com>
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
index a77c6e9ff90c..a1c3141372d1 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -626,7 +626,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
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
2.53.0

