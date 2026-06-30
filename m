Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202EF328610;
	Tue, 30 Jun 2026 22:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782859971; cv=none; b=vB0QaTycOxPH7EXBW05j9bGOnsIPdqd23u8w8OpzR0bBbz8ciU/c4D8+IZJK9Vf7XfZ9TOwuVLtC26ECVpaMAJ45/iQgckV0G++ewGb3VVjlIbuE/bMijazbuSvpmxjAITtvMVfFBWBgVCWk+0uzAsvDmEWQZ/IIql9CJn6CCcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782859971; c=relaxed/simple;
	bh=3n96j/ql0kU7RzUR4uo+dtZykDqVeAAHFSsWdv4fyTI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r38rdSopfrgj953yi0y0lDVAyYLaO2R7CK7WajdBZr5IehDvAwdGRrSBuhL0y86toXjE50kuB2vmvuwa8nNKDGPmY845iKBBhl+CO0bZBHG11rfAdOdWiEoX8ZACuLj7qBFQ3JJaKclHhqH386ghzKFaqyfoCASaVlk3EfAbo1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=bgAiN8xq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RuRxHXls; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="bgAiN8xq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RuRxHXls"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D241E7A0053;
	Tue, 30 Jun 2026 18:52:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 30 Jun 2026 18:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782859967;
	 x=1782946367; bh=KPcO4N+kR/OKUIdNoFJrabqDR+OoGT65HonnXinR6XE=; b=
	bgAiN8xqF0TYxEZcKlf3LFaXHzlrA/d9Iygsod/O3lGsrq4+tJzAuOtlVtHaPie7
	zFOO+FPu6xFon18+V826JAIC6L+nSBsmqDaad9gLqwRDr9ULJdddkSfZrQcYcYls
	zM6geJLgXYYK8f8jLjeHhqe+g8fJsBFvNlVseUO1eC92lT44L14s9cTk4go3fsf5
	YfawycSizqo4k/L+k/CWf6LTQO0FOfa75rSc1XcUAwoQO9YY+VOYdQFsmuVel64I
	uuuqJUjlyvRp12Oks4Uy07vkCWgwztv2DukyStyfLTgU8DCfzf0nu7EP9n5y3fQT
	Y29CDPBcvXskLAz4gueICQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782859967; x=
	1782946367; bh=KPcO4N+kR/OKUIdNoFJrabqDR+OoGT65HonnXinR6XE=; b=R
	uRxHXlsEHlTZteMGPvhl/71HZ2I0u+qes9d52Y7eJKiMeh8hLY20Jbj96d6qKFkF
	62MsnCIX2XZzGcAFmKREjri1JcokWRnYqOJ8aJXQO7Kq5D1fRum4xw2BzzSQ97We
	Ib7Lkd+588+Wl3aJ0Zxyrf3CsEbxpafxwJy98v8A6RKTxE01mC15LLvDgVFDI846
	2fCEksvDKq5isDsAmkY5nBo07NJNyi43dQBMNbIE3OBsXYdYIk7heKAIWObaYVhB
	fdkw3OMwuwMMh+uDy38voeMAZ8QZhDjZpq2nbgiEjeNLlhIZhjmiM0nOy3QzTp34
	1WBzaWq6oZkUDuH0OnD6Q==
X-ME-Sender: <xms:v0hEat8F2cAP9YBfqQZR2SQulJYC3SppeNAAAE4aJdT-yQDB3nPnJQ>
    <xme:v0hEanQ59ZYRQBQWEL4AkSsS4EziwS--OXQn6HiuNLHhMvDJa_zOVVSK1_-4b-NyI
    nfkScBGxrSdotJLwRIeAPGS9QltJvSQKZGhb9XnkjgmndR5J0LpUQ>
X-ME-Received: <xmr:v0hEakk2STt702LcCcpYmlucOzD0HV4ukAB-md29PW-FCbKgArlXiTV6r88>
X-ME-Proxy-Cause: dmFkZTG21ZqLxaX9ZPft+JP437V0AQi97C0Lnv/s2wq+4XFvvUqWtAQIpj6SllHNLPT//8
    AUQxLjiPVVgJZaWHfGHOcI0Dby4nUyKBpnJ9PWXHwiYSfLPd8+NT/Rbr9Wd6YXke6hGvRj
    cqEGkTmCwiWyWbWi08iOWmsq5MOop0N+2i0rq5iD4LyHoiW14UMeEvpsJOEl3LeipiZ/8V
    I7CtdQPBjPZHnvfJ+aibjT5qMuKJhFPE5n+rl9A0BD2GHqI9Pd6829Kj4AdWR/Ji0Splz+
    Qg1xTfRDoeWvseZ9ifiVbzh63g7kbPBg0D2mLU5Ni88O34AuuBZYpGH/WzOuu6ciLRxNq+
    mpOsLeRgamQz9z6vfpnJQE6OCUWYpvdcqD0nrvCuKritSacMvYP6mVUXv2Svnm60eEiFuh
    vvltUgJLWCm58OcoyJ/TuEtyoFB6G+YvCbU7k51e5A0EUDHPXTtGOH83u+RBtv7gPLNQY8
    vR+MI10B9tJJ+AVtlIh0nT+MgJrMUcVc2cpnBFICR8/VxNvnLrCphPf9tuuZqBN9wmr1Fq
    F9YqVg0RhUBy4HhugGxSKWNF+0FflFrCQdXATtSJO4HV8PiSqGFX5i8hPlKa0S+wZ29LG4
    jp5+JeYwsyl0Jk0wf2AmOMJPnIj3YH+97aHduQbHKvHHEp4bVjoO06X/or9Q
X-ME-Proxy: <xmx:v0hEaiXxwz3mzUooBsq3EHDd2Kvn7uOrg4wN3wuN9vXYKAjwCE7oBA>
    <xmx:v0hEapcGLTFEdLLD6diQptwb9al1tsXD7Bmycknn1YCrlbPSbKLguw>
    <xmx:v0hEagnEsTrI9vblNa8K8hn75inCWglxbPo7SS3rj9PSUR9oSgEfzA>
    <xmx:v0hEarDLGwrs_QB4f9nLp43cEk_lJhYUqDKr8uVWs5SEXRCGocMfbw>
    <xmx:v0hEakFAe0sqZfrZv9KtLeSljzzjGF1twxq2jdcdvUIh6mH6j6whpg16>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Jun 2026 18:52:46 -0400 (EDT)
Date: Tue, 30 Jun 2026 16:52:44 -0600
From: Alex Williamson <alex@shazbot.org>
To: David Matlack <dmatlack@google.com>, Kees Cook <kees@kernel.org>, Shuah
 Khan <shuah@kernel.org>
Cc: alex@shazbot.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, Andy Lutomirski
 <luto@amacapital.net>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Raghavendra Rao Ananta
 <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Will Drewry
 <wad@chromium.org>, Aaron Lewis <aaronlewis@google.com>
Subject: Re: [PATCH] selftests: harness: Mark test fixture objects
 __maybe_unused
Message-ID: <20260630165244.0d013bbc@shazbot.org>
In-Reply-To: <20260630213341.1664345-1-dmatlack@google.com>
References: <20260630213341.1664345-1-dmatlack@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Jun 2026 21:33:41 +0000
David Matlack <dmatlack@google.com> wrote:

> Mark test fixture objects __maybe_unused since they will not be used
> when there are fixture variants (the variants will be used instead).
> 
> This fixes the VFIO selftest build with clang and -Werror:
> 
> vfio_dma_mapping_mmio_test.c:106:1: error: variable '_vfio_dma_mapping_mmio_test_map_full_bar_object' set but not used [-Werror,-Wunused-but-set-global]
>   106 | TEST_F(vfio_dma_mapping_mmio_test, map_full_bar)
>       | ^
> ./../kselftest_harness.h:398:2: note: expanded from macro 'TEST_F'
>   398 |         __TEST_F_IMPL(fixture_name, test_name, -1, TEST_TIMEOUT_DEFAULT)
>       |         ^
> ./../kselftest_harness.h:470:33: note: expanded from macro '__TEST_F_IMPL'
>   470 |         static struct __test_metadata *_##fixture_name##_##test_name##_object; \
>       |
> 
> Fixes: ff556bd98348 ("vfio: selftests: Add -Wall and -Werror to the Makefile")
> Reported-by: Aaron Lewis <aaronlewis@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  tools/testing/selftests/kselftest_harness.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index 261e4df94d9d..29a19bc87084 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -467,7 +467,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
>  				!__atomic_test_and_set(_metadata->no_teardown, __ATOMIC_RELAXED)) \
>  			fixture_name##_teardown(_metadata, self, variant); \
>  	} \
> -	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
> +	static struct __test_metadata *_##fixture_name##_##test_name##_object __maybe_unused; \
>  	static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
>  			_register_##fixture_name##_##test_name(void) \
>  	{ \
> 
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482

Reviewed-by: Alex Williamson <alex@shazbot.org>

Kees/Shuah, I can take this through the vfio tree if you prefer, it
fixes a commit that entered through vfio selftests.  Thanks,

Alex
