Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F810471418
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924015; cv=none; b=qjHzHeuUKoxlhUqtGrujKiPRLkgZE9wCykbVSOD+YQoUyUBeBKr+fhNSsQWg5U6irxH1hJncaGQE9psMwPVyic6YiI8Fag1HZHiuZlUPD6poQGgXhXYdRkK7YfBVWiEBbvyDL1CwGWnGsacaoA3wQf48kHh2dO9D1fOEVsOyu3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924015; c=relaxed/simple;
	bh=qMIrOtqwDGQK7tR1Bzev9TaGmRY6zy0a+hjBj/b95ak=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=PPt+Ps/b/0HqD4hRK1I2qkf7CSVW58x7JXN2mql+NfmXqlCipnl9oqah/KESPYiPq57Wbupmz6QgTLr0uHS3dIhKHZsPpEdiGfGpgtdrs+h61aMEHmXKk/fAcnfO+Fm4VhdOnDgqup0TWVRvTQxybDmZVyLgRhnUbvY2jXuvry8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2WvOcgR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2WvOcgR"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso2683885a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 10:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789924012; x=1790528812; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yz1+tTRLmkyE0kaHQfyasd/tZYeHVlGzAW89MX5E2p8=;
        b=d2WvOcgRipppSk6g1D6k54nvA7uurpMduo8lqT1kInmFMvDftVTr9ergIqywGHImEJ
         d0CwIw9Pkfsqd603LqR0do4zbQAQFcxCVjUdTDGZ37ny2STI9rLDVjS+A1aTGqi29mT1
         eAaV8ELXNiZ1d+ofFLDxV/QS7/g4958cJhNC+NomHLCOKNtK4TuMkbSOJUg4z6b91Mc9
         vNqttL1inu9W369GYWCSHCP0RCf6LQafwh4ZJqYp4QsMiaE7yYhD1guNUakAb2WDaiYr
         Zc1qo1+UCmjLggx3zbRUhu2hprQnnqGsd7RYcMErBoMOn5O+ZBASvqi9wFK1SSwarjpR
         xz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789924012; x=1790528812;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yz1+tTRLmkyE0kaHQfyasd/tZYeHVlGzAW89MX5E2p8=;
        b=c3G8xtRq7KcIZQOAw8A/XGzXcp/ie58bJ56OPOfC9DochKB7o9eBurDlapb2mYxu5L
         GuXTs+7MUvkUBJlgCkgpHM96WLjOoqQDHT7E+CMwbJdn6qCZsDob0HqqnMmXRUCs+JRo
         4kE2ZO9JnAwynC5als+TeaZVQ/jLokwSw4Hl6iwSAKUyX54X3gptIYpcxAs/APZ0ohxN
         PcAa1ynbImODEVAok/jYFDS4gCbmZ+E0O3IlQMtUIi7q1eeA+ZPmkBUFHKjs5EsMITU6
         ohlxTYJNDp78d/GC/hqnmS7EXkNL2c8rSZU5zHivOzrVWoZXMlmCgBVZEm2yKXfZvX1x
         9ujg==
X-Forwarded-Encrypted: i=1; AKwUvBzGdkwyPfriaCBSlIEguI8XcOX6Ol5RUZgPKcZgobViPyMy8l56ql3BeaY36fhDVHhqFzDWRBBIYnLThxa0dVI=@vger.kernel.org
X-Gm-Message-State: AFuF++k5kpXTMonPBT39iyUQkL5JYOxINXh6iNeIJ092YkEORioQtXKa
	VvdtHucP2XSYK/lu+Te1/QVgxTa1HJf+9NYZMvVf54Ph0LZdzwln4fmu
X-Gm-Gg: AYBFou0W6h87jsMAkzSY5GnsTSR6iI57Ll1CUAmCrKqd78SaKZP7KIsxdaJMM2g3TB7
	60mVLe1KYa94Thg39z3BdaEdQvZqaUWJwHTzunaeTC2S5/l/GZYBCoJS4NS03cM7lvXw3Rq70Sz
	wnRczPmhI2Q7MgXC5Uugi5FWVnhmLwW0lRB7zSGzBkH1dnpHqIY3Ct+F48bKFE30vqFjIshJtrG
	BSZ0zoLOgdxaIYKLalO6K9RpYaDHHXynvhWzafIOx8BOP+5lZNoXB5/c/oMdrTZI53Q8mOyZl2v
	f+Wpc0RIse+cdckZs3hZi0aZqe/eFbyR/KTKNfKR3kaELcgvBmF5gkfBcpijeyagBi0harrbjOh
	D1YjDBQx/8qWXVTgT/hABLAHWBQRR/bVUQ6c0Aw9MKyCsTPyTwmJuWyar5VZ1T5M3sZaXM4dQ+y
	gDbSoLHr4naEo3ef9hiyrC9XmxE6PDDqSxhwklZRfGhrOf4Et9ThwtrdIG0TZcy4Q9qY1dPMCzT
	GHHKsrTWkn+5/Trj7CZlO+mRGAp8EieR2exdPN9lWHL0jMCsV/ksSLkzuUi3qxYErttGRLqO4/D
	DnJ7
X-Received: by 2002:a17:90b:58c5:b0:39e:6c69:9b97 with SMTP id 98e67ed59e1d1-39e6c69b286mr7319728a91.60.1789924012326;
        Sun, 20 Sep 2026 10:06:52 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c64csm9614016a91.10.2026.09.20.10.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 10:06:51 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 17:06:50 +0000
Message-Id: <DLKB3UXOH0IS.1UL8NV9HSJFXG@gmail.com>
Subject: Re: [PATCH v3 3/3] selftests/bpf: cover stale CB after LWT IP
 encapsulation
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Weiming Shi" <bestswngs@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, "Peter
 Oskolkov" <posk@google.com>, "Xiang Mei" <xmei5@asu.edu>
In-Reply-To: <20260920163211.795547-4-bestswngs@gmail.com>
References: <20260920163211.795547-1-bestswngs@gmail.com> <20260920163211.795547-4-bestswngs@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 12:32 AM Weiming Shi <bestswngs@gmail.com> wrote:
>  .../selftests/bpf/prog_tests/lwt_ip_encap.c   | 288 ++++++++++++++++++
>  .../bpf/progs/lwt_ip_encap_stale_cb.c         | 100 ++++++
>  .../progs/lwt_ip_encap_stale_cb_freplace.c    |  32 ++
>  3 files changed, 420 insertions(+)

This doesn't apply to bpf-next.

And 420 lines of selftest for a 40 line fix ?
That's an overkill.
