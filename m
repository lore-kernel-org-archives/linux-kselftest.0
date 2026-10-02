Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16BD48034C
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941127; cv=none; b=J4UngJkU60Neov7thssuuLv3wMdu0C0iFXbDc8EBZx+7e9PQGlnitpR18XwVmfC4tzrXGbzVpHFAqni8RV0jA/P/RyRe7IsD9uDVxsCAcPFsg88M8Fdlx9AHrpV1eYYebGuEIU0uYgcLTxmHO7B9/nWQJ6sdDIFCJQ3feI2XHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941127; c=relaxed/simple;
	bh=f9oplO5WC58bhFJzOVFaqIm9gWgGw58xMvElkvBM7LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9F1m1KCOWhLgF328OGcQg3+LZ5WC2zbb6hug8pEyAWWxM4wpFC3asQUeeqhYAC5ALgK5ctTNOnKCbEZ3uDpJlnoRT4ovCUE9fSz7HBEbrvuhsaKLVSm0ESCmVXd+C87gmTS1b34/pSF/j8AL0g6KjibnMk57DvftLfcq6TYT94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b3a6aa10c2so2181740137.2
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 04:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941124; x=1791545924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=20l5MGKYIkk3dxTQvp40s490//vZekkNtR3rks2T+EI=;
        b=SbOXweLLC3E5HaKmTe3R9EFXJk9FE22CX5lY68+N4ibJBx3prxIgLBNHxpVSDn7UVI
         wq5k073eqMc1P32w/0/iAvYkhP08emP9Hb2F62XzNgrrMJRJxw7JxJwjuDb7+en46kat
         0zWfijD8vrBh7Cuyqxy5G2Yh3NINtozFRc3zv4crodBKdXl8f+ySMGOaGkn5yu0SvTii
         qQupVZZHmq2/hFYZdeK2BY61XBtngEPOcwM2lT/WQTlIHfFuolaYNxJUm0cQ7ud9nrtS
         dYEz76ANIj1OYBVdVX2NBUKZ3v06Btb994dAK4EHW3U03PMzrnFawOki0RPqTXqKEBzW
         Mjfw==
X-Forwarded-Encrypted: i=1; AKwUvBwPOSj68s3u0LKCvGn87CzsH5VYz74AgOSjSmLEcMGiwxXlsa4LmY0LTv/So7QFl0sXqUribEsmFUSZEU8PSiA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPswdLjPmTvO/kuKwqBE00gJVktirZcaQ54/XDq0XoZS5w17I8
	dzHxiqxSf+hO9fQ14TCRp2f6Y2/6MUiM57OnkcmVVu+WJxT06TppPzDd8+bleS3E
X-Gm-Gg: AYBFou25vSvUgOGwBBiYXxWPBmIQxu12G4Q7juoInpplazJ0WxhdLIdBmzAR1lsDn2j
	4mom0AtR1yTk7lxsdmM1g8CLp42TgYt3TxTGyKB8Cr12rRQmRlLp9zLkV6G+GpZsWN5cmLDfwoQ
	knz3vzEids3pOI7tpFM9PBWr7eCBkMVRPXlDaD/rpZt6wiW3rTrD71sEgCpwsZfmkwEQmKWLN1o
	0wMSvGF4tKrXk6D+FUTuJUfO8rXbp2qRIUGAIgK6mXsx2Yq3MMb528EtFdAjtjPgPWMdvcXNbkB
	SSOIyxNUn6JVnG6h7eHpci+cvxXvdhv+8PGKIMLe+ENEt7Ersv5i9SVGwUXTI06eiYmjv1xcs/u
	85W4V7Jzn31e3q/Us6r9/gsx0+iUI+TIZfmqwk1kz9BzR40cMUWE0VkxFskSbpGzmYZbMxwpMCM
	ADkROmiCcdmZylDK2fEfLKFr6eCnpt0UNVjuT95Y0YYq2wL7RNyf1Siw1rEHTpbCBUR4ji5RcEX
	ccGiC0yQdZI81w3c4dWWZozJDJW/+praDKGnIv1MeBmuc/w
X-Received: by 2002:a05:6102:5121:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7c0f4a8568dmr522080137.6.1790941124617;
        Fri, 02 Oct 2026 04:38:44 -0700 (PDT)
Received: from mail-ua2-f41.google.com (mail-ua2-f41.google.com. [74.125.226.233])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98b19aeef63sm2622773241.1.2026.10.02.04.38.44
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:38:44 -0700 (PDT)
Received: by mail-ua2-f41.google.com with SMTP id a1e0cc1a2514c-98a92bfba4dso358059241.3
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 04:38:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw3QZ95jch1hnzDJIjnPr7MhMlXzqDXDvXmcsMxoFlOBK9DjfeZIcjMy98WKZKOjg21WHeaH+U8cKDfriIzuoI=@vger.kernel.org
X-Received: by 2002:a05:6102:14aa:b0:7bd:b263:14c8 with SMTP id
 ada2fe7eead31-7c0f60ae056mr564893137.30.1790941124266; Fri, 02 Oct 2026
 04:38:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929235711.2287931-1-thehajime@gmail.com> <20260929235711.2287931-2-thehajime@gmail.com>
 <bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org> <ar4br2vW7yZGd3gt@gremlin>
 <94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
 <m2se2o3jyc.wl-thehajime@gmail.com> <a65f4431-d225-4535-b921-00319ceeb2a2@kernel.org>
 <ar9ldn036SgT-bq1@gremlin>
In-Reply-To: <ar9ldn036SgT-bq1@gremlin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Oct 2026 13:38:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKcUxHZKhTEF1gwWrU1o8O6jt6N3r90V5hynrLFdwY0A@mail.gmail.com>
X-Gm-Features: AclHuK8oY5W9edeNeZu9OdjhmLKHIkhJXkjnhYM2yOIrkiFEQlBpS9n1EzHgsaE
Message-ID: <CAMuHMdUKcUxHZKhTEF1gwWrU1o8O6jt6N3r90V5hynrLFdwY0A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Hajime Tazaki <thehajime@gmail.com>, johannes@sipsolutions.net, 
	linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, 
	akpm@linux-foundation.org, luto@amacapital.net, brendan.jackman@linux.dev, 
	liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, broonie@kernel.org, 
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, 
	daniel@thingy.jp
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Fri, 2 Oct 2026 at 10:10, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> On Fri, Oct 02, 2026 at 08:08:44AM +0200, David Hildenbrand (Arm) wrote:
> > On 10/2/26 04:38, Hajime Tazaki wrote:
> > > On Thu, 01 Oct 2026 19:01:45 +0900,
> > > Johannes Berg wrote:
> > >>>
> > >>> I thought maybe uname could help but our LLM overlords tell me no.
> > >>
> > >> Hajime originally wanted uname to indicate it, but that caused
> > >> regressions elsewhere, so we dropped that commit. I guess we could put
> > >> _something_ back?
> > >
> > > systemd uses uname information and our (old) patch changing the format
> > > triggered the regression.  thus, we dropped it.
> > >
> > >>> It pointed at something though.
> > >>>
> > >>> In fs/proc/meminfo.c:
> > >>>
> > >>> #ifndef CONFIG_MMU
> > >>>   show_val_kb(m, "MmapCopy:       ",
> > >>>               (unsigned long)atomic_long_read(&mmap_pages_allocated));
> > >>> #endif
> > >>>
> > >>> So MmapCopy in /proc/meminfo tells us definitively, weirdly enough.
> > >>
> > >> Hyrum's law and all that, but I guess it's not highly likely to (want
> > >> to) change :)
> > >
> > > a runtime detection is nice.
> > >
> > > scanning /proc/meminfo might be useful. although it requires to mount
> > > procfs (we can actually skip procfs mount as it is optional) so, this
> > > is not 100% portable.
> > >
> > > checking ENOSYS like syscall(SYS_mprotect) might be useful but I
> > > wasn't sure if this is always the case of NOMMU or not.
> > >
> >
> > I assume there are plenty of other mechanisms. Like testing if fork isn't allowed.
>
> Yup that's an obvious candidate!
>
> You actually need to check for both -EINVAL and -ENOSYS since, of course, we are
> inconsistent with this.
>
> Some nommu arches specify __ARCH_WANT_SYS_FORK unconditionally for both
> mmu/nommu variants meaning you get -EINVAL in that case:
>
> https://elixir.bootlin.com/linux/v7.2.8/source/kernel/fork.c#L2830
>
> Otherwise you get -ENOSYS because it's not defined.
>
> But fork() -> -EINVAL or -ENOSYS = nommu, then just have the child quit and
> etc. should do it.

fork() is not strictly an MMU-feature (you can implement fork on nommu
if all memory accesses are done relative to a base address register),
while I think mprotect() is an MMU-feature. Unless it can also be used
to change the protection using the one or two BARs most MCU haves?
Anything else that is a real MMU-feature? Non-identity mmap()?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
