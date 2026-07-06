Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2063F9F48
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356129; cv=pass; b=Jo/ocpuru/xjEdCACCNkGXmFG7huzsceakYxP0xJTBoPiOaQPuODKKS97qzJsfjkSxjOXUeSCY+qezbN2BtBPJu6ooyREMpj8SyP+PyxmOOlqF4LHiyfHo2NdwqEvqAU8zJGqMw68GK8mWyegScC5gjro35tGGDExkogRsGPalM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356129; c=relaxed/simple;
	bh=VNYai2/KPlhkeALcWLLZ0ukJRHgn91vQcKUBUKFOdDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4/rSBlckVNEXTESewRtmbZuhKyQHsMglSpdAvNUruJ5dduSjXByN/H1s0ocSNCuhtIxF1BkI3S/g5XZPDgZpcWx9nSTVygJgHtQAkg7A4E2G/DPbf/a9DPb5nS9QSCgWQKggjm2+rxmxFSK+9DdQDewy/+Jb1qSKq8183gvZbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i7+UflVE; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i7+UflVE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-383adaa461fso1580097a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 09:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783356127; cv=none;
        d=google.com; s=arc-20260327;
        b=rMV2nSACauJcIDu7QQ1hLCnKloetguKfnAVuknQf6C80XBzfQnU/+uKYNswINSGnKh
         uAuY/zkDL4pmKOb6mjQBpP4HhL1Cm+TAejiuYMNw5wI2qe9eJ50aVpYmW09GSiAyremE
         F3006y/0utNlec+6+1eyPVk7cBkYl+Y++2aBsKy3LQKSSAjR/a1GAOh0ZNOJKt+CAJe+
         1iqnbe0Q7Jh+g9cgIX+eOX7JV/7ZCcIELTrlt8MTGZZ0ZHDGHAdnJa2iu1HDRf/XaiZn
         qDiRP+BuSYLZ26n8zpfXZCUUAX7mK1lyjbcvg3zaeKkqlkwQwwqVZSk1zSG94zv3T9S/
         LoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyZ+He5uw82sFpn1+aSH51zefpGUJmYOMzfP9sVDRu0=;
        fh=y7e4iRb+VUO+3x+dlq0fCBO4qCbnp8UkmWp5uZ7cqJ0=;
        b=iS/4a1Ik036O+zFukKbJzDMtKO2ElapjnY3t5ysD2v7I35j6iN99PyGJ0AxDITGBo4
         eiNk7RmzDjvYDQZqnI90zaiz66jjxoqNo864qmbzeHLz8M3A5FgiEyT0iMljZ8Dbfrhi
         O1cdjwDlf6S0ktmPVyyjpokvSBwnV5Ap21NmKpLD8LtNctBhcxN/kWFWkEwSNtyaxSzg
         itWDJRkeyeXgMUy7EqQFptTsG3MauB0HzqVY1uT0hN1cLvQms6lU0oaLQUF2hyNW9gI3
         7m2b/T5bpd+UL7gevezPHZjrUFSP2xPnEGOWNhNFpWBwB8ha6mahHgBjjahNVpyk4ht9
         0M5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783356127; x=1783960927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyZ+He5uw82sFpn1+aSH51zefpGUJmYOMzfP9sVDRu0=;
        b=i7+UflVE8le/HQGSr6TKddOcP5/Rv3a98MWH+CQoGg8RFx8t0Ngn5ZO6px4k3aA5Kn
         V0y49QLWLa8o2wa3FFwhWYm2GvgR3Y5LWqmphRNG8OXgZbkLlf/tURhyuTs0US4lMT3k
         kpWDM9Wu+qBXGZ42zjt5AA9364nCClyFUr20QjtC2vmrR9yOohlCbZKaJvcOzeZtRURO
         74X92tu13mTdElCwCP+8M2lX6HIVJfdBUmZ899aPBjrn6asHyTO8TtmOG0s/81+yy4BI
         7Umc35EsfHPNP8KMJbA2GN12J+/SpCAR0FpEMnocikEASVGfg6S9EOL7Cta6fv6Xg2wC
         wuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356127; x=1783960927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyZ+He5uw82sFpn1+aSH51zefpGUJmYOMzfP9sVDRu0=;
        b=RWSnz6ig1DYKKYc6Y72B5b8nQ+EvCjVBiOnO/STAMUTuDtf9SYYCc0tARxnjeIlTSj
         +KLOdbPAzBB08X9j585VLBfdAQ88ZxUfEe3cMsLw5WnwTGS/tevF/QjDZolE1U3pVEFb
         pTyaDdcfM5oD1srhUL45MdM0xCcYzfOdn7Gm78GO2kWTVHAO3SO9OW5/OLlYPn7f9DAO
         B0R8hyzrcTYKfiqVev4i+FDZect/APRxb1f7ljkENRfojnJZ8zbGcYQzlmWksMyLDElZ
         u09rHIokgaRrkrFPWGR6rqgWHxULbJ2mpWivSyQNyBiMgWx5/FZpgfyQG93BzYTNX6Wv
         dZCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYB+1ZJocReJieoPEwhDJ+x36SeLP1EJGyxyUDf3SLgbyftbXT3hz+b+eynQdfnNk7JBN93NEmTRsv4eg5dkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWrR2Cvis9Ol3c0lnIHZEDi3ZMpYj9W4Uc5cUsZPJyQsLr28PV
	dVPS+GXptpKr3Ym7doN21cvd0djSibyy/yU47VBVpvJ8Wyf+s4JSSj7RSxpykDmh5BaxSFkitcS
	irMEfBIa1kCfAY4X8ujLsV7IxWKQ76LJ2Jtj3M5D/
X-Gm-Gg: AfdE7cl9Jy+5ZCpPJvA03WjS6akO4Uk30LFzquChaQtU+iAnZ7hIqtgUwsbWs8ZLk0x
	Wkia8oGm8YMKPaSBmaugyRZ1TGIZeTSZ/9jy/DNXAQZgjF54iCHCksLR1Drxri9nQc2eGt94rT4
	mMNjndUYwvnp2EuDNIysEADvRHamGmGBurIdMjr3Eb2xT+qDs0+QkWL42CrU9fhAfHKXz3Vim0X
	4U+xHuSOFXEwLpQm3v+AnKttuIgKNUblsb09+gon2oYkwHG5ZyQetbovMYPsCxZjWzQrVMC
X-Received: by 2002:a05:6a20:c799:b0:3bf:aa1f:4881 with SMTP id
 adf61e73a8af0-3c08ef34b2dmr1593273637.56.1783356126046; Mon, 06 Jul 2026
 09:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630213341.1664345-1-dmatlack@google.com> <20260630165244.0d013bbc@shazbot.org>
 <20260701024906.GA3960633@ax162>
In-Reply-To: <20260701024906.GA3960633@ax162>
From: David Matlack <dmatlack@google.com>
Date: Mon, 6 Jul 2026 09:41:39 -0700
X-Gm-Features: AVVi8CePgqxvFszRnZoJMtiuDb6vccWgIQj_T8klBJuvC17Cx9M9s08vrURGQT0
Message-ID: <CALzav=dVQ1EpQ2x4zZWv0akqPryQuMXqE_vKG3LuC0-2NorT1w@mail.gmail.com>
Subject: Re: [PATCH] selftests: harness: Mark test fixture objects __maybe_unused
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev, Andy Lutomirski <luto@amacapital.net>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Will Drewry <wad@chromium.org>, 
	Aaron Lewis <aaronlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 7:49=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Tue, Jun 30, 2026 at 04:52:44PM -0600, Alex Williamson wrote:
> > On Tue, 30 Jun 2026 21:33:41 +0000
> > David Matlack <dmatlack@google.com> wrote:
> >
> > > Mark test fixture objects __maybe_unused since they will not be used
> > > when there are fixture variants (the variants will be used instead).
> > >
> > > This fixes the VFIO selftest build with clang and -Werror:
> > >
> > > vfio_dma_mapping_mmio_test.c:106:1: error: variable '_vfio_dma_mappin=
g_mmio_test_map_full_bar_object' set but not used [-Werror,-Wunused-but-set=
-global]
> > >   106 | TEST_F(vfio_dma_mapping_mmio_test, map_full_bar)
> > >       | ^
> > > ./../kselftest_harness.h:398:2: note: expanded from macro 'TEST_F'
> > >   398 |         __TEST_F_IMPL(fixture_name, test_name, -1, TEST_TIMEO=
UT_DEFAULT)
> > >       |         ^
> > > ./../kselftest_harness.h:470:33: note: expanded from macro '__TEST_F_=
IMPL'
> > >   470 |         static struct __test_metadata *_##fixture_name##_##te=
st_name##_object; \
> > >       |
> > >
> > > Fixes: ff556bd98348 ("vfio: selftests: Add -Wall and -Werror to the M=
akefile")
> > > Reported-by: Aaron Lewis <aaronlewis@google.com>
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > ---
> > >  tools/testing/selftests/kselftest_harness.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/test=
ing/selftests/kselftest_harness.h
> > > index 261e4df94d9d..29a19bc87084 100644
> > > --- a/tools/testing/selftests/kselftest_harness.h
> > > +++ b/tools/testing/selftests/kselftest_harness.h
> > > @@ -467,7 +467,7 @@ static inline void __kselftest_memset_safe(void *=
s, int c, size_t n)
> > >                             !__atomic_test_and_set(_metadata->no_tear=
down, __ATOMIC_RELAXED)) \
> > >                     fixture_name##_teardown(_metadata, self, variant)=
; \
> > >     } \
> > > -   static struct __test_metadata *_##fixture_name##_##test_name##_ob=
ject; \
> > > +   static struct __test_metadata *_##fixture_name##_##test_name##_ob=
ject __maybe_unused; \
> > >     static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
> > >                     _register_##fixture_name##_##test_name(void) \
> > >     { \
> > >
> > > base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> >
> > Reviewed-by: Alex Williamson <alex@shazbot.org>
> >
> > Kees/Shuah, I can take this through the vfio tree if you prefer, it
> > fixes a commit that entered through vfio selftests.  Thanks,
>
> Not that it is a big deal or matters all too much but I do not think
> this fixes tag is entirely accurate. The blamed commit may have
> introduced the build warning/error in the VFIO code but that same
> warning could occur in any selftest code, as evidenced by the exact same
> patch submitted a month ago:
>
>   https://lore.kernel.org/20260530054722.271157-1-kuniyu@google.com/
>
> clang made a change to -Wunused-but-set-variable (split out into its own
> subwarning, -Wunused-but-set-global) that exposes this. Personally, I
> find that change explains the problem better but this one makes it clear
> that it can become fatal with -Werror.

Thanks for the additional context Nathan. I can send out a quick v2
today with an updated commit message to capture these details and
a better fixes tag.
