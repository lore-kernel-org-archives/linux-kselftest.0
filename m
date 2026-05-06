Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF73E4C95
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081451; cv=none; b=eLsMwcUPpUJ8Y/ezLKgZyPte00bbcDpVUBl6ERjU/Ds/CouW54ZSyIj2c3RcHb7RAssEssIeqCEIaPh6irp8YURiSN/oN8ndN/EPYn9UniO3E8tqh0zdqmQ1W1Qyy72hbJ3iD/4aFRJRoteVjFB9p+F2O7Lb9zbkzhHDFoBqoCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081451; c=relaxed/simple;
	bh=+CVOJ1B8PW2INcgWflXAEelcpfaLxfm0F4gfkFsTUVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4ViCFj80A3c4v6w6Hafvsl3Oh6SUJ9SMWzTW8TDnTfebctNGC6BNidBByFGVkgcn44P+mPJtqqqaWs/I+0232uRNnRZ5cUNswvcxtZVvEcv5wu5XwK3hJb/60M9CHKMvjZ/IRaaxDw0PVzmLRMmXS4HP2/f8JWpaC0n323sP2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i5AwRLjG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQduzks/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i5AwRLjG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQduzks/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778081441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CVOJ1B8PW2INcgWflXAEelcpfaLxfm0F4gfkFsTUVc=;
	b=i5AwRLjGWP3hw96aGCujhSYWGReQ1YI0xCY2x061n2bEpfbAljEcceAQnivKFty4yFv/Lv
	2J/BUNmGtz5/Ei692yf4rMCVXs2lb4upUjorL25PWRwmH/blRRv/RAWTabaFALsFlJhdH0
	hFY0nBYJjFfx0rUxdb4fbwBdZpMK11A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-8w5fHAa3PKm5Wpxmj6B9qQ-1; Wed, 06 May 2026 11:30:36 -0400
X-MC-Unique: 8w5fHAa3PKm5Wpxmj6B9qQ-1
X-Mimecast-MFC-AGG-ID: 8w5fHAa3PKm5Wpxmj6B9qQ_1778081435
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-44dad1b938fso2380235f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778081435; x=1778686235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CVOJ1B8PW2INcgWflXAEelcpfaLxfm0F4gfkFsTUVc=;
        b=IQduzks/Aa3aQaPzCE80LHVAZPXvbZTwM/vpj/hMvQmTU6swShunYWjcxZybpFm+dI
         mE7jomw6t1SCKfSjVjxrdJ45E2HixtJ+lNwVP4uxZ1RiBUnLjVXfmyKNaE37q7BlikTh
         sS06jcmPZJgGAdPIWdSPSGccsRSGzoDMM9coq0IeWfbibDYoD19+T8PkQcJgk+afAjAf
         JdxUDfvFc0ew+fGGFCiejhqcu7TU5uKPuM818JId9SMJ5Rshlsfb8zgXX7QdAAVTnCKC
         N1gefwEztcOrXNjt3jCnfRKy/AkumanO3wxTPvwniDtU++5CIbGZbvYiuA8/wgiuQHua
         GwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081435; x=1778686235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CVOJ1B8PW2INcgWflXAEelcpfaLxfm0F4gfkFsTUVc=;
        b=ihbduS4zxeprx2pRsobW+a6ki3zh+Ja2Sv/NlBb3nR+r5nXopKFdF7AiNANm5p3ZlM
         Jc8xW5GEH4thruO1GtOPo3J9CymWop+WxD5C4HBdoLzH5xr1o/WCbO/jVnN14SLMJLKv
         eu6Z5ZLVVWUtmbRKXLpA2g2J55Pg+4f1HLyMncE13PG+QVk7Es0+N0OVfeJHwf/gqO1m
         8bgKAobrPVhb+8SbUHBwvId1p6QdzveyixIW2VeXe9hQaaI51wTIrOhYpujPP6hrpEAb
         8vFtxFH2+WnGnAkkLe8LRDgFJjvlbytROBdyHnidpn4jyIIYO9X2ikydh1aL2hQxYoI6
         BEOg==
X-Forwarded-Encrypted: i=1; AFNElJ8EEg2+ufwj7mWRficEVhNNrmjqh4v/CBV2+9+UcGT1JF0bsXykY50HS9cagULbXHYeJZ4+iuKNDjm6sZPBbxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy18RLGZnCMLr3R5Ng70/5KVB0PLRWrSbz0veoxHjClVWmT9ow+
	oJxgZ7QRbuPbGmmyX2gKJbyph5O8DU5e+qNBCL7BKgpstRkbgc7OixQZ6MxT/ZZegYzFX7VdRNe
	VYwkGSDHiPLJXlR1nOam5zmmVd2pq++Glla3xn+/Hy/Euqwq/y6kyZ5GYMopvg4BMHXp6mg==
X-Gm-Gg: AeBDievBP6HI6p1vZ460vgN6iCZb3a/e4Slo6YZg70dUmU2PY0Hi1UHOP7VAKI/LtFD
	To63M8LgirNYrI+/kYalflfOFGLXKxsT3UYmkiiwkbYbHsRNNiH7gD+wBFTLDWGcmZ+gFVbizrB
	A7q/w+dXoQchOikHUNHTjVqqjd0Ya/ZMbLeZ/jwV0Vp7SiNeuLFWEkmLTc/gRkPV78eOAW2mx8Q
	vBgCozM8rkjvq6Bo2Rg9UKS/056FlcVnDzw6KXR56vZFM66Uli6deY/GkXBiPl3W9fLT8iCPaoX
	iUERuRXFq/8iJvyu/4sn0W/lS6Zwq0h4r4G+e1fQ1AzB2jy4KZOMJIP+RwY7yFPJgdK9heug1VT
	zD3Cyr6hvG7m5Nsf7e0gsAkcrfkECYktn6dM7Jb62buHkyAUfWXuV2S04rbycblHJeBQ=
X-Received: by 2002:a05:600c:4f53:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48e51f4456cmr67008465e9.20.1778081434834;
        Wed, 06 May 2026 08:30:34 -0700 (PDT)
X-Received: by 2002:a05:600c:4f53:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48e51f4456cmr67007475e9.20.1778081434293;
        Wed, 06 May 2026 08:30:34 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5311f891sm31160105e9.4.2026.05.06.08.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:30:33 -0700 (PDT)
Message-ID: <ae14591f-f93e-4947-b3d4-af4c441d8229@redhat.com>
Date: Wed, 6 May 2026 17:30:32 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 01/12] net: shaper: drop redundant xa_lock()
 bracketing
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20260506000628.1501691-1-kuba@kernel.org>
 <20260506000628.1501691-2-kuba@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260506000628.1501691-2-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/26 2:06 AM, Jakub Kicinski wrote:
> The shaper insertion code is written in a way that suggests that
> perhaps it was expecting readers to be fenced off by xa_lock.

FTR, the code was shaped (pun intended :) that way to avoid acquiring
multiple times the xa_lock when not needed. Sort of evil early optimization.

/P

