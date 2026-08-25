Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2844F3939DB
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 12:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660150; cv=none; b=DFMUUfp2e4DeCTnnqIRk9aFuKgrGYXriCq5ZiHmVJ2AF3iFyaVSItshr72jQRg7ma6qxEo06GcjOIFwTZhOpf1CmZZ0HWIMUxiXSh9P1hQJDHNTJ5ezAa90610R9e3d4czlhHS6c+OtsV2e8fG3mcITG3TavPOinyvYvmTgcHk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660150; c=relaxed/simple;
	bh=kIGbgLdqR3rmdzi2XNFzEQipmg8/NFHgn0jSm2QwTng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5x5/h9GzBVA0+yCJ3M2MEb3EG/2jl21UWtrCAzowX6T7HZ5yH0PB2PUFRILd/L+ui7FpxCq7pjinPo5gS820Yc/f7W8Mmdzuthqo9TcqGWHblGNG467gCHh2nFwGJsYYxxXKqU8QAmAFmyJnnpmSJ9nX8LJtcUSG21ZvPLN+UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-966e7380109so3763549241.3
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 05:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660147; x=1788264947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CEQlDORbsq7fZcBmgPspHpPEQcLsNmOGZMeC3aM3Zuc=;
        b=EYygXiBznVCXe0iE8USu/NBJYaIkDGXGqlBhkCJqqND5pSdmyGFpzajI1t8/G4D1kx
         eWjshr+3TDgkLlz+7e4I7fr1xDngOVAYt63wKFOFV3yVjZqtFBIuoAutJIa1avgHDxXZ
         uqAycoZx2AU+bbaEHOaxBGxs3aUCRxSibK5kLGRNaScs4mW6QnfRiH7iAZJOFvvfOiWt
         J3msslwe1njjLtPU/uQgdAvK1CikilT3J/QYMiKUiPa3I6oaCAmYojQDzr6ariAOVDUY
         ilQ+AaDZ8iKnodnUy3XIWRwGt1YoR91OJ1AGh5FFQ/iNwOAP4N0bzCdnMMfiFzO8fPoG
         HvAA==
X-Forwarded-Encrypted: i=1; AHgh+Rpyuy1C9CNdc3EpPehdJv3Zj/oboME8NzF1F0R6TtSY9Ow8y9xlTxUdzFv8+aqqngniMRGThDx9db5kbci7orw=@vger.kernel.org
X-Gm-Message-State: AFuF++lfBV0Lm6qWxM45BO8XB0ax4gvje9brMVO+36JyDFB5xJFW2hqm
	/TmW1ElShWCbXD/BEiB2Z5BwewryzWkJOCnvy8Q7MKO0t1cJ+WMOGyJNwYSReZXjuPA=
X-Gm-Gg: AR+sD12OLYzTNbAhDwzCXanIxK7EV4v9feYq8mgJ597uQwKX5+P7iXkL7HSaIC70ad8
	/0pLGCcZaByZg0jwG1Mpz0Fs9riXfyv84fdiHwrnUl/sM1wyd+AxHJ5aP4qT/Dbp0qEITn28mUT
	MMMlSwjdozmScOPxLdB7wTNv6qDE1tu143fVjufl8gkWQPgdexKS6oe4k/JxS3XJH87JQUi22ow
	qKkBI/3t2skez4HlzxhZtgbfKnlhU9c8fSTlJPbxjUtxSWA9U1oGLVLNhXjZuq2q66sMxap0l6M
	+elnWAd0iHaUbtAqhlZs5W8NYDylQ/J8yDohMtlZfkWgQpxR1plUm5xI5/9ZYIMdvgCH4lNkC4V
	uOPfCPsa4Wg0uqC4CVMjKvC+yihVzstaj2O3qYP0gdYA+B2Hpb/7IXcWXzZyAk2Y7y5fAwxdM2U
	kvK0D90RBDbVCE2+GPTa0okf4iUBPrm2fqsCkJXE/sxhYkBieHnmtnDQtlzjwbnN5jWiIFcTYyE
	H8qMaxA+9G814bghOBMMnjM/w==
X-Received: by 2002:a05:6102:6883:b0:778:86f2:9f26 with SMTP id ada2fe7eead31-77fe9c1a4a7mr2377487137.9.1787660146721;
        Tue, 25 Aug 2026 05:15:46 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cb3970361sm755332241.5.2026.08.25.05.15.46
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:15:46 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97c940ef65cso1203908241.2
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 05:15:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq3d8TomFg3FkbxxykaMi1+kbgMJ4rVSAAYZa821dJb/xad3XPYSgK+lF/dkZjaxvKWXNhLB/341+RsUD8TacA=@vger.kernel.org
X-Received: by 2002:a05:6102:a48:b0:77a:ce37:9884 with SMTP id
 ada2fe7eead31-77feac33b60mr2347080137.14.1787660146138; Tue, 25 Aug 2026
 05:15:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1e519fb24aa5521788d69cc7980665ccbc227b14.1787584184.git.geert@linux-m68k.org>
 <ao1hIejAdBPKUHFW@kniemiec-mobl1>
In-Reply-To: <ao1hIejAdBPKUHFW@kniemiec-mobl1>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:15:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuG_s3Rm-gLc2KNw9Z0bptQjdDDGH+9YawEMEsFZZ6Nw@mail.gmail.com>
X-Gm-Features: AcwNN1UDGSe-NYvdVfySLOjOIV0hwEpIGT0yDB-s9yaAhlTbK7bvzY05-aj9Td4
Message-ID: <CAMuHMdWuG_s3Rm-gLc2KNw9Z0bptQjdDDGH+9YawEMEsFZZ6Nw@mail.gmail.com>
Subject: Re: [PATCH] gpu: GPU_BUDDY_KUNIT_TEST should not select GPU_BUDDY
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Karas <krzysztof.karas@intel.com>, 
	Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Maarten Lankhorst <dev@lankhorst.se>, 
	Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 25 Aug 2026 at 13:39, Krzysztof Niemiec
<krzysztof.niemiec@intel.com> wrote:
> On 2026-08-24 at 17:12:30 +0200, Geert Uytterhoeven wrote:
> > Enabling a (modular) test should not silently enable additional kernel
> > functionality, as that may increase the attack vector for a product.
>
> What vector? What product, exactly? As far as I know buddy allocator code is

Any product that uses DRM and has CONFIG_KUNIT_ALL_TESTS=m, so
developers can easily run any relevant test when the need arises.

> currently loaded when a) loading a drm driver (which would need that code

Not just "a drm driver": very few DRM drivers use it.
Hence one can have a product with DRM that does not need the buddy
allocator.

> to function anyway) and/or b) loading the kunit test for the buddy allocator,
> which would need that code to function anyway. And AFAIK neither are
> built unconditionally into the kernel. So the amount of potential vuln
> surface is not exposed beyond what is reasonably required for the system to
> function as intended.
>
> If you've found a concrete bug/exploit/"attack vector" utilizing buddy code,
> then please address that directly.

So let's include all available code in the kernel image anyway, unless
you can point at a concrete bug/exploit/"attack vector"???

> > Fix this by reverting the select to a dependency.
>
> The way drm kunit tests do it is by select-ing the appropriate
> functionality out of the available ones, with "broad" depends-ons for
> DRM and such (say "depends on DRM\n\n select DRM_BUDDY"). DRM_BUDDY,
> for example, is not directly selectable in .config, as it's meant to be
> selected automatically if a module uses it.

In general, test code must not select the code to be tested, but depend
on it, to avoid that enabling CONFIG_KUNIT_ALL_TESTS pulls in lots of
unneeded code.

> This is also the case for drivers, with Xe having depends on DRM and
> then like 40 lines of selects for specific functionality, same for i915,
> amdgpu, so on.

For drivers, it is different: if you want the driver, you obviously
need the helper or library code.

> > Make sure the GPU
> > buddy allocator can be tested without enabling another driver that uses
> > DRM_BUDDY by making GPU_BUDDY visible if KUNIT is enabled.
>
> This was the case even without your patch, and was the entire point of
> 8fe3fc37564920ae mentioned in Fixes. The kunit test kernel can be built with

Yes, that was the intent of commit 8fe3fc37564920ae, but it used the
wrong method.

It is customary to make library code that is only selected by its
users, and cannot be enabled explicitly, visible for testing.
See e.g. commit bf2d44d07de726b0 ("ASoC: wm_adsp: Add kunit test for
firmware file search")

> a rather minimal .kunitconfig (included in the gpu/tests directory). So
> it only loads whatever kunit_tool would load, plus CONFIG_KUNIT, plus
> CONFIG_GPU_BUDDY_KUNIT_TEST, plus (implicitly, which I discussed above)
> CONFIG_GPU_BUDDY. It doesn't load DRM_BUDDY at all (which was the bug
> being fixed in that commit, you used to be forced to load it, now you
> aren't)
>
> > The page based buddy allocator for GPU memory is only used by DRM.
> > Hence add a dependency on DRM to GPU_BUDDY, to prevent asking the user
> > about this code when configuring a kernel without DRM support.
>
> It seems to be *technically* true, however, the entire point of moving the
> buddy allocator outside the DRM directory is to expose it to other non-DRM
> drivers, so the lack of dependency is kind of by design.
>
> The change was rather anticipatory, but it was clearly well reviewed and
> sent by a Joel, a nova-core dev, I assume it's gonna be needed at least
> by them at one point or another.
>
> If, say, nova decides to use the "communal" buddy allocator (if it
> doesn't do it already, I only briefly skimmed it looking for kernel::gpu)
> then the DRM dependency from this patch would have to be reverted (yet
> again). Maybe moving the buddy allocator up from DRM should have been done
> along with the first non-DRM user and only then, but it just didn't go that
> way.
>
> If the issue is that this option is too annoying during make or in
> menuconfig, then I don't think this is the way to address it.

Once the symbol is visible, it needs a proper dependency, to avoid
asking the user irrelevant questions.

> > Fixes: 8fe3fc37564920ae ("gpu: Fix dependencies in CONFIG_GPU_BUDDY_KUNIT_TEST")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> > --- a/drivers/gpu/Kconfig
> > +++ b/drivers/gpu/Kconfig
> > @@ -1,14 +1,15 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> >  config GPU_BUDDY
> > -       bool
> > +       bool "Page based buddy allocator for GPU memory" if KUNIT
> > +       depends on DRM || COMPILE_TEST
>
> What's the justification for COMPILE_TEST here? It might be needed but
> you didn't explain why or mention it in the patch description at all.

It is customary to add "|| COMPILE_TEST" when adding dependencies that
are not strictly needed for a successful build.

> >         help
> >           A page based buddy allocator for GPU memory.
> >
> >  config GPU_BUDDY_KUNIT_TEST
> >         tristate "KUnit tests for GPU buddy allocator" if !KUNIT_ALL_TESTS
> >         depends on KUNIT
> > -       select GPU_BUDDY
> > +       depends on GPU_BUDDY
> >         default KUNIT_ALL_TESTS
> >         help
> >           KUnit tests for the GPU buddy allocator.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
