Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0228847AF7E
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988598; cv=none; b=dN6/w9H6PvlTwJIB9Mcovdfd0hJXWU6KvxEDD6/TdKTSPmbgIXcrFZ0xAR9ymoFNd8QqPsCcwj+RxzbiOeyR+M4I324mLnm/WRRmQ0QPul2csbEzkogg+/JgdVxtCSHeFjVqWwmAK0s8CXE4Gr+hscwNFQ/E16uzm5R5QBT03F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988598; c=relaxed/simple;
	bh=mH2DmH07sEpwrcUFlhBvHMXUkoUhNBdPHIXzor+swzc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jkA04NZ3IDQH1qCgiqvUoirxrjFlztqLCk7c3uZdeOuC5afTmiEUy1e4t1u9SBI2INaSdCEVerkeu8HhG3dARC/sUm0OopDCtbuUZZfRNpS+lJ0gNhgDHVMS7t3QAEHLBZ6IJWodvbSEKnN9twKq333cDMErAsQeMphO2xYONRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Jn0f4eUf; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Jn0f4eUf"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b8765be29d6so888521566b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 01:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1768988595; x=1769593395; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mH2DmH07sEpwrcUFlhBvHMXUkoUhNBdPHIXzor+swzc=;
        b=Jn0f4eUfUmBNLPEV6HP65smxEVsU4IBzOkKsosX70uLJpdVhbGesuuUglaRQ6qIy6x
         oBYVupubj9y2kHD/3Bt8bHJxbrO/ROO7lDaoAABkHnrSEZ3m2yMh7oEwP9DVp4W7awDg
         YGy4jUe+n7ErMXHh8OPx9gcf0Ria2Un2n10Bby9Xfmz++/a+eeBz84/fgxpq8CCO46Zv
         WxsTfI9ay0P9X0V6/goUVn7CQXfvskQEZsDh6yFg7QcWcbAxmSeqYc6DkwXF/9HF0BMl
         15YNMgRGu7rOd6QXBiHErWftqtcJUyttMxIWJgnSpL5P8xTxOTOFaYKqRc1+dPHk9GLv
         CKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988595; x=1769593395;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH2DmH07sEpwrcUFlhBvHMXUkoUhNBdPHIXzor+swzc=;
        b=gfGsO65i2SUX0I4F9dWxhpxSQxepeOlZMTaA9n/LKKgf8BLH7GF4hk6p+EPMW9u4Fd
         CqosPx8dvonhdkqgvxZVzUfB8PENlnUGcgc0j+KO+QsCvp/9+wwtqqtQqrr7BRQjo1NJ
         h9rP6NqbpASXwwMMDKskux9iNYlQSimHFXh4eCROYUs+8Wyx3THuq9/MeN9gl2gWFusY
         rHv6WjBrGuUVFNkh7anWxPR57UjpGaypEwjGvZCN8OoncYfJooiQ7IxbDMmvRU3cFWPJ
         BL5tQ/yo6gjthANm4vTyt9Ly5OljTbgPhza50ZVW2IrYBjs9qP+PeyJHGnd3MjqaKW4a
         ksCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWlhJ1gbdT7Q1XTysq90rAvN8Gu3LhQxyj7544HaJkpmyvcn4ARiwJjxkQNORXP44Ot5WGJj4p7tMRRCpbetU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2A+IBR9C7+Z4tM1nb6ZP66lg3E1skcTe0+NNMyWTj9B4I8oGa
	0tc/Eev5TsrG0vtLmyh+P44X0Tu4fwCzn8MsCidX7blsvTqRpFgB58kEx7H9lHHdc0Y=
X-Gm-Gg: AZuq6aIknPf3BNu81KH9TgYu/7mMYOXls6by4Zvo8CmBR9Gnc9I87nshIess67rg6Mn
	uE/N4lEWc0ftVtiMgjodRWNrb3ja5KPHMAqTIlZI4K5LJqevUqi105uS/iFI6ysoluhlV+lbqfQ
	dOXWJtmfntUF8Ev2WuEuD4n3Qm0m/H86aukOlEmHF5uewWa078Lnew4+Y019IN6HpakdbZdnMn2
	qKbi6qiU7o90KUluESfFGI7IPg5cF+pydHIlaF7+XpGQj+LsN4htYXUQtScaAQPJOUlIhNLyTvd
	z5FX3XOA4OY6rKau/f7YAuorUJ9oZ4YWH56HNf5EucEFq+JVhA5MtIyviz4+n3GGKbTlLyPykUS
	JstnAPgtGv522Fwjn3WuVSCdtQMz/EK9rcF+u7XuRvrxAmAVj49OK8RqMXo7VrSrGnXdFW3G5EE
	B0BA==
X-Received: by 2002:a17:907:930a:b0:b87:751:6f21 with SMTP id a640c23a62f3a-b879300b515mr1545567366b.36.1768988595143;
        Wed, 21 Jan 2026 01:43:15 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:5063:2dc::49:217])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8825616964sm25011466b.46.2026.01.21.01.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:43:14 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: John Fastabend <john.fastabend@gmail.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,  bpf@vger.kernel.org,  "David S.
 Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Neal Cardwell <ncardwell@google.com>,
  Kuniyuki Iwashima <kuniyu@google.com>,  David Ahern <dsahern@kernel.org>,
  Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Eduard Zingerman <eddyz87@gmail.com>,
  Song Liu <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,  KP
 Singh <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao
 Luo <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Michal Luczaj <mhal@rbox.co>,  Cong Wang
 <cong.wang@bytedance.com>,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v7 1/3] bpf, sockmap: Fix incorrect copied_seq
 calculation
In-Reply-To: <20260120153807.gzwnhxxtcocycfmr@gmail.com> (John Fastabend's
	message of "Tue, 20 Jan 2026 07:38:16 -0800")
References: <20260113025121.197535-1-jiayuan.chen@linux.dev>
	<20260113025121.197535-2-jiayuan.chen@linux.dev>
	<875x8wuy4e.fsf@cloudflare.com>
	<20260120153807.gzwnhxxtcocycfmr@gmail.com>
Date: Wed, 21 Jan 2026 10:43:13 +0100
Message-ID: <87wm1bti6m.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jan 20, 2026 at 07:38 AM -08, John Fastabend wrote:
> We could probably push this without the 2/3 patch? If we are debating
> that patch still would be good to get this merged.

Definitely. But also see my email from today [1]. I think I figured a
way how we can make leave FIONREAD in a better shape that it is today -
with what Jiayuan proposed - and improve it in the future.

[1] https://msgid.link/871pjjux2u.fsf@cloudflare.com
