Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885E2595751
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 22:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202961; cv=none; b=bSJWrsTDy/ok17xRaNs4gSoIzYScmQ2EvtzGIQg3/f6ua1yWiJoVeknCHRP8XBSjCKAOWNQj4hxK/KF2n9zHCBomQwTJEz10g3iJ2FxIsJcuJovsIvIf6lMrdZZIzov42dHRDRjA27Fmfz4sS8Uowist1PK2Psvl/uekKKeoB1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202961; c=relaxed/simple;
	bh=WmC6lAU1CkqSfVkT7RlvESW1sm/preurH4K0P4INTpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5sDNCOGAc4ytap+bcltWcqwkoKC4wNCXD/bzzH8SMkp3pXV8+cIoW9NfYwIpU7MfCtIkl9F8cWclXaGEEvRdrFwDck3JYefX9FnWXUutdL5UoRxvCgf99felLO2ltRwF/SmobNeh3q1zxKuGrcPe5ktOGFsKUj06411S9UGIHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCahwwnF; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCahwwnF"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc39so1371339fac.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 15:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202954; x=1790807754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXS+8+nuFSh5Ay7yN4yk9y2BRpKd/B6vxX00DeKmizI=;
        b=cCahwwnFjJww3oFNG5u/hgj0fMHQIfx/YMPOQ7QBo/It/pszk1aCHkKToF6Pb45z0P
         b2jzi/Kh4KhzfMQ9hicBOFMKHLUAXxuQrl3wBysZdkBwaaQruq9TJmHvw/EdAaezC+w2
         djXfKdAoqf9DAyPRsOYer9EgglFIFRTHDBE7SgexocV898IqRaZjVCf1e07ZdnSpqXKe
         9TqZyOh6zdmv3bWCzYSPw0ZE3SJoJ9gWd9Jgxm2KKR+GMe3JIZwv6ekCvNTL9J1hZsa8
         lhzCgxC0SVcHQQHHDCHY85PBEeUeF94eZDlkEvmhfKNwWeI5ykxj4HpUo3QNy5h9ww5U
         Pruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202954; x=1790807754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXS+8+nuFSh5Ay7yN4yk9y2BRpKd/B6vxX00DeKmizI=;
        b=KVmRvQbUBjClKJ0Eiu8qYHueTNDPUTQCraR/RgmEPL57UbMxzFaOQCUTBHeJpREys7
         dK7tKOvciMQ6mQtAJyUyw5CAGX3Viya6Xop5RM5Vw4kR4Rs5wMFLHXpW4y6u70PUv7/9
         LUYkHVyr8rh5xz5ZeKrGni2YkvQsE33GzDG/YBeydpxk9Sl5Yy31/hTu9CW/W75LDgin
         BRcvGNRUYRcKpu9JpLK75r4qHV7cc7a39hn9j+tiWTydCqkGf4xMjAt9eZOg6xSdt59u
         7siklDcsAo6RG8km1XX+ghxWXE9MOfUtdGFRApc9Zx3oSS4SBjRI6tRfeYPTKavhi6vB
         p/RA==
X-Forwarded-Encrypted: i=1; AKwUvBx7Zju9cZw+Cj4fY2c0jMZMi6jSjzzH9HdXgy55FVcITFB+A43kcqavBovsNlp+jx7kVxzwOLnQQ+ZSBgu8JyE=@vger.kernel.org
X-Gm-Message-State: AFuF++n/urZ8XPUAfeME4pR1KUPVKPr2QgCF/wz6hZqzistelEO5QD57
	5WJhGteip78fpj7/YX3wid4RaS6L+rW7oS8KroQKx+Ij4/Tsj5xkE6Zk
X-Gm-Gg: AYBFou2i3voqAA7vQOdu93OReMEB69PARAxsnzvnMPhQU4dcq18cBwifoW8upEg+Tlf
	2dpzuPVPNsz9Joq0HZ0/t5gMevZL0dOQBum7bY7EkBh9zahWMIi2fHi/vYN9oqfA86AMj2bayUF
	iT3PG0NZ4wA4+Zi1aKaSqNlawQgRj4IQRqbFiHb+lp0uQDjYWvrPgE6Dm3xrn4BDM1sGuiBTiyq
	q3auuaeIDVIpg2j4COZ1GVHQrd7Aiq+DecIx/S6L4kGMGB+7j2lq1ckpzDlxfnPpcHakDS6c7+m
	2f8k3owW2OBQwY4tigQAVuHyQRIZrXHAljS1cw7sKFDT+Xru3n+0s0V37vcmWx2e+bAEkhgqQL7
	VEJEiWmQfh4RoYXNYVmWy6A1izVRKXwOBQh0WxIJRHc468d4DhB2el26XD2FYqWlFyTHR3XhFJV
	HtVChuEPoBE7znZ07+0xk7IBGo0jN31f22S0OAAIQxxjvtt0qiYjNn3+Wxd8DTp0XOdGXft/FZ+
	akcxGuLgrAi6acIxl2dJLm3CgVo8Skaqng/2k1RPuJ3HVbkjVMTHA6I9IyZu6pkepHZJH7FzMSu
	MwsREfGv85SbKbpJtP4=
X-Received: by 2002:a05:6870:8125:b0:468:41ce:1675 with SMTP id 586e51a60fabf-491e4f6f740mr713240fac.0.1790202954410;
        Wed, 23 Sep 2026 15:35:54 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-491ee1ac486sm559401fac.16.2026.09.23.15.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:35:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 23 Sep 2026 16:34:57 -0600
Subject: [PATCH v11 33/38] dyndbg: harden classmap and descriptor
 validation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dd-cmap-part2-clean-v11-33-9b6c217fdf2f@gmail.com>
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
In-Reply-To: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
To: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Jonathan Corbet <corbet@net.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790202874; l=10514;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=WmC6lAU1CkqSfVkT7RlvESW1sm/preurH4K0P4INTpU=;
 b=5bVfHR2K9HOWBIwVyrHaGcMg9a5/AphRF2DCn4QgeLAofTqYM0TSuKLlbhYSpFHXheqi3+YL0
 POIXSE4cDspBzee/GKBBGRSy13yo+vJQ4Ls6I2MisWkfr2/mKE7mLMp
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Dynamic debug classmaps allow modules to _DEFINE and/or _USE multiple
classmaps, but this requires coordination amongst the classmaps.

Previously, class validation done by DYNAMIC_DEBUG_CLASSMAP_DEFINE at
compile-time, and ddebug_class_range_overlap() at modprobe-time, was
incomplete, and DYNAMIC_DEBUG_CLASSMAP_USE_ had no validation. This
could allow broken classmaps, making them harder to use well.

This commit improves classmap and descriptor validation:

- Unify runtime overlap and bounds checking across _DEFINE'd and _USE'd
  classmaps in ddebug_validate_class_range(), enforcing symmetry and the
  <= 62 upper bound for both.

- Split runtime validation out of ddebug_add_module() into dedicated
  helpers: ddebug_validate_classmaps() (fatal, returns boolean pass/fail)
  and ddebug_validate_descs() (scans callsites and emits an advisory
  warning once per unknown class_id).

- Downgrade the global WARN_ONCE in ddebug_match_desc() to a
  pr_warn_ratelimited, since orphaned class IDs are now tracked and
  warned about early at module load.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v11:
. factor runtime classmap validation out of ddebug_add_module() into
  ddebug_validate_classmaps() and ddebug_validate_descs().
. unify overlap and bounds checking across maps and users in
  ddebug_validate_class_range().

v10:
. fix pr_warn_ratelimited() line wrap in ddebug_match_desc().
---
 lib/dynamic_debug.c                                | 92 ++++++++++++++++++----
 lib/test_dynamic_debug.c                           | 16 ++--
 .../selftests/dynamic_debug/dyndbg_selftest.sh     | 22 +++---
 3 files changed, 99 insertions(+), 31 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d300d44c1a82..098fd2639cb6 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -311,7 +311,8 @@ static bool ddebug_match_desc(const struct ddebug_query *query,
 	/* site is class'd */
 	site_map = ddebug_find_map_by_class_id(di, dp->class_id);
 	if (!site_map) {
-		WARN_ONCE(1, "unknown class_id %d, check %s's CLASSMAP definitions", dp->class_id, di->mod_name);
+		pr_warn_ratelimited("unknown class_id %d, check %s's CLASSMAP definitions\n",
+				    dp->class_id, di->mod_name);
 		return false;
 	}
 	/* module(-param) decides protection */
@@ -1507,18 +1508,80 @@ static void ddebug_apply_class_users(const struct _ddebug_info *di)
 		__di->_vec.start = __start;				\
 })
 
-static int ddebug_class_range_overlap(struct ddebug_class_map *cm, u64 *reserved_ids)
+static bool ddebug_validate_class_range(const char *modname,
+					const char *name,
+					int base, int length,
+					u64 *reserved_ids)
 {
-	u64 range = (((1ULL << cm->length) - 1) << cm->base);
+	u64 range;
 
+	if (base < 0 || length <= 0 ||
+	    base + length > _DPRINTK_CLASS_DFLT) {
+		pr_err("module %s: base:%d len:%d (from %s) exceeds class_id limit %d\n",
+		       modname, base, length, name, _DPRINTK_CLASS_DFLT);
+		return false;
+	}
+	range = (((1ULL << length) - 1) << base);
 	if (range & *reserved_ids) {
-		pr_err("[%d..%d] on %s conflicts with %llx\n", cm->base,
-		       cm->base + cm->length - 1, cm->class_names[0],
-		       *reserved_ids);
-		return -EINVAL;
+		pr_err("module %s: [%d..%d] (from %s) conflicts with 0x%llx\n",
+		       modname, base, base + length - 1, name, *reserved_ids);
+		return false;
 	}
 	*reserved_ids |= range;
-	return 0;
+	return true;
+}
+
+static bool ddebug_validate_classmaps(struct _ddebug_info *di)
+{
+	struct ddebug_class_map *cm;
+	struct ddebug_class_user *cli;
+	u64 reserved_ids = 0;
+	bool valid = true;
+	int i;
+
+	for_subvec(i, cm, di, maps)
+		if (!ddebug_validate_class_range(di->mod_name,
+						 cm->class_names[0],
+						 cm->base, cm->length,
+						 &reserved_ids))
+			valid = false;
+
+	for_subvec(i, cli, di, users) {
+		if (!cli->map) {
+			pr_err("module %s: classmap not found for user\n",
+			       di->mod_name);
+			valid = false;
+			continue;
+		}
+		if (!ddebug_validate_class_range(di->mod_name,
+						 cli->map->class_names[0],
+						 cli->map->base + cli->offset,
+						 cli->map->length,
+						 &reserved_ids))
+			valid = false;
+	}
+	return valid;
+}
+
+static void ddebug_validate_descs(struct _ddebug_info *di)
+{
+	struct _ddebug *dp;
+	u64 bad_ids = 0;
+	int i;
+
+	for (i = 0; i < di->descs.len; i++) {
+		dp = &di->descs.start[i];
+
+		if (dp->class_id == _DPRINTK_CLASS_DFLT)
+			continue;
+		if (bad_ids & (1ULL << dp->class_id))
+			continue;
+		if (!ddebug_find_map_by_class_id(di, dp->class_id)) {
+			pr_warn("module %s uses unknown class_id %d\n",
+				di->mod_name, dp->class_id);
+			bad_ids |= (1ULL << dp->class_id);
+		}
+	}
 }
 
 /*
@@ -1530,7 +1593,6 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct ddebug_class_map *cm;
 	struct ddebug_class_user *cli;
-	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1562,10 +1624,10 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_set_module_subrange(i, cm, &dt->info, maps);
 	dd_set_module_subrange(i, cli, &dt->info, users);
 
-	/* insure 2+ classmaps share the per-module 0..62 class_id space */
-	for_subvec(i, cm, &dt->info, maps)
-		if (ddebug_class_range_overlap(cm, &reserved_ids))
-			goto cleanup;
+	if (!ddebug_validate_classmaps(&dt->info))
+		goto cleanup;
+
+	ddebug_validate_descs(&dt->info);
 
 	/*
 	 */
@@ -1587,7 +1649,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 		 dt->info.descs.len, dt->info.mod_name);
 	return 0;
 cleanup:
-	WARN_ONCE(1, "dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	pr_err("dyndbg multi-classmap conflict in %s\n", di->mod_name);
 	kfree(dt);
 	return -EINVAL;
 }
@@ -1674,7 +1736,7 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 		mod->dyndbg_info.mod_name = mod->name;
 		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
-			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
+			pr_err("dyndbg: failed to add module %s: %d\n", mod->name, ret);
 		break;
 	case MODULE_STATE_GOING:
 		ddebug_remove_module(mod->name);
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index ea81c5158b13..666b447b3740 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -173,14 +173,20 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_len, 0, 60,
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
-
 /*
- * in submod/drm-drivers, use the classmaps defined in top/parent
- * module above.
+ * In submod (drm-drivers/helpers) use the classmaps defined in
+ * top/parent module above.  We _USE_() with offset, to test the
+ * non-zero case.
  */
-
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
-DYNAMIC_DEBUG_CLASSMAP_USE_(map_level_num, 7);
+/*
+ * maybe force failure of runtime sanity test of classmap.length + offset < 63
+ */
+#if !defined(DD_RUNTIME_CLASS_CHECK)
+DYNAMIC_DEBUG_CLASSMAP_USE_(map_level_num, 8);
+#else
+DYNAMIC_DEBUG_CLASSMAP_USE_(map_level_num, 55);
+#endif
 
 #if defined(DD_MACRO_ARGCHECK)
 DYNAMIC_DEBUG_CLASSMAP_USE_(fail_offset_big, 100);
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 0478ef59dd0f..5de726254d91 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -576,12 +576,12 @@ function GOLDEN_RECORDS {
 #K= c518a50ba30ba8099d0dc874a27ecf16 FT_multi_query.4
 #K= 91838b4012c50a1dc1d9e210ba8d68f8 FT_test_classes.1
 #K= a15ec4843acd721fbdfddc0b512c8032 FT_test_classes.2
-#K= 2cee6842c9cdee5cb3bf50b2e3914813 FT_test_classes.3
-#K= 81b16613f8d444485e2bc5aa4d38d024 FT_classmap_inheritance.1
-#K= c14c8aa758e24046b3237d20e2189bf7 FT_classmap_inheritance.2
+#K= c03cd07445ca93358176130f04320ee7 FT_test_classes.3
+#K= 1489b3b72dbdfdb553cc0c6594c4face FT_classmap_inheritance.1
+#K= e11c22649735cedb6c30321378100e11 FT_classmap_inheritance.2
 #K= 5d0f3701517aa3a461c8887c332bdb42 FT_classmap_inheritance.3
-#K= f444ae312fcce32444c54da757d87c41 FT_classmap_inheritance.4
-#K= 7e92245008439ee79fe2460aeaa16a9b FT_classmap_inheritance.5
+#K= d39188ded831453d90d77390546b314d FT_classmap_inheritance.4
+#K= f43e0aff8a4b38435b73d90ed8100d1b FT_classmap_inheritance.5
 #K= d2e8b8c5a5b4e7b9bbe1a29460a3c07d FT_modprobe_w_param.1
 #K= d2e8b8c5a5b4e7b9bbe1a29460a3c07d FT_modprobe_w_param.2
 #K= 11032ef17569bd151c3806527a2428be FT_modprobe_w_param.3
@@ -592,11 +592,11 @@ function GOLDEN_RECORDS {
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.8
 #K= 535ab526b24a7214de41d92e94bbd52c FT_modprobe_w_param.9
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.10
-#K= a71670fec42b1b0646f0317180bafcc7 FT_modprobe_w_param.11
+#K= 7c02282dcfb73eb5ffb9629ce63360e5 FT_modprobe_w_param.11
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.12
-#K= aacdbab171b374f221f0196e6e415d09 FT_modprobe_w_param.13
+#K= b0942decc84dae237019bc2877ff02e7 FT_modprobe_w_param.13
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.14
-#K= c7eb8e25c780f58c78ed73dc1c187a02 FT_modprobe_w_param.15
+#K= efe8e3b8080c3310708b7505d60f7703 FT_modprobe_w_param.15
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.16
 #K= d682c98ced7d31f1555ab474a9ebe253 FT_modprobe_w_param.17
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.18
@@ -610,11 +610,11 @@ function GOLDEN_RECORDS {
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.26
 #K= 66eb387a95512f679eb5cad4168b0992 FT_modprobe_w_param.27
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.28
-#K= 2583cb4637bcc2ce1e93eea4222ec76c FT_modprobe_w_param.29
+#K= 7df05523f4d61917fd7659357eeec1bc FT_modprobe_w_param.29
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.30
-#K= d592c5bf23312e705b39064c21ca68e4 FT_modprobe_w_param.31
+#K= a75600ac4e129f4315c5a50ad3a3103c FT_modprobe_w_param.31
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.32
-#K= b44d105d151123c93cfe953bacdb573f FT_modprobe_w_param.33
+#K= f43ccce73ac2b0e1529312af66a4ddfe FT_modprobe_w_param.33
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.34
 #K= 4819f715ba485c493afb455542f7ab8c FT_modprobe_w_param.35
 #K= 0239d8c0808eef396782362613f675b0 FT_modprobe_w_param.36

-- 
2.55.0

