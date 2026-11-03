Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749919;
	b=eWCiAvgptd3wb1fp64fTK80f03VzYrRoOFfGwKyX0Wtrp/VHAdd78xtwCO5FAN9h93Kq
	 B4CcDhEsj4TctKTvIaubcMmK+j0fPs+8kWSuLjiPiB1slZx5a65QV0iglwlFVjZoREIk/
	 G13bSKOMMlI317p8PbqwNWT8efTb9L/UJ11r9Kxh1wD9kdlewKVCgH6B0YJJ6yds1HVuK
	 8nYf5Ue0uEtF1dO+LNwH4AVSMYiHzY4cpTXAzirPrfdI5WwvGayyAens5x+bWdG3klUZd
	 SEJUBhu6rWq7W8ySxe7i8d/AGLBY9bW6u11JQM6ZgEAzU2l0eyM16UDrzjihVfkOkDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u2FL5iZJ3JHIjTjapoLLiX3E/WLeHQAJjW9k9AzRwQk=;
	b=UT75Fuuf0f2ft8UPzYafaip5Av7quRH44Rp9RKGmKVoZ/ipK4ULnbm9BfrCbz88mJ2/V
	 axxGwPu6iZFk4a9uQzsMBVMm8cTX4rOhFoA2QSbE9rHh0kqcjSc5HDbtcBnh3Bl2okSdP
	 bovfsReEttbiU28wirRy86ezjdulBx+71shBt+uiaQjFo2mAdlH05UmZBrUMMEL6OKIKV
	 HHQPzS5kyK6B+97QaQspOOfQ65oPBaDmgSiHejUWjsndH5NkpFx/BFzkxcdfHla/EyF0L
	 BTEPh/x5G5HK5NPugv/3aO6vYpu1gi2G2zD8qP3hpc9S44recqHSRUbfm7VkkYNhrWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPGN4NCT;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D64606A33D
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D64606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPGN4NCT
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso154228c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749918; x=1794354718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2FL5iZJ3JHIjTjapoLLiX3E/WLeHQAJjW9k9AzRwQk=;
        b=UPGN4NCT1NhBPIdKHOKGSo0GUnrckC9TyZik21lyvgHH0js5GC9k5TJvR4sCkcW/zf
         1lqBRPSCRMRSY8+khu79223f0n2Ep0gmSa94vrnY8TxyBaizryjW9AhJNcZtA2mf3rpP
         c+7JpL8AACxqCsQvF+N7Q0U9wahzNZPeATpsssFqEZKAqYmSoi13mFrBPWqmLOiY7rAs
         7bc7HjUey4W9j/QrJb+6rhxinIql8PWDfb0Y3Wzu2YMrYCxKlqq1hT1Un32U7SuPjVFM
         RqQ13NeFN5J8S2CANiaczj8DJJSAn87CmCAoq//kL8v1lI8OLCvoVpchWHTM8BtStETw
         HPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749918; x=1794354718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2FL5iZJ3JHIjTjapoLLiX3E/WLeHQAJjW9k9AzRwQk=;
        b=c5WHuHZcr7e3TSX/GqgWI+8iSwN/bfS7Hdy3UJHZ98j8ijR0YnVia6O9XG8Uhdp75O
         JHHoZx3DgoInmgg9tAmsZSJRyml8nQ6GRJx6hBaybrDVwpRRs6sTDmU4KhFSpAjbNbWg
         7OLbhBbrrw1zKcgtJG/KA93OMW6l/donn+gR44qdwzpzK64WEB38cusFGd4vTS/iJQmT
         1a6Xfnmyukl2SviEXeUF72OLfsWXTVObWrkhXe11JJuFfzLuyzSLR/bRUB+zyvXagzYl
         5OlCzzUEbjRfKwf6+sxCqEWV2NlHSY7aA/VziOBq2MObuKNfBjQx+2nTkC34znjh0pmv
         vGvg==
X-Forwarded-Encrypted: i=1; AKwUvBzL1zp6OJCZ0fek20+w0tCCY+896JVeWZIPgeIHfGnivqeMJRstiktCMJTDyj4kINEc48bkDAWbBISxqRPOAhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LJJQs3/20RAJhy6NjryQjy2z5FLMZwDkgzH9aVVkipo5Ei3xL
	+iq1IobKpIIZ+Cm37TDf6jB/Z+szDimL0qRZAZtccC/6PH7GhzhJP+iv
X-Gm-Gg: AYBFou0V7qPqNpcd3NQcmuJgO/S/NGCLoclMO8bS+D6n24tpJlnxQtu7IFHD8QKfGRg
	4lE92LLXKmF+RVfAmXHFzSGN99FMQ1XPthy/diKTG300KixdkrEgo7OTBwNv7vrJvv42u7VO70/
	neQCmLfH4ZYC87++slARfiVI7qcSh1Yo2oNVl0gw6WdwDSpsFI3zP4PvbQQcggnNEm+9atOBeje
	Mfbc1SmLaFFuJKgun/2XSmG8Ny+uKGU2ftqbznVgI8wujrr8Gj162OuAWj7I68bVS7NPeK5Xv6V
	uxTuhtRiTQ2kv2Ry/XEBU/l0EV5JoXqyb7Y/zQjb8cAuIG04FTxULtS1Ur87wLxDZ/s1pUQ0GeD
	oMb+VQubc3eaAOAThkjqILkfulfgSGWMfiyuH6hq0gqmc89Ded7SwkIoe+7etKT/3PYo6xB//IQ
	JFzzjTid7SDqEMVydhyCXicxe18c/QcL4EKgcwMqXdiu8kPVZRK3ic4ZOuxJRf0UeRkwDOwPMhi
	BahCfq6ykkl67+gFTKBeof6cIrd6XpGaqKEusK18PsRfe3cKAoJ7da5sCUVpYx5YbPCJ5d/GiOl
	81eNVx6RuauZY8VozmbhJyE=
X-Received: by 2002:a05:701b:230b:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b2437835a8mr3011803c88.21.1793749918147;
        Tue, 03 Nov 2026 15:51:58 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm2167834c88.23.2026.11.03.15.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:57 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 3/7] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Tue,  3 Nov 2026 15:51:48 -0800
Message-ID: <20261103235152.1904727-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
Derive the index and offset from binding->niov_shift instead, so TX
bindings can use larger net_iovs. No functional change, TX bindings are
still created with PAGE_SHIFT.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 32fafbfa1359..6339f221bc82 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -455,13 +455,15 @@ struct net_iov *
 net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
 		       size_t virt_addr, size_t *off, size_t *size)
 {
+	size_t niov_size = 1UL << binding->niov_shift;
+
 	if (virt_addr >= binding->dmabuf->size)
 		return NULL;
 
-	*off = virt_addr % PAGE_SIZE;
-	*size = PAGE_SIZE - *off;
+	*off = virt_addr & (niov_size - 1);
+	*size = niov_size - *off;
 
-	return binding->tx_vec[virt_addr / PAGE_SIZE];
+	return binding->tx_vec[virt_addr >> binding->niov_shift];
 }
 
 /*** "Dmabuf devmem memory provider" ***/
-- 
2.53.0-Meta

