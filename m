Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF643F4B1
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 20:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667459; cv=none; b=ZRZn7qLZoSAjCulAHpxjcsxskC1UbXi4tmv64N7EmSjrJJs3BZRiiJyzj8UJFW8q88XI7QIE8CQcoqba65wGkgif/3BgRsw4VARHkzFYShFIVTGbRBS5q+4o9yn0CKUi25Dy8zXK652dcyQbadNYDjyzRa+b8FVlBr2r6DBWIMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667459; c=relaxed/simple;
	bh=eCloqlJ2v/+XMSZlI14hGW9da+1SGwpyJZa2FWOM75E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJWRDz0ga3vdQBdeilMmiNmBKp2cKLf3x/lGnf/7SfHoT2L0FLrI+Ki4s/GQKhGktrebcODu4G/tA9NKCN3hoqiJvCnfWp53JcFDpDHSd8LyrcKoPMPMyZfA2/b8OrYYQFNxtQYUchootFlvCRvSnpxUjLvnQAlPBEW8AEeeJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrdeoGDG; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrdeoGDG"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so6475594a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 13:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667455; x=1785272255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVowhHu7yo8cpo601RS2GxxXakYLg9JiM3lfJ+Lnq8M=;
        b=LrdeoGDGQq1DWqZ7PwMPc9BkdE9IRg2S6knazNkxA2NoEXL03BWyrdR6ZjgSONOuTa
         iddFDauop/3Md36UGnqE7InI88mftpTB8goCWU0qK1093dbMLEIvGiFSF6814nwME2ke
         y/KuuW9w3KIbwlgUGuUP9GhJVXsE/OsFBRgSeegAIo89kAMByR2aphlCX8vLueHudbaZ
         IjUDpSTTYzV8BANB4uYoUiaGn2XS9kyxMDUCCFN6YlB9zXIdortoY3Tra/ZcOOriN244
         iJe0k5+QwrIBd6MVwFMTfOyRJxSXxA2zztPjpeW6JYIvQQ8+4U3ToxhEU56E3lqEtIWR
         uHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667455; x=1785272255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVowhHu7yo8cpo601RS2GxxXakYLg9JiM3lfJ+Lnq8M=;
        b=VVWfTRWROehoHnxeuC3V3s+Dhkt8tCKVy4+T1o1equCeaTgv0EpvWFQgXaJpnyLWxA
         2Mr/DmQf7lsEAHtF/5GqnN6yDtqiM/DaU6fdNHhC7CZ9EM0untbMIiihAgZ3APPs89kk
         t4ywSXEcAiT6S3ty6FtuXTHadGZcmb1Vr0UGWs98ErmaF7GJbH5/0JbS8aL9MDymdiMQ
         SJWjkCHZ9PQHLJoJjdoQCBlVbechfz9CJSLKHdvW3Qt0FAKrJL71T+WXBKIwudlzAbRz
         wEA8axcabGd5D0/VJkaY2cXZWJB3NKPJCMhcOQlqtbi7t7RwYLidQPxY0IcRiTQ1XJm0
         Qbvg==
X-Forwarded-Encrypted: i=1; AHgh+RpQ0GAvf+HFJcmEQmaAaC/2/JTH83xKdtGB7RyPSmqM7BayqZY45MD3cpoAhHxWTEQBCLZfMzTQDdR9vNsyQ2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/eLQjSx4OJZ+uNSPwdYFVrbT0haY3FuwtA5rsfTsHzpVi4+/T
	te/8nFYt/VSa37B2VK3AmF1Ha+ISfOdiDoPSKrrTGUyHKipBc0wIg/zVwv7tsg==
X-Gm-Gg: AfdE7cmzyO6s/v2C5e24CvjGjM33FdRBqldLLEQ59DqB6xz23IcKFOBEqVN5zhljgN7
	wLE2PjgNQ7xA3a2QethcL6OSzCuP/pxkFvWwc8EonQGM2uyVuvJd9AYGuBaCSPg4Lwosr/sw6UP
	Zrr8PtcSR3aeqML+ysd4QuBOmH8EoStdGk+oQDUol4DKhZlFYnCqNjV8pmbHUp2gOyRuhugNSIK
	rFiAG2aIpILbyGI1j+z11Id6x3HnLJKHB68OQ+mtFjfiHtiyKA2Tx1uNJ0QtgpbWgwTFfysgTQF
	vZDd92FAF12Cn3RnuOQqbwNAJTFwf//9WRRGQrmPkqY8ebnRy+0pwzmzIJEciEGnmrpc8bK1Wjf
	AYVqgcFTdWrve1AjAb8wmmQGRTLLxoxyv/xRdoSnp/N2UlMrLNw7MEOUatHKazDP4850Rroc7pD
	6UXZDJHjTOMkwxTge9RX7bCVE2H7TJHE+E8TPV6iXtJTdK7NYhfzCmT8nQ9ysIE1j9HnX2taFin
	MrY4x8+Zvt/6W9A4ayvuTuziQ==
X-Received: by 2002:a05:6830:3c89:b0:7dd:9b19:a87b with SMTP id 46e09a7af769-7ed9a7d30famr10804335a34.4.1784667455635;
        Tue, 21 Jul 2026 13:57:35 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:35 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:57:09 -0600
Subject: [PATCH v7 20/29] dyndbg: refactor param_set_dyndbg_classes and
 below
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-20-010fbe73b311@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=6125;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=eCloqlJ2v/+XMSZlI14hGW9da+1SGwpyJZa2FWOM75E=;
 b=oHGyId4pOK0AQyfB5EtTY1sBf1PEHx3IQj5ek/QCUSKOnylp5jzcTcLyUk7CzUyws32r458v+
 nQAuaTfBM2oA8jq8pegokMNkBYsKo1zbnsl9r1J4l5UBBEtwgdv2HBE
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Refactor the callchain below param_set_dyndbg_classes(1) to allow
mod-name specific settings.  Split (1) into upper/lower fns, adding
modname param to lower, and passing NULL in from upper.  Below that,
add the same param to ddebug_apply_class_bitmap(), and pass it thru to
_ddebug_queries(), replacing NULL with the param.

This allows the callchain to update the classmap in just one module,
vs just all as currently done.  While the sysfs param is unlikely to
ever update just one module, the callchain will be used for modprobe
handling, which should update only that just-probed module.

In ddebug_apply_class_bitmap(), also check for actual changes to the
bits before announcing them, to declutter logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB
---
 lib/dynamic_debug.c | 51 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f66e5373e61e..a619cefd801f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -615,9 +615,10 @@ static int ddebug_exec_queries(char *query, const char *modname)
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
@@ -625,7 +626,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -634,12 +637,16 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
 
@@ -652,6 +659,7 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
  * param_set_dyndbg_classes - class FOO >control
  * @instr: string echo>d to sysfs, input depends on map_type
  * @kp:    kp->arg has state: bits/lvl, map, map_type
+ * @mod_name: module name or null for all modules with the classes
  *
  * Enable/disable prdbgs by their class, as given in the arguments to
  * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
@@ -659,7 +667,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -683,8 +693,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
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
@@ -697,7 +707,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -707,16 +717,33 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
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
2.55.0

