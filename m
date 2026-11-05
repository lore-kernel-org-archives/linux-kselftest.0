Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917265;
	b=lydlWvpqGQMsm1zq5/EDbmI66IIqcQZTc+sxPiEGVbLDxE/K6OiyIi6JFyTSvTBCGfFp
	 ql6CKGDddAGPnvgMX2f8L0KOPwvhjdfwNxmsFIAcGSQqHiAVngv/9P1ey8gQLxVHRjrnn
	 bKw2cOso5pNRFKZnTz8zmmWp69xH/MvqRkabvR8oagBuym+rVF7xSzRGSzIMma9fykapi
	 AO3NzWlTI9ZNvE56ElLM5Zx2azFjybEmgRXQFB0Lr2VjincPD8S/fbRC68/TLz6zu5pz+
	 lIC0IdVQfnEWybBfEvJ8BGTt38s4mIl3mwHW2p9FUd3ySnhigcHVb/jQv11t9yWHf9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bZjDWOUD0tAJxtZMll1Q64xr0BqB/ZpzoZmoV9J+vc0=;
	b=dPfKHiPfCKqqwQ67j83qBRruq0BIDx2MgTxFN0nh/CvMKiZ/TIBK2Q2ZAr+/YtFVap/p
	 opFLtlOah5WQydaP8Fgs3o7EA6+wAA3Uljl/frflHqwJEJkhl07IWGU2aSdgkrhM/z1cv
	 qpy3Vkg0wWOCna2AQl7khlo3fWNZVIL9gmydWq3pPURw9O4kEqDLBIaQM3xCl86Z9fHuL
	 VNK1FDcgfeTZDvCaD3Jp7IGF5Kac1fIOlqg40TDLwH7VvxKsnSWhssqBwezfwlMZ6BEvZ
	 5X2WQ6VyChSbK5sYxLUN5H49zFSM/PrAC+IYe6LJrekaV9hqITMAvoQHBlFhasxa86g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTmCPrmV;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA101606A336
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA101606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTmCPrmV
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso5864eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917264; x=1794522064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZjDWOUD0tAJxtZMll1Q64xr0BqB/ZpzoZmoV9J+vc0=;
        b=tTmCPrmVRUAllLERaiIgEGzgA/3GcfFM2ivaSUFN58HhzdGttxq7aMEdu5wFU88DN3
         BGADzbE+V/rwCP47nlsBPiPbimmbqXpsm0MTO8By3xg3KpXoEoJg/xdT0VlsAlDt1Qws
         XBiuk012JlHh4nvmFh9c91uBbDK3j/UegZ3ClICJVHL+CXJJZhjeWkC20o45Z6amYY7z
         nX+4m+6F9NRf2a/BOP4r7rY3hLk2InUAbIHtQrptWriCeAuG1hD3EmLPQ5n/AzeXrwZE
         86vRSdPo2JBAI0tzU8eJWVzWY5nCMyI+JmMTbfHCkbdmBgZJIqVl2SVZdWy0kwxDGHPq
         +gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917264; x=1794522064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZjDWOUD0tAJxtZMll1Q64xr0BqB/ZpzoZmoV9J+vc0=;
        b=kY55yCyTIIoUrj9dCOJOBujwHOx92A260gON1/HFr54MFZCA2UtE0CVE1rgJfZngGm
         nof06M3XdLyuxH7qBU3bkmhjmzrch3aiSD6wM2OMqAusvBgjx0H2Xwvy7pAnpPE4gnU1
         0U6W+Swvi+jmH1Qt9sDfELTq3U/FyBNhdoIPbjE6QkF1VXQ7ggPDnD+sc85pGi67DygZ
         CHK/IC2pgthKzxzzaSxrT/+O2rzALc4Bf7/N+HepEogb+aK+b2rtR4TGVPpxL5lyARgf
         KWmIWHDDiXAaCvL9EjXiqMLuNTA7jnGxFayw08t3zqJQ0u+oGdKK5Uu1GVgDSNO/FFAb
         wc7A==
X-Forwarded-Encrypted: i=1; AKwUvBwILuYEYtksevaTC//7OjrlS8FgVL+6N2odsgXajSRz9K23UGQKnyQ+GWOyq791sCvEYsMeJJ6Gb8E4yy/3AaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oQWwW/VgKL/15qD4ITkIDx7P8nLPI++SzDBey90+QJC+VFuDT
	8q2Ni82aA7PPRKGU9/sISwhEcRVnuH3w0QnEz/uHO8Mf22t3aifopgI/
X-Gm-Gg: AYBFou05AHnUNRAFYoMguFJxyqanZOHKB1SNhiYS0bH6HV2qh2Vijgogu8BL6kF2jpK
	hU64A3euKhlwLfGbd9kWFr4MZA/ffOkrkVkoDoh/njNqgCKMXegUjwiHH3mum0gxk2Tl3NUxdxA
	II5Fl89Nx4YjHzvVRssJ4iQfTruEEvlivMMtsuVaLZI8piWp166MAXpnoOlqWXFNU5oyNn91lm2
	H6gAe6b+i+oqj6qgY500wd01rwxHB8I1mUuodDtTUJ5JUbwPAPY1W+H/NViFOeTIk2kyw4/O6QT
	PgDNTLCuZNNti9WrQubSNSL2SqmbZyWuDwklrJsPDIfx57fRY0ow3hMpTYofBgKUcbnFX/TJZ+N
	rykzbX4z0rIy4AOxXlh7Qjm1EzSstwDDD8pKmH8qY/z7MAYBAFI0LWtbo0SmRP1x90UyYCq0EL6
	8KtSKZmKi9PuqNgGW6aWnYHFrw9uk7I4RppDo4Noxpt69lIfL9VSWILtVbgn83amG/3AUQkWlVq
	9TQvr7XQkT0J3JxQF9rW2f6olVOstYC40TbFrP7BzQoRcvQipeu4KS+wVR9cNTgkZyhv0MJPJx+
	7Hosm6mxlEpeAN3HewSeAcc=
X-Received: by 2002:a05:7300:f586:b0:36e:2b8b:a09e with SMTP id 5a478bee46e88-36f76c1875amr631599eec.34.1793917263769;
        Thu, 05 Nov 2026 14:21:03 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm47741eec.16.2026.11.05.14.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:03 -0800 (PST)
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
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 3/9] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Thu,  5 Nov 2026 14:20:52 -0800
Message-ID: <20261105222058.944293-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
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

