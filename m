Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169469;
	b=iz9AYMhgSNeVtNKZiNpYXS7OeQFE8a30fQJcIk5PDlRFsIwEApdVOIwnzu6/aSGBfbpV
	 ltYs3hEIx2gI3nTAB2Me9hKlpyWD8SXWX82pDcbaj7CdUPN0wDN7fUZfyG+tHjTLgIooU
	 8EkBOLCXzL9It/dcG1Db3bOvBTJnxAs/FnsbiUTz4nVLXwLX3sfaaTxIhdw/z8GnCx3x3
	 G2FUTa+v1GEdWaj2Nx6RIDOpOSLTyYVDX4hSSIf76z8gyDFmASJIK7gejmXlhzdSlMyPR
	 ZqJ+GLu3TYP9KgvuwNTV8EKc0jXaRNN8CIAdkNPyK87si8nDA5kY03hQtKpPwjujxNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sl1RiSecafJJLjcGJkmLnXileJoqiVI5c1VnjtgRMUs=;
	b=g0M/f6ytSnSBlwS7HGiojYewFmiP4Q0BnHmKOkDMv56Gv47/JJs4Kr3Wq4szMJzY87g4
	 M9NuUX9C7eTMf4dvceh8aENIdT+oWX1kV6aj4OrGsEd8Rmkzq8F6xHwQLo9fZPm8+RNXO
	 9ObFgA1w2kCvQnj2jNvAH50renkjcgmkrRpcY6RuH32tGg6Opt2e/rbl6d3VcUan9Fx+U
	 jxuCkGBJzbj6XPH68VIX7opVDCRUJwmpsAbxDEKRbE7MUJZ3nUt5h0/EgxOtAjkT4EUov
	 XL1C+JMILXKaq4gRW/HpnXiT6A9XSU/x/UZ/wVf9Fqu/kcF7ltUkt5OS8YcO5qiz65Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qh/J0nAf";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE03606E033
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 20:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE03606E033
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qh/J0nAf
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e4831c028so294321f8f.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 12:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169467; x=1794774267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sl1RiSecafJJLjcGJkmLnXileJoqiVI5c1VnjtgRMUs=;
        b=qh/J0nAfM6eBV9ItcrhQzKqEOSU/vZC2wJNodHwTQe8F+q38Va1rm0wWiivcjb0p4k
         SJERNgoH+ND5g41BxVpsW92mxP0kfxZeS1o/0Coeqk0D5RJdR1XkTjkkXjMn/cXPFYfs
         4QK7REVIOvzccmpMVzMxDJrAXuaDnesijlli94ob0iI9HxJ0f3/2BHWYVZgb/mHIPrj1
         +59b3DXoHQ2HTRhHxhqiiUvz2P/x7YKj8dHjnbjbzGj3FkXWtAgVyr45TJr3KflskABO
         QlDVIVHUbVnLzUO2ssGOKKfaXDQoZs4T06oeB4LP1670qFZ/EYickeqF2B6YtyDEIg3W
         CyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169467; x=1794774267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sl1RiSecafJJLjcGJkmLnXileJoqiVI5c1VnjtgRMUs=;
        b=wZr6BakLtSovKTD0Ytg9+8PZq+VdCLlAb7oLkRFk9NVZy2PCKdtOUTM7peR4pQn6CT
         0xzUVZPiI12tOFPgNecxBQaUELxQlcKbwOUnEjyJGGSx6/fNAZOnKEXF+3I8R9POmjZY
         ZynKPz0JQeVXlyj6s2VRaBwSIhUo5HWoi39CQm1kF2vZRyWjCZWHdX/6ygHmhh964Fw8
         KBjycio7zN61mXbidju+7wTI6zeKyKDqX73X1nWi5ApC1GaPzCoUmcfvI2xcg+GvFXld
         C7Nu3P9UX4B91SAh/Bf5ZM7zKhfqUl8u/IsnkOqmFWzCRHeSx5aiBYGZRRHMEGTM9Lcv
         YAwQ==
X-Forwarded-Encrypted: i=1; AL+hErFk6o4unrTWjgBuW4AMnI6K/GeC0ny+QCq4J/M0KF353XyX6n6jdpmKIO+Rn5VLGLfaL1cwsDFU7cWjsazSG5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s1slB2OYWlbEFHXuFGtgH7SzOTu7mKTkzCFhdunolY7FF5Nbi
	QW5F6EOBJMXKdJ8OzQ5qpZofvaNMzhE9JvOBglcKr+pNpO9ZW2rkndkk
X-Gm-Gg: AYBFou1vbI5n3tQQJtDwX23s/2QAVRFEzh+HQSnSKl0M3emDBbE/vVMZ0ehSZqWB7U/
	XxYg2kPmRFYtD6NosHIAlTjvwPcC5BZySYBuHQNts5SfofWY8G5dmLQAZXRCG8nT9YoqKPXWq9Q
	k5gMGix32Ze12em5Vv6xdLiGslyLQWMMiTgZmmJ/nJ8tihnsA3Vwx1qlH71zTqi9U7B3a6ILKsT
	n6Z86IUdDVS68pdC0pTYeMYDOEsFYijuQr7C4Nr9uQZhHQD5INFDjVYRocaYPtiH/llZhL8ud1a
	htCy+BmGzkMMUguIoI6rlTd35s0VUDEi1VaAb0Lp5ZgMkfUzY4zsqyLmn9TC7mpb8o9bdw+9XU2
	POhANybdUYQZ+s6fCUPyIOouJkMnuwSKDGLPzXBVV9vkubQvPD4cm/6IpB2ON0xpptwCC0RVwIP
	txEOdTFoZrUs5vytRlIdcyovXOobtf+IOR42kGoOWWTdqSO9KW7iQQqRfANH6jRhTcd7+a6uxdh
	2xOdxl7mb50hHziBdgiKGj+zXbclQS620sCmxetR50hg46XAny1hO4ZJbJvmhM3YpOl8mDbmsVs
	WOv9pc6zTxl+GjWJOdCRQbs1ZZOIpaKZUH4kSzgbW3RmgC+y8FQE1Q==
X-Received: by 2002:a05:6000:1a89:b0:48d:c186:dcc6 with SMTP id ffacd0b85a97d-49585f85ae7mr5659490f8f.57.1794169467418;
        Sun, 08 Nov 2026 12:24:27 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596bc3ba1sm6034100f8f.24.2026.11.08.12.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:24:27 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Sun, 08 Nov 2026 21:23:50 +0100
Subject: [PATCH v2 3/4] landlock: Simplify landlock_get_fs_access_mask()
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
Message-Id: <20261108-b4-landlock-refer-nonfs-layer-v2-3-2b405fc1b3aa@gmail.com>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
In-Reply-To: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
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
2.56.0

