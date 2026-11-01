Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556140;
	b=X3M/B55x/CRtnbo9tlsTX6dSxSZBC+xVtOXTFw/d2Z6sEAZLUHl3rNxULhJvQQHviZX9
	 vGlbs9IcHkO1ivcrJbj+lOqs1GzUNavMOSUtgD0K2Ijb5bUMG0kpcMGF3PhX1xjU6+H76
	 m1+V6bne5B2u9DAVwfWUce3O5c7tN3H2lJnIUZSIfBPMevJP9894/9rfGyyQ9KSpnMyuy
	 rSZX3tVRiK/fgRvK5OQ04q7IOuY121FsK333k9ySknUseucVLXJZVFbcdO/NBMHT1Aa0k
	 QRS+YkuKSaS/tj+sjHKEhSwmvFOvj8/N8FICeNE2DBIsEzDksrJ79D0q/+GL2SOJ0Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=FREPCHqd32BxvTRibj2ezyei+u70OcF5BBJs2hCkKaA=;
	b=TOUFDntIbREQx0vJ9yS/Z3J/t3Y/Ud6leArWSnHdhCaopOJrx37dy4f+CK7yrVI7PdQP
	 LtalabMvJ0hoHZgsarKYE6Cu3NXMue5QMNJCNCNFdh6dF2rHRXA8u9hZ8kfsCvqMYV73V
	 OS2vPQoV/kBrvvWUTIDyJWp556YWvyS/0XTT9Wl+A5Dq3ZX0IvYBGEulygqskfJ7pIXzj
	 QtpdL4eA7RycIH0oX9lce+CH3GwxlzTrSOjS4+Mnu22A7oQwQW7mv10GpaKawj5ScHAJw
	 CmRIFs+dcj0O1X60eMRtciSd6BZVbTCz/B6H1hp4rCeIgEzwXKRzFB/D15dp2ZTcp6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slcgMxp8;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E10606A331
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 18:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E10606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slcgMxp8
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso1309408a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 10:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793556138; x=1794160938; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FREPCHqd32BxvTRibj2ezyei+u70OcF5BBJs2hCkKaA=;
        b=slcgMxp8RCYEydkkdc3y20upQDeN8khLNYu7y3Nh8Q7/AOFw7WfOqjqtV9/H9j4gyx
         x33+sn4dxMuLkHJRVhs1BHMRmx5o9BqnZHTdzKKTdObJdURiF7AmcWHf+zoO3Qrei1vq
         z26pjR/Zkg74S2vOxlDF6j8pbcqQitmI1PeIXcC3dDwLuIuyULuvB5MvuNI79FzBbWt1
         TSy9iPNq13w3pAuTygLC6mLgBbFQ1vqJAOG0R1iZknuTS7J2qwNiGGN2Q4GCOt4yVIWg
         h72GjTOXlKO+JWXRwo2qs+v4vRwDWUkeRxxHCdq+YsfG1ofPac30PNmC1X5laJ+UHTB+
         4weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793556138; x=1794160938;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FREPCHqd32BxvTRibj2ezyei+u70OcF5BBJs2hCkKaA=;
        b=zpaXuhGak50y1raChgT6ewGP57QgE/8XGHIvnjDRyNesldDRtqAEb41YeeVIP5x12o
         cqZ08bk0owscD7izVUWc1TGGwLZlPXk3xuWJXsG534KL9Z+98hbTfraNBVOFkcBcGiqT
         L+X+JQk5gZjXfHc4yMG8LUtWCTLShMs1Dd31eisyfZ+BZpiizPgy0Ipph4H9XlQGv/Df
         eA6Ufb4ATVTFy8JE82WeEo7z0BCEIpT/VdFpx1BgTzT2qZOkdvQL31zvPPaNo6TvaTG8
         x52G/9TX7X2qTlUn6UjfBTcA/uCRn04kA51AZyvSi9aOjzR6Nh2VCLFTTFwpflibaz6y
         icFw==
X-Forwarded-Encrypted: i=1; AKwUvBxEOWZrPg4FEh0h2A+hXnxBGiwN1ozJVeEBYWfaxAK30wHd6nRXlwWeMyt5pmwmRC7BK2prl9uby5Buz53zVC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zaI7Xs8j5gdeORWsXwfoGPHM3pV+XCiRew/iTeFXEYW5WvR+C
	6hxALMFxxXi4JvTJg2ooU9mog0363gz9YFWaZUUxgeZxW7LUEEQVWt00
X-Gm-Gg: AYBFou0fwOlRDh0wXFxY1VUEpunvKZ/SewAcAu87RQTGFonpE2CI/eQYvRBG5AYulyP
	K5A1by78PFa4M6cVlpzPCcdnZAlkMPy0S1RiAFVLgdMhAsQRPr+kYE1PkODYuhFvB3HIIwe4LX4
	XEyFKgPZkcrOd/M4s9wmeAT9b+JoJlMnU1nKqwJ9eDhzR0xebxuOU15u8UfA+7pZp4f0laJJ2sW
	YrUoGg2HY0/Ug23v8M9DruxrqR/43i4QSgabFpbYY35CS68rYUJbIQr7slIW2mavd6gCCBfCB7j
	w62SRJFDwUU2eHoE1gleMDfOCaUz2skxlRgf4u+NB8K6O3hByoJQ7PYbbn4Iqn0zJdoSp7aKZOt
	o8TT2Bsv3fdeFMdEw92Astl2AzR8uOaF0eWf07kXDK/7Ge/JcCFm7+OoY/EXe1htICNlIxPXv2K
	/QPWQSdZZCijd9Xv5PFIn3V+8aHXAoQAuOphUmTna9mwf6buz5uLOfmte5Pa2QyHFnWKPUf9juV
	oVNDUs4fubfYs4SpE2Zx6jkeRra4sEWzEc/uCFkxJZEv6jl8PKXtDktgjXo11GxzWts5VfVQc7K
	QX0UwpPz49NCQI79TIXIBRZe9VMHLsylZIdl49lxp3OyP0rVC1ckazxV4Lp3oIrmS1fyk3xFCXY
	HyONCjQENnN7V3No730riniY4KIdqVwWpaA==
X-Received: by 2002:a17:90b:2891:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3ae897ab44emr6085932a91.44.1793556138558;
        Sun, 01 Nov 2026 10:02:18 -0800 (PST)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d5b8csm15660646a91.1.2026.11.01.10.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 10:02:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 18:02:16 +0000
Message-Id: <DMK2L6ELL4W5.24CXTMXFDKA3P@gmail.com>
Cc: =?utf-8?q?=E6=B4=9B?= <wanghai8081@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "Alan
 Maguire" <alan.maguire@oracle.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] libbpf: Fix stale raw data after
 btf__relocate()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261101155615.324501-1-jiayuan.chen@linux.dev>
References: <20261101155615.324501-1-jiayuan.chen@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 07:56 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> Call btf_ensure_modifiable() first, like other BTF mutators do, so the
> cache is invalidated.

btf_parse_elf() calls btf__relocate() for every module with .BTF.base.
That BTF is read-only. types_data points into raw_data, so raw_data is
not a cache there. Only raw_data_swapped can be stale.
With this patch that path changes:

                    today                 with the patch
  types             rewritten in place    copied
  strings           as-is                 copied and hashed into strset
  named_start_id    kept                  0, lookup by name is linear
  has_hdr_extra     relocates             -EOPNOTSUPP

The last row: btf__parse_split() of a module with new header fields fails.
Ihor removes the same side effect from btf__find_str():
https://lore.kernel.org/bpf/20261030233355.1836749-2-ihor.solodrai@linux.dev/

can we drop only the copies ?
The kernel calls btf_check_sorted() after btf_relocate() too.

Something like this (not even compile tested):

diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
index d2ff6f5..d67f78d 100644
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@ -2033,7 +2033,8 @@ struct btf *btf__load_from_kernel_by_id(__u32 id)

 static void btf_invalidate_raw_data(struct btf *btf)
 {
-	if (btf->raw_data)
+	/* types_data and strs_data of read-only BTF point into raw_data */
+	if (btf->raw_data && btf_is_modifiable(btf))
 		btf_free_raw_data(btf);
 	if (btf->raw_data_swapped) {
 		free(btf->raw_data_swapped);
@@ -2099,11 +2100,11 @@ static int btf_ensure_modifiable(struct btf *btf)
 	if (!btf->base_btf && btf->hdr.str_len == 1)
 		btf->strs_deduped = true;

+	btf->modifiable = true;
+
 	/* invalidate raw_data representation */
 	btf_invalidate_raw_data(btf);

-	btf->modifiable = true;
-
 	return 0;

 err_out:
@@ -6642,8 +6643,12 @@ int btf__relocate(struct btf *btf, const struct btf *base_btf)
 {
 	int err = btf_relocate(btf, base_btf, NULL, NULL);

-	if (!err)
+	/* types are rewritten in place, some of them even on error */
+	btf_invalidate_raw_data(btf);
+	if (!err) {
 		btf->owns_base = false;
+		btf_check_sorted(btf);
+	}
 	return libbpf_err(err);
 }


Also pls target bpf-next. The selftest is contrived.

pw-bot: cr
