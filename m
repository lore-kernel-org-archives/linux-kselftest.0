Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F3332EB1
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765422; cv=pass; b=PJ7AJ3P0a1/Rln33p/ZqxXIR6YgYip+fsCFACV7CeSsvTuOHCzFc1BT8B5p/TmzBvh+rw5tis0GP7N91k8EWqKkCls6jCUYcRFxpdhXcrmzSykz3nHgGDONZhwsCOop+0wY8ruEH08YqRUHvhcgRF8QSoCxcuHpyBNYUsx53lgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765422; c=relaxed/simple;
	bh=rqL5Z0h2rCevncTGlgklxBt0211rUyUNLOZJCKCfihY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQeQeA+mxmSmByytZZUYjm3fqDPJQ2uAzxFaiZbla9WCkoRyKA616wkA7Fn3A4EZUU0Fj0SEPsNe2VY+hBlZAt59CQGUBlK2dtCtM9nUwUy91yTscxC+DtS8Y3pWR6iwKfcOCugZKE0bkZxGlSmZj0sAy5zW7wTTiiv+FkArnoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4i4mMAO; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4i4mMAO"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51af8fda4c0so11994551cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 13:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782765414; cv=none;
        d=google.com; s=arc-20260327;
        b=c1rKadE8aiWL16VhRolnimud0ZRoY1PPSCueaBQ1dQzxjzdKZctTA6DaG4Ac9EpA1r
         kVBkWaC+yg0qkd0yYdQYHXJR5QwvH1zKEh71rH0PkvrRWKdHLnXvBbKMufzwNFnKdxlE
         YfTEM4d3PoDPst9OhPq8YTBKhqFz2MEssSSXIjNbaPMEUundsqGHbHajsvIW0lxObA6T
         PBlnuvYb4s5wzrvyvO4HbARydMUp9pKDTycg4ATcivODGxJMYbdfhwMBY7ghopzf+uMa
         nat/F8MB1CGiuNub1aoZco2nVfeGZ5Pw/WTfXhQPh20Alc1TjGPvn+sJa4/jtTYRRxTt
         uzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9YIu+7FU1VHtbqvxCn7BGYzQvkGTmNtaVEMjWe5+3hY=;
        fh=3pEJAwNV37LC+o9PtRM6gB7sAfJacL9u/2dz1DBxSgE=;
        b=kG5IFKIucKjCQkWiDWP97vLOAVdh44fq8NW8/aq5PriXR2YXokND8ezIf7+Hnd3JaU
         W4lr7qLwsMu95VkQRugnvTXtbmzq4tFpKtIzcgg6+Bk21sGzzah8m9IyyMzFlxZm4jwh
         letHEMg81uUc30q9j0PYrdjYZPCSynh9i5MJdkl579/EMqp3v2hf5xf+GfaeRu8rb6R+
         n0wlk38l9Fw8siEPjEQwv+Haes8XP9GoadZMxF7tYT8Dd2Vdiwk9QVU/ZtvBSlGO8Hcu
         fELVtKjktfqjKPmLyRV4UmmgSz4E8H1Xa7hJmRKSKTaXoEYtG7TLB02GH0VataK4aPJL
         HxxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782765414; x=1783370214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YIu+7FU1VHtbqvxCn7BGYzQvkGTmNtaVEMjWe5+3hY=;
        b=Y4i4mMAO4HFGOj70muULFSSzhbwu3OOk6CXHdcrdku+pvdRhmr/TTjvJ6NXVUHZeEx
         RucGWbqu7R9EgjwLd5ZS2qep+Tbcp+oCWl69K97IPqBk0/RYhbFj3gxL09I5P63Q95sw
         FYTd0GGoAJy0Xnix4Sx8XVPv6nRjHjH0c5TeE72uc9sqO3pdJ58IWOYBWgl+TOZjAF/E
         J2DYmd4AcRhKBgLU3C+sJcynlcwJnDCg1+SDmuR2fnYVqqQKzpptvTWnIGfKV+H2oH4q
         6WIcvyqbyom4elmmgUnpQICULHKmkY5zA5uZVsrZ7JaAE4yHyH6uyTDFWFz6syBKrsXH
         GVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765414; x=1783370214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YIu+7FU1VHtbqvxCn7BGYzQvkGTmNtaVEMjWe5+3hY=;
        b=QnaDuMXQrNbM9HUnjqRX51I1qkgOmMUOt4Xe7J5BCn7/InkCtaCsTZY9OEA+QAlvzv
         8XwdF511lM3Uw/as31Bl6/gRFQuOAnR2Qo1keDfCbTITOjopmsy42/g371XRyYNWW7SO
         n8BKZ+YwKk6yBuznPJ2Tasy97I0bJERR5kk94bs5jw53Qn1v9+AOOgYD3bXXDSxwRrMF
         mUf3KThSlxhbuh1Q268hAGXL3yjlds8XNa5AHtyrIknXstGD6u+qysJ44d3cYgX5nd7X
         qAzOfyLTHGWesY0hplYXhFa0gdGZ+bSxIZM6qdYqU2YED43I+VNE27D8RBmYi3U2Q0+N
         WShQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QnSicUXbEXFjvYxHagA+nNVfuV1a4bDRq6wjF38aZaxO2muNlv2vjKGDSmw14oUe/aVkE0fXbkk3grnVTnGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiG9aKPkwwrQIe+Qk6emDt9Rh0pQSWn9auUPrRAhm9YTt0ra37
	DdbAj/FNyTpPLbulKzj39I+GEc8evTS/0r78ctMrAvbLsY7cWK17ZJGWCfbnMsLH4h3coqq9kPs
	VujIqAzrRci72iDZdUiJtIO74K/+rUfQ=
X-Gm-Gg: AfdE7cl2YYAYuY9p2yoAn3Gk5DoiVn2PLqiylBJJEU6/SvC9r0aiVyVxiyMID/mO1jx
	b1SlI1d/G3EOMEbnSSFj+yWajK2X6zG6TDYVxyoZcltphF62UHwDWcB7d4atQFe9eCYwxE3ncSM
	TA3mi9Nm3gNgbXBWDXB6PfcY2U7EcX4wXcWIS10T40wd2HMQ2kMIIMvN7NmWaZli51WyxF5IbJw
	ZZ2FqjXPxyZRvNdm8mbY+PXYfG+Bx8gs4plAPpqzNV7z9pSPumRWkQd6vJELuI6MVzRY3SuwO3D
	3yZFfESGwNdVG1Gx5msH0a8M+io=
X-Received: by 2002:ac8:7f4b:0:b0:517:146d:2db5 with SMTP id
 d75a77b69052e-51c10716dfcmr13137691cf.2.1782765413909; Mon, 29 Jun 2026
 13:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622183109.1137245-1-dwindsor@gmail.com> <ajqBkKE8TpQL1mIG@redhat.com>
 <20260623125725.GW48970@noisy.programming.kicks-ass.net> <ajqJNju6MY3B0S2F@redhat.com>
 <CAEXv5_gFBvtP9HZrQ14VAYpFbrY44o0+Qw9i=c6GM1Mnp4R83A@mail.gmail.com>
In-Reply-To: <CAEXv5_gFBvtP9HZrQ14VAYpFbrY44o0+Qw9i=c6GM1Mnp4R83A@mail.gmail.com>
From: David Windsor <dwindsor@gmail.com>
Date: Mon, 29 Jun 2026 16:36:41 -0400
X-Gm-Features: AVVi8CfuqcgWf9PxadWlEONY5GAlf5DL137qARv7peK2GzjuWzY2x-_h44kqHGg
Message-ID: <CAEXv5_isBBk7FJhuzv4n_WWHtseiiA5JM4AwZAsTBdRpx_L4fQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/uprobes: Keep shadow stack in sync for emulated CALLs
To: Oleg Nesterov <oleg@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mhiramat@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	shuah@kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 1:14=E2=80=AFPM David Windsor <dwindsor@gmail.com> =
wrote:
>
> On Tue, Jun 23, 2026 at 9:25=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> w=
rote:
> >
> > On 06/23, Peter Zijlstra wrote:
> > >
> > > On Tue, Jun 23, 2026 at 02:52:32PM +0200, Oleg Nesterov wrote:
> > > > On 06/22, David Windsor wrote:
> > > > >
> > > > > --- a/arch/x86/kernel/uprobes.c
> > > > > +++ b/arch/x86/kernel/uprobes.c
> > > > > @@ -1246,8 +1246,12 @@ static int default_post_xol_op(struct arch=
_uprobe *auprobe, struct pt_regs *regs
> > > > >           long correction =3D utask->vaddr - utask->xol_vaddr;
> > > > >           regs->ip +=3D correction;
> > > > >   } else if (auprobe->defparam.fixups & UPROBE_FIX_CALL) {
> > > > > +         unsigned long retaddr =3D utask->vaddr + auprobe->defpa=
ram.ilen;
> > > > > +
> > > > >           regs->sp +=3D sizeof_long(regs); /* Pop incorrect retur=
n address */
> > > > > -         if (emulate_push_stack(regs, utask->vaddr + auprobe->de=
fparam.ilen))
> > > > > +         if (emulate_push_stack(regs, retaddr))
> > > > > +                 return -ERESTART;
> > > > > +         if (shstk_update_last_frame(retaddr))
> > > > >                   return -ERESTART;
> > > >
> > > > Well, if shstk_update_last_frame() fails after emulate_push_stack()=
, we should
> > > > probably return another error, so that the caller handle_singlestep=
() will kill
> > > > this task?
> > >
> > > Makes sense, the other user has a force_sig(SIGSEGV) on failure.
> >
> > Offtopic question... both shstk_update_last_frame() and shstk_push() ar=
e only
> > used by arch/x86/kernel/uprobes.c. But they are not symmetric in that
> > shstk_update_last_frame() returns 0 if !features_enabled(ARCH_SHSTK_SHS=
TK),
> > while shstk_push() returns -ENOTSUPP in this case.
> >
> > That is why the users can't just do "if (shstk_push(xxx)) ...". This is=
 really
> > minor, but perhaps it makes sense to change shstk_push() to return 0 in=
 this
> > case too? I don't think -ENOTSUPP is actually useful...
> >
>
> Agreed, will send a follow-up patch changing shstk_push() to return 0
> rather than -ENOTSUPP.
>
> I'll send v2 shortly with the additional call to force_sig(SIGSEGV) to
> balance out the callers.
>

Actually, we don't need to force_sig() ourselves in this case, the
handle_singlestep() path will take care of that. We just need to
return something that's not -ERESTART. You may have meant that in your
reply, but just noting it for the record for when I send v2.

> > Oleg.
> >
