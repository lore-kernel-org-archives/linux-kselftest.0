Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3F382291
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 05:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401132; cv=none; b=KKU7PMk4VLZguaX1kLm6Yuad7rIMovfGoDT6csO+ykXpwk3IhQAx9TvGObNnRV0S2S7pAhTPSGwlv01y426s3xe3Che4Pbt9dzKagjvHpTCiN4iuN10QBt/4DznpRoUtT0JRtaXV9SIjPyznEXat6SpMOng6HeCO9WDaXIbGx9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401132; c=relaxed/simple;
	bh=ime//DaYmBqwIhHrao7HYFzuOkwTo6QeoLEfQQ5ICek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neFc6Gn7uS4J5FuDhlYU1LPnd/Ty/aPhfFLEocRvy+e8seSLqEet46BVhtMjJVRJRwW4zdC2bqRQnR0awyfsH4p6fNKUr2rCuis+uwknQt+xP3D4H4+jyhtJdjY/aaJntPlBbxm8rfxkR80Fm+32s6mTmEpzjh+NC3srDIeB61c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M5SRDs9U; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M5SRDs9U"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so2955076a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 22:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783401130; x=1784005930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WoCABaekpbPXiB4d8t0gR5TdOk1VNytyridycavPgIc=;
        b=M5SRDs9UqE94VoVw95nOLugxduyu8pLlu5BhHHEZnNMRiSjSZTQDEpT6wK2sPfCbwf
         mnhhS/FlmLoKoCqbANIHk1MWQd/AJG27k2Yv5zJIIQQ1kjk+4JS0JYEiv3ZIR83n7VeZ
         ss7LTtUdUGnJD+QleyNl3XjSNrg3xzGGxJdyo0QMFxOWePpYTlHQWJGuiOSo8FYjsZuB
         85uJCfZcuQfzYVVWdTM5BGHditkoUkTKd6vG8X5AuDa1YLQLV9dSgUn6LVIDbigsJWm3
         x0lWqxJEIChs2gIPmemcz2yeJgoR1LXk8cjQdvYBhHZZjPWKuPTgBq8WJjnPvgNA9Z7Q
         w5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401130; x=1784005930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoCABaekpbPXiB4d8t0gR5TdOk1VNytyridycavPgIc=;
        b=qtF6tckZNKcEudOEtoNAd70qUIdjE5KvINuvnZQasmN8Za/AUuV9hw1X9WD1tnBGUy
         FPdMHK9ulizRZwYiP2ysdB9dckAuZghvMJjbMwQAB8vmvCge/cQjiL0rMdFBi3wjgqWD
         1DpQDhNcbdMXYFW9Uf66z2Hz4Ur4ejAIuZeE8xwVu0eeoYnxu+bOB65IqVrFZ2cm0hS2
         dOxuN8M3sKtLeUUu6OeoNsC3b1oShTTB5R72Vo4KEH6mKXRQT2VLjkbD7Hs+9koJAQ2P
         E+xYxQXIVdYpKqjOhuLC6uJm5cdLXMXFB3Y1PfHKpEU/Ef9J3mR+WhOwBmP5NePxKT6D
         wLKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF1xe7ueGNruUBzdS8Da2jR/FqB2BGRgSwIgBtp5Ao6YQ6Id4V3TOYr2CbBROu6WNAQ/A1Jviybj9TSpOPx40=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJPtE3aNeqeH6u8B5XDQIVZIZUlXNAY3NcCBa6/weWW4Sob/JD
	EHUi30DqIsvZ++OLASN05FRmjS0PldZXdO4lBMd23poiItohDUYn8HvoodO6FkzGkiE=
X-Gm-Gg: AfdE7cna1pIMeUz8vuBiU6AWgMLgvJ+mXrFV7PaiwbCLhJzVfYx7QZYL/JJuzNOyli+
	hGEn5Fwvt6rMLNX+QFYGkXEOW1MuJAfaIoavTe24hYzom+NhaEHp9r8dZ+qdXx1/bVghpYMRu+r
	gJBjH3E7Eg4WSp6weo/iAI/t8TTbCTU8f8HzJtOFCdMYi+NGhWnUdQ8RtHMUh01gdNukM57ylJe
	e1WQBAbGzyAPO4SELKL1CS75EF7a2mp75dSTbtyp4tM3uC4In26P1P3U/+JWHtnzlL0P8VZa4EP
	vT+pfjLZjAOHWyhb0/jZIkDHR/vQ7Bpph8aaOYyQHCS+KMabZrZAc3cdK6MKMFg6tPllUzAEbk9
	1O4IV9coDQTLaupC29owlMogZZRJ3TVvwDUtro4uEhiSYtQzdc7HchNNxMBYO19sdND724nu49Q
	a8vwHpGoXmk7/K
X-Received: by 2002:a17:90b:254d:b0:387:e0bb:57f8 with SMTP id 98e67ed59e1d1-387e0bb5b9emr1407204a91.41.1783401130082;
        Mon, 06 Jul 2026 22:12:10 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56d4dsm3514693eec.14.2026.07.06.22.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:08 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:42:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jinseok Kim <always.starving0@gmail.com>
Cc: rafael@kernel.org, shuah@kernel.org, linux-pm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/cpufreq: Remove unnecessary sudo from
 quick_shuffle()
Message-ID: <eqvoizjmktaqucv5wd6vwjdxniz67ehs5fl67lte3ubq46vz36@f4f63vngqyet>
References: <20260706143857.3306-1-always.starving0@gmail.com>
 <20260706143857.3306-2-always.starving0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706143857.3306-2-always.starving0@gmail.com>

On 06-07-26, 23:38, Jinseok Kim wrote:
> The cpufreq selftests are always executed through main.sh, which verifies
> that the test is run as root before dispatching any test case.
> 
> Therefore, invoking sudo inside quick_shuffle() is redundant and may cause
> failures in environments where sudo is unavailable.
> 
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---
>  tools/testing/selftests/cpufreq/special-tests.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
