Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5598334A76B
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 20:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384105; cv=none; b=XPSYCST7DFjIixfhHWF73IKHVzs2X17WzSkWbiIhKtVHzlslkr1NG4coGKTpmRxDc1SQoLNeNoW9b2DAtPU4vmDSTVtpadDsJbarAajRTZqF9VIcgDBQlsgY3MFDAIYhxrlqOEDIctVQYiIg+qXzw2+1djWj02O2yTLlh0zfr8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384105; c=relaxed/simple;
	bh=EaoaOeUX8AqjvVbZNt08iXK3Dxhpy3xpIWd3E46BrOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/Lk9jl4guPx0waixYNURrgqzXAXKlt6x5U/5lB4i0b3quht1q25HeUG1LRtcX01w4yIPtHocarlJi2T9xXK9HLIcOTVjpf9f4t4NOeFtuUJtreHME9EWPy2MSx60+7+DBVn7m+Z9yU/7QLnW9Dv+J/xUYHtwDoi7xm5t4lSUZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qEQ6Bvve; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qEQ6Bvve"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B4CC2BCB1
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 20:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774384105;
	bh=EaoaOeUX8AqjvVbZNt08iXK3Dxhpy3xpIWd3E46BrOc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qEQ6Bvve7z1gj+IXfBVW9W2pdNfFAzOP8m4dc529uvDttkYLc6j2V1KA2Yt+3TjnF
	 gmJXLXquo/GmHQdHo+/Yml3XJL/PWoNot3APu221nm0exgxGvdfNXJaVj7zCQSF0Z9
	 TbOqvKHYGPh5+jYG8vsKRGT0Ujnl0j5233cL/sSJDOXxbkX1TJe/TnqDOHhPEAPlsk
	 EEb8tUCMCgR0XIFxzFh+E17Wo0E0hH2MQTJlVUp9j4wcJgJArVBhv/MmWPcr86B81p
	 I5OIm6DMeezSf2c1MM0E+dmS8tzzJHBzLGRAtJsOuy+HJGKSx6N+j+4T8GmrrHVdj3
	 PAFz+CNP8DnsA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9382e59c0eso714315866b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 13:28:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV++G8EkL7Ile6QLeL8eNOTx6avhRsDXAy7eRg8C91S90t4zdsvxw5Lywor1t0cWxctEhZfjeIMDTHe3zG8bAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+m6d/XeTe8E1ldXo0w8yGi/UmAg3o+URSCI7tRaXt+rwrlDPw
	VY55tzRHW0V8zjJ8HH2M2C5F/iCKBtyL8T4wjqrx4zjVBBvV34XtcRcwJzFAMukUY7kprTRnPgm
	KjU/HcGOvVgLd7HRdUQH0iYccpDRu9yc=
X-Received: by 2002:a17:907:2da1:b0:b9a:7d8b:cda8 with SMTP id
 a640c23a62f3a-b9a7d8bd67amr54892466b.42.1774384103812; Tue, 24 Mar 2026
 13:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322061038.156146-1-liwang@redhat.com> <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>
 <acCyPNCBoTGAJjfs@redhat.com> <CAO9r8zPxUv5V+VKEBuyacJUsc-UWh7hGc06yNQntY2GcUJLBPw@mail.gmail.com>
 <acKAr0TYzuYPxH4A@redhat.com>
In-Reply-To: <acKAr0TYzuYPxH4A@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 24 Mar 2026 13:28:12 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOCGWSX1+t8-5qe+04UZ6i4mChPJ8hkpiS5Z8pAPZ0sZg@mail.gmail.com>
X-Gm-Features: AaiRm53OGDgI98_zONp3zzOg_O6qapPTbqUwmQVzXx4u18gME0Yx7R3j1RulnCA
Message-ID: <CAO9r8zOCGWSX1+t8-5qe+04UZ6i4mChPJ8hkpiS5Z8pAPZ0sZg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
To: Li Wang <liwang@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, longman@redhat.com, yosryahmed@google.com, 
	nphamcs@gmail.com, hannes@cmpxchg.org, mhocko@kernel.org, mkoutny@suse.com, 
	muchun.song@linux.dev, tj@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > Sashiko claims that 512 pages will end up consuming 11K to 15K in
> > zswap with this setup, do you know what the actual number is?
>
> Not very sure, I guess each 64K page contains 1 byte of 'a' and 65535 byt=
es
> of zero. A single page like that compresses down to roughly 20=E2=80=9330=
 bytes
> (a short literal plus a very long zero run, plus frame/header overhead).
> So the estimate is roughly 512 =C3=97 25 bytes =E2=89=88 12.8 KB, which i=
s where the
> "11 to 15 kilobytes" ballpark comes from.
>
> > Especially with different compressors? If it's close to 64K, this
> > might be a problem.
>
> Yes, good point, when I swith to use 'zstd' compressor, it doesn't work.
>
> > Maybe we can fill half of each page with increasing values? It should
> > still be compressible but not too compressible.
>
> I tried, this method works on Lzo algorithm but not Zstd.
> Anyway, I am still investigating.

Do you mean the compressibility is still very high on zstd? I vaguely
remember filling a page with repeating patterns (e.g. alphabet
letters) seemed to produce a decent compression ratio, but I don't
remember the specifics.

I am pretty sure an LLM could figure out what values will work for
different compression algorithms :)
