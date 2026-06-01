Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED1E379C4F
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 12:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315545; cv=none; b=eoJOcMYJe0gMFazxTolTQcrZjIY9k1IUFQ690XSMUb6p2hOGhwYyFY4yWdFSDZPrdAaP9PNqocLFBw7zsBUD6Et7/H5J1uVjs+JkR0MXlqkgRbeNOf8cLJ+KK4kCZTPoyYSH1eacU0o0i4nw7RY9BhyUZi8/A5P40SIJtHsQ4jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315545; c=relaxed/simple;
	bh=ZfklE9gj7vCfD3eea9V5X8HvMt8Vi5qjDtQN6GjxEN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g7QMghbbY+9fpIvy+WvrUqLJDgE2s3u4mTZ5NujdZmZkl2LKwU9/+GPmTJgzoySnVbmuwGYoegjS/+Q0zb5g8m31og722oQjIWRr3WkwsM3HFynJbK58LxNEiP16jIT4yjT2W/Ih9b/X9G7G8EwQelrrTlJMDR3fYvUQnztyWUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UF4Q4I/U; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UF4Q4I/U"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso3280965e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 05:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315542; x=1780920342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ech87mZQ32X3CZj+LUnUER+oXQssLV3xJ3OsaeZimlc=;
        b=UF4Q4I/UHe5u7yhuJwOZSBuIYlvyRpK7QE/Wz4cQMkXgVNSQBEpSItY2c90fj6DEqX
         rk9PFniK2NlNoXgrstfaYkNOq56kfIrh7/4y19DAl3GAFDGjRIY5Bnzd1AoVZMXh/Ubw
         43dSslLZS3N0ZFKDl+q5jKq1LFXgQ4IcqWaZ+BjXD9hztW5uGTQQO/tdZ8OT69gy3OKs
         BfHmDn4gktezG6iJsCP+XJ+ssznG9qi++Sjsw3s0aVDJcbYefgdAYJBaNQmyZiVTftz0
         ghLRJFwwaalVF/ilof4vjPEFVDSeMyLdy6KPUI0lYjB+cMAKxa5VX6Ur50MRL8xPBawN
         fp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315542; x=1780920342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ech87mZQ32X3CZj+LUnUER+oXQssLV3xJ3OsaeZimlc=;
        b=NcGJ/LTgDFM1NAlAuFV9qZkt7hdaIPhbKo8zs7PkpP4Xg5c82KClqCBEX1yTskYKxd
         XNjUSn/5legSGbrhL+KQBvZB72wjKgwzqP9D5VvYoFIKkYYgy2E8cM6s2odGOKkdYlb2
         YRo2iiuJKCYQ7+4hwWzFS3axuygg28QE3VFFK9d5VAqVwB0GIy6k0OASjVgE8mgTLoT3
         0CjUR8pf+kGOcT6rDQNyGGRRbAAx3aZt3P57TbSztUPCxNxwxAYF7/6A13UIE0Lc2Zzv
         GEkjpAeZuEA1C0HBOEpP72JWUfL584RcKY5NwhbjHbcupqa+UNHiEsxS4okvdaMadTBj
         gxtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GVXe9nh2iB8L6zsGyl4MvDq8v8W4aj8LPxU1in411Y2wZ6GQx/8IPkHtT3+us9tE32OFmI6OpYMV34JJr7hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFNgRLRHEqckzolhd9d7yuYlDBJ5WNvbv0PXyckG3tM+WRu95
	LE0RnUOjZak63UM5cOdO1pA3Ap+SNhRrSIs7v53Wl2Sg/dj88uVPs0eh
X-Gm-Gg: Acq92OHBpUynCjksHUXucJIMaNb2EOUnD9qiYTBCqzEI87sHo7CL8nz5VFIca9AdjjW
	/XLU6XnHFRzcrKoJcEeK+IRvsue6YhH0YyeJxOnhVhGCm4/DVpRWjjFIOMkfUEvI4IQak1WuqLT
	EAIUbUcRQcsIXbztyz+E609akcsIOylW2CRRq9MQct2h8d2wwh+bubcR3xXc7AZDCmst5fMmTDk
	1lM9qahsXLoH5g//6VMGtuoxlUxzo7XU9bYxB9WzjqrEl+Bad+snbcfV7b51gRXbq1prN/Wskzu
	yb5S03D4E8VKUtKRE4JHE3pre8uln382/vK0oOtvWJ6tKoTI7fng4BSB8Y4GQ3h0deYY5/vkRLD
	htnZkwuDVVzN3FFELwjUh5zmO1FLf8zbHdHZ+PMuH+NsUDfTg8OdyU1Ga+47PKInRZfRiH2sYPK
	I8jF5EhKlE5npKxL3CQp9/Zj/5mlPflYzryA1or80myA==
X-Received: by 2002:a05:600c:1913:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490af632efamr7899045e9.7.1780315542019;
        Mon, 01 Jun 2026 05:05:42 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:05:03 +0000
Subject: [PATCH v3 17/24] dyndbg: macrofy a 2-index for-loop pattern
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-17-4a15b241bd3c@gmail.com>
References: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
In-Reply-To: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=2772;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=ZfklE9gj7vCfD3eea9V5X8HvMt8Vi5qjDtQN6GjxEN8=;
 b=n8nbwWaKVqGnAekTc7n4FU2ddyIF+UIcZ6wRa5fDPjwBR201R0OD3zGDuaEJfEr7LlWKf47jD
 m33YXSb5mcNDMK+V9++XRt+r3LXwU+PrmjEmwe2Tl6yun1FRoZoWzIK
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
index 34d002e0a08c..41bbb72ef730 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -129,6 +129,20 @@ do {								\
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
@@ -156,7 +170,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1160,8 +1174,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
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

