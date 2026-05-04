Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAF5314D06
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927542; cv=none; b=an3I8h1LwIh4Neb1OMHiElgsHspGKNRLyqr/4EGxdZ/1o1xZumgn1K5CliSZ7DkbWqqDBUS/XwnbRnSm9gMklJAEMhXHc6g0WAqSRO3tUR9jzLhkHkNa62hx4yAAju2UVvoIo53t2cjTWo+Q8LJdeOCUJIs/oEUBOwwSEmztT5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927542; c=relaxed/simple;
	bh=DKL3NEYNkLT6AeW3tGBzlBU8SoqnCLFTHnLDJZrfZZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZ4bY6y5WnVBuEavRza+jZ4SqSQQJZ5v2d3oQS0gP+2ce1zF7FHMKDVJrIB+oWQiBCrvPQbfzgmqvsYLqMPW6gava2zaaHl7oeVwuKpA9VzyFxG4dUPKT4aAlwZHMG31D/QXJQdLrdtvTeD+0D6xOdQv3wYnzAeOjb0Lo4AKn0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYJdfYms; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYJdfYms"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7de44ed7a11so3749396a34.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927534; x=1778532334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Br7qcpiGPSj2JmE5U3/ZGo89ps4boWTHGEyMJP8s7vk=;
        b=EYJdfYmsY86yU857B0kr9oeFzhsOmB4xULl+ZYFRyJo+KmhDkGfgu1FUkHVyvj9+Jl
         dNRoQJ+9L8Ie4tNm4c999U5qZT+R2yji87yhpsYtXmSi/vrLgaGQySAFvkJFa0OI/CzQ
         raaTqvHy0BdU/uLni5ZRQnu2imEVzl2ab+a4aBKA9MsUuWBQmJJklUxY4vOT72Rtzzm5
         cyy7lq35ca+soLPY93HeqguUkVmF4tmJZr9/26a2r9YiHVnJRrETmx2OTMYPu/iHifGg
         onvDcO/lCbzKZYCnqbY5TYFjqksbzTTgFq22PNmCZRL7XQ1XNi6K8MCni0yWxwNczDqs
         vJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927534; x=1778532334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Br7qcpiGPSj2JmE5U3/ZGo89ps4boWTHGEyMJP8s7vk=;
        b=NZfhEbFD/slGjm4pRmjgY6lsxEWb2JbTRyqAO0xNn+MtL5k1iTUcmXAauAK1plk6pV
         RchlUu/NgU8vYOmOC5qhxfH2jho8YieuQmZA+cLwWwXZhLgtrM1SFWS4/pagcBkxNjL1
         mB/g2y4nDS10rxjnFNjjzAJFOQhrs/JYcTlMVkz28LvSLvZHYZoISaBrZ+ArVn1WOb+a
         fVAE9Tp4I7zXdVMzoSOjBHmB16qKyRXn/sauNBH1BK7Zj11Hfoq9wJ2BJe5kHFCjse4T
         aReI7o6nIxj3V7waIfaNFJuudojeS58uuu9poT+MwwKan+mgGIjcHcyFXL73FkOcfKKK
         b2jg==
X-Forwarded-Encrypted: i=1; AFNElJ+YZv7UDx7Tq5Hvx3cXv5M2Iy1ay5Szf+Y9KEuNh3xNG/6KEkRYeCqkDfnUvEikYbbqyXCuuLU4LeQkKS9tADw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9SkqqjdxYh4nl3ImGRG4c74o0mBPq4CwkqnUiQib1XrbUmoiK
	/tFYN2Z2tjnesiKfO08Mj0LZA9E+US8h4qjVasHQiBt+HFyt95XHQi5f
X-Gm-Gg: AeBDietkKTkdMIWooP4E8ueZxPlOoXWSwwASIMWIo2BYsBmYPYNIaPeBl8l0YqCpir2
	lmNlMrd0VQSog+MTqiiWgivRHmpjqOpRXk77hNmn6CLQke7Oktms4s7jvaPir0p8ImwvhHEctY2
	idS7QvkoX+gC+wVsXasGiMuhz4KHEc6XqQ5U1oba1ig+LC60iUyWdro7Bp4pHzAexp/O+JfWuls
	U7V4bwXK/AHV1LZf0a/wl+112HaffvhUE9f0cUQLXePoJ8SxEus7+PWc/YRtL9S565dO5/v/jhU
	QPzyrIUnxScj263DM27LjVvR+guTGhZx1khNRcMJYWWEXd2Xidpw5bBtNW13rlhxGl8dXSvVxgX
	jcnJDURHNtRmmmeQ7745FPwNi1dYHh9Fm68KVfq95Kd9dH+ByGCJtK7RU6W5nV0+0uzw0gmhd//
	L0KxL1bUkIGY+DiLh2cnG6+3jM0g0TGLotpy14EVp/puwjqFc+BYVQJjO6kApfO6K3T4pkJnnfk
	zsx/wZXoTo=
X-Received: by 2002:a4a:ee85:0:b0:688:c97d:bfc3 with SMTP id 006d021491bc7-69697c41b7emr5109337eaf.38.1777927534448;
        Mon, 04 May 2026 13:45:34 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm7144713eaf.0.2026.05.04.13.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 13:45:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 04 May 2026 14:45:20 -0600
Subject: [PATCH 14/17] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-dd-cleanups-2-v1-14-6fdd24040642@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777927513; l=3965;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=DKL3NEYNkLT6AeW3tGBzlBU8SoqnCLFTHnLDJZrfZZo=;
 b=yq8Txsr8bIzmiRhadcjHnLMNs/sapqhed8qLLgEzSAa0+PfCMKNobkXl8S6boay7zYiFSWV1A
 nx2nllgQBJMAvR1+0/NV1xvwd914go+J3k+0nFpHrbuJGYw/7Df0sxs
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

The body of ddebug_attach_module_classes() is dominated by a
code-block that finds the contiguous subrange of classmaps matching on
modname, and saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).  We will
reuse this macro shortly.

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which already segments the builtin pr_debug
descriptors on their mod_name boundaries.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v10?- reordered params to match kdoc

v12- refactor/rename: s/dd_mark_vector_subrange/dd_set_module_subrange/

1. Renamed the macro from dd_mark_vector_subrange to
   ddebug_set_module_subrange to better reflect its purpose of
   narrowing a vector to a module-specific subrange.

2. Simplified the arguments by removing the redundant _dst, as the _di
   pointer already provides access to the target _ddebug_info struct.

3. Refactored for Clarity: Instead of overwriting the struct's start
   pointer while the for_subvec loop is using it to iterate, I
   introduced a temporary __start variable. This avoids the "subtle"
   side effect and makes the logic easier to follow.

4. Updated Documentation: Improved the comment block to explicitly
   state that the macro scans for the first match and counts
   contiguous elements.
---
 lib/dynamic_debug.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 4065c57637f2..546b3e9ec25c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -169,8 +169,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1271,6 +1271,35 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	}
 }
 
+/*
+ * Narrow a _ddebug_info's vector (@_vec) to the contiguous subrange
+ * of elements where ->mod_name matches @__di->mod_name.
+ *
+ * This scans the @_di->_vec for the first element matching the module
+ * name, and counts contiguous matches to define the subrange.
+ *
+ * @_i:   caller-provided index var
+ * @_sp:  cursor into @_vec
+ * @_di:  pointer to the struct _ddebug_info to be narrowed
+ * @_vec: name of the vector member (must have .start and .len)
+ */
+#define ddebug_set_module_subrange(_i, _sp, _di, _vec) ({		\
+	struct _ddebug_info *__di = (_di);				\
+	typeof(__di->_vec.start) __start = NULL;			\
+	int __nc = 0;							\
+	for_subvec(_i, _sp, __di, _vec) {				\
+		if (!strcmp((_sp)->mod_name, __di->mod_name)) {		\
+			if (!__nc++)					\
+				__start = (_sp);			\
+		} else if (__nc) {					\
+			break; /* end of consecutive matches */		\
+		}							\
+	}								\
+	if (__nc)							\
+		__di->_vec.start = __start;				\
+	__di->_vec.len = __nc;						\
+})
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1278,6 +1307,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1299,6 +1330,8 @@ static int ddebug_add_module(struct _ddebug_info *di)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	ddebug_set_module_subrange(i, cm, &dt->info, maps);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 

-- 
2.54.0

