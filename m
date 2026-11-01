Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793494744;
	b=ZWZEMEYFOiziN73X5gnStM3s2YIei5kQziFaUsXT0e49WIuk9Iq7JktcjQnOf1x72ULn
	 w5tgbz9R4dQ6ixjogdl9v+nE0zA1uJKwIsR9socwhRuQaxaDC1FycFtRFsqWGp++wDHFv
	 AYunsZJOh1jAGNBjJl4Iqmoa9dJTq1ss0FWwWwLBhQxuBEwKHJty6fPSAxUJqFkFQLF0y
	 6jJIzktBd2SyO+GAoiR0Gy90ZiowHpKjuKjzpSK4RJMQE7Yt7Ox5HTNKJgGZOou6jmQfI
	 uotAuRVaPVdE2L9rqEqUlaloUwNs658ghqZG8rPWvjk40pDvLFGjUE7fjnYfR32CUHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793494744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=PRYSgurAOIt4+aBdsRsGfnET3k61sZs24m9Ee/nOO+g=;
	b=u6al2t55xgjzkh2GVFaT/o8ckSc/mHy22cXxZb1R8HPq7199pvwT8EJ80GQVFX0qEb6L
	 YQCMAIm/uL+mU49MoONd6pa2BMJHxP4DCly4KK57CcUqWO1hNZjTVEuYWd9qrH9E4o+qw
	 i2oqRTqDMlKngQhE70YHQTmyT4ohXbPvVWryJRc1xkKXNmZqbQctHlr6d9YAxWrjBDjJ6
	 RrnSd1YAQC1CV7pXzvRy+bxP2jlhADWxNc06ycl+sUHDLO6mWunxTgSOME+3aUb1EI2+Z
	 6hmWmnZBo61An/X9TJob3EZ6FBXYK7hqFyMqZSdm4vqbPauSRyZ5thHjlYX+HhI59Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T3ukN4yK;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EEF606A31D
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 00:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EEF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T3ukN4yK
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06c60065fso1233240b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 17:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793494743; x=1794099543; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRYSgurAOIt4+aBdsRsGfnET3k61sZs24m9Ee/nOO+g=;
        b=T3ukN4yKFkPtgMsFX5x1SEOOKz8GBupCamU8i49SWxdqc3wJiL3c5ySJZxdXRgKQzF
         Wrpl1NNK50XzEYomT/rGTZcURo+d4zhfepIKbfpct2Z3RUIIxxVf//kRTcHezlh/hC5W
         l4TlCcsf9+Nv8k7V3YJDVjDNnIepGxJuF5RX8xDEVcw3JMzdHC9UtHN9FzUmZsu/NLxi
         riut+UyVD0lcxeYv3q4wWvH6SP12XEXG3o5fiNVF6O74lyHedkdGEPVsPRNdYWWOiaKb
         W3/pFP1tdEGyjIIj2RxijaCTeu1hUVkYukPABn23eCxO3bJLOh2FESkL0/z5PHrzMzKq
         Prcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793494743; x=1794099543;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRYSgurAOIt4+aBdsRsGfnET3k61sZs24m9Ee/nOO+g=;
        b=S+I0R9OKxlOGHWTpYzgcDFARcqZ8vle8p1WUQJ+iaufM8v+K51Vy3oXjB5Moan4EI2
         h0JQqmHRQEhH7e8iuTyClFsNYeKaeH1SESgCzW8TBXvHyGUInISNdzfhIwTTEsQzBBOf
         pEP2KIjs2sgwNoCNthl5oVG1W2+1URo9qzuLAo2FUtMh6gqUmv+tjMQ6YL2hK7g1RMDh
         lE04odc2PST2qW0ezEXxozFWA0ATs6/beg85u4+lHPmCIne32hNcdJ68sfeX4tqJH+Bv
         Pr8mBRnKPSFy8jBm5Fqth88xcog7blClHpRMJmk/FCFrvSzTVCbIEvxneZJeM4ezIStn
         gTGg==
X-Forwarded-Encrypted: i=1; AKwUvBzWAtb5I0KHu5dtdGHYn7yF7/x70xy8vq0hculy0skTUc9/Z9JsJpR5bYImsO+Z4sG7a63hSrhLXjD6KySxbRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z82dzQ8IFuv0zXBP8Xxrsa972vK5C+w1Ekly3sdEvzNB2vqPYu7
	OLmkaHtsRi1DdnNuHjglKARFA00dsgxf1ACMM30SRNvYyTgCG8Euw0hr
X-Gm-Gg: AYBFou3rVabj/yvoukuvmabiZfxhg7N7dv/q4IDTSMY5FtUDmQOxx3tLlNZS1Qidnzw
	gnR4Kmwrvp0Vit2YLOu/Nh2BMRDm1AwJ4Whewj1w2sRsEv2YIWZHPuqGnAJelq9uAuWDbmFAk/E
	Zh3b+s7V8KGHuDaTfG3XZ5T+yXH67EQzSw6Mp69iV1nnwq4jAW78vkya/2CfDXvcRcAYF+c+bN6
	1hg0kjI9Ge7J1dZTiTeenANl906L5bzT5pQfqajK5AD8cKahRojVWkl9NYyL6s5iQUHpOAs/cEh
	iwsfubkoQSSWl+g6ObYETefJ/E6KyN5ZS/2R/pEFu/L+xS4l4kmAXlXqw8iThy/Xmx+wkva2yiI
	VBlukoL8p6U9dhZebMnK2BhZKk63vcvCMAGe47j3l/kiiJqpj4kLDi9PeaBNNHZFqrFBP8T8QO9
	kj/bghbUaophfl1uCCSyK1z+5V/ZDMJ2gEXapx5BzgoB00gJNynYf1ASeXPCyWIMXo2lGiBdgKf
	eVmXfcIH4jqW96x6vGz+vzRpROXKtHmOdUhzQwWIKMw++QuF0e4zxVfT7XAmmDoc5EoVY9x9Wmq
	QPCMwpFGc9s1vXUu8fPIvTBnqqiZkcRiGgP8m/S4mGaCcaqmgbsC0Pt5vjGUc8fTK3xug9rVbGB
	RuXAhl7bSMSrVGYIYC3oeqxvogy4Fq/9Fjg==
X-Received: by 2002:a17:90b:3909:b0:3ac:a203:e095 with SMTP id 98e67ed59e1d1-3ae89536c23mr5122823a91.7.1793494742778;
        Sat, 31 Oct 2026 17:59:02 -0700 (PDT)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87fc548fsm5145835a91.4.2026.10.31.17.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 17:59:02 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 00:59:01 +0000
Message-Id: <DMJGTQ2WDH27.A1UOC3ON9WJM@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <bpf@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <memxor@gmail.com>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: don't count skipped reg_bounds
 cases as skipped tests
In-Reply-To: <20261028211921.1055711-1-vineet.gupta@linux.dev>
References: <20261028211921.1055711-1-vineet.gupta@linux.dev>
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

On Wed, Oct 28, 2026 at 02:19 PM Vineet Gupta <vineet.gupta@linux.dev> wrote:
> @@ -1581,7 +1582,7 @@ static int verify_case_op(enum num_t init_t, enum num_t cond_t,
>  	    !assert_reg_state_eq(&tr2, &te2, "true_reg2")) {
>  		if (reg_state_needs_two_arcs(&fe1) || reg_state_needs_two_arcs(&fe2) ||
>  		    reg_state_needs_two_arcs(&te1) || reg_state_needs_two_arcs(&te2)) {
> -			test__skip();
> +			*skipped = true;
>  			return 0;
>  		}

Applied. Thanks.

Eduard,
unrelated to this patch, needs_two_arcs() returns true for an unknown
register:

  needs_two_arcs(U32, [0; U32_MAX], S32, [S32_MIN; S32_MAX])
    lo = 0x80000000, hi = 0x7fffffff
    lo > hi && 0 <= hi && U32_MAX >= lo

That's the full circle. It is one arc.
A random 64-bit range has unknown low 32 bits.
So reg_bounds_rand_*_u64_u64 and the like ignore every MISMATCH, it seems.

Should it return false when r1 or r2 is the full range?
