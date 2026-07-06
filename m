Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D807381AEF
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350159; cv=pass; b=K/6j5IuGpxmeQ0JqgehpIGpf3b/QPJR4IV4gNsF9JcQLpS629jvafSPNGUPmpkQja0sRo1exAW7KI9bh+Qls4xt3qTo8D2B096LVnoY638CUFxttfq7Bbe2P7++30qNgRTHofeELaLIkC3KRoStG3Ame8Biu8Kb3IRgMc79eEI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350159; c=relaxed/simple;
	bh=Wa+sxYzN0vgHAlrn1l7Ukd6+2CmTzNUEJPYH5iOPwcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZT7pmmcYq3cjLpOSmqSB+go2dgroQ6CZkNhiW0kcH3rtlq4AqLeTYAuxmnv5fxXW8D+yBwpY4izq7B5StmuhDhYP/df13dUWOFWizX8v2ruIdhtdSClwHz8IY6wJ1oSABY0lkVf6MAfXTiyQFrL5NdvkYF9jCM4ltgOI+MXuI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgtEeKCT; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgtEeKCT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1943108f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 08:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783350156; cv=none;
        d=google.com; s=arc-20260327;
        b=J44oat3kHtJyqFPhCYre8zV5S1opuoddT9V64+omF7jpHaB1xSxJDURDvdH6+QvSHl
         lYBqKrylMvPaIq1B7m6o6GYDxeQre4H3SYYKPU4MsvbF3IQucUWvjKcf14CPZRIBufat
         hmXi/qQKy0Ax8SAcuDePdefU2x4geVqJAW43GkFC81U73CyqifuJElgNhAuToyJ+LkrV
         eOwWmZUbsVAGorE7/4lJGli+w/31tQW5tQ1YR1Axse4RxfWZG2z5kGMtUbVG9begyL6C
         j6daDLKD24d9/sQAUZ8g2Ek98WI6SOCwiZRtl0MUk0drGdvoHR51mSLEPmxEsvdbDO+x
         7EWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c1Re96DzDAx3slkT4ts4QXijEXA4nc8QRoRbGyPo6co=;
        fh=0D6BxOR08Ozo96yJCAqIMgs+yKu/MSa4whYTPV6zASA=;
        b=PxQvKO7sbRbj83M0VD9ikdmn/rvkrfg1fxR078zzXVSQntlNNjw1hW58IEVv3l9QOC
         3z7P+TYlnL3IysxyklMqBidEpu2zR4eRlyj92QXaVSti6dPkjuGy5032sFEkrZctdyqg
         AmWcoX0Eq+IanBiV+sl9AAAsXtX3x27Fu+fVQ+aiWmPINT+d2HaSjz6MZvQT52HhMBMt
         OijYa0BZcdGTxPZokPE0O2LBvi8Dm9VohAdYq+4EyyYQyMzsE/FIZoActZMCx0/F3OPc
         hL850Fkpi1mySg9ykD0h3nqsE8wYAg72rFIYVAcmS9Z3GtSQ/gmDgU1pyLbFq1Y4eWsn
         yZOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783350156; x=1783954956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1Re96DzDAx3slkT4ts4QXijEXA4nc8QRoRbGyPo6co=;
        b=qgtEeKCT0BGk4TF9sUdkRP/+vGqXHYoRG0sP8mndNTb6xHHorVhYDo6oGTmgQ1eFII
         M74gEkmq/VMDIRLf4HtheiVvXCBpP7nxfvVIacR0TYkcxFP1fHRvLAfRRMqq1AHwdWDB
         DGANqlyFaDtLvldoF3GsiZClxRlprrR2wSuc35q7rLxLIuPgskTy2xNi4NNd9Q5UTplr
         WNEMWkpnDkUde9M1miMnScJvl9aZczNXoyfMxyIAs7MIa55LdqMcNy5yzEbbwAUr5YDi
         klX1JYYQ/YK8tMPe/ySDX2C4RJXx0JaQMdZQPuZBbC0hF95Mu81fmMG2a1RdmUNGfJim
         b8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350156; x=1783954956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c1Re96DzDAx3slkT4ts4QXijEXA4nc8QRoRbGyPo6co=;
        b=mtm0RhNFJG84+jwS+HKTEjP5SUNt7IFFeDhMXZbDvNSvyH+aJTGyXu42vx9yTitEBl
         Jf9ZmJwpuWZVLgZbuurkHNoKHMe3Tno9Z/iVWMhPoF7gN78SgIl/xl34KxT/0u+eDky8
         JBB+SAYvZ0g+o09rnm6buQwOvMv2USs9BPZd00rR5LVqAF76OnMbP9LMBFVM7whfTJOy
         zlyVRx+wqbdGwVjIIyd1dEbrNXVMeeiDgRZkZU/RZ7H3xLl/jB674aBUWRVY3wpvo3/n
         wYKxluWP/scbS/C8GqF19OBC32WeKfUyB9myqTMIMg4lh1peDv4aOQsDAoaUIKS1/CoT
         MoxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsYvonokWptI/bPcAnswbeI1dvZgSK4VCPr/oEhfsI/v9BKKqQblF1in7efowTK31qyyibAaM8CWGBpRjh2aM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSk4OVGnu1ra2D8VqEutmjfbQ+tTMgzgHL3MvoxBiskjUyZvYq
	z3Af0w4433KVKh+db+AM633aTzi7HzOpulK1Q8UR1LuYY2QggHnA/jWh4d3JE+t+8n2N/aL390K
	3XDRev15gGvcXGU+uj1yVXEPXJRizdJM=
X-Gm-Gg: AfdE7ckg+ixl7OHTrPcVigU2Lkl3fS9DrfOrCD7j6Xex9Lj81giTqkoqjc4uSupp+j8
	xorTsDkrxxZYG4u+JauEkMj584PbSmtyE5atAzovu7QkhAJ0AsirlNxYMGdQ9ev1KzMkW9X1KBq
	XyrXVoJpV9fYNfqDjGT8aTkmNhlxYAvVGcyvUdIKwBEQYofkLNAbFncIhJGqOGZkrRjtfzXGgsS
	emiF8guB/fIaJIZlF6J5xwPbb9oTmgV4Dpf/AYWJR4GJDCGSXPqt8mjzFcr2coQK2atKXoV6t/A
	55JdFR57YfogkBAXk/TajewfzL8+KIsmthaiZL3Iwg==
X-Received: by 2002:a5d:5407:0:b0:473:ba02:8cbc with SMTP id
 ffacd0b85a97d-47de663c413mr662008f8f.0.1783350155940; Mon, 06 Jul 2026
 08:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-kasan-v3-0-bd09bb942d86@bootlin.com> <20260701-kasan-v3-3-bd09bb942d86@bootlin.com>
 <CA+fCnZcJzRvq9942LXgTpq5067u4DvXQRjdNDpq-5vOZpQuCVQ@mail.gmail.com> <DJRJVY5TTS73.2NQ1NZ8XI5WWL@bootlin.com>
In-Reply-To: <DJRJVY5TTS73.2NQ1NZ8XI5WWL@bootlin.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 6 Jul 2026 17:02:25 +0200
X-Gm-Features: AVVi8CfA5crYSwWCMxhRRXMzJghcorjwv-nINM4NjlmZ9iTniJZPIYvEuEmIswg
Message-ID: <CA+fCnZfbR6uaypws58MUrzBq=Q+yUuckt5Rm6CKH5nrMi_aL=w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 03/10] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	ebpf@linuxfoundation.org, Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 4:16=E2=80=AFPM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> > I think it make sense to put KASAN_GENERIC into the "depends on"
> > section, as __asan_load/storeX() are only defined for the Generic
> > mode. SW_TAGS mode is expected to be soon implemented for x86-64, and
> > that mode uses different checking function names.
>
> I guess I can move most of the kconfig options that currently are in the
> `default y if ...` into dedicated `depends on ...` lines, and just keep
> a `default y if KASAN`, something like:
>
>   config BPF_JIT_KASAN
>           bool
>           depends on HAVE_EBPF_JIT_KASAN
>           depends on KASAN_GENERIC
>           depends on KASAN_VMALLOC
>           depends on VMAP_STACK
>           depends on BPF_JIT
>           default y if KASAN

Assuming all these are required for the functionality to work, looks good t=
o me.

> > Would also be great to add description for this config option.
>
> I can fill a help field with a basic description, but it will be visible
> only by reading the Kconfig file, it will not appear in menuconfig
> unless we make the knob user-selectable, which I would like to avoid.

I think that's fine, a description in the Kconfig file would still be usefu=
l.

Thanks!
