Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CEE32D0F5
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927548; cv=none; b=cFS9CaMZPMCc0GdFr25xNeRuP2XJ3mOXTx9QS+LfA0VJMsmqkc1uC9Drh1xYzz/BRjPncB+eUlZhIaVlaih62fVkv9F8ik7OImqg8n4qcXZvoWOxv550/elecJfv64U/Zkogyf7YMKe96uDWG2aoqdOt6C/aUI4VcL9OC1mDlYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927548; c=relaxed/simple;
	bh=YZwMAR3uqET/bZH1qZJj95QcpN0V++SSyz4QoqNaiUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsBQtxKiWBMCWvsGu3VesAKB0xzIKUPGGSH4v0299WU/rAjaw6DWBWY3zb5RG905RVnsSHF98rwV8Na+l8gsQcLKzm48orTUo7ncgKicNmaGq5nRV5i+I6fjSbLqBTcuOX+t1VdTR2UYFBG5HwgwL9PFesXST31TQ5S6xWS6B7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+9dnfDo; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+9dnfDo"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6949831a7bcso2503838eaf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927538; x=1778532338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nmzwB7G7wQji/lU/ygTPGmrlGNrlrcnn35fzNwdq90=;
        b=U+9dnfDoUWfFxRDkfXIu6OMMgD7h/o5jK0z87sroarYMb4njliyxoIDWfMdFhdXaXs
         wdmzWDL/VnfXvp6/c4GXJHMhI8Idzkyw0daOoM1YiQC2scseTZHODpGU+iMBSE+he/b+
         6cYBBxc6eRElXH42gep1/69pn+Gv+L+Ho1T3qvfjN36DuJnxtIew3ajoHB4F5EFb7DMq
         7vfflndq0yfRDbdv+duZnj3PNmJ+uGlwP3FgrEaYCOsJ9j7kchGLiww+78qE6XtTNMDi
         BnU2WFOeVTcij0ldHSUHYHR4iHDkYcWmu/tTwmS5Opg50ZcpEjthFNxHY/z1KSI9IRId
         IpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927538; x=1778532338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3nmzwB7G7wQji/lU/ygTPGmrlGNrlrcnn35fzNwdq90=;
        b=D3wJDlBToyvU5mzCAKz7/zvh7HSq90CiDP5s1FrjX9hD/xEKhopyKTi0yYF+EhctXU
         mBc1yduQgUmb9At0wMFk4902S+rHV5iDPxVTl+DSiAz2yIdUDENUQ9YPNYH3HBO6U2Zg
         PamzOFPQaJVcuLBY8Cbc9a2lGc+MAzs3L6GoItW8VguaBZGr1JQ7gSRGI/7scDePsznr
         Tc8K6i9OGCRIrZS2hO4OAILfxmgsm9mhrpnDsZ4AmTGgWg7+OBjShfjL6Ip28ebhcChH
         hCavgQa4p7cxfsGQAV6qws6KzApjZPOdPKbKL6/ZRUj5oGXcyBNgqINCp+Eq+3g5WOyl
         lL6w==
X-Forwarded-Encrypted: i=1; AFNElJ8jgv0RfBhwzNVaKnqWRVhtB3OidexL9kWJ1vXVuO6dXvGIA7hmiFDWra8zzbgcKh1M50Dmqom7ZW5yed4eUTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbMJLQAVndApMdYJOxpBh010JfJLtrRPPUKI507Tf7myBiLu2H
	x8485STZVVY7Zq9ZevfJzqayqT77Kd1qzcfdIjWXbu+/bVtFJtnnMJC7
X-Gm-Gg: AeBDieuK0XWziEZcCDmlwYoYzMZyFc9NX5bsxl/pJfQVaERR/bea4X1JlL3kpg5ahJo
	MKIFfr72Bfywp1aJUSZs7lZ8P/Sjp3Q9bIjbFlK6JOIqm3fV4zMIwXdl73H/BuQ9fyhupJsG6cB
	JsikCS58K73ylCpdULrHGWYjuXfjnDdrdirixCuyDMmaJknGG/n4Ej08P6KNETaD3i2rdwnXvLE
	c8rCHgRxKWdMS0aqWJQq29zVJgNRAmgImgjoYBDiEqbIo4NXa5ONHtzQNUpAg0dndcynskrTnZh
	NJUvW5MaD1D9d6JKoAOYyODql8uPzTyehO3NiHr/0jYdARq+tT3juMRnGJnFA/HWnHQOIL1Lfus
	x81x8jOVYZOweZ7+Rh09Jh6DqepiCKJY90Myl2xrYF5tLKbo0M12ggpfymqrjjnrzAlGiw7bM/L
	yLhx6EjM/ZwNvcuFCSwO1IAIPA8vkEHujA/xNj5pGIB1wMuo7ha4vtdC5yWhOwx0yLRl/DAPbD
X-Received: by 2002:a05:6820:2908:b0:696:14c0:3f9f with SMTP id 006d021491bc7-696979ad3c5mr5336413eaf.11.1777927538248;
        Mon, 04 May 2026 13:45:38 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm7144713eaf.0.2026.05.04.13.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 13:45:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 04 May 2026 14:45:23 -0600
Subject: [PATCH 17/17] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-dd-cleanups-2-v1-17-6fdd24040642@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777927513; l=2145;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=YZwMAR3uqET/bZH1qZJj95QcpN0V++SSyz4QoqNaiUk=;
 b=eISda3doke6ER4wdyvj6HcSygG7ahPVJyzRZLi0/2Xp1UhRLhMFfOJo3ZTRiElFtSC1U9xb7z
 NOeCSToXMEdBLWMSznSMQx3SVwpwr30T98dHODRqXEtoAIJAy012N13
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 027e96e0889b..3aa51e7f1938 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -224,24 +224,24 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)

-- 
2.54.0

