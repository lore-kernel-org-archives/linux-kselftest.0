Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18F349CF3
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 07:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520528; cv=none; b=LlSlq7L10Vnig7nm3Xkw7oTIle0fHvEl/pWbkJACZJDgRND7nbZwr5XVMsFiQftECTciib1hyN9TvsvjHFWZbrAoF0C+CeA9QdwRwMuiYZXo+ajA1FHFph4r3NyZ+6IN0UFeBi/hkX9bNfUN+bfFglSLebAQdIXDUK6itl34YQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520528; c=relaxed/simple;
	bh=oDf+kcaqTHCY4oZq0wlCToRk1g2OukIAotS4exRWKPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCh7YMYn5MOFvGh8FRSMkHiMjqZJZPld8qjt9H8QgXX+xl6CebU4fVmKTRwiaOugyThx6mCBbdmKnfWsma0LYu7WIUSRZzsMhZZ35k1bwoFJn0NFSMvhEJMTGAPgoUd8F3dGLOPCD1QFJuhS1nM8nA+EGUeHQnlB3eMXLr3VTMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgStQzme; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgStQzme"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso4554951f8f.0
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 00:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520524; x=1780125324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fSocxUrFxgAtDOXA0qj43u5TiXCLHTMOERYZLviDbw=;
        b=CgStQzmeggTBaA+GWM2J0nZsgEYp03aQZ0k2caQ2mzugIbOFmXnvDunOwYnk+mVRlq
         hLw9Ni6nk4YWOP6mlyuLw/ahmenK5zd1d7H4PJnHGK7SkXQmR1okr7T9cz3CGfX53fPP
         hpNwPVhaf7+jIbEarsF6J3xPzSXnP6pD4IjV3EZ5/uAfEggW6zKlxc6otuHuLU+lI7Md
         3DqTR4QYb7T64u80TmuLkh92wJ8TagFH0yD9/OL6el9QkYexJUFtnPkmHbTtHwrEN8HM
         DQjqPYuiTB20/OwEepXbCjbRFsdPXsf5qh4ixK4gRtPonTa013xQ0th+/fWWhCDJUq+U
         3owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520524; x=1780125324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9fSocxUrFxgAtDOXA0qj43u5TiXCLHTMOERYZLviDbw=;
        b=MJE955gzG1/YJjUqXfy19lX9rxLZ8Z2aRNitclBgs3qq3h4VqCn6dGcY/Ug2caWsrk
         Co9k8WCk1z5oUV0hASFUWosJxl4j2Rp6RUpUlTFLYapYrgzCpJsfjIjMnCz+E5JZJHh/
         abJ/C/zV1ECXT1WEbCz4g3kKLuXnASEDCd02Mf7AFy3hTCcMpz46zPjMBoI9RTnDJqo3
         5lDrIjzJWVxAcpfUO5t8xWAC0B+gcgGATblhXgoKRVNqYdQsB1W2JGQarBOhMSwyzHnF
         cmIoO3xJl09KlQ6DVAwVpFSK/675awcirPiWOuGhHKRJIVpayvgPUhl//LTu0kraWeWY
         cuZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z6DLdezgKG/7hqQoeEv2UC0dIfQbJtqWR/paX1U92y3z02jGcQhiN+nLLL6Ed5MBxiRCtxaHY+JKPviI9xoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZCm2kH4oFnAf9Xm/rzlx5IheFT5usAcxJ2ZJ7l0+kJpMu7nyE
	HWM7gO9wbEm8mYzn1M4CqF3lp1ugrPDDkjIVA6VzLwV+L4n8eg4sTMEr
X-Gm-Gg: Acq92OG9gflXL7zF/LN5ZztWlVi2QY0izzym3DDtSaFPHfcxOLFnfFS0NYOBonM9tdQ
	RSyWExVxSKrLvzVh2MPXjvOffWU0EcO1q9/3HVICUDcwcRLHJz1t6k6vJnGjSFG0wSgAD34SHUS
	Dlpkx22HkzLx/XKGsJRe5hMwmCln87eCcml9xk8b3fhJ6WAtZOaeWJnZnoFcCYgDr4jd93LlYP8
	H4J6pfNUUYPnu9sAewPcku1GNdWFqkcjIB9MUeoNKW52MuARYiWUHRqc7uoABdGSbfnrEt9Nvlt
	S5wQ4TC/zmvXUiyIvtbuDG76Qe/OSPS4P5aITHtvGdYsCTR/smPFLMtF3lzDcXRysWQ/7Vn/Dib
	7Zynmd+xemi15K/e3Mq1bfMroP0CoICfGx8clNrf62/ePsmmNiOofiawAJODGiOa/z106aSaRnU
	LvBTUpQcy2+M8AWXixCrGk5YgAqsWz5OTWYWW+jz8=
X-Received: by 2002:a05:600c:3b02:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-490424b2cf1mr100521625e9.12.1779520524386;
        Sat, 23 May 2026 00:15:24 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:48 -0600
Subject: [PATCH v2 15/24] dyndbg: tighten fn-sig of
 ddebug_apply_class_bitmap
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-15-b937312aa083@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=2913;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=oDf+kcaqTHCY4oZq0wlCToRk1g2OukIAotS4exRWKPg=;
 b=HCNi//0D3/IXeC0ZirdAUlF8jXyXmVdu2JTJojhs2ocfT/641MBPamdbF6PbEXk5od5NoIqPk
 YdzUgjtOj5ABTvpfAP4WIHTqV3stIf54/YaYKL0n6FTRuGiv71OrVW5
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB
---
 lib/dynamic_debug.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index ce069459aafc..d4cce0f4f197 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -609,7 +609,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -618,12 +619,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -635,9 +636,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -685,7 +686,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -698,7 +699,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
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

