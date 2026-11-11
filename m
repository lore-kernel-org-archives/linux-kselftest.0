Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417589;
	b=lET7O2O3vdtnmvdd4FFuNGdVLYPXk3aay0reQ2opGvmI1UjzLSo0Yld6vZ3mKbFY8a4d
	 DtzqG8467l6/bfN3PopXbNgyFORzkGqHKujsNMFBzRHYZbMk6wpfa5TL8JFJsIiXu82Mh
	 TYH2q/blMldz/6if7yd3Pa8IzpFjZ9QT4WQb+dBOpQdkfEnoeljPzHfum3obb3u1FgEux
	 okBAGxD4Yrf8A0iQb7ruI1m1NF/GePbSHiq23iQ913FXrOTzluhFYU1UtfeJdbWvvM2Tq
	 5qvEDONxGcJk/UiWsjhUCgVL0a2SzdgZsC4uYhDOeo4hH91uWXx3C5XHmtEzszb2T9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iTol9OuOgGYXh26V9QvjAW3otBVqyc5sDP/r02tbP3M=;
	b=d1QvVZRXgA3ZqxYRTz+rYdeohQTKiIXGlGwsk16U+tQgOZc/D0Nz0HmEZOkPNtdS+6It
	 ckWl+1OevzOEuC7TxP0bbhwINLIvEZ7lhRd8LLW7TzuWmmyBjQtFy/CoUsp/le4Kl8Wt/
	 5+jMRMA2uU+h4S7eMnIw5X7tCN1eNY1z8Yrvt7n7SMN6jB25WYNhiBf2uhYBSexlc3ZKR
	 fXeDAQ4nRm6DzO/3BP7aSy85lB5nnEkuUZIlJnjF0etMH1oEPzF0asOkQ+GodDFRJxkwl
	 C3n2HJf+xELIx1Csb0NNOSptGYYr/qfGaAPgCY0OXO+SvP7agQKbJrLJ9K9yycZNquw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=as1eS6by;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75DB606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 17:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75DB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=as1eS6by
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5366120a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 09:19:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794417587; cv=none;
        d=google.com; s=arc-20260327;
        b=fGE1AECz9HwammpKcSg4rO0JcZZDM/ZT71/Syk1dRDECtLh8vGnlwHIVlfgaNItEOg
         k7XZ7GbQyskpBEaXnPe62Xlw4eQHxM+QwxjOzOmNbYQEAGYoi8C3WahfK4/1bNX6OPBC
         OXhzSCaHWTQwbBaXJSCr7KUa1Ms6J+EYal1cVdSdKC6iwVs0CtnsdfSeCpgXKRAiZIn6
         wS1M24IzFJIqY+L0462IuT7W21gKPsFcgOhVBdHOv+3iln2bj3o1eW6UDrX6h3Esx58/
         ffZSTccDOXIKIVUwKPvBNm/4FwR5Tgy9LfxtoeRi9dg9vhLmTfGlK3zGggnRU911CL/I
         toFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iTol9OuOgGYXh26V9QvjAW3otBVqyc5sDP/r02tbP3M=;
        fh=fPHPTU2nAUt2Q0wZ15OkYLNX6/T1LAK28dhwLKFhw64=;
        b=kvc4OBuEs3mL5MLBEy6ebHe4POq8QMornd4VghPz1lyr5w4YYA6WFBMHWX/TrzNU+l
         XOkH2Gv3ZtuiHb1aASNkBa/QaWLPAOVN3wLoIilKNCwg0pi0zDMvGZ4Eqvy5MjtMsV0/
         1o4ywH8yQ/WWdxt1wt1iL+7cPupyt/kPO0lT1tWKlCBsczEp8t0e3nBPSJvSLR1H7cfI
         KwACTHJWHQFY7Fkn9mL23FcbqEJqzkoDmXATNqH8djdYoU/5gKr5OB1xBUb20jUpWb/e
         XQi6agWtbA37Vmnr4D9Sn+NH/7Vf37sJOsH4Uo6lAEUXYqFTWKZ2mqdYHINsz3LWlgxR
         Xgmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417587; x=1795022387; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTol9OuOgGYXh26V9QvjAW3otBVqyc5sDP/r02tbP3M=;
        b=as1eS6bypCTE5b+92bv/ROzRgy8V3klxe4VWAMyoyyL66NF5Fyy3Z1UiZKTUi/v74V
         VAXDX1IavrKKO3i32uvsuHLolnjzXugfNMQdUBMbrmJ+Ix7mIJKfQh5IpOFMMCC4HQTk
         jGlIPZakc/2kd8Rojea82axums1XYqtmqqvqbVT3itlwu/zrv0j3Bjz0SaHrF6fuxZjr
         76o0sZbhtz5JeCzVBgDViK3ponHzPGY6Igy//d7n4sZJWr3ErAQehFC0lhs38iUEPMtf
         qV6acbOlEYpwhGiTPHXBGTNXf7TwbKOgcYXcTRvbrbQb8RSc4PhIYtqtz8yBo5A3l10x
         tAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417587; x=1795022387;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iTol9OuOgGYXh26V9QvjAW3otBVqyc5sDP/r02tbP3M=;
        b=PW+AJRpsF59dxj01N4PU8K0m3z2BYYcUIE4BZUVkHxzlTq0QyBSQnh2eMh2HGIjVud
         NQbywfnuQcfvVbT0yNO4Gbzqe4RCK4j7jQB0rYRhLINX992kPc6nG0olCn9bigGyNjnM
         FV+vFkXsQi+jRLEl48P99jPdOVUtlodlakYNm3Sg+t17v4D7P3xgt7yEDoTmw589nSMw
         0f6LsNQidOQ8xrAgXpP4JRbNdRicLVWeSkzLTdJLZdXSWhgJQxGzPpid8v8SLHZVNTuO
         itsvYlqTNQtKKB3zetCJaovClaK5By5OdsKbIp6BlfAnzETL9ly/DHr0zwQTegM7ddTD
         vtUA==
X-Forwarded-Encrypted: i=1; AL+hErEgL8IWB048WlFRzUuv7WxpTh2KbsHvgh61QJHOz1yQujjwDkPg/mG+SSL5wqLHSf+2HDG2rr8Nlly9eRyYsSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yR151RwtqNqN26dtHQtEiXewXCdP7H91uADZpWVFy+FO9Mpwj
	t7nO4epwkJQBEABtO3wvfiLpoylGg83RjtKL7nc43vfdGSR+bhNfxhb3YgRx6m0RzW9jufovpb4
	k4L+jKGfMX3rH5biEduMFNMFll7TSgVs=
X-Gm-Gg: AYBFou0wCkEovYfD8DHnwAdhsR3jnFplIUoFFp6kbqRQAqDbQp35Ui5OKNUtS10BjY2
	wWs5OPemLyRDgYUvioxr5g8DU8cR9IcV31joIwZEUz2UGHhUa7BaBbVcAmvYE/Juk4UGp08lQJZ
	i+EXQaBtJDqzogaQ4Gt9/xW9AYd6TzbUB9CcFnoxPeGqcdAcLr6dCua303mfcoVDJNowYComlNR
	X51bfsRhbQHT7BsfuIE3JsQu56XLEOGHsIT24pQAzjszUuVck/BY49JaEXH2SkHQhlw8S7xu++z
	9arWVYOx/K9xJb+3Zxx0qzVVUCN5in4gfNK7LmKxdnDage21GnMfPJ1XoIWHhsa4bnfs9ZbGJ0a
	ouTrmKXJSplgOaE7UIN7I9jlBy7gUuCRofRN3azI=
X-Received: by 2002:aa7:c4ed:0:b0:6b4:5d8c:95e2 with SMTP id
 4fb4d7f45d1cf-6b77733f5c6mr1625239a12.4.1794417586999; Wed, 11 Nov 2026
 09:19:46 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110021622.122490-1-technoboy85@gmail.com>
 <20261109193925.8a127f2d0afd5429f1f551f1@linux-foundation.org> <20261110100116.5c435722@pumpkin>
In-Reply-To: <20261110100116.5c435722@pumpkin>
From: Matteo Croce <technoboy85@gmail.com>
Date: Wed, 11 Nov 2026 18:19:10 +0100
X-Gm-Features: AclHuK8iwIUz_YGXZP5CajA0kq-b19YTFhGC7BAF4j9dRAM_y1FghCHa33mkCG4
Message-ID: <CAFnufp30PRLUaW-grdxuuM6vumgHBwWmf8FTm9WNfYU4BWYGNA@mail.gmail.com>
Subject: Re: [PATCH v7] kunit: memcpy: Add benchmark
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 10:01:16 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Mon, 9 Nov 2026 19:39:25 -0800
> Andrew Morton <akpm@linux-foundation.org> wrote:
>
> > hm, sorry, I must ask "why".  Nowadays optimizing memcpy() is a
> > super-specialized thing undertaken by the bravest architecture
> > specialists who are unlikely to rely upon a generic kunit test for the
> > purpose!
>
> But kernel benchmarks are really the wrong place.
> The 'bravest architecture specialists' are going to test the code
> in userspace where multiple algorithms can be tested and quickly
> tweaked/dismissed.

Hi Andrew, David,

Fair question. I'm not one of the bravest, but I used this test to
develop and measure a fix for a real problem: the RISC-V memcpy()
falls back to a byte-by-byte copy whenever source and destination
have different alignment, and on a Milk-V Megrez that made unaligned
copies run at about a third of the aligned speed. The fix[1] does a
shifted word copy for that case:

  Before:
      memcpy: aligned copy of 400 MBytes in 429 msecs (931 MB/s)
      memcpy: unaligned copy of 400 MBytes in 1202 msecs (332 MB/s)
  After:
      memcpy: aligned copy of 400 MBytes in 428 msecs (933 MB/s)
      memcpy: unaligned copy of 400 MBytes in 519 msecs (770 MB/s)

and it's visible outside the benchmark too: UDP RX on the board's
stmmac NIC went from 672 to 827 Mbps with 512 byte frames.

That slow path had been in the kernel for years, and I think that's
the point: the specialists tune the hot path on the hardware they
care about, while a slow path on some other SoC can go unseen.

I don't see this as an alternative to userspace testing, I do both.
I develop the assembly in a standalone harness[2], which checks every
length and alignment combination, and times ns per call over a range
of sizes against glibc's memcpy() and a few other implementations
(a vector one, C-SKY's, a glibc shifted-copy patch). That's where
the variants get tried and dismissed.

But the harness runs a hand-copied memcpy.S as userspace code, which
can use things the kernel can't, like the vector unit. The KUnit test
checks the real thing: the kernel's own memcpy(), as built for the
running kernel and, on architectures that do so, patched at boot for
the running CPU. It also lets anyone else check their hardware with
a modprobe, and can run unattended in CI.

There is precedent in lib/: CONFIG_CRC_BENCHMARK and
CONFIG_CRYPTO_LIB_BENCHMARK add opt-in benchmarks to the CRC and
crypto library KUnit suites in the same way.

[1] https://lore.kernel.org/linux-riscv/20260311173138.1820-1-teknoraver@meta.com/
[2] https://github.com/teknoraver/riscv-memcpy

> You also want a comparison against the 'obvious loops' (which it can
> take some effort to generate because the compiler tends to convert them
> to memcpy()). Otherwise the numbers are pretty meaningless.
>
> I also (sometimes being one of the 'bravest architecture specialists')
> try to work out how many bytes/clock the a copy (or ipcsum) is doing
> and what the fixed costs are.

Agreed, and the sample output shows the problem: timing every call
with ktime_get_ns() means the small sizes mostly measure the clock
read. For v8 I'd:

- time the whole batch of copies instead of each call, as the
  harness already does
- print the per-call cost in ns next to the throughput, so the fixed
  cost is visible (and say MiB/s, which is what it actually computes)
- add a byte-at-a-time baseline, with OPTIMIZER_HIDE_VAR() on the
  pointers inside the loop so it can't be turned back into memcpy()

The baseline would have made the RISC-V case obvious at a glance:
the unaligned memcpy() would have matched it, since it was itself a
byte loop.

For bytes/clock I'd rather not use get_cycles(), as on several
architectures it doesn't tick at the core clock; ns per call at a known
size should let you derive it on a given machine.

Would that address your concerns?

Regards,
-- 
per aspera ad upstream
