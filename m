Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A493A2D028A
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 20:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064552; cv=pass; b=nLgbBC8mm/59twzi4OmvJLn5dUerdnbgna/4kXAtvsRnuR3olctIWTeAyWOg4L2i272YFscuv9W1MO6psSp1xfcOTszOxflhmvdDKJwFQXtY6F7F/WGMdwpvmrMMmZMHUacXd1u9QfFmQJjEWiy5jio5t5d2798xt8rLsWvQr3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064552; c=relaxed/simple;
	bh=tyQib1ceuChbfkwzIJdjciwjxIFvP+Qw5nCmw62hwHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4pu0val7oPY35AiGMBOVZ7ekB7auatnLGbmtsKGWh1MQLOZHiApPGP855rxJHEW49c8UJxB9337KvTkqkdPCAB9t+mx7gSwoEykET21MozNmXz9txZjn/LNyM/TpxcxK5mjcO6eHO+xISt4BaZ7tQ2ea270nBCz0yT7qWbtoxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z1n/yRr9; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z1n/yRr9"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-652fe3bf65aso74a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 12:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770064549; cv=none;
        d=google.com; s=arc-20240605;
        b=VwCygcj7gc0x++BR4Rt7qBn5DXX/6qfgiUrrVwQUat0kWLyiRURGqMoDlMTgcdZaZr
         QvEqko3RnLUlgUnCbgMxUxWoRo7erHTp05Enc1bYVPnDLeXmSvyUPYhQruUfrkdrW6m1
         CI8j4TmQtMWzjxPPd3RWoI9R6wXhepeLxd2RiZrOtbo9WOJhAaWW0Kg9xi4NeltuRWqK
         pGqZjk7HGQ9nr3xZjTBXvtlFFMLw0AD/ExhRCGof3zVCtsvBB4FCOnFBCuc4rAtlKsPU
         LoldsuxwHN1SwlZTFBuy2zEBRsoPen9bb26nVBboEwg4OrL1dQRJyElaYunJ0tgo2js0
         mOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TimSe4Elag2lScoYOa5FjhZsLF0DWUzAectjzq7ujCo=;
        fh=DFKCNW18nMzSFL9M8a/XiLt1kZiteTiWB3nFXO7MWyo=;
        b=c38iQgD14CwEanjfVHd3jlBt0UJRgqv3bFZsw9LK8p8WAePysZMwO9esYlcEgHFsZk
         a6ep44zhp6PHxev/jWEHKLw6S/vnX8OiNUYv3qXH72aYntzB96jKvTDoFRCJzkrS7Xzt
         RN6+PgZWQG7I1CVf9rb7Vh/VOyM+M/rVJIPOz6EjI5N4WHgYzmUZxzZEnjoEyzMtD7Re
         bNpQ/N5KmEauD+iibmaR3yKQeFRibdVgnAauitn/HGlhwmVEwh7Q1kenh8ccO303+T/6
         HuaUcgPSCY2XdR71e57paGTU7E7vXOra8Y1YwxSBGRXjKV8Ne5SiwUuyYqrgvE5P3exo
         6r2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770064549; x=1770669349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TimSe4Elag2lScoYOa5FjhZsLF0DWUzAectjzq7ujCo=;
        b=Z1n/yRr9f5uzvsccoW+TWbHLUfmDT3XeyUUG2yuyyR1StvGWeE9aJwQd/Gjoa3IEZV
         px2oy6exQlZ1lS+HwOz00bJMXLwD67RcLfpou6XSKtfKjqrm500C7OC+bhJ1CfaeAzqO
         EiEvBLEUlFlf6XOGphzlQMZoUUUQbjZEPyHAqdsFKpFXdi3Kel+EPxqnWU4jORpoRdoh
         kgcBQ2OjwGUey1Ra5hK4Bwwz4u7hirPJlBz/eV+puOF9YITZkGmCtJkJ0JcrYG34H1T6
         vtYhjAXbXPJTnRg8mbmL/p/4jKkAKP/nbF1u08MMrShhSyRqg6eEzcaNS1qJ3sjx982p
         mb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064549; x=1770669349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TimSe4Elag2lScoYOa5FjhZsLF0DWUzAectjzq7ujCo=;
        b=lz5TFXFIn1KrUVwibvKdRIty36vMzFQFT3hVTIpq+ZOQ8ucan86RlIJefad7YRZnPj
         zBlCsnGtlIxIUclXj9uu/FesWzVbkl9luyDiTv5pQ1Ip0qmgdEZ15Dm62hu9mM6SbBfh
         zpcayh9jND/IoaOQGg4NUnUs+MEQkPziyaeqeUbhrKlQPVJjfjawxE9QbjaTnQBdFUpZ
         msbEOgCq9nj7mG3t1e4kmejVRHxHNu5KjJa07efrT1HJE/cD+7EUz5Wc6Lc0WEZ+SjpI
         5mowsXAu3RTseLy8qSTGWywmuZIjJw4sx4yCvKq5Mg6qCLj/EaSbHq8gS1TDbz0uqGTk
         z4cA==
X-Forwarded-Encrypted: i=1; AJvYcCXxel8aNft5m/V0O/gtwurU+P4N21lDdq5t6nWQi/n7nm6SU7TYTslfnOSnjo3/5Yql00UQyBb0KVHwKdaw+/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHk2LZ1qVW67HNj4FIj4WQWxYc4Z3dbGXKMqZtVJIjJe5n810O
	8W9aJ1KAKp2vwdHW4nuQsKDVdZFdl6c92ZygrI4cXpCoMEkafjtZPNw+4OiM4ZXRY/VJ3PjeKsR
	v46F1T/MCMz0cIVY37AnQYupYcUM9CPygvh/L2bQP
X-Gm-Gg: AZuq6aKQNw9z4H73iygBT4DX1uqxpyZrHy+Qi9PWuIEgr4Ks88rDHnsFh/KssgPCxIR
	DpJm9YG+gfjWCc4+71U6iRISsholIuvSa9zba5SQozdmwexgiWbWN6Oy/bFhYr/kO4E4gk1Uu19
	5Px7lrVGI2f2NKKVCOAEmaOwbDtBwfcRkCgo0wKaa4N3gh3Tdh+roFqt44shz+BRCK54APR1hZl
	sY9hBd6ezHFMFszYtnw/ZlG426kwPakTy6NnCtmG2mtu0Ln7cn+7zvDAeCmR3Dn+S6Ztos=
X-Received: by 2002:aa7:d50b:0:b0:658:eee:f21a with SMTP id
 4fb4d7f45d1cf-659346035a9mr7853a12.10.1770064548804; Mon, 02 Feb 2026
 12:35:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115232154.3021475-1-jmattson@google.com> <20260115232154.3021475-3-jmattson@google.com>
 <e3j5qgrdjad7ura7kodfzcagynvrkxv227ddg3jfjknzewvyay@h5pb67muiycd>
In-Reply-To: <e3j5qgrdjad7ura7kodfzcagynvrkxv227ddg3jfjknzewvyay@h5pb67muiycd>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 2 Feb 2026 12:35:37 -0800
X-Gm-Features: AZwV_QiDOXtc8m_XNuNL5oH2Ivi2xScAYY6eNR1dbMaYxG9uGGtsX74otJesncA
Message-ID: <CALMp9eSUg=iu69S7jqW_Pt9d88yUbmr-+xk2hW1zXPFzaCM0FA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] KVM: x86: nSVM: Cache g_pat in vmcb_save_area_cached
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 5:28=E2=80=AFPM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
>
> On Thu, Jan 15, 2026 at 03:21:41PM -0800, Jim Mattson wrote:
> > To avoid TOCTTOU issues, all fields in the vmcb12 save area that are
> > subject to validation must be copied to svm->nested.save prior to
> > validation, since vmcb12 is writable by the guest. Add g_pat to this se=
t in
> > preparation for validting it.
> >
> > Fixes: 3d6368ef580a ("KVM: SVM: Add VMRUN handler")
>
> g_pat is not currently used from VMCB12, so this patch isn't technically
> fixing an issue, right? I suspect this only applies to patch 3.

The fact that VMCB12.g_pat isn't used *is* the issue. This patch is
part of the fix. To make the fix easier to review, it's broken into
several pieces.

> Anyway, I think it's probably best to squash this into patch 3. Also
> maybe CC stable?

I will squash it in the next version.

> > Signed-off-by: Jim Mattson <jmattson@google.com>
>
> If you decide to keep this as an individual patch, feel free to add:
>
> Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>
>
> > ---
> >  arch/x86/kvm/svm/nested.c | 2 ++
> >  arch/x86/kvm/svm/svm.h    | 1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > index f295a41ec659..07a57a43fc3b 100644
> > --- a/arch/x86/kvm/svm/nested.c
> > +++ b/arch/x86/kvm/svm/nested.c
> > @@ -506,6 +506,8 @@ static void __nested_copy_vmcb_save_to_cache(struct=
 vmcb_save_area_cached *to,
> >
> >       to->dr6 =3D from->dr6;
> >       to->dr7 =3D from->dr7;
> > +
> > +     to->g_pat =3D from->g_pat;
> >  }
> >
> >  void nested_copy_vmcb_save_to_cache(struct vcpu_svm *svm,
> > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > index 7d28a739865f..39138378531e 100644
> > --- a/arch/x86/kvm/svm/svm.h
> > +++ b/arch/x86/kvm/svm/svm.h
> > @@ -145,6 +145,7 @@ struct vmcb_save_area_cached {
> >       u64 cr0;
> >       u64 dr7;
> >       u64 dr6;
> > +     u64 g_pat;
> >  };
> >
> >  struct vmcb_ctrl_area_cached {
> > --
> > 2.52.0.457.g6b5491de43-goog
> >
