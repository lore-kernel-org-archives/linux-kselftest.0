Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FC73D333A
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 22:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440542; cv=none; b=FYsIqZCPbIvbn1oyyyqq6q52uemL7b72ZrzeZgkE0aedFQ09qMzixg2fk4h87vQjYzRZuug59cF06vneuIUbkXn4ywdgZtWP85U4Hxu8ZzFz5+lJN8GtyKEuy4f1eaNn2ZvquFAwfMWF92W6xjwAkCLkLk9Zf+Bp+VSgXNyrs8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440542; c=relaxed/simple;
	bh=4lg9KesBI/N2Rj/6xaevlfNeh5wYawcWkW4JaA+kRgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=unR1tVfbPgF0L0OJYXsGK0ovEVJqqfufmI8lvTaStAGyJFXZOQBl3ouXuLiIz+vq+xiG4WvPlHyZNv85WdkccQrphsZBh9AwfN8ToTaeqGzfm2hQGZSXfOATT7ZDXvN4fMd1ezoP7UwcB9iiDuB3objM9+HzyUxyBwrPxcbZ7gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvuI13Yi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvuI13Yi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so121684965e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 15:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780440539; x=1781045339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5wuRkJDj9pHl8KpoGRxyvf+Yl8bVjDmoJ2Kfc5m7ZI=;
        b=PvuI13Yi+CpUe+TYj+CdvAynnYvoQyFeAdrmZ3M+Hkw+aEYuXq0QvJYLK+GHOKrKiA
         HKvIX17kpYzwovZ5qFIcYLFN7gqs0r/jgpq6RYuNSvxs3I9a3ue6/C/H+/CbJAXBDFDD
         3C0wwrbXOG1kB0xQPUsceM9xB0MFig4MXYr4o/K/oD1sbtO5EcrD3OAvjNF6PEW5K9oI
         nvepBQSLyuPJSUZpEe7P5U+iJwwO5q/crAPlJrzhAUa5VUIIusNoGnvuPtzoA1tm367M
         mgCEUAwrhLXaE2D+tLnJj+C/XUOPlIDKQj9OIzkT8cfGDb1zxqzs2rfRXMzoJMgG8KVe
         G2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440539; x=1781045339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a5wuRkJDj9pHl8KpoGRxyvf+Yl8bVjDmoJ2Kfc5m7ZI=;
        b=BfmkYpy4cCjvsc63R9LsStmzQfQbkWL4ig3HxhKF5l1eqZGFHY5hkrh4j8JRU/PhhO
         bVfKOQczhUVEje4semkRgvWHgE+Pxn52Ag7KcfmXg7pNcGJm3p9GoPi5iQHDC1y7+8jR
         XXekcpDbaMLM3G/VaSKQczypDeWArGb1dXGCvoT4eoONdNCBJa06uwXHoZiFNbh4h18p
         LkiKEJv9VLsZAbs6rvvRQiJiBPhQuucnvy2bUBBPhnKxQljEIBAh0E3RFN+VXQ14jcod
         /whYbQSF7vVvHcKiR+tuECo8mCfW+JRKG9jg2DyPdSQlkhs6LBNc8LLz+0zAuOO/1iEP
         /d7Q==
X-Forwarded-Encrypted: i=1; AFNElJ94gy7NhHM4IoCUHRAi3ZV/tyL0UK0aY+6ozglSMGKLqgt4qJM4WSirthWfuqaXNSnSEpSkE8UgJuN3Ho3p600=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSzIk2xA0v6/5w/rmTXR/sYviJ+WM+BJ0eG8ZSeORV0gEE2XrD
	O6VEm2NOvEfpLtA0UvTy0CXQOAL5dHE3GSWwAYrOquMj5BBCDu7ROH72
X-Gm-Gg: Acq92OGBKnEAlUSb6OCE1NP5H8j3xOho1kMDM3+mYd4fUMtaUDAU5yndKh150b2jxx0
	BToSVtIH5QQY3ERaV3CZyRgTWN7ui67jYrqLPRXplbAj3P6dYvhM1rzbvzBHM7HuimF401f8FuP
	JkYYnkxmEVP2GCrayEDidwM6d06NW8kpcyhpu8RcLbVeEAyEh2H3LZ2HaYcqTLzZRtjZXCdqZr6
	QquwArwNsxneUScawxBYYjivHaxAuZavpafIZLqFK0NQzaB/ToPNqFs6g0E13pigqjJPZsbIG/n
	5LeoomvO0LA6cO+paD7g4RLJrubxNxvA7No0KkPczx3UlumMMofYXwju0YvnMW7tX+pMxYRfYCU
	1Z168e+neKsknHTiqFXy6gZrHrERf/EQt4JJ9MIVr+0uquhuG2SgY191IBsYqZ1cKRus1oCnYPU
	dD9wYUcC/bup1ucw33HiIGQQWLJGc7kySUjah+h6GUJQ==
X-Received: by 2002:a05:600c:1d09:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490b5e51a49mr12032925e9.16.1780440539379;
        Tue, 02 Jun 2026 15:48:59 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm1999791f8f.14.2026.06.02.15.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:48:58 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 02 Jun 2026 22:48:14 +0000
Subject: [PATCH v4 17/25] dyndbg: macrofy a 2-index for-loop pattern
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dd-maint-2-v4-17-19a1445585a8@gmail.com>
References: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
In-Reply-To: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780440488; l=2812;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=4lg9KesBI/N2Rj/6xaevlfNeh5wYawcWkW4JaA+kRgg=;
 b=3P7+mdCXoJxjAUzdstBNcQwkEcs02tscKMoOPE9iAw0vT6di3+pyxw9lbgtyKlr9wFEn3rgo6
 J9clxTxMwNZDcYTI18IdMjs4v5w40CS0kYdfPFI8qc5yiKQpwOZjsfF
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
index b8a494835ef5..a593e040d1ae 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -149,6 +149,20 @@ static void v3pr_info_dq(const struct ddebug_query *query, const char *msg)
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
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
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
 							const char *class_string,
 							int *class_id)
@@ -156,7 +170,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1162,8 +1176,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
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

