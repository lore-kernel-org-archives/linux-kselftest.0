Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601443;
	b=rG71sbcQy04CK5iDYEaiiY+Et1Y6s8E+F5Gq9VzBuYDiAcBgxW2yITN3er4V6XO2JP27
	 IjMneW7q5mTYKaUovO1rJZm0GsejgP/JcKys6HRYeczWoL0PAbrQ9i/CxT4/yhjalUWON
	 vyt4vk5DPwCEPa8snZ+FsrU7hsm0tjabjHm9TIod/L4OG/+S5jcVcTTVSJv2KNWVuWjOG
	 LkpnMbcBsGCqL36gwbiPeHPz4TpqDKOSUQg8qTrQ11YE1nPutKYY/eavSAN404V++BaSv
	 71yMCq6iJsOjCVjUSgetAf8BJeqk5ZmEBQfphAqvKHkzwksN320Jl1TOIDaSMu5AzQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Dnbd2yEJPOTWVHoma+CfFfSv19z03dGOV1zOyksuwzQ=;
	b=g8dqSSUC6czrFJKW3CYBiqygH5hL7Jo/UNuQxI9h1qw54Jf/12CyEmbY1oUjqKxJ613D
	 9TR6qJNf1Cr51/fPAd6fJitKyB71rxYMZa20dOkRPZPTGkXE8/Y0q9A7u/M009bXBpAEV
	 fEMG24+oiCpTp7Rq8Kp3ZDd3HD+lbFWGujpgKtwtozK0lTeuPFJNOpoHWW//+2nfn5XIR
	 G7U9dtaxdhfTcJkfgA8pDFXnOL8jORKSG2sYgF6p/gqJGgDcURsG0qY5KQyHrHFziVniZ
	 Pm2Kh9qC+mt/+2IV41CcbH1LR+7aUO0EqWo3DAvNK0UDt8TpgzIIx+4ogR/7XOXYdOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KFXLIUtM;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD319606A8B8
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 20:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD319606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KFXLIUtM
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb606491faso1094475e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601441; x=1795206241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dnbd2yEJPOTWVHoma+CfFfSv19z03dGOV1zOyksuwzQ=;
        b=KFXLIUtM6AdBysF0IcYKp2OWu/zq9uLZ05/8bsUylIrbi4Ystq3ItVsjnhScR6FdOF
         /kqebKcQZWDtzSf/QEJzaC4nbIiXFJLLq0bKCXxvSpD8G5+/TJpKMEoJtFNP2lc93/zF
         a1irRLp7AfT9LoXvJNeuiuARJMYRZNTm8COdkp6t3BX6I3XumkxIiIFQydZIXTSkHIwQ
         Zg5duJMJuxueAxmOfS+fA0IKqPtI7f1LGG8G1x8y2pn4g+pwsIhM66BXIC/tWigP1ld3
         1dKuycJgtp8J7WFOa5IhUJ1tJ5BLtMCatqpeJp58gFekHt3lDxgNcwroy9iSJsLANAGc
         WRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601441; x=1795206241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dnbd2yEJPOTWVHoma+CfFfSv19z03dGOV1zOyksuwzQ=;
        b=bmpX3ExjJOY6M29gqXK1YpkVacxe6yNhVPPaQosH00+chJ7uaXJVYgJ/9amm8FLQ/2
         U/YDOugCVPi5McFwbarbcTMzmdJYEjmonG1cu7i9t43OjwsAoa68t3ILo4BKHGxIaI+w
         WZ/pkHM7lzz2l7ITCBcdjmIOkxS78uIyrf0S5RMkavkuM0pE9HE5VhNCl9h1XsnKdBRg
         CCnDfObomJv4rn8jBSxuO17uRGr71Eh3zchNZplZBQYG8VufYGISia5Wlp/j89atxddf
         SndQopj4OgYiGQDmB0xkMHyVWh01a/UEb1Gt15/5zgBksKENhrPIFcciBtRUWLYlbcUm
         Liuw==
X-Forwarded-Encrypted: i=1; AL+hErHOhcpQXOVJMquvkQnE5fnr6pdLL+MRr32llAcAfg4qLRfnFmOZIb+OtY5LSyv4L9f2UDyZ76i8kOkWoapck0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z82VWbgfuZvOXRDmZUithe40bJfttbT8AwYvFxkdmMH/QOQyQZS
	TY4VFTTQEoUDqGia1CdGTk4BTtFojID3pxcbb0Jq6YcrUNxyOlo5BR/G
X-Gm-Gg: AYBFou3nfkElfrKciT7H5B2uV4zFwTwmVFWh9sHRqzEHhKXeCPZqaxSPkoB/HYeLUnx
	qJk0LSe9UzNp9hJ7QxC6lLJqFIX0UZTaiZpwJ4c6rKv18ggrUIvBN2WU7B3DESnGYOx/J0PYpVv
	5N0i/3e8LTvEaobvzXpIrMpc/3ScWsFOHAowc9fffQ0m37l0s5ZSSXDFUF78V9pZzuhRZIrd9im
	HGL6QgR6arfPcgPN9FuXbabQYOLHPcDHrmqwwJ7xoYL9UWh8yaBkPzQ/rmUKL54Pk1rQSz469TO
	vT7/FYVFWi8tw8IM6Ud0ktzvuCzk8jpVgR4nYpT4bGor7NuPPZJ2ojnFXx+6auOi9Hqqcl2aUpw
	Qw68e3xMfhpyZd89/xNXbSvvQdP43zR0jKAbnkawcugwY+kEw4aqwV5nXlZZJPEaBXQ93ZVxbVI
	G1aOXwz1sw76weOKooygKwHTfrccVoxyUpZ/fiklj6qkijRH7haz59pecVAT0i3WDVmaEhRTSV1
	FGYNSoILv0DPj80PQtmgA7Bmw2x36Tkbq3oBfMcO5zXT2TxcldQNbnNpJq0RE9tUe1hNxajvZuc
	Ysg96Z5DeISMjrPTJ4nHSTrCex9hnld6PvG5CA5F3boTcGws7NRS8w==
X-Received: by 2002:a7b:ce9a:0:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb55a911aemr55130455e9.28.1794601440992;
        Fri, 13 Nov 2026 12:24:00 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm59505405e9.1.2026.11.13.12.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:24:00 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Fri, 13 Nov 2026 21:23:26 +0100
Subject: [PATCH v3 4/5] landlock: Simplify landlock_get_fs_access_mask()
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
Message-Id: <20261113-b4-landlock-refer-nonfs-layer-v3-4-02d7e42bcdfd@gmail.com>
References: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
In-Reply-To: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Return the handled FS access mask as it is, instead of artificially
adding LANDLOCK_ACCESS_FS_REFER to it.

Since commit d6c7cf84a24f ("landlock: Simplify initially denied access
rights"), the merge operation already bakes the initially denied
access rights (LANDLOCK_ACCESS_FS_REFER) into the a layer's handled FS
access rights. -- They don't need to be added explicitly any more.

No functional change.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 security/landlock/domain.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/security/landlock/domain.h b/security/landlock/domain.h
index d9ebf4857fce..812c324cb6ef 100644
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@ -262,16 +262,12 @@ static inline access_mask_t
 landlock_get_fs_access_mask(const struct landlock_domain *const domain,
 			    const u16 layer_level)
 {
-	access_mask_t handled = domain->layers[layer_level].handled.fs;
-
 	/*
-	 * Handles all initially denied by default access rights, but only for
-	 * layers handling filesystem accesses.
+	 * Initially denied by default access rights are already included for
+	 * layers handling filesystem accesses, see
+	 * landlock_upgrade_handled_layer_config().
 	 */
-	if (handled)
-		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
-
-	return handled;
+	return domain->layers[layer_level].handled.fs;
 }
 
 static inline access_mask_t

-- 
2.56.1

