Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950029;
	b=T98u++IWfldghjVwJjT8OrCsc63mP5EilOuk7/NglFQQZwYFh4uwFghyAlc/YUTZqkEu
	 mgTMKu1DRe44cPrsa09WpAWQDM7nEmgXZ7j7I9VI2plUq7cDGO+J17uaM04cgWCEXWkcZ
	 ItvOrl2kZLuAJDui6651Lye6UiyPzIbNn9aVCgRB59PKJtAjjS11cD2yHb0kp3MhsuvGT
	 gA0fgmKngqezHj8xGQh4EpyQ3fpPFF5XjtgLlSUTIn+D78+ZQPBvt9Ta/vMcDhoUqaM8B
	 aL7qdhveKtnaCWWYMjr54w9wpn/P6OWCCcjTj+W7AOtIqw2+jSq+gbzEMAO8SB5Uttg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1V5FDGF/e6SVBVJsOb1x0mGzHREcuT+Gfnqc1J4W+DU=;
	b=WNdPKPyc8fA+WjoPA02lIyOE6BkawmAmccuT7iCumHew2Ytvo0jB94J2RliMCiZRGU21
	 slPqR6d6s+KibhZzxxBT7JvYFHsJL8gn4ryr+vurWpK6uBpXM7wYI720efYLa3IcSE1xp
	 eneRiUWgl8N2a40aHGUBnvH4lyxpMODbajWeel6RKa1VpikD+Pn3SI5eEk8GyXwl6cIKD
	 8f/OQsPQE/A9OviQpkUhnWKN0MyiM4nHL3GC3JaFKkw5sH2gVbxh634MYSrf7q3ttSZBb
	 SDIvW8y3s8skVRCw0unAJ+AY5CfJw1HoIXenVI+AQZGFZtPiZokCeHhVpDtXkTQV3Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kThEKxFU;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2100660A2607
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 17:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2100660A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kThEKxFU
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so2036283e0c.2
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950028; x=1793554828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1V5FDGF/e6SVBVJsOb1x0mGzHREcuT+Gfnqc1J4W+DU=;
        b=kThEKxFUrqmeaZ5Mk6vciR8rP2LVT4S5jo7RRtIro4YklfgsI06MKzt6CM5C698Gup
         yaBf7w5cgU7nNd3L0xe4jGsl2RTN8n4bzx+QqO5uqg1MpCFAkeU73/5kisEDGP2CRoSg
         AViw4qdfFio6tUcGYQXvctYxEvmhiLMVhFA5HulzHBjErF3h5Bt82MXGoJIe1OzBvgIl
         D38QrZk1dchWoPYT7olZLi5gEg0/RvaNnXeBT6K2mPuD5QBfHf7js/l0jUpSTMDGTC8i
         mqtX++20uNhM14LdVr5Vpqp+jrAHLVf8Tu5N97E65WrdA9PxQZ9lZgE/salRpmwtPnI2
         uSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950028; x=1793554828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1V5FDGF/e6SVBVJsOb1x0mGzHREcuT+Gfnqc1J4W+DU=;
        b=acapAgOCqZpOqTtC584eo/xv4lgECpEB6WR9LxfUyjRtKDESD4OTE6p3v2mPASunwe
         HmoffBILDaxqJ72gbj2pHx4Y8+WhGzBjtYzcEuouEeUgnpkQpvTBpkiqCmGSQPJr4mFz
         ql1Zqksw+PsSHFPpblyfDOJqtTiJAZIAWzBPR1HmnO4eXW6ok5g4YR0mK7P5JhD9HGvH
         GRvQVfxrRxEOgrVQiw7ep3B1JyIM5B1MU9FXQvLxjlJJ/7UcGH70QbWFViodi939dGeh
         gEId/1u8nvRaeH3fWtJ4mw1cASJHWmZkQxBSFiJqQD9xmXTz5eCODPAMMuzLIz1pIbSY
         wZJw==
X-Gm-Message-State: AFq9FYK+KvjYbmqDQ9/VBSaVLpT2RO0zDF7m2R0lTeobTGyxo+Te4JuC
	tZ0KMKkx0bzAK732/7s6uVJs2IO/duv0vaHCW+uo9Ln79METKmaDtnYQymV5xnECfckZ95AELrL
	xRZHI
X-Gm-Gg: AYBFou2kZooh28/xjIL741zrxVb/GdrbcrRqFP92qzsbLCQ0I64xVI0rXBONCGmiIl3
	HOraRdxlYxXeK/m2fi1Xry0WYuQvWZ1XsYEdNYHK8q0/dsasqhGMhjMErGijNzVNjerwVm7UUC9
	Gt3pMw/sH1CQibTIizHn6rOdgAIehrw+MwYT3nFsjtVy4rSS5m+jB8zd2YxglzjfP9EyG2ILlD6
	SeeBpD/VPx29PdRFDqBK8t9CX4zmY/MFT964568LhriE5mIMBcVsSUQ/PuKvggO+kB/w4ttszzd
	grWjqB0kwXqOoQedyTwrouFPnu+gywnp5OF+aEMhKcvAmCtOfEOIjDjrdPbYcvP+0yv5ikHRHKZ
	C35q/kpFJ6PI6ZFqp0Uv8nY7w4rCGH0by/OFy+Ln++FNPt23VdZcJ6db/dOXtbDiwk8ZvuStUhV
	rgWbMiw+r2ekm1R4NL9N8BHeQ9utXbJapfFBW1pPcnE050adx/vsPYerC9Dc3AZRRW9sEsE1CJf
	URSiT84TtiY13/5P69Xh+cD8JY2L9QMONGYjEo9wjrusqEd/apx+1VOJrm7xvqzUBsZ/WI99rhj
	vX/EaxDaHEMNdluhi1YpnUDjkrrV4IFhqUw6RctLBiTb23EyzU5iS1BeEaqiya6WjexQ+bf3I8K
	7Z+tvpnTIaEwBshUgGS7/rw==
X-Received: by 2002:a05:6122:50a:b0:5ea:be1b:1b66 with SMTP id 71dfb90a1353d-5ec22ecf5f6mr1525623e0c.0.1792950028135;
        Sun, 25 Oct 2026 10:40:28 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:27 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 6/9] kho: support read-only KHO mode in KHO core
Date: Sun, 25 Oct 2026 13:40:13 -0400
Message-ID: <20261025174017.3870481-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
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

When booted with 'kho_ro=<pa>', skip standard KHO bootmem and FDT
ingestion in kho_populate() before early_param parsing runs, disable
standard KHO in kho_memory_init() once early parameters are parsed, and
use kho_ro_get_fdt() in kho_retrieve_subtree().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kexec_handover.c        | 8 ++++++++
 kernel/liveupdate/kexec_handover_common.c | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 67efbdd39439..cc56caeecba7 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1819,6 +1819,11 @@ void __init kho_memory_init_early(void)
 
 void __init kho_memory_init(void)
 {
+	if (kho_is_ro()) {
+		kho_enable = false;
+		return;
+	}
+
 	if (is_kdump_kernel()) {
 		kho_enable = false;
 		pr_info("disabled in the kdump kernel\n");
@@ -1841,6 +1846,9 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 	bool populated = false;
 	int err;
 
+	if (kho_ro_cmdline_enabled())
+		return;
+
 	/* Validate the input FDT */
 	fdt = early_memremap(fdt_phys, fdt_len);
 	if (!fdt) {
diff --git a/kernel/liveupdate/kexec_handover_common.c b/kernel/liveupdate/kexec_handover_common.c
index dc25cb4c08af..a9bc8d45d3ba 100644
--- a/kernel/liveupdate/kexec_handover_common.c
+++ b/kernel/liveupdate/kexec_handover_common.c
@@ -263,7 +263,7 @@ phys_addr_t __init kho_get_mem_map_phys(const void *fdt)
  */
 int kho_retrieve_subtree(const char *name, phys_addr_t *phys, size_t *size)
 {
-	const void *fdt = kho_get_fdt();
+	const void *fdt = kho_is_ro() ? kho_ro_get_fdt() : kho_get_fdt();
 	const u64 *val;
 	int offset, len;
 
-- 
2.56.0.307.g5fe7bd680c-goog

