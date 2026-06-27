Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6731E822
	for <linux-kselftest@vger.kernel.org>; Sat, 27 Jun 2026 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782580496; cv=pass; b=F/uwICm/d3Xf3ve5XaemLP3KpofnkyhTRhY2uytaNyCGSGNfQslCkrlEM+Ai4nmNM0BIT/Oip0/UeWYnSZA7cwOgAbTu7PUjrM0qhBhYoXOpHFsghAviU00iMEQVIeHXvT9IXTRB1OLFwUUDLaw2bFEE5EW4MHqbmqQeyBJuL5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782580496; c=relaxed/simple;
	bh=Sa5hldT2ZYg6r/+6wae9/5GH3ZUXIje8CvnHz152sKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNfTJ7sfMYd0RnjCFqX8cuc7sj64CtPgdc9OUPfxg5vCxJTABGaoFXV63Goc8f0Vr6aW0/nkb/Drz4F8m/4+MgyuoGATDF4kBP1h7s4m0xHw/cF4Hvb2WerBTEbDfinBXUfYTHt2LeH+YCRGQYWMxx1EJ2oocYnwqKJF/2or6xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sr4A3Lla; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sr4A3Lla"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8eefd4a8057so122606d6.0
        for <linux-kselftest@vger.kernel.org>; Sat, 27 Jun 2026 10:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782580494; cv=none;
        d=google.com; s=arc-20260327;
        b=YxLa/ApoKqG5jfmtmaPEMfyIc6xat1dMBWmM9nXULqaxBeRmkDHK1EpvViccx9HIno
         h5YbRZwGirIQdxMvsSlvbr9nIf/y596WnZuLP1MBhteCWPpiTgFEnUkOZErr3O6NPk11
         C9Ew5GUFqDsBodeRgazMkKvqSQ+nFq1qZjsUJi5b+FFgFv0j/Aw+PM1JUR7l6ucxK9Pv
         eG9Hsg0e7agy68Bh8Sfc1hbyn2KbH52qGD7AxGB1VsrisqfqvxIrDgFZ+2xnVlmA48+C
         7wghp6NJlpeWc6T+Kcr66liMRh+tKw37ibTP/+3937Sxs+F97xDY9Wq6uA+q1nuXg94J
         /02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rndg724fhT2gi/rg6KYiyv9At6WA1DcoE2rGnTpaLCE=;
        fh=c6I5NH1MkYmLzYNkGeyod56lY7z4GGUrp28RSMX675k=;
        b=MBzl9BNwpc8XmXfzxQb2OUwm7NY7rxNgxWQJnbXvq1jsqZwSh/6zvWyaKpkUCSW3hi
         ercZezgdADM2upt7QUKda+azkNKFsaIsO8hyAzOJ6PM1I4AbmgwNRRqWEc1jtszMJ4eh
         Xg1zgH2FBLKWxZ76i+2ZRmnmr49SuF908rW34JVjgtqHJgt/Ffc/qIsjZSk4neOm4hm0
         ejs2wMyYZXAsYkYE1jvDcOs+ELvkANW92a1JI0WEJsI+quMaK2CJEKhdPEX+ksf0ggP1
         weKiZuLGvMaWe5bbANr1fQaevrlFqGF8TXlekZHUrFUVAKFaRFxCJ/Qg6fZ5F8XwDlVh
         gV2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782580494; x=1783185294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rndg724fhT2gi/rg6KYiyv9At6WA1DcoE2rGnTpaLCE=;
        b=Sr4A3Llap4xpgm6N/Byyxzb/2ebidz2f7NxcQCmtHj5IFBFtYsCYTSdSTKuYDoJgNz
         4a4e2lXiwCwdsfwWzBvQZ9Qr830N63LWHbtERvyFZBOIxXu6Y2wq2hKR8otHmxtjV1It
         BngyI4flQYia9MN6hndbKiJtFwNPCHXY7XH/vdzJy9h/V5Bo7MKMFDkOJcrBrxQmdxIT
         LGREonmCqa5hkEb1rvr8EN/co8WJV6u+LSiUrU6cUGyZzgcvBosN4jmoyHxRiw2mctGS
         Qptx5FIeajeU+wSLda9rSFth6t1alBVU1RJwcHPdn1ELaypGcLYE/CELuyfcOSbNBWPp
         Gatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782580494; x=1783185294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rndg724fhT2gi/rg6KYiyv9At6WA1DcoE2rGnTpaLCE=;
        b=hc1d2ckuwSrkdZYG+/Em8y8zj74MM6pjijKoEE+WE3sQAWgrmCGSJ+wOCKjwAnrROc
         wmWYPxlMgtdWY0JGq/OHzzoPTHKurB+jZ8siLAq9huHp6J8mtvsCfBa5IOIQ3NdKjfot
         jEcecIDBkuyXRaYM9Yvpg0P9H9KsYIlPAUlROa7mZ+ROmeJXxMCJ/lVK0I/7J6eWZNQ3
         EP+uvsnpVJM+IqPqdb6ZdSqBKejFzwqtjwQ0JYEq6LVqZJ+/ISqmuPtXSwMitw1ZWYUe
         d8xu7dbk759khE43dCESd4Cprl21RKpJAI54TitRvMt4mz6Pqx10nJ2HJql+J5XSEwg7
         EnUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2tDQdfBfqd59SNifnHS+yaaX0uUCeaXQCDpPN4/LiAD9plVy5xaniLcuCTxWpeArVNALY34QNNnOa/rBciw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdCNn2mRYJZhCHFxhZ+DkYhpET9E83ntIal7G7nlNZZ4Zej78R
	LT1LhWCkr/jjTmY7mkt0WHz7defhNpKQzSeGiMeoulGVidk4WUACxQ+rYVPy0hpnM2j1jRlFfAQ
	+aSUB5j4s66horvqOPg7aMmoV0ED17u8=
X-Gm-Gg: AfdE7cmAlx43xiRjYDbH2gGjkkrke+RvGNaGoF1eYFRY3IOc5OZv2tYxLCovXWKu9W9
	j3VMDvEIDbKoaIxmKZT8hrt2M4u3JxNdaFpS5xzViijoqpZeMfKhENxpjXEEPn9p6DDpdMtHk5W
	FupHJ2YOp9QB89BtvuUY2GHDJqlJ3fxWU0xNNhjFVWhpMK3o7cw4r+RFL3ScJARAt9VQJcfHMVl
	oCypVjZ1npWR/YOQOf1caoYka4d4WN9lUQ46FYa68C7HDUBTehRjhQIZm4psJG2yuHx5O9vt7oW
	JBGZs2dlM5/nvzQtW8ZVoHnO2b4=
X-Received: by 2002:ac8:58c4:0:b0:519:7559:3937 with SMTP id
 d75a77b69052e-51a7276b300mr173294671cf.2.1782580493825; Sat, 27 Jun 2026
 10:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622183109.1137245-1-dwindsor@gmail.com> <ajqBkKE8TpQL1mIG@redhat.com>
 <20260623125725.GW48970@noisy.programming.kicks-ass.net> <ajqJNju6MY3B0S2F@redhat.com>
In-Reply-To: <ajqJNju6MY3B0S2F@redhat.com>
From: David Windsor <dwindsor@gmail.com>
Date: Sat, 27 Jun 2026 13:14:41 -0400
X-Gm-Features: AVVi8Cf2BLETcrC-Y5ycMRcxCYiENER-6GwvG2TtezK7GfUOEgSuV7OQzuRAuW0
Message-ID: <CAEXv5_gFBvtP9HZrQ14VAYpFbrY44o0+Qw9i=c6GM1Mnp4R83A@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/uprobes: Keep shadow stack in sync for emulated CALLs
To: Oleg Nesterov <oleg@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mhiramat@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	shuah@kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 9:25=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 06/23, Peter Zijlstra wrote:
> >
> > On Tue, Jun 23, 2026 at 02:52:32PM +0200, Oleg Nesterov wrote:
> > > On 06/22, David Windsor wrote:
> > > >
> > > > --- a/arch/x86/kernel/uprobes.c
> > > > +++ b/arch/x86/kernel/uprobes.c
> > > > @@ -1246,8 +1246,12 @@ static int default_post_xol_op(struct arch_u=
probe *auprobe, struct pt_regs *regs
> > > >           long correction =3D utask->vaddr - utask->xol_vaddr;
> > > >           regs->ip +=3D correction;
> > > >   } else if (auprobe->defparam.fixups & UPROBE_FIX_CALL) {
> > > > +         unsigned long retaddr =3D utask->vaddr + auprobe->defpara=
m.ilen;
> > > > +
> > > >           regs->sp +=3D sizeof_long(regs); /* Pop incorrect return =
address */
> > > > -         if (emulate_push_stack(regs, utask->vaddr + auprobe->defp=
aram.ilen))
> > > > +         if (emulate_push_stack(regs, retaddr))
> > > > +                 return -ERESTART;
> > > > +         if (shstk_update_last_frame(retaddr))
> > > >                   return -ERESTART;
> > >
> > > Well, if shstk_update_last_frame() fails after emulate_push_stack(), =
we should
> > > probably return another error, so that the caller handle_singlestep()=
 will kill
> > > this task?
> >
> > Makes sense, the other user has a force_sig(SIGSEGV) on failure.
>
> Offtopic question... both shstk_update_last_frame() and shstk_push() are =
only
> used by arch/x86/kernel/uprobes.c. But they are not symmetric in that
> shstk_update_last_frame() returns 0 if !features_enabled(ARCH_SHSTK_SHSTK=
),
> while shstk_push() returns -ENOTSUPP in this case.
>
> That is why the users can't just do "if (shstk_push(xxx)) ...". This is r=
eally
> minor, but perhaps it makes sense to change shstk_push() to return 0 in t=
his
> case too? I don't think -ENOTSUPP is actually useful...
>

Agreed, will send a follow-up patch changing shstk_push() to return 0
rather than -ENOTSUPP.

I'll send v2 shortly with the additional call to force_sig(SIGSEGV) to
balance out the callers.

> Oleg.
>
