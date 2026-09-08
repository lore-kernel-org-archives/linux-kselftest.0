Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A667831197C
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 04:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788843491; cv=pass; b=LsVVlW1WNuAZl0h+cgeAW6ZYuT8r0cTZx2NH5+y1JKCxfEOorqFk94zK/TMM/SwNPuH2dD6oaWZ7Gy/joqUj9f6/IGRZsA19G/7YLPTrT/geAJX4EF17yL4jKlioV6P3XDxIca1KDVN+qQeBDYZ0ZGsw5iQ3orxICR6/PRsoMXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788843491; c=relaxed/simple;
	bh=RgLJezrTBUs5CG3LnOFPDG4AOpylPG1JRVWLEgIQPGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJEXYN8/Oi6fikXrn97TyUmd4lZYAr0DaUGzSuosODUMYOc/AeSR0HCktnhGR9sp8JBXMrahka0z5W9efXmKlwJ6vh8jRHH9kUAG9AFT0scoIP2hO5TaY3wotJ81kw9tAyV20wpBiyExhOB67eang5brVDeqdHp6pBKdRu32xAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ja7ANi/Q; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ja7ANi/Q"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso512981cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 21:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788843488; cv=none;
        d=google.com; s=arc-20260327;
        b=rKRhdcpLwwbrRVZeUBLWlE7iGcaRsNLR/+yw75WyOmp+BLyrWMpO9PPFHt2hpqkNbC
         bByErdCke9NVnyThVq9mSvWq9aVni0h/B/h0XP6OkyULT6Bb5GTymrAUWAng9seWxjpQ
         MnVwaAqvtaaPvedF9R1YRIP7fOTQPTGQgWFo343tdFFR82b293o/vbnclFB+5XnCgL+c
         GvmlD6giLU3tFcbHHdoJ2mKbaWEMhTCG+kXdcCk+X4Lr/dT6LLNQ35fbncQi+hceU8V5
         DnUXVfZn0Ef8BiVeDIRjqve9lGmZG6aTEezk3hQ5gQ5jwoSGdsOcGnm9UNdUcK+POF3s
         n+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=72ehCLFMyNfTgkqst2/aW85nSHtZnpsBG16QZCxLCCU=;
        fh=iWFiLtHUXldM+SSGKUXGejE7GcugJAGY9bEztqAJCxI=;
        b=DAj4LnplDh6IVMV4VvU8Q6nHo9pcra5SgoIclOKhjb6Y1B940DusCmjHlp6nEbwQGF
         /GSAF2/Y+n3BvpmqiKN/O0y3bHz5i3q5gvq2MHg4aDScVR/O1CGL4DLxtwFbPI7LkMES
         8EH6WxXFT56eu7FvkDUrAIxTPWf1RVh9XpkFCqc0j2Wehailvwb+FEHvk5DSSio4hoNR
         jQ+s5/jIxWFct/a2zQZvOwP2qAuKqcTBrmk6Mn6S+vc9SbWJV/qqkroSF+GOIisYDd78
         CXeddYe4yQdQ/mn1A9kVNOBtf25HBKaruzcxwcvlvRO1zihOdVf0JQr6ON6Zs8fseo5X
         YObA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788843488; x=1789448288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=72ehCLFMyNfTgkqst2/aW85nSHtZnpsBG16QZCxLCCU=;
        b=Ja7ANi/QfO8JQ96r+R+Te0+n1ZblgTrtam3QeDRQoc2mlfZbO2qw12qyvq1k+NhzeA
         VtZfNwia0lgLaQkMAEmhFYbMwLyZgTuYOA02zenVz9kU6nWbdso93EN3fqzu7qdkiOh8
         D6Vn/53mMVxM9CKzLq5qgylWFhJTkvbAfi2G6J6q7o6ussrF8lEDwGDdpSTCi0E1QyjK
         LYr3JxJtllVst9y+QSuRqmfDofJWZjIIXYXJliIPpkZBQ3b6kUw8R1Qg/JVLxh5Rn7MK
         zq9c1ijWZQxC417heZG/OC4Y+vBP4JGZpAyETOuJcIOAc3QyIPTNPYe/9Oiu+FOgBf6b
         WTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788843488; x=1789448288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72ehCLFMyNfTgkqst2/aW85nSHtZnpsBG16QZCxLCCU=;
        b=f41LoL9e+W1yKnCh4sdgUttBobGZbLLgjNY7xT7of4PoddglpW3M31Mzq51yfGN1fa
         hVoTlliRi4A1YoacnNoES6Q7ih0tXlE8btp0ipGaSInmWP4J/9uyqeozM0ZIN2JmYygw
         Fyb/A7P7KMIKsarRix/Hi1kv8nmADm60b97AKlLhiMfj6JpXJXSWG04jYAtO4vxeOrFP
         Si/tlb+8easblaYtV68uP0BHv2pGrhDfH7zbkk6iUlctyTtGJMEPmj8FQgPvPzZQd4/a
         Fc0yyzw47Yt+aEuhSsIWKdaFpq3e7oKk2aNHdcXjtP+I+mXgFTL4Ocq4XbdjsMwsm2b/
         cPyg==
X-Forwarded-Encrypted: i=1; AKwUvBynCqhzUDtEfFXp3QG45J6OL0LgS5jrN2gOj95/lc1z/W3wZtQKlkp9k8nkWTPGQUv5sF/zGqsWezEquzqmUKc=@vger.kernel.org
X-Gm-Message-State: AFuF++nHPg6rffZMMP0O3kHI7WOly4/KqUAl4Tpl7nSQ4Mo6FronjCxY
	YBPXob1Lze/CzD/oEKQsz46U+oPG9vAzmdiF8pxw8W0Yze7RyuJP49pN8i3aa1XIMD1xjdOotJ1
	jLctEY5/oheRQXtyL3SBFUWFP5NF+72WTYUxXqTvb
X-Gm-Gg: AYBFou0s4mtI8nW2u7B3CM8REKOb6qdlJ5zWm19WtxrxI5qmvpmGzfrRlyv/q+m0p61
	9yafw4swCzAlYzjZQ/bYFceGeqHJgXEyurCtoIHWjPnAvf2ELjmjT4mQDhY+0eKGzeG7evAnjio
	9lhI1USPb1CVsr6bhv/xKADPntCSh6SIs4+dNe0eT8iFhY7d4xSGVM+0N0UMZMaqhmFkq776sWF
	h9AJXFoMWUc0blQC5vCTb2y8RM8d0R0PRBGWe08/hEZrbPuUFXRUHV7TX1PnooTX0aN3SFqMyWr
	pEmc43FaATgK9/4e2YTMP/IXmpt55YrwKBJ8L0FX5yqMPQCkZta0vg1NzO09J2syOmmuf2DwyUK
	L8rAg1ulLF64OI+Y4VQ1SltsUA2z/5NpAy+yQ2A4=
X-Received: by 2002:a05:622a:2b0b:b0:52f:4a75:f840 with SMTP id
 d75a77b69052e-53082b07b6dmr24762111cf.9.1788843488057; Mon, 07 Sep 2026
 21:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904031912.2133476-1-tweek@google.com> <20260904031912.2133476-2-tweek@google.com>
 <4468d220-9d7f-47d0-8e5c-c01070ab2d47@kernel.org>
In-Reply-To: <4468d220-9d7f-47d0-8e5c-c01070ab2d47@kernel.org>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Tue, 8 Sep 2026 14:57:50 +1000
X-Gm-Features: AcwNN1Vv3IgsdJ48TcwQ9T2zgBF6SbU0dMzFnoZRARrkmuhvOX0r_mwDFwUWnFQ
Message-ID: <CA+zpnLdPu+os2SFU1UxR9ha0NqYwO52Hr9ogk2zaEUHLLcv1XQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpftool: Reject non-autoload programs for
 light skeletons
To: Quentin Monnet <qmo@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, Leon Hwang <leon.hwang@linux.dev>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Sid Nayyar <sidnayyar@google.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:24=E2=80=AFAM Quentin Monnet <qmo@kernel.org> wrot=
e:
>
> On 04/09/2026 04:19, Thi=C3=A9baud Weksteen wrote:
> > When generating a light skeleton (bpftool gen skeleton -L), there is no
> > libbpf runtime object or bpf_program__set_autoload() API available to
> > enable/disable the autoloading of programs. If a BPF program in the
> > object has autoload disabled (e.g. via SEC("?...")), bpf_object__load()
> > silently skips loading it. bpftool still generates struct bpf_prog_desc
> > fields and attach functions in the light skeleton header, leaving
> > skel->progs.<name>.prog_fd uninitialized (0).
> >
> > Explicitly reject non-autoloaded programs when use_loader is true with
> > an error message, preventing the generation of broken light skeleton
> > headers.
> >
> > Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> > ---
> >  tools/bpf/bpftool/gen.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
> > index a50540ef6521..1583150241c8 100644
> > --- a/tools/bpf/bpftool/gen.c
> > +++ b/tools/bpf/bpftool/gen.c
> > @@ -1340,6 +1340,12 @@ static int do_skeleton(int argc, char **argv)
> >       }
> >       bpf_object__for_each_program(prog, obj) {
> >               prog_cnt++;
> > +
> > +             if (use_loader && !bpf_program__autoload(prog)) {
> > +                     p_err("program '%s' is marked as non-autoload, wh=
ich is not supported for light skeletons",
> > +                           bpf_program__name(prog));
> > +                     return -1;
>
>
> Sashiko is correct, at this stage of the function, rather than returning
> directly, you'd need to "goto out".

Thanks for the review. I agree, I'm not sure how I missed that one.

>
>
> > +             }
>
>
> Thank you. Maybe consider adding a word about autoload/non-autoload in
> "bpftool gen" man page? My concern is that users who are not familiar
> with the notion will struggle to understand the error message.

Ack. I'll send a new patch to skip over these programs instead, as
suggested by Leon in the other patch ("selftests/bpf: Move verifier
failure tests out of test_global_percpu_data"). Thanks.
