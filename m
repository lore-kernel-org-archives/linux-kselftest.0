Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E8036402D
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520540; cv=none; b=L6rvxZAqOtnCPyqEb7vP1Gh211H3SWSFDmfBOLzZ+bMcKoshmc56FUgnp+QUdM3jOjtrcsr/U5U8wHojsYW/+4aypX5PJtEIlrP+15XFaxXfPmb/xZoJ2kHCXWK8E21C7svP36BHJYpbj0c3KE15t/SIg92BxTMMX/pzYf2wuSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520540; c=relaxed/simple;
	bh=fPmKvI6NbniJByc2FBVS00QxE4c6I3lmAwyQxA2t6uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GHZotCfPDrW2+tiJhaCQEwmCK6r34+9srgxJChzKTnJ6VAuaxwNgF617lH+hrJduS6b9/u0VkhpYN0iLI4Rk7U549fnMDgvQufV5Uy/1lB4hsn1MZsK1WKlo7+fSJm+fTUA0ODwuT6xa+fkbQH7uZ0C8XDadxUEN7wjHylIS8sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGw0uzzX; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGw0uzzX"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45297094718so6267692f8f.3
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 00:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520535; x=1780125335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISSGZRpyMR72C6f36Ix88YVeWGG0f7DiWTu+/JHvX5k=;
        b=ZGw0uzzXJseW9jWyEdl14KCvMkKWOu0kHtBlYOd+OKUuriIHGpHJglNlnnul4n7Uu8
         cIKZjxXtIUJwOkrYs3UrtqIkPCVG3gAMoHIR8nNAatpiEg4hIZf5YemJ9qwlHL65SzhF
         9DYNOsRp0QLQTmP/bbKOD6FXRSnLAp7QrYn9uZbyyuqe4KyfV5BHQn+J2hISdeAz7mBd
         /2KoTm8yYhKkviMc5GyTNjWvRFSFhsvb6PKcBZy1AUWz7HUNrSwxR9PpSXszWqmpt5ib
         s2UAVftaerAk8vkMKOTABsT22CmGpO7B9JuoijtAlLygAnN9LVcKPO3Mkegt9xBwL3Lf
         5Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520535; x=1780125335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ISSGZRpyMR72C6f36Ix88YVeWGG0f7DiWTu+/JHvX5k=;
        b=NaK6CXjgBt09CGy+3zneJqT/PIbGs483h6gWxF5g4GnPw9KFpHODV57dbqze3Y3cmP
         lOb+V63C5sL74vpmdYrlhYlVIgDj/YFbBtwx7wI123s1vpmlPH9ysQoi/KhhsBtEbiGL
         GClgjFtS/T/1p83NKCsNgcF/BuYeedUpR7YElTkE7/yYTEiu5GAB22Ibnm5BnfEwOqFq
         2aNyewfUcKo0xeLPSNbZhiIPaLP/1CUylolz9laWA7WLuQ3XZyihLZYzHybXubUABJgz
         MCjLSSXVDXlvhBP8JyiCky5NCmUOtwlXMThWKwDzAGu2KQWiZ5uryG3CE+1zIDhhtrbP
         xfDw==
X-Forwarded-Encrypted: i=1; AFNElJ9AlScmNtvbuEY2evUl/QVCPv7xBRLOwD9x4INIxtzW6Nhk+qjBeG97VBn5vFam4TiEubdNOzfgjZ3z6aocS0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPru3zHbRs901jl4x9dv7dhSHAsiaqMIhquWWgh4uXcT/XRHZo
	v8fQYuAoOf7sQRvMZYugA439my2XinoYZvmUtAB8LVRDf0r09Pxr3/ii
X-Gm-Gg: Acq92OEvfX9Lbc4++hZxv5rIVj/snMCzSQTtPGD5dNVbePkPH+qzuKmVesPd9t45GfQ
	wVjTQxzqwfLlUdYCfAvZSes74JeY1ow+XCcVIQQA/hVri/z3NA7D/38OPK4BB3waDbbPXsFYsWg
	O2mUknx/UjZRbYT6xEzR6K9QIFFwc7crAgEkGtYjbg7sYItgjRHdkjZurr7VZcEGuZcvxgB+Kew
	cMwwRGE8iyA2qfA8J1nTpi5sC8Xoxy6BII0N5ApX5rYfNB+dqtBOwhjo0gQKs81gkj32O95HzLc
	vifJA0j+u6ZCyuWIGw4lu+OY5V+pH/yce2cLI5nXJsueBpIJAUZYmwoBBl+d5IxJYDAGIA8n/fp
	ZzCSDjxKKziuFpwKECVTQ8HCE8eL98bLEppZcSYGve82xQZCzxW7buLXl1hknikBfV5kGZHgc8g
	thDzRRKMkF39BsWi5F0ROuq8PXz+RhrubmAzCGv94=
X-Received: by 2002:a05:6000:4283:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-45eb38badbcmr11064502f8f.26.1779520535190;
        Sat, 23 May 2026 00:15:35 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:53 -0600
Subject: [PATCH v2 20/24] dyndbg: move mod_name down from struct
 ddebug_table to _ddebug_info
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-20-b937312aa083@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=7729;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=fPmKvI6NbniJByc2FBVS00QxE4c6I3lmAwyQxA2t6uk=;
 b=dj2YmW0Mwtnd1FmOtaz+swCbQ/Q8ZmY76fe/dXtWBD89JfjZBoBXvxghPtRegu3RSBtOwIC2z
 t0veVV7lCIWBMNZ5cNlRyM6eU3fkGnR+w7Xm4wxdt79YXFpDQmLmUPW
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

struct _ddebug_info already has most of dyndbg's info for a module;
push debug_table.mod_name down into it, finishing the encapsulation.

This allows refactoring several callchains, passing &_ddebug_info
instead of &ddebug_table, and hoisting the "&dt->info" deref up
instead of repeating it thru the callchans

ddebug_table contains a _ddebug_info member, so its users keep access
to mod_name, just now with "->info." added in.

In static ddebug_add_module(&di), reinforce the cursor-model by
dropping the modname arg, and setting di->mod_name at each caller.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB

old-v12
. moved up 1 position in series, ahead of hoist...
---
 include/linux/dynamic_debug.h |  1 +
 lib/dynamic_debug.c           | 50 ++++++++++++++++++++++---------------------
 2 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 001bc84eadca..11ec40f488f3 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -97,6 +97,7 @@ struct _ddebug_class_maps {
 };
 
 struct _ddebug_info {
+	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
 };
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 169b94ff6f8e..4a9b9bc9efc5 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -47,7 +47,6 @@ extern struct _ddebug_class_map __stop___dyndbg_classes[];
 
 struct ddebug_table {
 	struct list_head link;
-	const char *mod_name;
 	struct _ddebug_info info;
 };
 
@@ -246,10 +245,11 @@ static int ddebug_change(const struct ddebug_query *query,
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry(dt, &ddebug_tables, link) {
+		struct _ddebug_info *di = &dt->info;
 
 		/* match against the module name */
 		if (query->module &&
-		    !match_wildcard(query->module, dt->mod_name))
+		    !match_wildcard(query->module, di->mod_name))
 			continue;
 
 		if (query->class_string) {
@@ -261,8 +261,8 @@ static int ddebug_change(const struct ddebug_query *query,
 			valid_class = _DPRINTK_CLASS_DFLT;
 		}
 
-		for (i = 0; i < dt->info.descs.len; i++) {
-			struct _ddebug *dp = &dt->info.descs.start[i];
+		for (i = 0; i < di->descs.len; i++) {
+			struct _ddebug *dp = &di->descs.start[i];
 
 			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
@@ -282,7 +282,7 @@ static int ddebug_change(const struct ddebug_query *query,
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+				  di->mod_name, dp->function,
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -1077,12 +1077,12 @@ static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class
 		class_id < map->base + map->length);
 }
 
-static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
+static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
 {
 	struct _ddebug_class_map *map;
 	int i;
 
-	for_subvec(i, map, &dt->info, maps)
+	for_subvec(i, map, di, maps)
 		if (ddebug_class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1110,13 +1110,13 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 
 	seq_printf(m, "%s:%u [%s]%s =%s \"",
 		   trim_prefix(dp->filename), dp->lineno,
-		   iter->table->mod_name, dp->function,
+		   iter->table->info.mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
 	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
 	seq_putc(m, '"');
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter->table, dp);
+		class = ddebug_class_name(&iter->table->info, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
@@ -1177,7 +1177,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * and length of the subrange at its edges.
 	 */
 	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->mod_name)) {
+		if (!strcmp(cm->mod_name, dt->info.mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
 					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
@@ -1191,7 +1191,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	}
 	if (nc) {
 		dt->info.maps.len = nc;
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+		vpr_info("module:%s attached %d classes\n", dt->info.mod_name, nc);
 	}
 }
 
@@ -1199,27 +1199,26 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 
 	if (!di->descs.len)
 		return 0;
 
-	v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
+	v3pr_info("add-module: %s %d sites\n", di->mod_name, di->descs.len);
 
 	dt = kzalloc_obj(*dt);
 	if (dt == NULL) {
-		pr_err("error adding module: %s\n", modname);
+		pr_err("error adding module: %s\n", di->mod_name);
 		return -ENOMEM;
 	}
 	/*
-	 * For built-in modules, name lives in .rodata and is
-	 * immortal. For loaded modules, name points at the name[]
-	 * member of struct module, which lives at least as long as
-	 * this struct ddebug_table.
+	 * For built-in modules, name (as supplied in di by its
+	 * callers) lives in .rodata and is immortal. For loaded
+	 * modules, name points at the name[] member of struct module,
+	 * which lives at least as long as this struct ddebug_table.
 	 */
-	dt->mod_name = modname;
 	dt->info = *di;
 
 	INIT_LIST_HEAD(&dt->link);
@@ -1231,7 +1230,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
+	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 }
 
@@ -1294,7 +1293,7 @@ static int ddebug_remove_module(const char *mod_name)
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-		if (dt->mod_name == mod_name) {
+		if (dt->info.mod_name == mod_name) {
 			ddebug_table_free(dt);
 			ret = 0;
 			break;
@@ -1314,7 +1313,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 
 	switch (val) {
 	case MODULE_STATE_COMING:
-		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		mod->dyndbg_info.mod_name = mod->name;
+		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
@@ -1412,7 +1412,8 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.descs.len = mod_sites;
 			di.descs.start = iter_mod_start;
-			ret = ddebug_add_module(&di, modname);
+			di.mod_name = modname;
+			ret = ddebug_add_module(&di);
 			if (ret)
 				goto out_err;
 
@@ -1423,7 +1424,8 @@ static int __init dynamic_debug_init(void)
 	}
 	di.descs.len = mod_sites;
 	di.descs.start = iter_mod_start;
-	ret = ddebug_add_module(&di, modname);
+	di.mod_name = modname;
+	ret = ddebug_add_module(&di);
 	if (ret)
 		goto out_err;
 

-- 
2.54.0

