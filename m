Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D573EDE7C
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 10:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989561; cv=none; b=ckXi1NYxpH3poZIS5RJB1DwYvqUYqtX1sBa8glsE4LkiDw4EunJfE9kdOHxCQ+omyJ+N0IEMEtdt1RqLsNyoeyHjpl62A7WTTLbS8aYX2vthFSekrGu/i7jvWctv9YE17vQowTyZQLzmz9IgJg25+pCd/SMxE/pgMun5YFEHrv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989561; c=relaxed/simple;
	bh=7rT3np+eTVic+AGR8HfNTj3tMq5UqYOzy5X3Ylc6UOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ePp//F5aa8aEh4nv3IblPz4AY/WAYwMnZsccp7kYBSnync3bUQ9Ktygoa3BP8Li9k9ZvKOG7p7GfQJatJQoBVrpDbtD6udv/0WG7qei6mJS2MfifCfbKiLEadjLa7QPtuFCmk9GCfUQvImks64xgMnYQgGXK20fBDTdWzsQt4gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=DsoWddnP; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="DsoWddnP"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so2575647a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 03:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1782989558; x=1783594358; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rT3np+eTVic+AGR8HfNTj3tMq5UqYOzy5X3Ylc6UOc=;
        b=DsoWddnPLORJX50bGQIzSvkSCZs4ChUh7edzQZAYeXJf/uV5TQJAoepEYm0CegibaC
         tKmmdUvYq9o++MnE2mW8dekLZytuN30Pijfczi63OasWLgrgV6yXrH0Ne4wAFgvn5gJe
         GnPNireYmU0O65qDZJGso0gmGVHcwJ5bg1tRIKkSDUf9J3Y2/GaaRqKJp53TovX286h2
         jI0yICsxqVcNUh8N6cTn7BzGi9Xd4b508G4iiVSlcO4YIqaaHPd8G/mIi15F5SuadqDt
         pYlpVlzy3Yf7GaWW1+mgY43lxhbhAgQ52nkxao1hxigN4OKy0f3oss9AXcggJlc/4/ac
         1lgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989558; x=1783594358;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7rT3np+eTVic+AGR8HfNTj3tMq5UqYOzy5X3Ylc6UOc=;
        b=cBVHCMRQVrewYiiUX4DMrdqnQIGkSEPXW79PasIkevB4BG6gFNGmbkEstHhLyT/6YS
         qODric4ZyjIx8zF/7nLJdqpyC5jVsAD+OJW4xoUtJCY3CiDSOxA4caNSQPKn7F6XAmGc
         mHH6hr84b0/d7JrxeWAAe3y8I3DHQt6hQhsu2AQhYT1fCI6+aopMaTLQL3nb0gnjp2J/
         AsBMPRdRkj5D+O/XghTMfpLWFcwGAhH7pLUee9awmS2Uq2L2eVeq/l6PyEzLi0NYqBeR
         8WIi+/lbiTMxCtHhv2DPq09FewqCHn3rBzc0NL6yMcVaqe3gR1+gyuF5Ef1P2Zi+I997
         0tQA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0KF1aG9Xegl9etHgYwtD7TvXxct6HxNtjVUuHdiud0cT6X9QES/4syA0HDlCieWLW+TYPr+yXQfqLKfA+tuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpHUnNBqTOkPAa5GZy+G90X3xMAOd0m3KC8DhXXHBOILn1lsJk
	VFtmLD8Jyh7ZixbHLPxeZW8GfyWC3jUV4Bc7IN7O6hWTwnRUk1ktsXecwkHmbXkFRVY=
X-Gm-Gg: AfdE7cnocBurnCaQvNW4MzScGy56fOhICCYswebrH8n9mRWc5G2CDvhzbJR1Catn/y8
	Mp9jzal+sxMGS0TG4J5AGEGVtNG0RrqTVQ9evIchYnYUuQcrS7x+DIl08BGTf4UpPueS36tIU6K
	65Sfq9uMQj0JAnP8QeNVVz3noKV2dPfLzivjOsFUWGafc+mYYlSflU7o+tGWjCdBrqselZl8sCD
	VY52mmtW7xiuByYy89NPcnOG3ixpsUhsURaIqjkCw/PVQllZ7HUyDXSYowpGz+/2e8EwBsVDcD+
	uIfuVUliyoRhcLTvXmFzuSEVI7QnD4H9975B87P/rfQqaxHHyI0PsZICp6l5nMATcCVGXQGMdPo
	UQZx/sVuNQrGtdUz4XK5a1LA2WE8289OM48n8qz8ZgKzN7C0vFykm2KHZSlRtUkrQLQVFdX6y7Q
	TFLb6YoyhFnYmrZ4w=
X-Received: by 2002:a17:906:ba84:b0:c12:a417:30ad with SMTP id a640c23a62f3a-c12a9d386d1mr240239066b.7.1782989558379;
        Thu, 02 Jul 2026 03:52:38 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c52sm110937966b.58.2026.07.02.03.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:52:37 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Eduard
 Zingerman <eddyz87@gmail.com>,  Kumar Kartikeya Dwivedi
 <memxor@gmail.com>,  Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,  Jiri Olsa
 <jolsa@kernel.org>,  Emil Tsalapatis <emil@etsalapatis.com>,  Shuah Khan
 <shuah@kernel.org>,  John Fastabend <john.fastabend@gmail.com>,  Jiayuan
 Chen <jiayuan.chen@linux.dev>,  Eric Dumazet <edumazet@google.com>,
  Kuniyuki Iwashima <kuniyu@google.com>,  Paolo Abeni <pabeni@redhat.com>,
  Willem de Bruijn <willemb@google.com>,  "David S. Miller"
 <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>,  Simon Horman
 <horms@kernel.org>,  Cong Wang <cong.wang@bytedance.com>,
  bpf@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH bpf v3 3/4] selftests/bpf: Adapt sockmap update error
 handling
In-Reply-To: <20260702-sockmap-lookup-udp-leak-v3-3-ff8de8782468@rbox.co>
	(Michal Luczaj's message of "Thu, 02 Jul 2026 01:28:21 +0200")
References: <20260702-sockmap-lookup-udp-leak-v3-0-ff8de8782468@rbox.co>
	<20260702-sockmap-lookup-udp-leak-v3-3-ff8de8782468@rbox.co>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Thu, 02 Jul 2026 12:52:37 +0200
Message-ID: <8733y13bpm.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jul 02, 2026 at 01:28 AM +02, Michal Luczaj wrote:
> Update sockmap_listen to accommodate the recent change in sockmap that
> rejects unbound UDP sockets.
>
> TCP: Reject unbound and bound (unless established or listening).
> UDP: Accept only bound sockets.
>
> While at it, migrate to ASSERT_* and enforce reverse xmas tree.
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
