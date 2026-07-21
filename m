Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0C943B3DA
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 20:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667442; cv=none; b=gWHEBcYz9Dl9qOKJVHmnR/3iBFFe7t8enSeIP4wESUzC3bPN4ghqSf2eAOTq12h0a4BWRFcJ5Zm7Xxp/25MpATIHmNkExOVu+YVd4xWkVvOxD921+ir2CLtVXgzQEM1VQ4o+xfgChwNvWEJtj1HGaznJPdnHIdVNq25liHBYodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667442; c=relaxed/simple;
	bh=hS/jtkq/JrVHcN/uc/pVKASKGCENsolPn7B4mWKffAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XqaLcC1xs6G2t1V8q0Ch/McZHa3m2FKfZt/58sx3sO5pp60QlUuXImjo46bo8Fa7+9/Dqp2jNkv/7wcs8DmHk7hAAy9gkxSkGj3iNFy39pDPSA0I9UeyfvPTyO1Xxl1iy4ERjo2i1Knfid3qzEj/TyzA92rifv+TQFq6yIF6rx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsvaRuaE; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsvaRuaE"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9d7464b71so4196199a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667437; x=1785272237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tICvvWUDLTcQaplMAJMGSX4sdCGxuxLlP7txV6x7Ef0=;
        b=BsvaRuaEa8t0WOpGhFUuzxV8ljunu9o+XdRcgrWLZ0DRZzmr7eUXRaHjWVheSrHxO+
         lRQ2n5USOyJU5CwSu+SycnU+yVf9DR7BPKGCfKGM1l8axIkN9bmwBElRC+8WpcGBZKsl
         cIC222LNGfeTtqNrpo29w+q+2L0yCTl/1JhVFM14zonVvsQ75oIKLQ9sjIpOdekI0uWq
         XKQTFTwBswVGi7kuAB60AjV0g/lRS32t159Z1utvx0jGnTrvkl3UrlvZb+PvvksqGavf
         +O/ywyOf0mGJM6/PcXIJ9wZnilhD/7vxqzjpytTn3UOQtlwf7Fw+vaqfNtLBMMJy7sRy
         bYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667437; x=1785272237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tICvvWUDLTcQaplMAJMGSX4sdCGxuxLlP7txV6x7Ef0=;
        b=QSKEGWetUCqFcxgGyLYPeHW8WWXMdNWYwgvr4GlFBTRTGh/H/o1RArfPGY2c7HIVXl
         a/MPrYlFbd/MML4qeol2MRr78Z7oo8gquaRtxRRy+vluxEbFWysdu3cHUK7+KRfoxtgl
         rh1rmczyVrvkM14ikIw0IfAFQWw9tn4PzshDsR5UyKtOtDwmGTAid15EIJxNmjtl98+/
         vvEBosvHoteLPqV51VrsqEC6h0PBg9WO70xXMZYrqFrFhtLftDrx/niePOFf7vOXOgUU
         awnthIKIL0O/TuF46d3QgOyh54JN2CF04P1YZ2l/hUUeQOflq3DcluiZBQRVwm2hXBXm
         WgGw==
X-Forwarded-Encrypted: i=1; AHgh+RrDfVJ6xdQq3fW+Q0VnqDmOkCaTA/eo8orbQOrXe5BQxpRDQXjaHpceZH46BwHTFemKLlbyQOAeu/csFwhbxvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAYO43C14wg2OsRgXt80WH3773+wAQDw/1n4VC2I0hL+yZ3sYP
	pO4vlc3m+xHb1bmUF92TIxXib2cnfP6j36wbB3rFnQKomNGzOrnAg8E2
X-Gm-Gg: AfdE7cmPRH6IPbjPZ2LhcCb0m8jaZh37CC0Us2Nr2Gs8xd7MDdboDCrSu7Q7eq8YV4s
	hEWiaKUJGYW9Ong8NTu05bbyNQTA30+Y6pI10rMl+tE4lAMLATQASL00lL4WOQUoyQoSFgZgnSj
	4hv/1SautB4q4YQt4Kgm4jlPpqPmKXZ8XozGkqSwStJzmCiIYbqGkBrLwT2R5+PMf732LMCsCr8
	/8sznzlmpNjWGRzQ4eG/bYaqrOzhrQIYuwaYD5oM9zIwuyrQeJ8Z1uHkDgryFIBv+GGyL4PfWkU
	Tpav2vzvzj1DTFDBsz3M2gH5Gmx3KCP99X+mFuW59p6NzMTDYTXPY6C2hY917cBzQY2JgOeK5YC
	s1z+lZw9jfv/sxwBwqcEZ20hxRu9d8T3y4s50kdf7kXGICHWhAiQXrhVXDB/N0srBAB0I67Pjul
	GMx51uE920t3qgm+wZEaMr+TE2HQs6cUt8ttDtq94WI/lsN4vHXVMfTgF5TFofpvfuNcuPBtgFk
	X7tqdNYSx3AJUtYjunXfWYVRg==
X-Received: by 2002:a05:6830:3746:b0:7e6:c9eb:535a with SMTP id 46e09a7af769-7ed9aa4576emr10492097a34.6.1784667437350;
        Tue, 21 Jul 2026 13:57:17 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:56:54 -0600
Subject: [PATCH v7 05/29] drm: Mark CONFIG_DRM_USE_DYNAMIC_DEBUG as
 unBROKEN
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-5-010fbe73b311@gmail.com>
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
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=924;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=hS/jtkq/JrVHcN/uc/pVKASKGCENsolPn7B4mWKffAg=;
 b=Lsf35FcMlCjbByxil/qjct2DAL4mr3Oc2q7x03tL/lqrAAMPWfcuP6gbFsC+oTgUeWP2YAwmG
 rTpFDD680+JBUtHGotBL8c4zwJWAzCGG1m6f1joIJBe2KBkLkyy1u+R
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Remove BROKEN mark on CONFIG_DRM_USE_DYNAMIC_DEBUG, inside
drivers/gpu/drm/Kconfig.debug.

Un-breaking the var allows to enable the config, and build and test
dynamic-debug-enabled DRM drivers with full classmap query support.

Doing this early in the commit-set exposes the series to more
in-series enabled testing, which has more chance to expose bugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 1f4c98cbf090..2ae59a616e75 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -1,7 +1,6 @@
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
 	default n
-	depends on BROKEN
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL

-- 
2.55.0

