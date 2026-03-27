Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA3A31716B
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774626304; cv=pass; b=kTxjYqe/oPTPU0BiIM8cwBPJOcKWa0LLFUXecY0KeQIvHlqxXXRd1PkxTPhmVROAHG9+dUd7HCz3oZ5hSborEBBcRCF8w9Do9TQZe0Q499TCDy7V9ZHx0UmQfSfXJerTo1nLEMRzl+1aBaZkaIQgIOP4buvXJyynGz5BYDkjfc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774626304; c=relaxed/simple;
	bh=40mmVCv2uq+EcnxMirNhzQKqSJlZ6U/4w5ziU0gjUWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQQH0Q4gG+XStPOSl2yUzv3ZIjGgSIFoY6HyKKBu3BsYjsg+OEuS0J1Z2xHkdBcbRL3axlHTg1CJnofMTXPHqoNnK+zi1clFqTJUoV7otrHHs3GAtFe+/4pp88keSVCA8bdInzVW/eBtuSIvwaAZm3o86Y873Jf7noosgIvy3yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtXI4djA; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtXI4djA"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9961e4f71bso360631766b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 08:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774626301; cv=none;
        d=google.com; s=arc-20240605;
        b=dVPEAKULuwFHoeddbjP/l8qzoDnXzdzU91C+RGvdFUQC1uSQZ0+o/idEkCQ+axL0I8
         2ktlF00z2iF4QZzVxAE8qbwdQmJB5Vc41L+3DGF8e3dZLlhsOJq0Y/RyuhGA3Xq1r/bd
         Ap+JoH4Ww7NAouGHI3iXEMuywlilaXsZgWQ2IJz6XxoyrvXJfCvPL5M3qxgFNR8SkeA9
         LleXQZEVDhr9huRvFBS9I0uvcmwXfmupEaRt6SKgMJKqt+o51hKEwYeBwZ/lpMyP2S2C
         QzICQPCMWBY60nayJeLvt84k0WmPawp8THAbnwr3XX9EnBnvHQMz/uMqBqB0GwmOAG4q
         Kw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=40mmVCv2uq+EcnxMirNhzQKqSJlZ6U/4w5ziU0gjUWs=;
        fh=qFEIowLJFhQxTuSBkcqwINegt/tMAdAhtuB2uvMlnyU=;
        b=Wh+3zAl467WQpQaj2Y35rvfhb4CQtghYp4j0hgWNpeogjWkb1b47IodbngeTVGlKYq
         25g0iaoJt/sOFdkQ8dPiRa+Jqi1SlngJ4Ec1jTAGY54CiVkVbV7+9kXJmC0N8sBKhYkE
         BBwsSjrs4t3YYzPUMlXXxG12hWXvIC7qh46y7iBbyQqziaF+Iscc0gZzei04HPQ1olXW
         3rm+U+RvhKYy8L+MEvawm9UwS+a4OKXumXKt2/htOMQrMpatiVMSmq2iLFa3gxP29MkR
         ntBG0DhJmG7py0QhOS7hVDAmkF/tmkJ0lufF76Pk0z1ShRs1OvNTlexorz+JUJxMLnxp
         g+xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774626301; x=1775231101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40mmVCv2uq+EcnxMirNhzQKqSJlZ6U/4w5ziU0gjUWs=;
        b=gtXI4djAhZlG73g19mjRy2/VFonqz+F7kL4RbUw1Z23MIIIPDpyAUI5vvxm0N4Cib8
         aas2ZU8xzt/Zt1IlbA1S1asgCC1nrifS51jIGs8TyLFnHRfBFTo8fRuAGeO0ZgGeICxE
         Aj74nqpeuHqPxr+Nc1D+WIgkjW0I79sKm0hMOlW5B2oUqF/vuFi4BJo9TwN2q2QlC/5B
         JjkVfaxKeU28tq2tqvhrRTDHxOCNnyPIGs3ZQ/naaCccFm73D012LwpGcCRTgyy6CVfN
         +MKBJox9bVfLj2FGDGnzq1Qt832GjbCi6OAQBAvui2iwfDs0XZ3Ljp56kmtu+7UtM7Tt
         +D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774626301; x=1775231101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=40mmVCv2uq+EcnxMirNhzQKqSJlZ6U/4w5ziU0gjUWs=;
        b=Hi+4rDfejWmrEidk060rFLko4MqrakagwMLJjwumc/Uy8v9WqGxOBGFahvEnNB7uaZ
         VSlPO4Hb4oztF+4SuDN/xQQKlCSK4DHy9h1jjQCkqir9R7f1vDMiwzEs9MFoKrqSyK/X
         BSFk6tdscI+QR0MbmIWOvUXk3q7AE1Cp2MyZkwk85nDayEPXfRZeULAwJ5MpCJ59iMxw
         MRn5hxhmevE+9QXBRi661PwQ0W4nP3TMmaHAJRw0gHiumsD12uDOkTDpE4Rcz4NfxFxS
         ApnMe+xAqtCnFiGEMJqZ4Du5WvN/FTdxFyTBMxKCKCgqFn+kDiGAPIuXwAjZSOpIrkXI
         8AUA==
X-Forwarded-Encrypted: i=1; AJvYcCVhuUzZM0uP3Zv8vMluk68RJytYIMzELon1CqoE9aSMXr+rlEuoPtclKDh3d0+QbP6fyTzjsR7G1qtzUdD9+94=@vger.kernel.org
X-Gm-Message-State: AOJu0YydvZH9K4KML56aeCIf7fvTkOOa6H/Xc9yAz58NS+42EYLCGxc9
	KfHs2iYR7j7mSXsjjcIh/8ictEqbqShjLdv5aQyj+qTNQolQ+oRd36Unh+EpICT3m6/Ab6CSeOJ
	ZpyUmI1FphSFWX2U9qfTg6zkQPGfABLxHq77U
X-Gm-Gg: ATEYQzxuGbBBMFZtsYw/Y93ag/ixxhfaxP627eHRin06E76VENUCbu1bILUqVQ5XpVj
	0H677v6YBqPqIvx7JquSSH5enppT/R1+TZkK18KkCOzDo3CTp3dvLxZgXZ2JrnL6y8ysYCvpIhu
	sKJN1jRA+Cw4qNYc3gsOc4pnDQS29+4S171zm/PnBJ91tN/VKAOA/rQSsqgTB4sbgaCXVsjxts1
	VGR7Va2CeIdxSbFwMNgdHPgABm9bfNpuZhhhuARJP8uobRNJvjUselySwmqHsh8BfX9ngUPoep7
	Ignva2ghY+8W3XSqFRp0Hw5vs8XjPEFQTsVL6q4=
X-Received: by 2002:a17:907:e11c:b0:b90:7fac:c668 with SMTP id
 a640c23a62f3a-b9b50312597mr151970766b.11.1774626301062; Fri, 27 Mar 2026
 08:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327141616.1961457-1-hayatake396@gmail.com>
 <20260327141616.1961457-2-hayatake396@gmail.com> <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
 <CADFiAcLvdjE7zwqf-hpH01jnbxtnWQNoj4+zBwK0+RU80-k9bg@mail.gmail.com> <CAADnVQLR6Y94wKo1G_4w0-xTPdR8ws38oGu3xfHOXxNKcqjyWA@mail.gmail.com>
In-Reply-To: <CAADnVQLR6Y94wKo1G_4w0-xTPdR8ws38oGu3xfHOXxNKcqjyWA@mail.gmail.com>
From: Takeru Hayasaka <hayatake396@gmail.com>
Date: Sat, 28 Mar 2026 00:44:49 +0900
X-Gm-Features: AQROBzDUZdbXu3NU8UK6OXVcQkaAEutR-Vuvd_IgNdNnVFG6OEs0gxLIHyQ4_NM
Message-ID: <CADFiAcJtjVHYVQeYJ_znVsjiJkEBmLfOafp5srY0HQMGwVtiQQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, x86: patch tail-call fentry slot on
 non-IBT JITs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood. I was a bit surprised to read that this area ended up taking
months of follow-up work....

One thing I am still trying to understand is what the preferred
debuggability/observability direction would be for existing
tailcall-heavy BPF/XDP deployments.

Tail calls are already used in practice as a program decomposition
mechanism, especially in XDP pipelines, and that leaves tail-called leaf
programs harder to observe today.

If fentry on tail-called programs is not something you'd want upstream,
is there another direction you would recommend for improving
observability/debuggability of such existing deployments?

2026=E5=B9=B43=E6=9C=8828=E6=97=A5(=E5=9C=9F) 0:21 Alexei Starovoitov <alex=
ei.starovoitov@gmail.com>:
>
> On Fri, Mar 27, 2026 at 8:12=E2=80=AFAM Takeru Hayasaka <hayatake396@gmai=
l.com> wrote:
> >
> > Hi Alexei
> >
> > Thanks, and Sorry, I sent an older changelog from while I was still
> > iterating on this, and it described the issue incorrectly.
> >
> > My changelog made this sound like an IBT/non-IBT-specific issue, but
> > that was wrong. On current kernels, fentry on tail-called programs is
> > not supported in either case. Only the regular fentry patch site is
> > patched; there is no tail-call landing patching in either case, so
> > disabling IBT does not make it work.
> >
> > What this series was trying to do was add support for fentry on
> > tail-called x86 programs. The non-IBT part was only about a bug in my
> > initial implementation of that support, not the underlying motivation.
> >
> > The motivation is observability of existing tailcall-heavy BPF/XDP
> > programs, where tail-called leaf programs are currently a blind spot fo=
r
> > fentry-based debugging.
>
> I get that, but I'd rather not open this can of worms.
> We had enough headaches when tailcalls, fentry, subprogs are combined.
> Like this set:
> https://lore.kernel.org/all/20230912150442.2009-1-hffilwlqm@gmail.com/
> and the followups.
