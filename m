Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601438;
	b=gnAVGJVgKKp+oT+Y3bNXg6sglCe+XFXWibNHxUHnIy2syTiTrnyX/rgtKE8UWV4WzHyb
	 zUckkW2+qmbMW0gpoJwA3wDsn7F07cVGmHqMPr4C4KXHkSPYR3XUIx9xGvMZbKBN9J52q
	 IDT8WVlGoKK2b7tIuaOadrBFPDFAZULIhFKh9v+m1Qj5ye+m/xEO3IaltVwnLCM1DNnfM
	 qzXupaRVpxiaw8NDxB6XsPwS6lGd3RqMjeNRPQ9xP6g4jQKBZh0rdMNbKNnJFQo21joJl
	 CPq8yrMq0XS0iFsJQFTrsrfxKRZqBf3YV6wtjkMTD+qqunP4s8OWjUj5/FNApwCGXdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xbWBgXkenSa9yRsymUcI7Wl4ur3mhX+FS+9uM+YkKCo=;
	b=Qhi7DpRs3zg4aIAj61f5m8zKztP4kcece8TDSlztvuf2tO25JhXeREtJQp9W6uhP1fP7
	 BBdj8Tsmrsdk5lsFkr826Ye9qVTZX2yWu0t+ABGZy/3OH+aF0Zav+049uSdL4GjO0LfX0
	 RbND39FkWwOkNzxycl36RfwDpFxJpPP+FOG/EF3CX8dAzEOIEQxbOYpCMLqow8yW7PbJJ
	 TpDx1wYCUJ16Zj1pdS6TJXtesbyUDXQ+8HxyXkghCpcgJ9qecBoTqYXKf7Kkj52DWyWdZ
	 Y3dv/slnMgE5+SwIRReLsLoJ8Y722xoKXynguxGC5Ah7KoMLjegGInLkxtm026wPAMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZbXb6Toi;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0E606A885
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 20:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F0E606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZbXb6Toi
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49d64a88222so400549f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601435; x=1795206235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbWBgXkenSa9yRsymUcI7Wl4ur3mhX+FS+9uM+YkKCo=;
        b=ZbXb6ToiEor+Fks4PY5+zaOANffpyCUalvAA3FTNQCzl3dIT67JiJK/lFT+LibVv1R
         +gcfdwZ0t//pP1PP3y3RGJhyRZvOW0btRS7B7Ama9LRWK+Dj7UOoi+mOAyHnQfo459SQ
         RKDQe0OsTaJ+THPvQppDwb5gv8aYVMq85S1f5b4S4aO91vVMDOJd5AADEH8eE4bN9CXP
         vWTeg3GtQGcWyxouqrVH2W7SlfZp/05TwfTyHyG4zXw5VW4RD/UFMak6Spk0oOmTFywY
         JaW4xxvQBR6Eo6iZ7smq63zHqsHc1jFxGGk3ajq2CbTtiNX0d7NzGzzraRjbQBjTMMbo
         unoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601435; x=1795206235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbWBgXkenSa9yRsymUcI7Wl4ur3mhX+FS+9uM+YkKCo=;
        b=KjmsYniWsV3CkVupHIvFuQgoF03rHP9Jl6prTQqnHSjVM48wHZ0So9eC1LGcUmGLJ5
         Vv29gzUYPu51DlWz32mFHtKDUUfZIwu4sTRrG57BlM5fzT9fWlkU4QOF8RFMk5K1/zWi
         uDKK2nYuxqD1dJ3GV38KeG2NVg6B55I9kRNtM8NbpoTrHfvxBl2faJi2rMSHkn6w7cS9
         TD+1OiUME3zlliv24IEPhx97Bj6yEjD1HRL+xNxuTdJwEn5tTnBC1xvV+6p6GW8ytTwb
         vZ2O2jn2WXM5FtBJToHukaaiZWHMd1VGtYh1SgXXtcLeWVtJz83wCXEz+YFHdpa6Ysm8
         Tz+Q==
X-Forwarded-Encrypted: i=1; AL+hErF09zZCBQ1Qf8WDK/hryEF3ge8OytfkalNijkMQ1cxJGAOFm3cDvJRBObnTU/hVHVczQy95D8g5hj0AvZ+uLsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8msDuF+QxLR0t/ggc2xoirpEl7M14ImyQX787DJx48k50raVTp
	xRkMG9EGOf7K5ZRU8O11zN00zKllbF9RZU2IB0uj6vuE8uu4G+ssytTH
X-Gm-Gg: AYBFou2Jqgr/1A4pGY2DmwtMy218Ksia/2BX+7/8LwAuUgRNVuoShbgcH7xqDeI596w
	Y9Ay1znvUDjmDOmk53hhiWjDUaxg46goXoLRWjwvoZu4ihnVDVu0fbsrRwybmEpcZzI2bjlOsw6
	vQ1J/AQBkhaag2EE/cM9RqzzcpvEKpf1eg8voX5QsrFfZkT3Frz29z8k+uGCZYASVbMo961CD1M
	gllqwR77NQdwUrU/A1NJkJo0jqALpO4jVce8YLmWBGD1roZATgJILhESquzLYgZ9d8eS60KGDxw
	NiKyIdvL1vu0BAqAacmWOc0h7OEd/uozEGPXrMmU65WXdxwER/GA51YEBZW8WGLNny9z5G2/oUP
	WWBxvYuposJH0OCtKB5v337vickrVlPn6Sj8Q8IkB1iqgbQXK/IU7sIc+UVOGhdBzX8AeLaqOHY
	/cbMBeBpNKgema1qmuRGI2AF78n58n1Cjylvt+ghKNm3BShvg7TgTqN3OeIWKtG3NLjrXRSqHN4
	QX643zrz4M6+kT3vY2BQXwlI8LV/eSqxYtm4rSh3lq6LVnRh7anoCWQ/Saue5u/aJM/8vQd93IP
	Dl7ZxpTPgjng1MX4VBCbJxOQubr8OjSNEBV9NXh1bGzu27Yamj19Cg==
X-Received: by 2002:a05:600c:4504:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb559f044amr74646205e9.2.1794601435369;
        Fri, 13 Nov 2026 12:23:55 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm40414575e9.3.2026.11.13.12.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:23:55 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Fri, 13 Nov 2026 21:23:23 +0100
Subject: [PATCH v3 1/5] landlock: Fix layer composition of
 LANDLOCK_ACCESS_FS_REFER
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-b4-landlock-refer-nonfs-layer-v3-1-02d7e42bcdfd@gmail.com>
References: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
In-Reply-To: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

In landlock_get_fs_access_mask(), only add the
LANDLOCK_ACCESS_FS_REFER right if any filesystem access rights are
handled at all.  This prevents us from accidentally treating
non-filesystem layers as if they handled LANDLOCK_ACCESS_FS_REFER.

landlock_get_fs_access_mask() is used when initializing the layer
masks for doing access right checks, so this bug meant that we
unintentionally denied "refer" (e.g., link, rename) operations in
layered cases, where the same operation would have been accepted if
only either one of the two layers had been enforced.  If the rulesets
individually allow an operation, the composition of these rulesets
should also allow it.

The bug only manifests as soon as one other layer handles filesystem
access rights.  Otherwise, Landlock filesystem path walk is guarded by
an early exit for the case that no filesystem-enforcing layer exists.

Reported-by: Dwi Siswanto <me@dw1.io>
Link: https://github.com/landlock-lsm/linux/issues/67
Link: https://github.com/landlock-lsm/go-landlock/issues/66
Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
Cc: stable@vger.kernel.org
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 security/landlock/domain.h       | 13 ++++++++++---
 security/landlock/errata/abi-4.h | 21 +++++++++++++++++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/security/landlock/domain.h b/security/landlock/domain.h
index 935e18b12b3c..d9ebf4857fce 100644
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@ -262,9 +262,16 @@ static inline access_mask_t
 landlock_get_fs_access_mask(const struct landlock_domain *const domain,
 			    const u16 layer_level)
 {
-	/* Handles all initially denied by default access rights. */
-	return domain->layers[layer_level].handled.fs |
-	       _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
+	access_mask_t handled = domain->layers[layer_level].handled.fs;
+
+	/*
+	 * Handles all initially denied by default access rights, but only for
+	 * layers handling filesystem accesses.
+	 */
+	if (handled)
+		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
+
+	return handled;
 }
 
 static inline access_mask_t
diff --git a/security/landlock/errata/abi-4.h b/security/landlock/errata/abi-4.h
index fe11ec7d7ddf..9784ca645073 100644
--- a/security/landlock/errata/abi-4.h
+++ b/security/landlock/errata/abi-4.h
@@ -20,3 +20,24 @@
  * that rely on these protocols while using Landlock network restrictions.
  */
 LANDLOCK_ERRATUM(1)
+
+/**
+ * DOC: erratum_5
+ *
+ * Erratum 5: Denial of ``LANDLOCK_ACCESS_FS_REFER`` in layered domains
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ *
+ * This fix addresses an issue where ``LANDLOCK_ACCESS_FS_REFER`` was implicitly
+ * handled in domain layers that handle no filesystem access rights.
+ *
+ * With this fix, a reparenting operation is allowed in a layered Landlock
+ * domain if and only if each layer, enforced on its own, would allow it.
+ *
+ * Impact:
+ *
+ * In kernels without this fix, if a domain combined a layer that handles
+ * filesystem access rights with a layer that doesn't, the resulting layered
+ * domain would deny all ``LANDLOCK_ACCESS_FS_REFER`` operations, even when the
+ * filesystem layer granted these operations with a rule.
+ */
+LANDLOCK_ERRATUM(5)

-- 
2.56.1

