Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BB531E85B
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927531; cv=none; b=PGrZYRXVLJ7yr3uBCQjjYDdp/YYCv80AGvBKynpQaGgCBYQBCDnkeI1od7t7SvK2VSMAkxpFaSFmONYoA4c3DVpOz9zJudSe3IHDJYJw6V/cSDGHreA45px+M30oLWDG+pc/fvJPz+PB2rdftIKUqs23twFxZJuJfaqA2+HprEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927531; c=relaxed/simple;
	bh=JZXjwW4jWxbmsrp9pcCx1mbkiF6OrJYXnqqrzYBS0w4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKp7Pw7I2MKytUDRccc3dFhLuiz/Km7Jxi0QFL79JLbmU47vizMS2bjm7asu6NmlrHm2K76Hdmb5yslZpK446g4W8KaFEz1aqgyLvwv7ELexauciK+8BX+ch7WtyjCrAQ60Z5GuLLutXVxCCgXFMrKHFmW3kTpN7LRDpLq9wrT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWte09Wt; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWte09Wt"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6966d0665baso2637122eaf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927528; x=1778532328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6AWJq+iuX9rkBsQZzPPBkpT39IXEVqnsK+4ZJ/OL6o=;
        b=LWte09Wt6XJ6c/B7/0b2XsM/m3UfleHorw2z7e/ApSkGjkNZD5WdCdZ+bCMyCUKSUH
         qZPl+NrxkRwiJd61UHh5GyQmWkLdTq0bEWixlIpHIL0MNUttr/80Bv3X0EgMt//qtdLw
         G6IWFLnRTVyB8cp503nyypOk3nGHHeSvPH/8TiDK9x8UPDFYlt7F5fzpEmBorKzasXoA
         +xWZX15+ikXQT/USsc2HEqVaRYQmmRRcB2MjQq0lgCz52h51/g2QcKodtAqGz6P0/gyf
         rhOKcsPmlUAK5rXKmiBbRNybYGwVq5JBuI8JKitYfiOznoo6ThDCwgm58ZlRZuciV+xI
         4hDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927528; x=1778532328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A6AWJq+iuX9rkBsQZzPPBkpT39IXEVqnsK+4ZJ/OL6o=;
        b=Q01FTIm6+ItxE+zYHO/UePDI+GT8CHPMYo+cxJJ8pacNMUolo4IyBliqlmPp+SANNZ
         1S5bdtddca/xkhbyhrwtBpHsqJ0Nwudjkld0aoScbD1sbAXOKY/Qddsb0tWsSUwJQvEq
         hReQsm/pxGpJX4ONtLzzq9qHQX4P8rQ/8orhMKUbxfx5OptMjzhItNOFWOR6fCh4oABW
         kerkJRhYS3g5i5ALjgSg6CjoxBPm3/RAF5y7uxlw1gcQUXv7VH/i6kiDxYatQCovQJbA
         b8YNrQMr1hBvPvZTeJ23M2LBeaemyyH+wwXq9TqNtU39z5J47vXJn8CZVRKKGc6bwpO4
         LOGg==
X-Forwarded-Encrypted: i=1; AFNElJ+OXdItT0UK0XWl/ns97bscoZ8Wx3tTI8pexgT4dS3c9TnmOKsO+uUK3XLmhl5tV9Hxepqd64DlnUUpd2MsYp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNk/CjH3lJKDbAz66l/4AIrIZgM7Mmm22GUdzMoSPCFXpBnSG
	/y06iBVfNaUzhMnkDeGnsqXG3Hftm0bLUPh3bUi/UnRB7CfoYlv9I+/G
X-Gm-Gg: AeBDievRMmjXuAtYZdTrNWE6yJcLFVALMTCPfY2PizTphWXdOQZvqP6ZZQvnHB071Zo
	FT8ZkDltRJ5zO2xqZqeF3pbmMVhcXudXjd/dBXTjIVJJHQcBQsUHoJdnQsgF+4X38RpWnOPYyDO
	KIwgYHYawLcq6m850VJS8CDoCkubsYbBKX0ApJWiHwy0ArlGpgJ/tmbN4r2keF+HFSURD9MDD8s
	44LqSl4+MLTxEBeljuIfYGLjUJuq07gw5UbGKjG0oy5MjeHn/C3qha7qHqLmhZPkjV3Lh55/cIE
	7hZzusyo+cGYZxTnqnVBe6kpUPV//H7j8WA1tRICkEN0W3jvUSp1CxjCc8iakl2pceO2jz8W2QV
	hB8T2YQIEh4gV99R69AHgIWDUOPOvF4zPTryr2vagnSpvqL0uSF9e9TSPVrCk4NMCSspGVodh7c
	XGSHYQ9Uf5biCQooupXpvayv/XnHXqOPYDoR7MmVANfbQtnb4MF5n+XQfOHCffvwJW8CJH7Cbb
X-Received: by 2002:a05:6820:210e:b0:696:7d51:79e3 with SMTP id 006d021491bc7-69697c60c61mr5959128eaf.42.1777927528202;
        Mon, 04 May 2026 13:45:28 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm7144713eaf.0.2026.05.04.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 13:45:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 04 May 2026 14:45:15 -0600
Subject: [PATCH 09/17] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-dd-cleanups-2-v1-9-6fdd24040642@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777927513; l=3865;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=JZXjwW4jWxbmsrp9pcCx1mbkiF6OrJYXnqqrzYBS0w4=;
 b=iqIVsPdjPxQ0kbii3QftSNVTypTv/hH5d4EWhD6WA8bVuPTvnPsVXpNzeMwKbYbEMmMTQAh0h
 4R8GLfRD8FADhA9FAUUFYEwn/6j/0N9Dgg4Ibr1LWXbe9znvtswebss
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 4313c8803007..a18f4bc63473 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -607,7 +607,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -616,12 +617,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
-		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
+		if (test_bit(bi, new_bits) == test_bit(bi, &old_bits))
 			continue;
 
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
@@ -633,9 +634,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
@@ -691,7 +692,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -701,7 +702,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -755,7 +756,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -768,7 +769,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:

-- 
2.54.0

