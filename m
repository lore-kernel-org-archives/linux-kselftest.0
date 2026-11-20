Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207386;
	b=O4zg411mBWTTvlfy/GJmWKr9csYXbCRFLkbbmZfqG4GTiImnd2NT8meZ9la+2sa0nRoj
	 ojMHhxEOuFr2hVtLQGXbVZV9NuDa1WHBJcZ/vTXBIt6mtFKMhQLc4Mb494y0GYtuFGiqk
	 3ky918xqF09ZtrITsNOzYirDzlYen3WT7XsRjC1OaYWz5Ilr5w5E8EhQtmxSYH8yKGixc
	 g1e6oIGbBU2gQdS8mknEO3ojiY7oKd3vA94dCacweSjVt6cNP/XEC17YTQpT3GCVpV2Az
	 tdMh3VagHXD18vz06RZ2M4HE0m6PPg8hGu8Xuvi/OqV4P6F9uDYlZKotJz+03vCIaxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207386;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=gYU6H2/wBp0m3RHfRk6KSsrkcHEKkYUH+D3d0ccp7Sc=;
	b=Wx53zLESx4vo8i/Lqy0odp5vzN2yD7AgY2X1nGEVq6NEFVYvdCQbaRudm1cPIkIe3eCW
	 Cp6/w5RWGCi3GZIRQglwQsBlhJuzisbYqHxCNZJ5Gw93XRurBCQyzyTRMVCIM56CJlYTH
	 Yh4Q+zHwcvBvNz75Vv0JGNdyloWmFK5zxbC/+dbI/NNC7+Jnq0eL5NFXMzLj6EabyfHMm
	 vjyBpW4LUS6+hNoHmj3St0+EjsM7L5WvYgmVre0Sqcatj2hadkadh7s75oVrTBhclF0LF
	 xMwSgwpGf8sclqEfgAxuEm74+gIKSP2RXnoLh5mUDVP33bQCyslEb7yeC67hzrats/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538CE606A70C
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538CE606A70C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9496473b511so155202485a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207385; x=1795812185;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYU6H2/wBp0m3RHfRk6KSsrkcHEKkYUH+D3d0ccp7Sc=;
        b=t9Zu4Qhl9l6W5C1dvqlt/e1qIAkXnIxhJaKF2Ve3IR8BlImh+vNaQHY7p7VSXu1S2v
         5s2QXutd/m5mTTkofmcWg/wiMFQrCkTutnjvxEuRDXaxTS9dhttTiavfePOB4yU5hb+d
         HN16VP39wm+L4fyEYRt/3NHkRfKlG9vRvcPfWaXGSW7HzOJYFNDwthM9k1+jVIctWNAS
         k8/paXA+Ao18tUWfULwv+nVI3ohaIp94rUsYDT8KZV9agEsjTpEM0GytX8hwiIxQmwTR
         VMOT8V7a2728cGLo53OvQy6kQKd4TlW1IIwSrSTApg8Z24bxw9y9HCvw8eAyqfSt3YaT
         CpJQ==
X-Forwarded-Encrypted: i=1; AL+hErGdbfRyECBDquGZQWG8pH0EUWvkcbiaIXgHqZEwpjomgW3LFyfiA1mP1ttVQB4oZUmBilA+dQBKuoaofefdvFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AonlBqPF+zYpzNcSIhHQF1/pTCRAIIbtuHLDfsYoWtxBOF944
	nF7mn98nbTgrmW/h6kv1Nc5JomLkOivEOYf2c65M8agsNscR0luNW7vX
X-Gm-Gg: AYBFou0i0a7KCokPPhUS6n01EfHxL5iZB9t0eujoL9TQ30XdwmrLPNDvirRMLW6PgY1
	xZDDfV8P31eOq0UHJPp6+AxwQaTILio6liVj+n/P2USQY3BCb9siTvGRZFjUzfmyXv7Cb1ik+r2
	ONqbMmhWbL6Gnk2FYAhgnXAZlz728CyEDD4kpXDH6sDtixfxI0kXlVei3merXC4Zlqoie/YPmuX
	v8pkfAdtvsbVX+ymsR6yNZIt7l/vfBTzgXjm5C/oyYpirxbWzMsnBrTLbGEVk0CBz1gd7eIX7yJ
	nkNBVfpahU1JNgzBQnwazr2tH2X4IFg6OqAa865JDtaWsX7SaADUjEZYhkGlwdy+SzVqOOd/X1D
	s/bqowygwKstUVKH01HJM5gIKKm2/ngTdRitVczyDUF8+TMX7/1qQMoA+uVFpFiCNckcR82OSBQ
	zjQr9TyH35N5vxviwRPTb6IBIzjqECyiqna8Wi1ubL6B4gY+VNqOfECU/5N91ux25ex7JDJ4mM9
	xpsCsZuIyWImZELZuchShTrs4iIAbcoX/Sur24F3T29tj3BVe8dO5m+pEw+SW2Vang+pbpaMtO/
	VRMKzUIST9hKsKmtbo6TBurJODte3/lboMkXXKLuMQQxgpTHv615N78oZJppjQcEF2fGZaaZzRW
	iYAzAEHq2E3Y0d7FjJWDtTqESjlifzfBkLi4qlmbftWFqHIeACQTS
X-Received: by 2002:a05:620a:4142:b0:945:d6e9:9a8c with SMTP id af79cd13be357-949baa0735emr674761885a.33.1795207385322;
        Fri, 20 Nov 2026 12:43:05 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb418241sm271210285a.38.2026.11.20.12.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:43:04 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf v2 8/8] libbpf: ringbuf: Prevent missed wakeups
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711471.18576.6533152874363127425@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAEf4BzYKewRUpOboOmPcxdX25731tF0w63V0Ha=_f4D_F-ie3w@mail.gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-8-33fde039ddf3@kernel.org> <CAEf4BzYKewRUpOboOmPcxdX25731tF0w63V0Ha=_f4D_F-ie3w@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> so we do this one time retry

The retry is needed for correctness. The producer can commit after the
first BUSY read but observe the old consumer position and skip wakeup.
The consumer must reread the header after fencing before returning.

> [...]

> Wouldn't it be cleaner and easier to
> mentally follow to have `goto done`

Done for the bound exit in v3. Callback errors now publish, fence, and
return directly; cnt = err is gone.
