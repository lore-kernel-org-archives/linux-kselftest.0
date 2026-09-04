Received: from mail-ed2-f11.google.com (mail-ed2-f11.google.com [74.125.228.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3002C431A22
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512559; cv=none; b=Ax0Oow6HXrvW+on5IL5ZuQzCkc7INgWF5LhKpkiYarYBn364QrTjNIUfTjUzm1vVaGPwCU900Emxj7LIprQVMcS8u8FKDw3/bVXI734WiLp1xZgJypwuj3xEanu2K9QzfzNKE/cuDk6lM4reX9HRtMtzGcQ54k5kdb8mzGWIWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512559; c=relaxed/simple;
	bh=FocYj1Tg6JeoZyTDyfHblEWp+ZMU7BmLVvhrp05G4mE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gZrdpLXX/5vJ/vNmuk8ken2DdJQLDhEiyCoU+cq2oYx9mcQ7qclvV+V01vY0Qk/QgQrndtRMyYFmfqMb6PJblvGfWfHmQZ8AqPStysUSB+gD4Mv1dPPAVXRUQQfiWL0kez0stvNOvZ0ZXuNjPmq/2UR3EGQ8bafAqJ1wWtC1qsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahLmHHkU; arc=none smtp.client-ip=74.125.228.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahLmHHkU"
Received: by mail-ed2-f11.google.com with SMTP id 4fb4d7f45d1cf-6a144c8f038so351459a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788512556; x=1789117356; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VSBcA76yWuklBIVlW8nFJkprKtYg80K7J6L7TsEg75w=;
        b=ahLmHHkUUY5GyLFEnMgSOAo6lncxD0syIQsq9xaGV+PMU31VF/R0AWp1T1/XGVjJ7m
         HyWJ6ezyl+fjWFsxwts/r4gMnEFYYrohLFL5iEBQs0Ti1XSxFN+F8sASHgWbPzuuUwBw
         liwG7psGLFP2IfFG7ov6CWJztbtotCJ7nUQDDS7u54xWuXRJjljy+C3dSPaOZDET/eyh
         HxP26qOtsXoJVsZ3a7Q6u2BZqigbdT7cq82dDmGsB2NfrnjNUpYaKE1jtCldZD4m9KSc
         y6PHgMqjCn5Qi0tG5orQ4q1fLkSmUKySZBUVCNIz1CfwAeb5G+VvDVjMSghbqXxAgCVZ
         a8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512556; x=1789117356;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSBcA76yWuklBIVlW8nFJkprKtYg80K7J6L7TsEg75w=;
        b=XoaOqBEe6SSRIJJJX5O0WY0KOGy0Pnp2bu9DYUdZVeldDDdo6hjZaRBdZRuoi5I5d8
         sOM2C0qRdSqAhkReFIhL7LzJNqWt0Ynaib9Teaqx+dYDnkst57ILY8G8mrOLETgrNSMC
         7/yAXQF+PG9xwv/lLbyGJSdpfHgHDTbRpzHPnD/B4RGZwyVIpJGg/Y5Ut9Wl98LRgoIn
         eZvqSJlZxvwnVtD2fd6NU8hzAIaKycLpR2uv4/FwEteJB0tb/lWIxqUDjpS/+1wnFKxS
         /rKNWNDSm9bZbBh4/tg4xuGTeUSG4rrk/yny7j+QAxWEB57CU52uOqJr0P9Qci7c9aZg
         mI0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzyGp05mZyw5iNbpq7Cyy41Dc+getFEPUGrnLN9vSn5u3yNdk3COX342kAyTTP965OtPDhg3ahVpqUe0nojT1I=@vger.kernel.org
X-Gm-Message-State: AFuF++nguqDlq8440F5/ZCAu8CBOf2I6QqgbaiEPCKxAwKUXBhOZaF/Y
	ZrwT2aMCimZbX36BX8y2jwl7AVl31JlGjUOdkvGnK5oMg+F6agxPW62J
X-Gm-Gg: AYBFou0rwIxoSVu55aPoBNNl5gZu1tLziwQGrUhBO+edPrQgEx3ZbHae4azUJVWfBge
	59W7VZhMNr3U7VO8YSONnLCP7iquPr77nia7DsreqXr+IDbIDDLwy6+7G8SYov/cBYojyR4I4Aj
	EMWUyPoVmp0krrKk40MPbMoVjIw7xSE9Gr0iuoaj0wvBzyVJF5hYcGOqkVuP8Rv4ucMBKuEcH83
	v2m2KsqT7OuLRzK4XjqbH3lsrBLJWrMqoHPY4zxljTz5tXhacGBhA4TFtA12pLz9pDynG2vADHz
	ZTYedlgiQN+ri00v6+e2kIuEDPfubEgeunkbj2ZMFUetOXBnqwMSi1GzcGmrzGmd2h9Kej4QrLK
	D97ioup3ZZ3pQLzo8sN2YUODhiyUtRGuNn70C4ueRNgxvYbwXiIyIB5Gv7MFqGtFMJddR5dDDQw
	us4f4OHF+Fm9JmcT/c23QSNqEFt3jDTF44Z+e4nOPanCjlrST0v69+FxTIxPJYjXKMsyaxPUUcb
	tMy1Oy/CWBxUyHjy69Wj/Sp1hmXBliT5K5Ob6aPp4j3H6E8+Z7EYp9Duc3A+pYiWJbPlx0dNIJg
	IOlZEg5Rlw/tf1ELGy1xIrmuNw8=
X-Received: by 2002:a17:907:c81a:b0:c25:659:89ba with SMTP id a640c23a62f3a-c260c8d4e21mr198032866b.9.1788512555920;
        Fri, 04 Sep 2026 02:02:35 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d503f96sm77028066b.26.2026.09.04.02.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 11:02:34 +0200
Message-Id: <DL6ESCNVJ52D.3NSNU8FZDQTU@gmail.com>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v9 0/8] bpf: add support for KASAN checks in
 JITed programs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Jiri Olsa" <jolsa@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Andrey Konovalov" <andreyknvl@gmail.com>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Yafang Shao" <laoar.shao@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260903-kasan-v9-0-2407fe99255a@bootlin.com>
In-Reply-To: <20260903-kasan-v9-0-2407fe99255a@bootlin.com>

On Thu Sep 3, 2026 at 3:51 PM CEST, Alexis Lothor=C3=A9 (eBPF Foundation) w=
rote:
> Hello,
> this is v9 of the series aiming to bring basic support for KASAN checks
> to BPF JITed programs. Among a few minor optimizations, this revision
> fixes some wrong kasan instrumentation on some unwanted stack access
> (stack access ending up being instrumented AND targeting the wrong stack
> offset). To mitigate this risk further, this revision introduces a
> systematic KASAN check skip when (addr_reg =3D=3D BPF_REG_FP || addr_reg =
=3D=3D
> BPF_REG_PARAMS) in emit_kasan_check. This secondary check (on top of the
> non_stack_access flag), should hopefully prevent the issues raised in
> v8. I've also reworked the emit_st refactoring to realign it with
> BPF_STX management in the x86 JIT compiler, as the "arguments on stack"
> feature made me realize that it could be kept more symmetric with
> BPF_STX; so I've dropped Ihor's Acked-by on this.
>
> Original cover letter:
>
> "Traditional" KASAN allows to spot memory management mistakes by
> reserving a fraction of memory as "shadow memory" that will map to the
> rest of the memory and allow its monitoring. Each memory-accessing
> instruction is then instrumented at build time to call some ASAN check
> function, that will analyze the corresponding bits in shadow memory, and
> if it detects the access as invalid, trigger a detailed report. The goal
> of this series is to replicate this mechanism for BPF programs when they
> are being JITed into native instructions: that's then the JIT compiler
> that is in charge of inserting calls to the corresponding kasan checks,
> when a program is being loaded into the kernel. This task involves:
> - identifying at program load time the instructions performing memory
>   accesses
> - identifying those accesses properties (size ? read or write ?) to
>   define the relevant kasan check function to call
> - just before the identified instructions:
>   - perform the basic context saving (ie: saving registers)
>   - inserting a call to the relevant kasan check function
>   - restore context
> - whenever the instrumented program executes, if it performs an invalid
>   access, it triggers a kasan report identical to those instrumented on
>   kernel side at build time.
>
> The series comes with new selftests programs that generate a wide
> variety of kasan reports: those need the kernel to be running with
> kasan_multi_shot enabled.
>
> As discussed in [1], this series is based on some choices and
> assumptions:
> - it focuses on x86_64 for now, and so only on KASAN_GENERIC
> - not all memory accessing BPF instructions are being instrumented:
>   - it discards instructions accessing BPF program stack (already
>     monitored by page guards)
>   - it discards possibly faulting instructions, like BPF_PROBE_MEM or
>     BPF_PROBE_ATOMIC insns
>

For the series:
Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

If there are remaining issues, we can fix forward, but I think we should tr=
y and
land this for now.

> [...]
