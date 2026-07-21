Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FCF4F7989
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 20:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667474; cv=none; b=F4+9Tq06LnWOkF1cGs+p+zHDHS+iBJw26zRopS+Kra7ravCkrOirNaJBO7zuSATFHgpwomYp6feJHFvASariKo9y8nU8zwxB3cpWjVrmGAeWltHIfgIJ4y5ve2ZLLtjqvRVVnueG/4EGtrTdl6EqmFRnNf6G2IbNnJ3SHCy4ef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667474; c=relaxed/simple;
	bh=N96lQhtnzU8bkmmt82baCctVBSF7Uia4qP3gtkWiwLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMiOr6t1TLNoGiVlvXZHwphlakB9Zpk9KhWHqZVoHMHlmxH2ZsdAvEP2j0Oi70ct0kVFlREOR97jFH/2ShCBkSkAk4qtjepQb6z9ai+tvrJeXNTDR2FSeAGzL0W0O8C+H9kYLLxkVGTqgwD87u8xnAhppR5mHOMVNGEyNwz1TAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1DnfR7y; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1DnfR7y"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso8924646a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 13:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667463; x=1785272263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmkeGJdto86FHCQc0XNSEguCjWINd8O0DQoc+nU0950=;
        b=q1DnfR7yIG0+hWkF/7lgcF1THrZqh0dd8IZ9aTmusxhLXo6eyA5HEkpluJEQtmlQiS
         9YDQC2uAfJxFXGHe5VS5lE3dM38wbIy9ZcJYewLFivnfvuYK1hh6slBPWlz9fI+vPuRI
         yRNTMFG13BA29DF7tgiUiznBaT5wA0MZM0yuDPzNu33Owbi7VGFbvSw7wHfNv6AzPIAE
         7UWzDZj3ZvCfWTFqjkJityGOzH+5PrdKksJ8GWJmQNTqFeU6mJfKElkSPPziANg0hvNP
         L5Kt4WLFWI/V7feLWufPNmxfvIVKKYBk+q2KqEAnaRK1/ldRV3iA4xm1+CptfSyy2htG
         QcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667463; x=1785272263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmkeGJdto86FHCQc0XNSEguCjWINd8O0DQoc+nU0950=;
        b=CGMnX54aW5sJzLVXLI3m6o59KqvrCPpaof1JsX2/eFUJxD6nXFFAPX+3s/Kq9cHwOD
         RyhLtpMXw8KxY+xL7uICWsAhB/E/iQT3P06ndDePEOFddfwH6XqhNp3cT7f+Tt5rnSCv
         QKTV1im3N5sSuwQS2S7fA+ililISyaCaiae/FBKM7JhiIL27eONz+Lcng9VLVzhnYsTi
         IqLDcdXmnimr5MkAA7SFebZm0LG04j1M3o1HX92HLYckZ2uMVE/doE3HjVSCNGgS8oj+
         7Jfh5tohDCxist05TkU6EphW2WtvLY3TOV87pFMUoNyIJ+jurYUS5jXZ3115+amWmlo7
         9ZGw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8I5ZEUXFM05AQn+9nflv3auhcaANLkHvA6l9LG8zwboi+vJXHJ8ZgKu0JhurXZ5rX41aGZX+UvV3YW/H/xBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU0NDDJaDNletgv2fG0VXbmkQUGz70MtiWF+D3j3d6C3pfZ5Xg
	RyjJRd86mW8MTaXErdj/PE81CQx8bxsWDsnAIGDjcF1lPnCs0qzozJWy
X-Gm-Gg: AfdE7cky0jBNJD2cezfmnZAcvnOr4WATAsD44YT41I3p4EaIYe9u1v8jLjDq+qRjChw
	IPmL52fPbTK/1MMlDrYcIxdg2hL5OKeb2RUZruRv8D6CmS6iEvWYRusCoPTx9/YOKJAmdNkFaPy
	yEi4LlPVVbT6hZ4xuzdyqG5aNh6IafCdxT2pintk7vRvI922VLmVI2yrPc668yKcyM7oDcytbNB
	oWVwQvl/BPYY+fi+mKsmbB7KKH/rsua1/Yf4MqSGRaCOdHYF6qYXpTPaMpNjvMafbr70/z6d494
	LwcfdGe2o34AigrBpjt+JDmfmnw8MT7BDiLHuWOije1T/gQldQRH2rfao6FFx+lhyBGxXin9v+T
	WFmaNClGZkTaaHgmWmGG1JrcpcptEaBA9vNP4TrS6n1B7ypS3n7wqrClwaTFElPUgSUg/sIhDf7
	FGQh1KimJ4oE51oyaivy5Okf+nrUNRG2GUnjxIasejySaNDIZMzGlg4Ssmi0BESiT2Gpwjhi2TR
	pr99ru17VcsXcTMJLnv+MFK1A==
X-Received: by 2002:a05:6830:2316:b0:7dc:c4ae:a679 with SMTP id 46e09a7af769-7eda0704f95mr10881604a34.9.1784667463408;
        Tue, 21 Jul 2026 13:57:43 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:57:16 -0600
Subject: [PATCH v7 27/29] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-27-010fbe73b311@gmail.com>
References: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
In-Reply-To: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=5915;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=N96lQhtnzU8bkmmt82baCctVBSF7Uia4qP3gtkWiwLQ=;
 b=sP65ir73TClkppbzOP0V+KYmmT2gM0pjq98BIJtPmzTh1Ty+3CTdB+Kp95pwEOkc5WpLv8Xta
 HD6lWD3U53DAUf4B4LiBWwGrVP7S0PQ7vRdyuvfnYcWAqZJx/Az7e7+
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

The body of ddebug_attach_module_classes() is just a code-block that
finds the contiguous subrange of classmaps matching on modname, and
saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).  We will
reuse this macro shortly.

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which already segments the builtin pr_debug
descriptors on their mod_name boundaries.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v3: expand block-comment in ddebug_add_module

v2: move RvB after SoB

finish hoist - drop old fn - ddebug_attach_module_classes

the v1 rev left the old ddebug_attach_module_classes in place, but it
is completely redundant now, since it already lost the list-linking
job it was doing.

It was being cut out later in the patchset (in the unsent API
adaptation phase), but for cleaner review, lets excise it now.

OLD all-in-1-series (pre split into reviewable chunks)

v10?- reordered params to match kdoc

v12- refactor/rename: s/dd_mark_vector_subrange/dd_set_module_subrange/

1. Renamed the macro from dd_mark_vector_subrange to
   dd_set_module_subrange to better reflect its purpose of narrowing a
   vector to a module-specific subrange.

2. Simplified the arguments by removing the redundant _dst, as the _di
   pointer already provides access to the target _ddebug_info struct.

3. Refactored for Clarity: Instead of overwriting the struct's start
   pointer while the for_subvec loop is using it to iterate, I
   introduced a temporary __start variable. This avoids the "subtle"
   side effect and makes the logic easier to follow.

4. Updated Documentation: Improved the comment block to explicitly
   state that the macro scans for the first match and counts
   contiguous elements.

fiuxp
---
 lib/dynamic_debug.c | 80 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 43 insertions(+), 37 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 905277fa495b..b5bc2cc8c400 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1176,34 +1176,34 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
-{
-	struct ddebug_class_map *cm;
-	int i, nc = 0;
-
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->info.mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
-				dt->info.maps.start = cm;
-			}
-			nc++;
-		} else if (nc) {
-			/* end of matching classmaps */
-			break;
-		}
-	}
-	if (nc) {
-		dt->info.maps.len = nc;
-		vpr_info("module:%s attached %d classes\n", dt->info.mod_name, nc);
-	}
-}
+/*
+ * dd_set_module_subrange - find matching subrange of classmaps
+ * @_i:   caller-provided index var
+ * @_sp:  cursor into @_vec
+ * @_di:  pointer to the struct _ddebug_info to be narrowed
+ * @_vec: name of the vector member (must have .start and .len)
+ *
+ * Narrow a _ddebug_info's vector (@_vec) of classmaps to the
+ * contiguous subrange of elements where ->mod_name matches
+ * @__di->mod_name.  This is primarily for builtins, loadable modules
+ * have only their classmaps, and dont need this sub-selection.
+ */
+#define dd_set_module_subrange(_i, _sp, _di, _vec) ({			\
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
 
 /*
  * Allocate a new ddebug_table for the given module
@@ -1212,6 +1212,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
+	struct ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1224,17 +1226,21 @@ static int ddebug_add_module(struct _ddebug_info *di)
 		return -ENOMEM;
 	}
 	/*
-	 * For built-in modules, name (as supplied in di by its
-	 * callers) lives in .rodata and is immortal. For loaded
-	 * modules, name points at the name[] member of struct module,
-	 * which lives at least as long as this struct ddebug_table.
+	 * For built-in modules, di is a partial cursor into the
+	 * builtin dyndbg data; the descriptors are the subrange
+	 * matching the modname, but the classmaps are the full set.
+	 * We find and set the relevant subrange of classmaps here.
+	 *
+	 * The modname string is in .rodata, the descriptors and
+	 * classmaps are in writable .data. All are immortal.
+	 *
+	 * For loaded modules, mod_name points at the name[] member
+	 * of struct module, and the descriptors and classmaps point
+	 * at the module's ELF sections; all have lifetimes matching
+	 * the module's presence.
 	 */
 	dt->info = *di;
-
-	INIT_LIST_HEAD(&dt->link);
-
-	if (di->maps.len)
-		ddebug_attach_module_classes(dt, di);
+	dd_set_module_subrange(i, cm, &dt->info, maps);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);

-- 
2.55.0

