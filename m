Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DDB3A382F
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408239; cv=none; b=Mx0OeXFOOAkE/QH01BTmbUeVOpX4o2CX2xA38GHSF+GXdXVE7V20woIUiWkv0OssxKxbZ2h8XafknceV7qw+gx7OmOVaVGYLRfGVGiqoz50QYEGJTJDykfvISkdSjXofIYObMlhI2YlFFlZJnBwqiJjy9R5iv1XalUasNdcHIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408239; c=relaxed/simple;
	bh=/DeIXqJLu0dhqgtEH5faf5593G1G1tM77qhOiecPIIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9EtUvZjegAENjQTIKPZToc5hvN0SPKJb2U6t7CWY14E7TyxyqKgBW7GDwN6+vw7Rf071BxHwtzGrA64lXuAtzWVnQGK0qZxl2OvVmAPy3Vi0tdVeApoXV60mDXzM4/Q3MQyI24jVV+czHSKUi5q4OiqCkOOlLcgVd6iNvLqNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4o3DJi1; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4o3DJi1"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-46708149af2so1223419b6e.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773408236; x=1774013036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLJ6/kh9zV3xnzIvFpZnDpL3mZ5cCxT808iTivJti0s=;
        b=e4o3DJi1DLsxLhW6GfE79wnkHY2D8OQyr50Lne5MMObKo2GQhLIliCBaAt3ynCBjA/
         IaNSbJSBMMVWZHzdxMMPZl3/yeM49N/0VU2apUsvLVs3RjKDKK6xu1b5F5GaL8hsCKwT
         hUmdEpzyu52e+y+PoQNGieQvu5JSBh0W5r7NH6Fl2XsjODcBLJxfS0Vq2C18S98nkKL2
         4BwzNRaC7+xZKTrGbUDaS71kQmekmPPSPakDXpJVTs5yyZHgpQeVwNkJxJOW2+ItE0OA
         TkPFYdFa32et4irF/5dlK7KBWaRGoriZgLCjFT6LP6UFfh1KgB3B/NrXGBv+SaQUNq4u
         YRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408236; x=1774013036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fLJ6/kh9zV3xnzIvFpZnDpL3mZ5cCxT808iTivJti0s=;
        b=ElNyBfFp6+peMtAp1C+kflvKARwLMKDRywHWRKyQZl0LUxhZca/qXylnKynV7Kdlx2
         W7ndZ+ZkDKqa4qgw2M3M5P5Rt3fzr6e3aLWI7NmhhQvBQ1Sihobk5Hz3JMTt2vg5iyK3
         Gt7d4HN6TF4c8pFqvDIevu2n63fEJQ4apnF1WeA9kjnbIiTF2Mtfcrl3rebcg1NdJ8q2
         FaEM1JO1HS4/sBkt/Tdt5IpfFuhY0DnW4hD8X1j31RBfUC1Ae328ONYEAtaV2AtY/ORw
         fiY/iUxxY3c+HGRXpKvQyJH9LbzRANpyIRfaBZ6HUDq9xPNwCxZLKOK3be7716wrVNNl
         lofQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5ziUojtTg9g1ThHw6Uh/5p4oz4yi0sbVOoiO4rD/eCiigcXdWrwc3NsYFdzGzWnbtTafOEhf2sQhyRC6G5Ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM6TW69heNF/xaNd6pUZwZs1B/TFd1seIBNO+wi41zO5P68b/c
	babg2+7rAbQyP2nKuvHWELNfajXNrWcPikmf2ocJ52qWS7rX1Ft7By/S
X-Gm-Gg: ATEYQzxdkmFzb5TSjSfZVwkU01QTIILWVeVRtKpBAF5l4FLw45pq/5ST9asjv3CltYR
	QJCGmHGKzcpmVlZn52uWqwZozlHJT6tMkvqHB5rbh0/xAeW6Fl/MJB3vu5I2ZLKNxqOaqVp47tr
	MNREw3uNc1oah+8IGd86asNEa2LQqFQXU2WiGU+ynAdL3YdA1mxhWhKQfHgq2gYq+Qz6HR8/o13
	8+FLrzplfeN5U4VqMruMRON6fpqutHFT44Nr3xhWC7eWeBdp295mJlZ2zqiPnBzpgN992nP8VlP
	cOxCwf1mSVyY9t45wQDGkNjLTrM5Vh8ZMFOv5kzLT1yIkbrKx3wxo28D4dphXkWY9IecQs/zaAu
	GGCfWit42QoWVrjtdBnWUPGJc7Hjq/VWJiAjCGerC3V5vSlDTD6TbQRJjlc88mt3Ylb4ul9/0eE
	CqoP8HEIpruaNV/zqfTBe/NdvX12I3GdNmaut5xmD0eM8B21Si
X-Received: by 2002:a05:6808:19aa:b0:467:284:b3cb with SMTP id 5614622812f47-4675701cd1dmr1819155b6e.2.1773408235774;
        Fri, 13 Mar 2026 06:23:55 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:23:55 -0700 (PDT)
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
Subject: [PATCH v11 27/65] dyndbg: treat comma as a token separator
Date: Fri, 13 Mar 2026 07:19:52 -0600
Message-ID: <20260313132103.2529746-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Treat comma as a token terminator, just like a space.  This allows a
user to avoid quoting hassles when spaces are otherwise needed:

 :#> modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

or as a boot arg:

 drm.dyndbg=class,DRM_UT_CORE,+p  # todo: support multi-query here

Given the many ways a boot-line +args can be assembled and then passed
in/down/around shell based tools, this may allow side-stepping all
sorts of quoting hassles thru those layers.

existing query format:

 modprobe test_dynamic_debug dyndbg="class D2_CORE +p"

new format:

 modprobe test_dynamic_debug dyndbg=class,D2_CORE,+p

ALSO

selftests-dyndbg: add comma_terminator_tests

New fn validates parsing and effect of queries using combinations of
commas and spaces to delimit the tokens.

It manipulates pr-debugs in builtin module/params, so might have deps
I havent foreseen on odd configurations.

Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  9 +++++---
 lib/dynamic_debug.c                           | 17 +++++++++++----
 .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++-
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 9c2f096ed1d8..dbf901150587 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -78,11 +78,12 @@ Command Language Reference
 ==========================
 
 At the basic lexical level, a command is a sequence of words separated
-by spaces or tabs.  So these are all equivalent::
+by spaces, tabs, or commas.  So these are all equivalent::
 
   :#> ddcmd file svcsock.c line 1603 +p
   :#> ddcmd "file svcsock.c line 1603 +p"
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
+  :#> ddcmd file,svcsock.c,line,1603,+p
 
 Command submissions are bounded by a write() system call.
 Multiple commands can be written together, separated by ``;`` or ``\n``::
@@ -167,9 +168,11 @@ module
     The given string is compared against the module name
     of each callsite.  The module name is the string as
     seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
+    suffix and with ``-`` changed to ``_``.
 
-	module sunrpc
+    Examples::
+
+	module,sunrpc	# with ',' as token separator
 	module nfsd
 	module drm*	# both drm, drm_kms_helper
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e383e93dc784..a77c6e9ff90c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -320,6 +320,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	return nfound;
 }
 
+static char *skip_spaces_and_commas(const char *str)
+{
+	str = skip_spaces(str);
+	while (*str == ',')
+		str = skip_spaces(++str);
+	return (char *)str;
+}
+
 /*
  * Split the buffer `buf' into space-separated words.
  * Handles simple " and ' quoting, i.e. without nested,
@@ -333,8 +341,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -350,7 +358,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -622,7 +630,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (split)
 			*split++ = '\0';
 
-		query = skip_spaces(query);
+		query = skip_spaces_and_commas(query);
+
 		if (!query || !*query || *query == '#')
 			continue;
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 465fad3f392c..c7bf521f36ee 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -216,7 +216,7 @@ function check_err_msg() {
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
     if [ $LACK_DD_BUILTIN -eq 1 ]; then
-	echo "SKIP"
+	echo "SKIP - test requires params, which is a builtin module"
 	return
     fi
     ddcmd =_ # zero everything
@@ -238,8 +238,27 @@ EOF
     ddcmd =_
 }
 
+function comma_terminator_tests {
+    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP - test requires params, which is a builtin module"
+	return
+    fi
+    # try combos of spaces & commas
+    check_match_ct '\[params\]' 4 -r
+    ddcmd module,params,=_		# commas as spaces
+    ddcmd module,params,+mpf		# turn on module's pr-debugs
+    check_match_ct =pmf 4
+    ddcmd ,module ,, ,  params, -p
+    check_match_ct =mf 4
+    ddcmd " , module ,,, ,  params, -m"	#
+    check_match_ct =f 4
+    ddcmd =_
+}
+
 tests_list=(
     basic_tests
+    comma_terminator_tests
 )
 
 # Run tests
-- 
2.53.0

