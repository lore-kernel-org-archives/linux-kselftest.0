Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB7A31E84E
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927534; cv=none; b=XCBfn8diwUc79lU4/KwGoTsv8PM29dWS3Yf8HZhBwAGwnwQ5ljMCGzksjUWxg8QauB3qjXkH5K0Y27VkrcmRdJoCXbqCSdfVZWB8n/xcARB1yK9KEBjzsn0shEWIL4HNSrUh7JsX1/RG/jEEDIXJQSTRibLhMzaznt9QeWj6dzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927534; c=relaxed/simple;
	bh=NslGPf56TkgN4/j9izGGWGr472wtOkGpmHFdJWrry1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QV6jxcv9e0zNm4RgqcC0AZkHC9xlIsGYeiPYZrztZS3PqvOfduqkW556wO7xgKH7ZwOd+kuVTfKleL4pNOTAhiO37tH7WFEYudlWM228XtjeWW4IdnUSmlfaCDZYq9kSSeHYuqmDiZ6DUFkc/fO8eCkyyWbKgezrr9y0Ay5BQGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDZz7YGX; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDZz7YGX"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6966f99716fso2279637eaf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927531; x=1778532331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qoclHCkjnqN+rteJqtNC7ysLMYwhIcJTEzsexq0zpA=;
        b=dDZz7YGXanxIpoIXidcrncu8nDnkpuOpavGtSFd3onU9Q/i7EV2NnAWJdyw8O7AmuH
         12QXlZV6GdKRnMumEVNUBBnv9wFVY4BQcwVpd4n3vXbVLjijLXLH7xewCiSAfh/3fEYp
         C+jG2og4aOPMuGJSasJSWTXDoguKfp1Acq6zC70qbSHSdiuKAxvXIsM8l0vK8IGiybhQ
         78glLg0TDjXXLnNfg6MGtDVgIRq+mwpcmlig1VDaqbK021CDf7tVg5dTXh0KFoYvnG6j
         5dikwZGqM1x3RokddYDBVGnPRzreFwVtNfGndMF3heMmycX+Nto4FulE0IomIaHcoEp3
         Arkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927531; x=1778532331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qoclHCkjnqN+rteJqtNC7ysLMYwhIcJTEzsexq0zpA=;
        b=oYmFek8Xui90QvSdr40KO5lFEFRxKogkdyMnJ44juLIGzJWF0hgUF4DfxTJ96P1gGC
         6LqAvv2+qajIct7Lczrm16DWSkir02VkhTTCp9LeGpH00+F9Ic5IbpheESNXFrm+80n6
         EpG3/ZZ+UGomxM6cSEACHOpckowoh68bTxMa7iZG1shRczDOYRfg/0yatniRvEp54UAY
         u7Y2kX+LOKflVuHhAA3NfYuuCnl1XMC8ibUcMlfG/pMDxpcBKFgkU8lXv3PLY0QIgni+
         1Qp/6gsuyn9lyQo1jNI0WwnK4Q28Chrn5n58nwsEahwRJPoct6AnglfeQvv6xuOYMfso
         Jsdw==
X-Forwarded-Encrypted: i=1; AFNElJ/5S0yvI6EyBziHPsfA5k1K9pjtQXSSbDp4EuEJ70PGNEwuJdknZjIsP3wLnTA8FtPAw0ILhkVtlrHRyyZqxvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyaCk2tRBO4XG8FjKxt5SQ2nZc3CkCMwKM4VB2ybAs8p1Veye2
	XCYnQYzXl1JoTClrtFhimMeDDtyQzFNIeROMgcL0WVFdJvj39cBdF0x4
X-Gm-Gg: AeBDietxnqsNvGoYGMpsjbgdm5IiwZqIIzVBNZs+xc+a6Y89rD3uG5CJma7Cc+XPv3C
	iK+MBzbIAzqGZWQ9DmPDZhWSarKvz+rrBYBm9uu7yxmExRGCCGw65vvmH+pMGM5RQOVlqdlljG8
	VfjzEDSkuPTQJBTfxvh5o6cVv26xu/wPqWFAg9u2PLzS1KP4kYrORLLIkw3P2gnx+XXBLKkynDx
	TE57wveZvNhOy3ZtZpb/Lf2Q3g+KbAuBslEJ2Xhb0zR3EACp0l4jM0ay6sR9hbRXtmKJQr16FfA
	M7hyi78WJuthfMYSdruVqdAHnmpg6belG5phCRkXPk7iVEw82Jj/KoClWfi1GcXmr0mU6yol9MY
	NhZ9jpBpbYRZ6LKPPt+OSZJAyy86FRzaJM3q/9waNtxQ9JXL0rJJSC3i7t86r5wMZGTUG90x6Re
	+h8QUBBA7ws/UxEF2/xaPX3JpewR2KUijTqjlChTjnuwCKSHvsX0Mk+HAmbXYBKOijr6WXtJyO
X-Received: by 2002:a4a:e909:0:b0:696:83be:84a1 with SMTP id 006d021491bc7-69697df6f52mr6282894eaf.56.1777927531300;
        Mon, 04 May 2026 13:45:31 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm7144713eaf.0.2026.05.04.13.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 13:45:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 04 May 2026 14:45:17 -0600
Subject: [PATCH 11/17] dyndbg: macrofy a 2-index for-loop pattern
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-dd-cleanups-2-v1-11-6fdd24040642@gmail.com>
References: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com>
In-Reply-To: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Shuah Khan <shuah@kernel.org>, Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777927513; l=3514;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=NslGPf56TkgN4/j9izGGWGr472wtOkGpmHFdJWrry1U=;
 b=aL9DILWqitpaXTi2Lq/XveMd/6MjFHAIaCLDStz6QGaHJLunCgyW01uKRPL1FfkVOTi1TSjzY
 eGisUcajPIfDpnllWPgO7j4IFinScltT4gwSEum6C7/DrErjEryYjIi
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

dynamic-debug currently has 2 __sections (__dyndbg, __dyndb_classes),
struct _ddebug_info keeps track of them both, with 2 members each:
_vec and _vec#_len.

We need to loop over these sections, with index and record pointer,
making ref to both _vec and _vec_len.  This is already fiddly and
error-prone, and will get worse as we add a 3rd section.

Lets instead embed/abstract the fiddly-ness in the `for_subvec()`
macro, and avoid repeating it going forward.

This is a for-loop macro expander, so it syntactically expects to
precede either a single statement or a { block } of them, and the
usual typeof or do-while-0 tricks are unavailable to fix the
multiple-expansion warning.

The macro needs a lot from its caller: it needs 2 local vars, 1 of
which is a ref to a contained struct with named members.  To support
these requirements, add:

1. __ASSERT_IS_LVALUE(_X):
   ie: ((void)sizeof((void)0, &(x)))

2. __ASSERT_HAS_VEC_MEMBERS(_X, _Y):
   compile-time check that the _Y "vector" exists
   ie: _X->_Y and _X->num_##_Y are lvalues.

The for_subvec() macro then invokes these in the initialization of the
for-loop; they disappear at runtime.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 94a66c8537ab..8f614eba8ace 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -129,6 +129,28 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a member in @_box
+ */
+#define __ASSERT_IS_LVALUE(x) ((void)sizeof((void)0, &(x)))
+#define __ASSERT_HAS_VEC_MEMBER(_box, _vec) \
+	(void)sizeof((_box)->_vec + (_box)->num_##_vec)
+
+#define for_subvec(_i, _sp, _box, _vec)			\
+	for (__ASSERT_IS_LVALUE(_i),			\
+		__ASSERT_IS_LVALUE(_sp),		\
+		__ASSERT_HAS_VEC_MEMBER(_box, _vec),	\
+		(_i) = 0,				\
+		(_sp) = (_box)->_vec;			\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)		/* { block } */
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -156,7 +178,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1232,8 +1254,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",

-- 
2.54.0

