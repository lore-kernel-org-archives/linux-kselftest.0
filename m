Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9635AC14
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520535; cv=none; b=Z0QWsVKWe3WhNvrdBdrVqDjVewabnbcnc0pIgUo3udiuMEXyC61snV3GQyURxy8wBsJMDmRiDWCMMyBJzypuHB3DHWKt7hB7FeJDSHReBb0HtZVPeAbpnDgEkFto/HnUZ5/27laFPUVCF3LIww3TQ/G3EBdk9dVfbz29VN0CdYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520535; c=relaxed/simple;
	bh=IcYsAkjYk+uuIclQHpJnOMdkt8o2M7E29sb0avD+z5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CzQ0cL/s5SdADhHOvqGACh4HcgF2VzwNsRigImBvG9ohzkdWj9CpDi3ZTXnX+rA7l9W0r3SZXLIkV2V2S+6/XTmWlKSJanwBd7XWfrfroMQFli4DY73ouZ49KYZ+zPFYfPOL7ogcNPYQyKKOEkXwGDt4Wv37QAIceKXdbXmTq7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8JSr5C9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8JSr5C9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a5174670eso4708053f8f.1
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 00:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520530; x=1780125330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDOYX2d+BKhaTTyw2PdfR5N/FD2dwrYDYgB1Q3ey6Ms=;
        b=D8JSr5C9WoHEXJvYIjqi4bTBRBV/9xNIiIveJ1TgRSTyt/EX8N/h+XUH1KwCBTTp/E
         BzFfjNt/1GZ9Mp9yQevC39464z9K3lmW1KZxbOtgA9H0Jp76uDjXqXvTzeCdzXNTR7+V
         i/Hx4kIZy5v8h/ZoDo/5u+21xEbRkSzcxKj3wVaWhHH4taC5eDI+SHzgQA6gqJSqCwmI
         CkHtmCaS5bQaOplrrcL2xS8WJRLWBCH2GuLKeGtOjD/PB8m4pyikVHEzcx70IfT7sY2z
         8xXCgAvO4LhBg+qpnQfNBYAN2In1hYWwtoWid/MBHGqr4jLYn/YKYaZIwL+GiMuS0Shc
         J4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520530; x=1780125330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pDOYX2d+BKhaTTyw2PdfR5N/FD2dwrYDYgB1Q3ey6Ms=;
        b=OXyieXbFfe9gilchBFR6G1ha5uy337oUwPgawqoIfFQsSjDb8/m7DciOMNIT5l+OQq
         /3ZNGDmJwl33NiADjtXxIBSiAU+WcgpLEh60zFIDW92qGRQWbT602a/woYP98cz1Z15z
         9WDfGwjpsv4isduw74lVOcGn2vWHT0YlTrrEWO4LY7c1H5NA605Fg3d3h1p7ylYqP/k8
         mrI0tkUJsrpxgHFNudcesODoZ1tbep1hXrPMj+OGk40tKBdsAVuCeK48+IhqJkjVsYLN
         EyvlKzgBTiroRSRDtRvDBrwBhXhSQ0Vtk0K5lZB9/N7LpL1vMAiDV70gqK0nGGDNkv58
         Bdeg==
X-Forwarded-Encrypted: i=1; AFNElJ+D6A/sscV0AwHEuIrrba0O/IIDUbI9fyPJSvKlx7hzkMnRAg3T7G7Z/o//FeyfWGXSYqE3XtCeJVn5T+JaPGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf/5rL2uEfnTMqAtdaFI97z0I57UOdbt86jIQJSs0xT12svtdH
	JaJZAHH1D8DwI9/QQIZ2gEY8zXi2Tqtgpo0eVkguMKg1t6sr/USpSymn
X-Gm-Gg: Acq92OEupWdrpvxoKC6QfRjpzpg+MwOl4oU3mEEd31N7Da8+LjGsW+/M2kHIIBXQBAu
	S1hkZu/HtbkGj7Orst2RtofqVC+AdEjbtuRZu8BgE8sLis7dLAM+i0HdcGST3HuFPX9mJxqYHMl
	g+DgeJ4njUn+o8MCqpo7IyAtwGjCaMMTiZy8zLeYtSkCAC4L+MWGDzrmsQ9kBhLXBcNdoN4U3/k
	162/wxlnKyY2k+S0B9wY0qEEIL6XdA2nh4Zj7Ogyk5/0cTkbyW1FFX2jelcDIdsjc/1qRGFx53H
	72NJGo2lC5IMT6kvHCIdUu453hjckaElBx4/beWdmJ0N750Hezcd5OlxnlusBUSXew1gbNKst9n
	Njwxk4lPEwxRIui+Tx3S3UKe+GoT2WB76uwB/7GQ0phM7ySZF/UA3YQg+U/qRhfOmkw/LvvxS87
	15da/B1uaKYkb+MKRv0co4rmvu0FhA
X-Received: by 2002:a5d:5f8d:0:b0:43d:71f4:7ed4 with SMTP id ffacd0b85a97d-45eb368206cmr11355026f8f.15.1779520530539;
        Sat, 23 May 2026 00:15:30 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:50 -0600
Subject: [PATCH v2 17/24] dyndbg: macrofy a 2-index for-loop pattern
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-17-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
In-Reply-To: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=2772;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=IcYsAkjYk+uuIclQHpJnOMdkt8o2M7E29sb0avD+z5Q=;
 b=DSaOdL6/jQ5YJqm3Wtd/v9vl7sBYDaCKynhQOcWgxX0DOYt6uiNlbXyVZEYxlh8Mx6/zJ2QHU
 3ndgCMMLJ68CdKl3OWiPBufHpGCMCOGE5M+QvMfjnN8/xUiv+axEwat
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB
---
 lib/dynamic_debug.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 7f03b331d185..e9481ef21825 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -130,6 +130,20 @@ do {								\
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
+#define for_subvec(_i, _sp, _box, _vec)			\
+	for ((_i) = 0, (_sp) = (_box)->_vec;		\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)		/* { block } */
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -157,7 +171,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1159,8 +1173,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
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

