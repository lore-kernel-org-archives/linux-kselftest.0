Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E734F481
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 23:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566655; cv=none; b=L6tdGpvK4fnwK7kXwfZ03Eru2aEbmr5hYgWunyBAV1aROD55Xui7tKMu4atVCgIQWDXsXkX8OwiaQGPF28Tx4gr69FuLMnIRkGzqg3MN+Kz4HU+gJGJoJxs3MSjFz1UQZZekmTvTFiAUPpuoh1yBr050VQ2NkYE7oS6VmtkfT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566655; c=relaxed/simple;
	bh=HEabCAS3j7mMDHObZy/GRmEkWbvvgyE9mlPkTC/rKtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PU0D7DsKxu39fqrPeqCFolKyUAN5JeS47JgnWA6GuL7tBxZwIMNzm1s0jRGFoge/K8+fYLtaKWiOu+BfDdZg/55KQ7amk0YHLPfd8R52JjVQKJ1b/nxEcawkAqCIdclrplYUct4JJh00nhzuGvluAicteAaWRjMsR9wDPvu4Yg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnrICnDF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnrICnDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D54C2BCB2
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 23:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774566654;
	bh=HEabCAS3j7mMDHObZy/GRmEkWbvvgyE9mlPkTC/rKtw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qnrICnDF8v0HcsQijsGqRez19f5CS3Muzmxh1YWTHJKpxImprw1BtALFpZD0GAgft
	 Sf5hOYxQzHAatwH2U32mus4XCVWRStfZN8hxrWctFJ7dCFW4Z1JN/DIcKb3hecevc+
	 Ck6AFb2GSfYDIqeBXXYgTjMUir0EJ5u800H5BNP9PO3BbYgRn9Qqm4WnEfnergSv01
	 AogoQFKvEI2cWQr07e6mdpvqTFRQGOotWV4AoOpYHaLdnUDKphGYfpBoRSHah3MPu8
	 nmwjj8H2vWpTDcdc+BvFQWyhHYw1cofN5G/5aKBhfrdimRpxu58ATD/2RttoWCzmRb
	 LUQF30CshAcsA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so201708466b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:10:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+jXMo2W6o4ToxFDMqOJUWY8s4ypnQt/Ru40T+6vO9Jc/Xfw3Jt7VUK9yl00LSMUMvInnsBM+AgPNq4rYe0SA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk4PLv3BA2AgOiDxSsgfqZCSpsWInkY78IXgHjt0th9MnhimmU
	/GNy0FV3LSwRtddFvxxegLdAaRuECm6CpQN+ewQ7dp3UJCWHzewXypJjF9517Z8c7P8BlwkXvms
	HIUrd64JO7m1xJ8H3Z7YpPdzDVbcZQWI=
X-Received: by 2002:a17:907:a0d5:b0:b84:40d3:43e7 with SMTP id
 a640c23a62f3a-b9b502c082emr17431066b.6.1774566653369; Thu, 26 Mar 2026
 16:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326032658.96819-1-liwang@redhat.com> <acTSQFxTs4-t7P5t@redhat.com>
 <20260326160618.18a20227b606bc95f3c3cfa6@linux-foundation.org>
In-Reply-To: <20260326160618.18a20227b606bc95f3c3cfa6@linux-foundation.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 26 Mar 2026 16:10:42 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPMtNaRuGSrHnfh6AX3DKVoR6d90X7O9UTjxbushssyuA@mail.gmail.com>
X-Gm-Features: AQROBzBwjNh8DYJY5cdGsMAUqkIBhiDt_G1kN7qGVt8vQO-IEBhvuwlMiehhNfE
Message-ID: <CAO9r8zPMtNaRuGSrHnfh6AX3DKVoR6d90X7O9UTjxbushssyuA@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Li Wang <liwang@redhat.com>, nphamcs@gmail.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev, tj@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, longman@redhat.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 4:06=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 26 Mar 2026 14:29:20 +0800 Li Wang <liwang@redhat.com> wrote:
>
> > > Test all passed on:
> > >   x86_64(4k), aarch64(4K, 64K), ppc64le(64K).
> >
> > Hi Andrew, All,
> >
> > I see that Sashiko still points out minor issues in this patchset,
> > That seems very tiny in selftest programming.
> >
> > I can correct all that in a new version if you'd like a perfect patchse=
t.
> >
> > Sashiko comments:
> >   https://sashiko.dev/#/patchset/20260326032658.96819-1-liwang%40redhat=
.com
>
> Ah, OK, you already looked.
>
> If you say they're too minor then I'm OK with that.  If there are any
> you feel you'd like to address then go for it.  That's my opinion,
> others might differ!
>
> I suggest you leave things as-is for a while (a week?), give the memcg
> maintainers time to take a look (please).

I think some of the comments are worth addressing, especially:

Patch 4:
Using BUF_SIZE in the allocation helpers is wrong, we should use the
actual page size.

Patch 6:
Zero initialization of zw_allocation.

But yeah as Andrew said, it may be worth waiting for memcg maintainers
to take a look before sending a new version.
