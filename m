Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA7829DB64
	for <linux-kselftest@vger.kernel.org>; Sat, 15 Aug 2026 21:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786831087; cv=none; b=uPmLuN/Yy3EJBh5hbHjtFzZEb3MQnMlepkwFEfglX8tYTRactJrA3Iu5PgtUwB8Tdnp3PTauxono1e3Y2AFLJZOmPDEjr/92k6GL34YD7gArM8JjOknBqtc6wqFQcTgUzYjHvmlgSYw3B1VDIXUiV8pLHt86YNdlPoCT0EkxKDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786831087; c=relaxed/simple;
	bh=PIJtSkiC+3AMjUNFPDtUQ8QpIOGVzwsyjX1HMeZb3do=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2Q9hrzHQ2DZc3LUqIF5K9SEIVrThYVfBtygTjyaz1HqnvEg0mXq+P3IUM8x2wQOEKnRiKYynhfwap2Du7QIZ7qCYVX1/DNPCqcdTNdkt4vxiWaiizvNTggJUVKrE7AWctFwr9+9IMB2o7T/eaME2VjqSZSNW4L2/B+dNUdSSkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEXBwN/j; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEXBwN/j"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2227219a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 15 Aug 2026 14:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786831085; x=1787435885; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zl3zbyHOUnx+7x+7DiqXwgLH8VDCbrevPogqZgNIfiA=;
        b=DEXBwN/jaIQsofWNLdZWKg2zq0v2kD+7o/XYJpQmbZwIBuVkDMEGNMnv/NRlZ6F8Wv
         qfsmOH78VSq4JRXJl9xx2Hl4F7OfSNgIjk49P0BASoCc2SKFbP7MgbkqA2Yribj6heGH
         PrNoxgB/Tp4ZtiRfaQBwKIjXSiUN9vUGl+WsBN6SQdM70weFml3SChW/R1S/9CrAapKc
         fb9InemMXZY0wNWlWd9jvS83eMYtUUpt0OQmxeW0TcXGbgThYNJPi0c6j2Q3da2D9dmf
         4W6JWd2pSMOwpUym2AQw3/nLoShrWcRUZ1YeE3OZKqqwDXFqydZNxSmT0nL1z9qLm0BS
         OaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786831085; x=1787435885;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zl3zbyHOUnx+7x+7DiqXwgLH8VDCbrevPogqZgNIfiA=;
        b=RSHUBNt1INNeAQVXJwDYXJ4MsWmFR0sDKY4iPKVwtGPf0W4RG4Ktiad88oGOhzMJSo
         jh2nsyuMNJR16+a8Dfx1vSy015TMbxd6UwyCGfx18D+X95GeZwxj/WWO02qpKjIGRtff
         ohX4X8x6drffTivx2QMjgHkLWHlGGZofxx6TKaY9K3aykMtfANKWztnjnWdDHyKK8n9m
         Mu0fTwTw6/pbYIb2e2zztYxdD6PLnz5wa9FwN/kbYN4APR2RejZ7zQWZ7GOu+emLxXmv
         QMWq7URdDmWSoLyXS7VDOBBwQcYAbF5QP+D4NdVek7rLmTuzgvbzayh/55cqZTpbJTh+
         H/Ig==
X-Forwarded-Encrypted: i=1; AHgh+RpoZrk6WphrK7FH7dlYjwr/5T/66bsUj0Y8hSBTnNBz+4RyDMp6haTVW7mL4WYdgkoWJZZTA3sO+taaeU2Zgzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzH13EF0YpRGbPmePfJLNvwgui9FHT9Rsjb3LTliLHHcgzMH0w
	T2Xtbatgi7ola8fDYL1TSBDkMte9xftOde17mZF0oVu9ngtvygaf5HAC
X-Gm-Gg: AR+sD10D701+RvB+OkrobYUZrkmV459/l1GqlznZvcOcqxUNymVRkPNqTnM5oaicP2Y
	ANmnr/oEIwJf8Xae0gUgBLFqJv6UNStS4Dq8iWMFFYkniCMOx8zzNoMjEOO1T9Cr/YeRcer+uVF
	EBoF6bIM4jIrCHZgZa7qOlbxnYbgi+ij50sVeCjI3XipDF32nfT5Ekkl1buPYYRcQI2b9btkGSG
	MbzdHclMAnnlM/OpA3cR8wqw59PUzWf9H246bmVQog9G5J6O5HhFdKzKTe/lr3BIs9SkzCqHIcF
	Y1sQYYIqjBKmZIQLGeRcN64afs2VotEShDEby6Xs5HAdYNceYDbYpP0lPzLs5fgZjDi35cJ14A7
	zCZbI2zVJe81U9sMK6DNfUtOsKV1hdGK/cjVSxtdWU/mI51noF/x1lExEWSmQ+Mxwoid7ka1P/Y
	u4jx7odogEiHSigoT1Gw7qZ8VICpLB/4AQ8DVKiGu412o8nV/5mZheaqXBpFCcNzS4v8iRf6tJ2
	LlHYW7Gc4aLdUjKPRlSCFgvMcMIFkn1t+UVIikYm9iqTl6cXS3aOzrOSXUmZaWKOoJSyTh0RqBO
	ZvVhmA==
X-Received: by 2002:a17:90b:57cf:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-3933b8072a0mr17420143a91.7.1786831085297;
        Sat, 15 Aug 2026 14:58:05 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb78f1a4sm7281618a91.17.2026.08.15.14.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 14:58:04 -0700 (PDT)
Date: Sun, 16 Aug 2026 06:58:01 +0900
Message-ID: <m2v79boxli.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: ljs@kernel.org
Cc: linux-mm@kvack.org,
	geert@linux-m68k.org,
	daniel@thingy.jp,
	shuah@kernel.org,
	kees@kernel.org,
	luto@amacapital.net,
	wad@chromium.org,
	broonie@kernel.org,
	jackmanb@google.com,
	liuhangbin@gmail.com,
	rbm@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [RFC PATCH 5/6] selftests: run tests on nommu architecture
In-Reply-To: <an8MlE22U3586R42@lucifer>
References: <20260813063401.1786548-1-thehajime@gmail.com>
	<20260813063401.1786548-6-thehajime@gmail.com>
	<an8MlE22U3586R42@lucifer>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


On Fri, 14 Aug 2026 21:50:50 +0900,
Lorenzo Stoakes (ARM) wrote:
> 
> Not really loving this as mentioned on the cover letter.
> 
> I'm sympathetic to making things work if it's not invasive, but now you've
> essentially asking new test authors be aware of this to some degree.

It is not intentional that new test authors should have to think about
NOMMU=1.  If there are no option specified it should be as what
the current kselftest is and it it's not, it's a design failure of mine.

> And making the harness - which is the defacto way of writing tests - now
> simply not work there is a bit crazy.
> 
> I'd ideally like to see _all_ tests use the harness.

I also think so but if NOMMU tests is implemented using the harness
test, this patchset would be invasive.  This one is very small patch
which tries to:

- add ability to run tests on nommu
- with minimum modifications and not breaking any existing usage of
  kselftest

which are, I guess, what you're suggesting.

> Also a bunch of the tests already do forking as part of the testing:
> 
> $ cd tools/testing/selftests/mm
> $ rg -l "fork\(" | wc -l
> 17
> 
> So at this point you're not really running much of the selftests at all,
> and are only happening to run those that don't do the very basic stuff
> nommu can't deal with.

the current situation is exactly what you described. `TARGETS=mm` is
able to only build with NOMMU=1, but onlyis runnable with nommu_*_test
(I need to specify `-t nommu_mmap_test -t nommu_mremap_test` to pass
tests from a run.

Now I'm thinking to create a different target (e.g., `TARGETS=mm/nommu`)
to make it more clear for this situation.

Existing tests even in selftests/mm should not involve these new tests
which has such limitation.

> I think an audit of existing tests to figure out what works with nommu vs
> what doesn't is really unreasonable again, given nobody tests or seemingly
> uses these arches.
> 
> So this patch might beget more nommu carve outs and exceptions and
> therefore nommu workload and maintenance, which isn't really sustainable.

I can understand but without tests we cannot easily detect regressions
in future.  Like when you applied broad changes into mm and try to
apply also to nommu.c, I believe these tests are also useful to verify
the extension, especially if the changes are not trivial.

# sorry, this might be too obvious for you..

> I know I complain about lack of testing on nommu, but at the same time I
> don't think running arbitrary tests that happen to work on it and who knows
> if they are valid asserts anyway really fixes things.

agree.
I think (current) nommu isn't ready to run arbitrary tests of mm.

> And given nobody really is doing testing, it's not really a great RoI
> here...

At least myself, for the moment, has an interest.

> ...OTOH I suppose it's a minimal change we can largely ignore as long as
> this doesn't lead to additional work/auditing from anybody but nommu
> enthusiasts.
> 
> But I'm just not sure that will be the case :(

again, this (not breaking existing model) is my intention so, this
should be the case, and if it's not it should be addressed in this
series.

> (I'm amazed we support a mode in linux that can't fork() in 2026 :)

I concur.

> > ---
> >  Documentation/dev-tools/kselftest.rst       | 12 ++++++++++++
> >  tools/testing/selftests/kselftest/runner.sh |  9 +++++++--
> >  tools/testing/selftests/kselftest_harness.h |  4 ++++
> >  tools/testing/selftests/lib.mk              |  8 ++++++++
> >  4 files changed, 31 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> > index 64c0ec7428a2..800b2b688aff 100644
> > --- a/Documentation/dev-tools/kselftest.rst
> > +++ b/Documentation/dev-tools/kselftest.rst
> > @@ -230,6 +230,18 @@ section::
> >
> >  .. _tar's auto-compress: https://www.gnu.org/software/tar/manual/html_node/gzip.html#auto_002dcompress
> >
> > +Build and test on nommu target
> > +==============================
> > +
> > +If you (cross-)build kselftests for nommu targets, or run tests on nommu targets, use

-- Hajime
