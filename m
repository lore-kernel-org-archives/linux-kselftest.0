Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF33644D7
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 20:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776977705; cv=none; b=BPV12e22LYcvZWQs726vCM3f0ygzPQXFqmqcRb1zjVna159rOVjJEFW1qd6AlSosKUTbwh/wdari1muUrEKkovy+3mT/BHiGJ2hEGy1WUqhEFxTdlKT8LvLIYZFYpc9CEErFlfwFtuqd7+U96tChp4sdFeoYzawMMfBUYkn4o6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776977705; c=relaxed/simple;
	bh=y0aqiZzD4/dauxqWGWZpTeZQeDGgmhoKACp8yCx31Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LO0bjkW+6XvCikkXV1wIiS3FTzZOWfxA7x++e9LG1d9SFT+Mm5v4mIkntCPzwxtS7b83yFIfjUYFWK7QxMkkz6LuIx4+bk3TUscfXanBwSJJExnGOtgPHoE3LlPewUhBaxXjeh0Qt0adfeSafr68OnBOCHIjfnE6Zh1/56HN7qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qh1LVAkY; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qh1LVAkY"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-479ae363aaeso4066931b6e.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 13:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776977703; x=1777582503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqO5/EH/UF1TE1Yyx5zB/rmOp92tEJKuB03COKwdtP4=;
        b=Qh1LVAkYTrqjGDUFcwWKbrChw9MdkegA4ZhDmXdigDek3JPs53TI4QaKLPcRlwZrHv
         B4wyLqKh7DstP9kad3mClYPX3fpf3AYjRXJIQtfOhPk2UsgTJc3g0Fj3Z+dem/fcBQzL
         mky1EncDaAxlGyBfOFrwb8iEJhGA0/l9U1UaUG2gXqUCUuFYUFEqRluCW1KLzPRDkHrg
         tiAGfaY7ZM77OqBMLmOxJ+Isx2jyRho9cwBhm0NMCKs/y7Re6qqERGdfxmRFeOUUX47O
         XYQIx+Pnclt79qrx1UW+QQMpdo0Jal17+bmV8bA2JiSc20W3qmpw76AJWZzBZrmIgZXs
         HmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776977703; x=1777582503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqO5/EH/UF1TE1Yyx5zB/rmOp92tEJKuB03COKwdtP4=;
        b=Srm5wPyZDs6DYpbNs2TP2cGy8+RmDYoWdVdbZmdl24G8CHyNQQgApsfL8BT7MthJwM
         EIN4aaYvBFsOXFdqqOFcHUZ/JxbYBfuz+2UipeWSGf/NX3mDnXODEpYLbmfnlhDzxIlt
         hv9ii/j7aGupwuI2g6cvWah+62eCt2mSGnxo39DYh0an0cMEZmi59tLaz3dTUvZgwcoX
         QFON91RM6OCEKi2KojG3Ta9DKbmREq3Tuvx35wSvnMjySNGURNASnXTHuiGLzWcSxBVU
         feSvte9L7httr3w9q3NGVemTKcd0QQJ6IitEvzrEsbVIqpFAsCeFLiqTYMrvqypfVn/w
         VDfA==
X-Forwarded-Encrypted: i=1; AFNElJ/X28Rj8jfRiAjG+81g1guRki/WIMRdPSbXNIrJb9vESF6iwojZY7CaTcIgqPazcbLnCo+rUeX9ZlQqEI4D2ig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0UdTI0bxYM300Hfcq1lYZBNDKN7tGQhPkGTjTN3aU9V1MDSDq
	lYStcAsElifntVqGD1KUQNZazDc0/ianrjbNCbMnkWAx3Mp15HDdXmu2
X-Gm-Gg: AeBDiesZkdD0i9Ifc94RCPazN2+MpWAc3L1eG2mYm/M61AMySruI/RPOlDSyr3qXMAU
	o3IzbtNS3qIbzGlwV0jFaFJsUQoWS/KDB/xdOp/Tzum2QRmkQ/jivL7ooasnC/ivb+VZcei/DXS
	5pi1IpmkzwUIvmAlkmCpLi1A86l9WoJ8rqmcoxKDqMaoeUTl8oewJemyeLcxsg9mF3rrHToJ3Ft
	TTosY6dQZzXU266tk8LaW4vxKwmb5CF7QeSWoqzU09LmRuR+5rSuR46P+w5uCfMl7ndnHc6BPRO
	+EtyxllUMThFt7eTv/MYdCH4fYoF6mVvMfL/JBKM7CvuvqmOuxUMFaYKm9Z96A3OMxSJiw6oTs5
	r5LTcLLkMGtg6kJsuoArnWLk1xfz9Sv5NHKuVIiug09599NT/nfdUBtPwJqEWo8JE3ikUOZIqZQ
	m2cAUyrjOlSNsIxEI+uTgO9L+wlbL1o8CkAZOthdeCGMpZimVXLlNpZgP5Rwdd3z19aIKYsQO6
X-Received: by 2002:a05:6808:4f0a:b0:468:698:a626 with SMTP id 5614622812f47-4799bf4b93dmr13762368b6e.22.1776977702799;
        Thu, 23 Apr 2026 13:55:02 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4799fead505sm14329744b6e.2.2026.04.23.13.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 13:55:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Thu, 23 Apr 2026 14:53:53 -0600
Subject: [PATCH v14 12/92] dyndbg: drop NUM_TYPE_ARRAY
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-submit-dyndbg-classmap-foundation-v14-12-2b809a8019d0@gmail.com>
References: <20260423-submit-dyndbg-classmap-foundation-v14-0-2b809a8019d0@gmail.com>
In-Reply-To: <20260423-submit-dyndbg-classmap-foundation-v14-0-2b809a8019d0@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Jason Baron <jbaron@akamai.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Sean Paul <sean@poorly.run>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Ruben Wauters <rubenru09@aol.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Liu Ying <victor.liu@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Paul Kocialkowski <paulk@sys-base.io>, 
 Jianmin Lv <lvjianmin@loongson.cn>, Qianhai Wu <wuqianhai@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>, Mingcong Bai <jeffbai@aosc.io>, 
 Xi Ruoyao <xry111@xry111.site>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776977637; l=982;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=y0aqiZzD4/dauxqWGWZpTeZQeDGgmhoKACp8yCx31Lc=;
 b=0ylBEG5Zr2L9JzVM3p0QOGGNJYPJlqcvdgDfrferqn+IIjg0mF/DXa7yY98RemD0Q77UWcis8
 afOWJy3fK3tDbGja7wdbkN+8vIczS7ipTPRP52IXbHMq4ogKAy8+JGS
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

ARRAY_SIZE works here, since array decl is complete.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 441305277914..92627a03b4d1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -132,11 +132,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);

-- 
2.53.0

