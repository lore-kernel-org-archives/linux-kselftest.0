Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E457337AA73
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671890; cv=none; b=uh4LSD8J9DYt8otKg6cZcEHDxFUfk+r+SEyoZ7Vpy7xnBLZypAdWSdB3LI0e3OqU8PM8zCSG0kiUtQx6IPBTZGPZJEO6NM8HO/9VPpqRp8T09WvjJJ0BSjZwAJYgu/uj0yGO5KJEP7AlBMr8eVmYx6gNrHCPKFvdeYaaYTZ0Gsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671890; c=relaxed/simple;
	bh=WNFHUnqzgDML2E8fRvJfrbHub3FCLJsfaV2ZvzZdIWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N0GxrQXvF+RNdk3Pm73tF8BOSpxj6HsIMH/BjD3i15iXpGbCrEld+w2K5KiimYGMsj3irMXkqPnfsjHOY/Fnl0ykAbUbXgSqKJ4yqWyBdidPQvsUVCBJsuuctDAhV8qSE2ogzUhB9CFfGdlCemLfynzTjGZCzi38na+eo0LfEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DX1ts97A; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DX1ts97A"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4044d3ff57bso242885fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 23:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671888; x=1770276688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLnXo5yx7jTU6//VujJhbrPBDy69yZ4QLqb7zkkpO0o=;
        b=DX1ts97A/9R3vpSi70MXm7i2OixQQwsFz326Knk7/qJ27YFQoxW1RJ7ZCq/Qwhw/6l
         YTkkHVZJBup9qOxhKzik+1b17dORTSmCHIQij83p8Y9lzS+AMh2gxixOzp+ijBEyC2J9
         U9dC0THYWcqQivEXmVnEhF7lIlsyzwbWPX3xYKfAJ/0APnD8qr0PZ40S+6j8eOGeqnS0
         xCNhe035ltLrWHJVb701apCS8Maya39rHi8cterSGPgz6Qo9CZnDnjW6D3bwswzeqdWr
         2215kvifiBSwysfuSTszfEwoPG1wz/IgG6K2+yuRN5Q0nQaB1VN1tNX7D1k5/spZBgpA
         qmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671888; x=1770276688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLnXo5yx7jTU6//VujJhbrPBDy69yZ4QLqb7zkkpO0o=;
        b=X3UuTqVIjMTre9B18IPlRettGhTZddNZdjUy3+ODK3iEv0vl7OOmYHAhrmEch8AMTY
         cT3PMgCfU2A1sk61UjHlB3t1UMcWzoIfcIMlqE+zeBWn/uP3yk8WvfLEusQ37To3rETz
         AO0gXkk942A1oqZ1ErJ1OIQgt6s/ewk2EF7KbP56mhXioRKcKxtkdq7X+OUcyPmPX9Oh
         MxP1zpvGtNWLk3rtOdCXjy8z66uGWYmx7HQnCFObcJmtdCtmVkGOQabosXZae/iEZLhR
         HhGr22ozad2qixxzqBkAbi2TCiqzmrnkYg71Cfmi/q0irJGzpzbpZOa1GBhpotcdH1Tg
         g5kA==
X-Forwarded-Encrypted: i=1; AJvYcCXoY74IA0jmLMfRyBwCJ+eDp4Iq5Ej6zQS0LEjlJRb7hJR8TaBOLLrY5o4EsEL9P46nLdo8yl3AGrWafHq/ZSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCaxBZ2b542Kpzw3sQViZ0oog4euc15yVxF6wBf1vG7CDbyJxD
	YR43kb92Kt35tW5vEgrElIHJWleuESjbbzOhZHrizHr/dsBlDU0mf1a1
X-Gm-Gg: AZuq6aLS+uAXOIuZL9h9F53I2f1MTk3+LSOdueK470osbZWeELrihCgnsNXBdTla6LV
	/cfTBcHfRWW5DdehUWBuTe7Ig1dFc6gD2ogeQ6iPmUfAR7xU3tz0KZUpAZtgI7lmevF+QTNX3K7
	Hp6+M+Ky9AIGX0Q71n5i7VZ9lfL8hzA5EqgGGIKtD/9Tsf8NDgMQr8yVHAQp3kuwtQ/g97PxLyi
	o+sG/fMFObdhLVDzyJZaZ1impbbm0fkwIxgsRTcwJySLfowWr/yeox+9BEDxfqX748UAgRjfVGj
	kSUJe6bCYG8mToQpNWpGUr2OzhAuoUMATI0iGplxTwTfwfvOiJn+GbRREpwGSFLDRGGFO3Syzv1
	4X1FMc0D/kQ99bwTGukPIFClI6jOgdZCUn5f4ZjSuzxvpk4jhG2uQ/Qunmsz9BHsmXo4nTF7B7j
	WDZAdy1s/ukNI77azvT68RECiABcuf3nj7QhI8MzWM
X-Received: by 2002:a05:6820:1c8b:b0:65f:698e:d5ba with SMTP id 006d021491bc7-662f20344d9mr4152211eaf.17.1769671887783;
        Wed, 28 Jan 2026 23:31:27 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4095752ef7bsm3344155fac.16.2026.01.28.23.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:31:27 -0800 (PST)
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
Subject: [PATCH v9 27/32] dyndbg: treat comma as a token separator
Date: Thu, 29 Jan 2026 00:29:13 -0700
Message-ID: <20260129072932.2190803-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
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
index 85fa031d8696..cec054ef7d64 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -321,6 +321,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
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
@@ -334,8 +342,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -351,7 +359,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -623,7 +631,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
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
2.52.0

