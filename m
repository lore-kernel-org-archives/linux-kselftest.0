Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6241037FF41
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315538; cv=none; b=GSlTSHcmUb60xdvcHqY14XKYeO8PWKpwLHDg+2lMLXVF9lf+0ePhuyb6Dgoqvpd22OJVh3pL2pInmlbmuXWPgLFn9yrmBOhav5fimP34kzajtWxBbsxPr8RBoXVftlyHnamRRRp8vEn3EMaQDiSHYg1v8sdQcuY8Nfgdpv0NWAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315538; c=relaxed/simple;
	bh=wE8HipMBgsDV2SYPl2IT8AHkLvxenM3w3wQOD/5dutI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAkB0g/P8rQOO/8Hec+Ryr/D2wP6XruFBNVhyMMH9YaIm/8Nz1bQSBWf/pIyfN3GwMHliStRYIO+g9b5zZBYrmV0w0ZV9zOSoyS9CpG1tTiz1PdAbXndsCG1752f2EVSZYS3WrVZvrmpdV/lFyRjvAThrIZwvHahJS0vGIqXAqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n22PKk2a; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n22PKk2a"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490426d72f7so87844505e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 05:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315535; x=1780920335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLgvY+msik7zixiHEqmkevZB0IHgZEWTQtTUruSN9ps=;
        b=n22PKk2abq/wviVfnmoozPHHElFAcZTrGSf9ywdxo6v4W8jp7fLDkooCJuWHFdLgOD
         agKEzA6vcOP74tQwybGRfAv03lklqDe/1TVNEGx89eBzdhLAJpdbbHxE4oSHatfmccNn
         87W2wkpE+cFs0eoKMFnirtWNwZ2idFxLA6/VAR89EseV7dylkf+KGZi64hDeFvMFx/12
         9cX38ocm56+NvHojmpqhLJu2Z8aiO5yFMPhLNo7qDYhdiq1TH9I/fKjRsl/HU3XI8eP1
         WU1oGa1dPi9wjK/Y/jK8sT4WXG4FkaYHT0i9y4+C/daAmPCZ3yutH1K3BL3Lu46Q8GWx
         dDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315535; x=1780920335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DLgvY+msik7zixiHEqmkevZB0IHgZEWTQtTUruSN9ps=;
        b=Q7B1rQRBvH9Y8afKU8RuwkdYVK7qB92n8TnLYMC9RphUdgALPjJEvyN5h9C3//XiF4
         sNn7Px2F0/kpCkxV0zapV4Us868jR5NqZJDvjynpjeWXwab9zaVAHDrOUQR627qmcEYB
         ES884+eqRYj8oXSxAcak5/BHBKwIr353G2Ze5J8Bub78FdDq2ObMTrm7azB9lZLknCDL
         oOCZm5DJ53tW+xmGjRxJrCZYPPqXFx5lrhtO5Nz5P6bp6lBGrZ8t1KwKGdw9nd7LzWwm
         n0PWPfjW241TuAgiQ7WNWz3KiguM6zm1Lv2a/jV/pehsRrKUPL/B+Fg9oq7Ke1aLPB83
         rWoA==
X-Forwarded-Encrypted: i=1; AFNElJ/KhQ4ohMHIIg70ZwBeXciMo6je0af8iR5BsdLGzWpySm5BfUJf7dFdZF/2wSlF93Ft00XxnvGQHmaL3xc0/wY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5ZfL8ntCW9wTgHNShI1fWNuMnZu7i35SKe7V6KOXFwWFxfjFl
	G4bEOCBbH76B87V2cWIXy9r+32ig6ASLhia2S72syW00lIFicqTCJAWE
X-Gm-Gg: Acq92OE8JzUu9CJxPz/fciLywkilQcipVY1Les0UjqK+sRdzMIxRYzmBvktF5zs/IWL
	PErlAEEzt5OGeqHA2ndon4eBKaE0KkwkJjlSsV7aQUDM0MbOfnF/fRyDxU2oaVwNqraeoJGz7JR
	X3qVnx7zI777BS2gRg/CXf4amOaAZeUvyhgjp0K8ZljsFFvVAMvzpfS3/0P8dAz0aYeMnA3qPNd
	JsbBaRAS8xU3X9e2BnXPxx53ZeBCZKk8Drp1CMUx+DsPKGQbf4Ja5gFcqsq1ZHAWA4hlrwhEiwb
	aIcO2LWXbvrDDPQrQsFczNVIpr/m/A+yECS/9HoI1cEB1J0CCygWIKnqLHAwlQzNUWGGJd0YaIE
	J9R50lxt0WtY/Itqmg2IPHF/AMOOmmVh8PYWiQFqn8CD4ghpaldXfdTSv633vDqGiqFJx9ZNlih
	3VNBEJ1ITVZpFCX8Llj3sfHdEu6SjOh+o8v276iEG6XA==
X-Received: by 2002:a05:600c:4f87:b0:490:abd7:fd9 with SMTP id 5b1f17b1804b1-490abd71214mr47977395e9.10.1780315534403;
        Mon, 01 Jun 2026 05:05:34 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:05:00 +0000
Subject: [PATCH v3 14/24] dyndbg: refactor param_set_dyndbg_classes and
 below
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-14-4a15b241bd3c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=6146;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=wE8HipMBgsDV2SYPl2IT8AHkLvxenM3w3wQOD/5dutI=;
 b=6luAckFtwBDjvRrj2lZ2JAoTCE2QX2lpjg+z7ttQIGdmO7+EslosK9PFS8WZeb3EKbwqA7m2/
 gbPklexLtWnA9PUn9sPtMa9ceFhNXHUib856W0frIxb7C/kzvtF8pVV
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Refactor callchain below param_set_dyndbg_classes(1) to allow mod-name
specific settings.  Split (1) into upper/lower fns, adding modname
param to lower, and passing NULL in from upper.  Below that, add the
same param to ddebug_apply_class_bitmap(), and pass it thru to
_ddebug_queries(), replacing NULL with the param.

This allows the callchain to update the classmap in just one module,
vs just all as currently done.  While the sysfs param is unlikely to
ever update just one module, the callchain will be used for modprobe
handling, which should update only that just-probed module.

In ddebug_apply_class_bitmap(), also check for actual changes to the
bits before announcing them, to declutter logs.

No functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB
---
 lib/dynamic_debug.c | 51 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index bacb55f960fa..182b84b6f6c5 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -608,9 +608,10 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits)
+				     unsigned long *new_bits, unsigned long *old_bits,
+				     const char *query_modname)
 {
 #define QUERY_SIZE 128
 	char query[QUERY_SIZE];
@@ -618,7 +619,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -627,12 +630,16 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
 			 test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
 
-		ct = ddebug_exec_queries(query, NULL);
+		ct = ddebug_exec_queries(query, query_modname);
 		matches += ct;
 
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
+
 	return matches;
 }
 
@@ -645,6 +652,7 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
  * param_set_dyndbg_classes - class FOO >control
  * @instr: string echo>d to sysfs, input depends on map_type
  * @kp:    kp->arg has state: bits/lvl, map, map_type
+ * @mod_name: module name or null for all modules with the classes
  *
  * Enable/disable prdbgs by their class, as given in the arguments to
  * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
@@ -652,7 +660,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
  *
  * Returns: 0 or <0 if error.
  */
-int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+static int param_set_dyndbg_module_classes(const char *instr,
+					   const struct kernel_param *kp,
+					   const char *mod_name)
 {
 	const struct ddebug_class_param *dcp = kp->arg;
 	const struct ddebug_class_map *map = dcp->map;
@@ -675,8 +685,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
-		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -689,7 +699,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -699,16 +709,33 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
 	return 0;
 }
+
+/**
+ * param_set_dyndbg_classes - classmap kparam setter
+ * @instr: string echo>d to sysfs, input depends on map_type
+ * @kp:    kp->arg has state: bits/lvl, map, map_type
+ *
+ * enable/disable all class'd pr_debugs in the classmap. For LEVEL
+ * map-types, enforce * relative levels by bitpos.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	return param_set_dyndbg_module_classes(instr, kp, NULL);
+}
 EXPORT_SYMBOL(param_set_dyndbg_classes);
 
 /**
- * param_get_dyndbg_classes - classes reader
+ * param_get_dyndbg_classes - classmap kparam getter
  * @buffer: string description of controlled bits -> classes
  * @kp:     kp->arg has state: bits, map
  *
- * Reads last written state, underlying prdbg state may have been
- * altered by direct >control.  Displays 0x for DISJOINT, 0-N for
- * LEVEL Returns: #chars written or <0 on error
+ * Reads last written state, underlying pr_debug states may have been
+ * altered by direct >control.  Displays 0x for DISJOINT classmap
+ * types, 0-N for LEVEL types.
+ *
+ * Returns: ct of chars written or <0 on error
  */
 int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 {

-- 
2.54.0

