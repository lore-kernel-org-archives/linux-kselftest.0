Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646884;
	b=e7QI93J3gzEVhBHTln1hWwX4AKUxdiitfg3z8gKdFA2rLKc3pHBeajIkOLpevVabuRU0
	 NHgLGZTQAgWrK4Ra6pqgRebS8bgFwaa7NH6mwcIBsyvxOAvBcUKjHqOHYV4VT7u+mrj/a
	 F/UOuyOTzyox8lslM2W10oCaL7z2B9gtAtIX/9ZwQBmg7OKINcVzJQK8PdDGgrz3tW0Th
	 YO1tfRgQnfdX9DVMdR9qxPoCdJxEn9Tvz+vyez887pAmsbQogtapQVpCqlR8L+8Zlm3ST
	 7MpRWmOrX43fmVKtt1ifon9qer86O2Dz+BCbFyA3pJpi+6TcZHCKbi5/boASVJcxOCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZVsuCPHQOVUX+J0ERU9EzUWJOblLPkY73pQVUzYA+s4=;
	b=GQhgtx3DuHeG4hkBSlZH0ZM0DydYNDjTiDchOuxU9rIW3QBe7pPz/KY5mAhGMtvbyx7h
	 Xu6+RtYMQTvIPe3ABBnuStf1xMBsY1HHrwS9dsXVcAj/6VoRhPKk1+hGDfXoL3RwxixRO
	 mHiu5qCZ/Lx1i/vpgBEBIL/FlhSnfwbP4ix4bZ+/aoNygcONTO0n3X3OSB+u0eHOkGWhU
	 aBxU9cq2e31BFmYHCbhDQFDnlrtZcBWIt6lNJ6/I6pyUYRh5Lt7ZdxF/8iagNbJr07qDd
	 MwRN3omESARdhJo93BBezN0AOdGplgm0pEGM+KWbjfxS6+UCwNr6lKeCO61URnlbogg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhiP8h5j;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CED606D825
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CED606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhiP8h5j
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso3835839c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646883; x=1794251683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVsuCPHQOVUX+J0ERU9EzUWJOblLPkY73pQVUzYA+s4=;
        b=IhiP8h5jzlmVlab52upLzwlOFij5iekEIG/X+yYfMJG3DW1rdsi4zAbXqX2qE1NgLu
         JdBpIyjfMkSoEncClqlyb/NpnB0PAOc3LDyPl6zZQ6q0wbOlm1d+/CVNbScLvG1z6sxM
         i/HtGMFHaaYHwKydBo3RF8fpo0x9IWf/CCQt417191kH9vwvO4fL/HkwHY1G4fXwz505
         V/Pkctgjr+J6Fprs5cmLUlEdFgPYno+VvEoPo9SVJosTUo/rIBV0RTAPhAJjEeIoWzxB
         +K8n6+YCssxKAswNrAWo32Hkd8dEq5TMp2WfY7UsPeLV7QucuSk+d/u1UkcvMprBCBBC
         5p7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646883; x=1794251683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVsuCPHQOVUX+J0ERU9EzUWJOblLPkY73pQVUzYA+s4=;
        b=Vd4I3+NPPx60znzipKAnD+tr6H/tk2xMAyZJXlP8bYGHQDRPbVOIN7w58CP/BX+b2W
         5hkJ/TtFkaLhTQ/4nhXrLJ+/iaQ6w/y902tjvqSVR1eVfkbekuKMUwX5R9D4l0Gmp1ga
         yA0uzpEkwNkOJyiDRK8OCCUYAib4ncwQGZuWEGB8gbNzoZQTvSJcCG7kv1tbNOVM+yNO
         1DKK4Bx2lGv/xsk3mMM+tHab8EqnjmbhfrYndPCMY4alM4xaHes5sJ03FlDENQ8GHmxh
         fG8RnWhw/hKRCLaSvl9ADMnbFSe02mO9cVPw3A5zTxYiCxNhbvpQSY/2WGH2UvQ5EHpD
         o6cA==
X-Forwarded-Encrypted: i=1; AKwUvBwAOBYR1M6c062sXq7im9TcLEuLVyp7qv2diT4vDGv7HqhozA87skwQ/a8rMTejdZGzPQav78jxl/Akygc28lI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuwV7KMTk2gFzJ+LZFgol9PPJ5Of9h8H5xxQruSM30v9bBMcgH
	K7K8Nb10dH+bvyndjbSnq0Cr7FtDYHBeqdhjjyimL0jLTY2b8dfineGB
X-Gm-Gg: AYBFou0z9gEWjp4V8GZOc9k2wEpdOSyx1sir32H0ji4kAqi4DLpVkm/qFUOyBpsqLFn
	K0/s/9z0ie5U1YwdbwqeOJERsCOAdp6QMKkl4Q2ZgSUn0vviLjQgywnpLwuQUN3TUam84xiWRoh
	x8pTTHLkaCNxaD3V5iSx/LEes75egZ3ou+BfsYaEb6geIVfjppp2Qy/iF6R9dbWJG5iPSXaTDV0
	Sj9oSGNs7kfD3QrLGohNqZmSkTKMSojydbJcNlm63/yL9QQ/D+dfv+JDWD2h1NXbiErAUmavmvi
	VfNiM88QOWbVb9xZiiCFCSjjWxtCifATkveYohI6+D9EAoYIivXuYDvTt+Btc0CDZqaiLRnc++0
	pUz9gbP5cLpy6ynHrr8efef/tsvjAxCCx1EfvAm6F1G7OEDtlUNF/zIoieX+gHiiU9VTYf6MPuM
	7D/DoTGbTF9Ek96d5ZKEFre3BXmPdX7O4XWdjQGcCHPNT4H3tGGESt3dzZvxr1u/7tCj2IE+qMJ
	KzX41on2bX6mp4eTYjb0l1/4jUMvHLGoIFdFrIGAbz3eothHeMRd3c3gw0S76/Q0ANg+lLYodmx
	euEhZu6yfjBLl7e/miSpV9I=
X-Received: by 2002:a05:7022:281:20b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1ade9e3e335mr15040908c88.31.1793646882743;
        Mon, 02 Nov 2026 11:14:42 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm36444456c88.12.2026.11.02.11.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:42 -0800 (PST)
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
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 3/7] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Mon,  2 Nov 2026 11:14:34 -0800
Message-ID: <20261102191438.1059771-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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

