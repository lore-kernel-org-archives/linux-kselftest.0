Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE224456E07
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774775; cv=none; b=PoDod6v8PaZBHDRuLRWTD4bY9yB1V5xcANYabC8uZR3EW5K1iC10dP0fnxsyEZReguAooDDMPAfE4hhj3ZtL1gtMmfoHLE5IyuylCAsnIczDgEhjOJ26rfqU2BiMZeFxVU9ppJC24FGSeIfqMdly2hr8dmX86XWnrqw/uCVaWzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774775; c=relaxed/simple;
	bh=R5R4dBbRkL18oaDcmT8H6C5VQWPuThc9w+Im8ln/9mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1vANUpZtWoTgMnnNwMn+5irVnoWY+fWj6UEm0uL0+KHOxlaP4r01/y3kaDs/Yeeag4aag7DO8PRoy4XVeuklCpiKPqa8BO7tiGxwhBlJjzhWnAURDsNLm4gbdfMGPIHQv7os8ut2hWREiPTylI/SJ73y7JQoMVjcjA6ADRARpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaiO/q0o; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaiO/q0o"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2653769a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 02:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774773; x=1789379573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJgFBYg28tVOaKzoqkIGeWjpddjUWJ3I21idFrjiKm4=;
        b=LaiO/q0oGMceb6psUFFMiEoYqNzQqRDTrmxUF9jvpnuzBkNiDCAFOUKM9fub7pQ62/
         Ou4dPnjgI9ha1zD4W3G9mS/JB0D4sk7OB/6NPg8D5mW8uzHv3TH0PfgxR7H+ajW9PfJV
         RIvBPDYvPhfbJDz4sZIw3jdqO5hZ8Z9oh7LHHJQ/677JA6eXbSFIzZaSKr8Kn4cryN7t
         2SzneNiJ0NQ5fxh5A3eZzeFB9U+vXy0FrZIesCaKTSanzlkqfk0fjR0Nu29wiPqu1SSB
         zMKT9clIaP827qZKT/RVwNzpi8NS48JcUiedFYbJHtLllHXxNqo2zF5UifykepjV63g3
         gs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774773; x=1789379573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJgFBYg28tVOaKzoqkIGeWjpddjUWJ3I21idFrjiKm4=;
        b=KRkWunettKg8/GIEX+oFNXJk777yajm+QUMnM7M5+s5o2wUr9xEcG39fdOXw1VbmkK
         guOfdwTTIMV62HwadT8UNbtZuuy23YwpUlyi7Y9YA6fUPumFfQTQCn+xkDsDC1Ghuxb5
         qmDLFg94vZB3QF23Dp/eXo/OdLOCcKwQknYHbCEdr6hkuFdSOJBeCVKZ4wcdDizOqiqm
         al8xL7C3a9Y04uEIfzXrgVE1iJhB5KUQCZSiza0TbkzH4MbV1Bc+SQ16+FxHIpfJOQHK
         7ncpEju7sn2jVLlrrW8QHiRY26FbMGZHpPd/Nm02D+SouQre9T4E7yDTGdiow3sdpVRk
         TJhw==
X-Forwarded-Encrypted: i=1; AKwUvBwLJh8AMoDRf81AR6CA2m8ZKdgJ7MRI9ZAxW8umTICVv7RY8r21qR56UXbq/d205LzSW2SDTEwNWpKOHUGu44Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mbLawcBSE0eQdJvkh5r4tBBFouXzrd+C0NmRJurANfrf+OJSf6
	kncOUYPwu24GVpyCbKNmhfhBcAKxEQbOiUeWi2KN64qhqrOTHRgylvjW
X-Gm-Gg: AYBFou3O2o0jC+OyyuSgg6tiY1h7T5gcodnvfLfvlfI3HFdlASxtGizRIMrtK4lKseJ
	GcmLtdiz5Z4DGpRSWjc+s53hLEbpI/n+B9DNT3YjdOJxcDRVow1L+shZ8Yb+lkFqC4PZO2nUaJY
	KOSKARxvNZbnDdyKnbsiv4Ik2olYI/8HVuiiRA2pjOR2Gmzy+lnDQM/lOYnC0txa74XQaOunpLC
	MmH3fB7cFkStjo1+LIgPcATdztJ/gm9zhyn0NuGTPEu3JA3NXwfL5nzR8IADAyZHcRe7Vtkrjpc
	aQ438SkFL/pQCx4bh/zwDFYsvUy4trRr9N1MYc48H+/+V9SEXxVSfCrrsHPEUYMxkFHQCB3G5pO
	/LPOpUOYDydQvKKx9E9H2lyH0LNlMF6t3w7VmWCqSOPLm1oieBDMIiIghWV5R2uburJ/2iHjgJ0
	Xa3cvldmODQ0jCFXqeol5l9RfuirThA5w14JYSePi2UicmJfYUHx8aLVnMqx3PNKuXqO0awvX5D
	bU+jGjR+rl48cIsIdiJW0BI
X-Received: by 2002:a17:90b:5246:b0:39a:e983:d4bd with SMTP id 98e67ed59e1d1-39b262a3cf7mr35585786a91.24.1788774773211;
        Mon, 07 Sep 2026 02:52:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm18924258c88.8.2026.09.07.02.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:52:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v2 1/3] netfilter: arp_tables: fix typo "alignement" in comment
Date: Mon,  7 Sep 2026 15:22:39 +0530
Message-ID: <20260907095241.24441-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907095241.24441-1-hemanth.selam@gmail.com>
References: <20260907095241.24441-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in comments, found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt. Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to nf-next and use a subject prefix naming the
    component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto nf-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907064239.39910-1-hemanth.selam@gmail.com/

 net/ipv4/netfilter/arp_tables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/netfilter/arp_tables.c b/net/ipv4/netfilter/arp_tables.c
index a87e07e80d0d..b680bd14d329 100644
--- a/net/ipv4/netfilter/arp_tables.c
+++ b/net/ipv4/netfilter/arp_tables.c
@@ -59,7 +59,7 @@ static inline int arp_devaddr_compare(const struct arpt_devaddr_info *ap,
 /*
  * Unfortunately, _b and _mask are not aligned to an int (or long int)
  * Some arches dont care, unrolling the loop is a win on them.
- * For other arches, we only have a 16bit alignement.
+ * For other arches, we only have a 16bit alignment.
  */
 static unsigned long ifname_compare(const char *_a, const char *_b, const char *_mask)
 {
