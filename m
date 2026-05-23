Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB836828B
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 07:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520544; cv=none; b=WzwBX/bD3REVwAUOD4HWiiKsMsY0oS2dzN+40yDGN3iKJiaOFfeITIhccJsEl/aymxC56b6y1dZ+y5W6QmimQeSQVqbbumqgOqe2807vB8QNkOPGN+swEirZqGKhP3LYVRp2VAFmotNPZcTjPMw4MCxe0GdzGn/OmhWHvB4rxN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520544; c=relaxed/simple;
	bh=fJJj649T3B3bmwoMx3I1b8H3sX85+6tYQ9gU6si3lQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gO+fogwREZuXPSvtd/VO0o9zosvbQSJSKRKPVr+A8z8Xt+9BvGIEV1bzolaRBUyxcJpHowDwV6dbQQIQbbHua2cJPcsKj4g3zKVoE1a1tor9ROFWGIy3VxONDB907zjWu1ts/CSnYRrFRqmgy3AnyEN7EeI9MOZ2CRr6yKH0/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCJmpk2o; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCJmpk2o"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49041e84237so13249695e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 00:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520541; x=1780125341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDLU5WQYt4oY/SVN5IVezPdfdTCoMnWFmJoSA2Xzdlg=;
        b=NCJmpk2oVJTOOsaGZ2M26DywtgLPU7+XxtNgrjDPyYL1NQxdjlAMyOfyOf+K7ApSio
         UynJQo3NfEUU7LZONXyGU81D8kX1PlHtvh9ungsvWyESHQpN+Bcz+WSUuWIRZj8BFeBF
         OFCN5Xt9Kvexqy2ee6eQrxQEZPkNAiIB1MhDP+qjwKfi+fCvIWNf/OdtzWioA5oVCeJ9
         XxS5wjdLgH5kPiVOXFzSYQE5d9SnSMvbo7pFJUZnjih2WEGqbY5KCJhuuhkz1TFqWzdV
         qjN4JkL6k6osvQNg68jgvCJd0NSMjX7NsCY3Gh63ELDMZ9sQTmWR/j8gVZqh6M9ZGlK4
         rPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520541; x=1780125341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LDLU5WQYt4oY/SVN5IVezPdfdTCoMnWFmJoSA2Xzdlg=;
        b=HEfHjKW+ZjBCo4oaJpe1HOYj8H2q4+x8Yn3BT8ZDS0tnwo3gie5Layc1FOVS4ORBkp
         d30cwgHq9mmzr9tYXq5aSd9856XdY57FRP3Y5tb2OcOwAZVIUykVh9ajwwO5Q8YMZXDN
         pdi4sQRIWzOqxtIkNC+ashb23BCsdUR3acfIcQS5mq3fW8PseYw+XgEl/GSuhiqJeEqd
         fNP0fu4lME9NaLTKPPKtf9VjSBGHdCCm8jKua9gtLNyVBbqbDu0W8PEdKdmOQ3oqq7Z+
         dqhZnD4XdmcLgkqmZixpFpGPxY1sv9ajbUItQ4KuQ0gDT708YKLHuE1pDMU2N7CoqXow
         BPBw==
X-Forwarded-Encrypted: i=1; AFNElJ8uuRlZm2SLqzLVZli6pkAqW5LK5ALTl1ZRkVKzSiFNKGL9xqEqlI8iFwuuo1bZQdxpwU7WoZGE52DABjDe0E0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUi/Gu80A2YUdJa8FrB001zOqLm1NJnXJAoAVLa2tblx3OOwzt
	5PYGovXnB7czbKEpQQFQe14BQj+cnMr5rfY1lW1wIWkifzdf5SPD0I07
X-Gm-Gg: Acq92OGjOE9a2tSy+ST8GVny2UIv+GuuprCoJVkDcPKBSzRPW2iYEPDOejcMUDzb5tF
	iQPSkweTvrkC2FOaTf9oCQaFKm2F6BIAbB2DY+ltr9LxgvmyNtYYTt8M+su+KXpFElwkj3yN8xj
	KQRiuvTfJgFzZIT5Z0tZ3FpQaoh+LMGIP/pFkPaF8qLlKVlbYCM/e0ibcM04cp25cidcyMgdWJd
	ypvmPqplyg6eTuedQ9xGdHebErZmLp+4OPp617b6lwvq6JwdD7ixp3KOXIzdQrVg+6J+mS8nzaL
	IIQTNSjRp/BaHts4t7icJ5H/qe/fR16uPo1a6vxcgBCcTBv8YDOgKNi5VL2nxTAxsy7FNCJ1Np+
	MmKRS+HVpbMiLHkavuWYtY1QyKXz+pE9N+Pyw0libbHVq4NIVaFq+DsngA1rXdyui1N4sP8x5Z/
	1DZa2RaV4CMGzU0MY/AfbiP5sH5acNlt/bv+An9sg=
X-Received: by 2002:a05:600c:4506:b0:490:3838:1548 with SMTP id 5b1f17b1804b1-49038381676mr146718845e9.13.1779520540573;
        Sat, 23 May 2026 00:15:40 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:56 -0600
Subject: [PATCH v2 23/24] dyndbg: change __dynamic_func_call_cls* macros
 into expressions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-23-b937312aa083@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=3131;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=fJJj649T3B3bmwoMx3I1b8H3sX85+6tYQ9gU6si3lQg=;
 b=V+8IE8KkGtFIdYyLDVrlrxn/sAoLHZdpVxJ31MGCeHA9ThYCUNqh2uYEtT6ZbgcGiaE/3Lu6i
 OMECpf5DJmoCzNLsou0p27ZdFaR4zl/W0edvspiJbNugzW2jMTcUHFw
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper, and is not an expression.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2:

fix statement-expressions to return 0 (not void) like their respective fallbacks

   1. Add 0; to __dynamic_func_call_cls
   2. Add 0; to __dynamic_func_call_cls_no_desc
   3. Convert the disabled fallback of dynamic_hex_dump from do { ... } while(0) to ({ ... 0; })

move RvB after SoB
---
 include/linux/dynamic_debug.h | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 11ec40f488f3..fe73aa27b350 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -224,24 +224,26 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id)) {				\
 		func(&id, ##__VA_ARGS__);			\
 		__dynamic_dump_stack(id);			\
 	}							\
-} while (0)
+	0; /* match no_printk return value */			\
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id)) {					\
 		func(__VA_ARGS__);					\
 		__dynamic_dump_stack(id);				\
 	}								\
-} while (0)
+	0; /* match no_printk return value */				\
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
@@ -321,10 +323,12 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 	dev_no_printk(KERN_DEBUG, dev, fmt, ##__VA_ARGS__)
 #define dynamic_hex_dump(prefix_str, prefix_type, rowsize,		\
 			 groupsize, buf, len, ascii)			\
-	do { if (0)							\
+({									\
+	if (0)								\
 		print_hex_dump(KERN_DEBUG, prefix_str, prefix_type,	\
-				rowsize, groupsize, buf, len, ascii);	\
-	} while (0)
+			       rowsize, groupsize, buf, len, ascii);	\
+	0;								\
+})
 
 #endif /* CONFIG_DYNAMIC_DEBUG || (CONFIG_DYNAMIC_DEBUG_CORE && DYNAMIC_DEBUG_MODULE) */
 

-- 
2.54.0

