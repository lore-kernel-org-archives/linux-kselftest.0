Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818842DB795
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 15:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832324; cv=pass; b=ohXz0TRkI8CTXOLJFef15jRwdZecCvEgFhjiBOjDADrQFWqEvM4RsZmbmuiu6d11IQrCXjERj8YDFSYnmexV/OPVWweD8Pib90bORb3f+sxav0w/dSTENu5DVy1WIo+/BQs5V5IuMHwVrnCYg+yIb4KXqBqwCA/9s+MMDS+vWGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832324; c=relaxed/simple;
	bh=hrZDgF7vfcUcbqsKeZ8056ezru3yyztiNpn9LSe10Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZ4n/MHrnxhmNie4c1Yd7yFc5+9h6Ih81VwN0lQ64FbdW/IlMWJoyvKyAnBa52nR79x3Vo2QhZlVIj1TeB9byTXY63MBfMEskBrQS7dXJVPDoH++Icn67IcmFt7/lv5ks1tEokw5prWaTXJvSpNtMFgJC/4dG3yrFAg+faAQkuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wowsfxxl; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wowsfxxl"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6982f2dc01bso11016a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 08:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782832322; cv=none;
        d=google.com; s=arc-20260327;
        b=ECdaAO90+xiY46LCRi8saUTYDRhA3cxlckf8LQids7eF1+LgC20jAFyV+DLJeZ5iW/
         zn7pT2FJQzmk/K2MLS0QJOKMwRr7ZeTPM6TTdkubId5ILitTfwkvadTja0dil5vt/kVw
         5+1goLwkWnJYng1Eb6q+Tp00qdBYtBlbDmVHV42IRPKfCCU2sXTjYpD28kzRLL4/GwQU
         FkONyFhYwGaRxsCp6pJ3MVXOzyfGaeqJnbhA/Kqnpf9VdOug8yqaBvQMAFad6NzACVuN
         ORzjwo3W5YD0Ug+6h0SRugMbadHD8hgt6jNKKjriqaPWI3KhXa1BebRTlXdFhYNNXki2
         fFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUrWRgHGWU8z5e51oajKgawX/7aP5NXC+F/I3KuFlZA=;
        fh=HqGof2S0qvioyjvsqarU4nOsPModFzm9YmzFeXfkXpk=;
        b=h033QS9PbpXwJBAW94ZbBYglcukKHr1kS2DSbdEId4xoSvnWVDECcoxl856khyYUqZ
         LpQpQ1Tdqn29OdIguwE4Scnbcj7R2k7TQu6v0rz5a7QT5Js53SNckDa6V6vWOVB19+8o
         bxerOnfe91O4JzcPcj1dB9SlmS/8QUC4hOU2/Us9aphducUXlnQHOaCVqL4hppqsEwwo
         LXdLrBu3LohFA4UsRbIl3rlQRb0L77UTKblAs81IwNAF6KFZHTjOZuxTVPL62A9xz1Cl
         7/CaQLWIx9PlwqwmHeCr0k4rdmcqX1JBV8/J8XX6DLGx473HBIzNuRNrxrTRttPS0a6e
         eyvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782832322; x=1783437122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUrWRgHGWU8z5e51oajKgawX/7aP5NXC+F/I3KuFlZA=;
        b=WowsfxxlkRgva8mX9WQvxR40keG3W5A45XgvSlnZv89fIfhRCtWJI6yQbSo/SBYkmU
         hZ2ehNIqTffCxmK7+bC87Egy4PJIO91DBiHBduPudiOVhJhMLhpLkM/gMHVxGwGcwegi
         oXzWS86d1dvuH/ZM7KL9AsOj34KUeE7AHNfDSBfdlvZEN823bWxPPOgKlC3GTjsFi3uB
         ldpCC1/tHks8NmOTii2PUGD1012xx6iAiNJkKibc3MGpyPH0zlgtwH1aoMdg7kKWFtCO
         1i3i21MzSQPmGGu4SH99MMgAXoLmd8mcpuIcvW+MGdNWl7t6p1x0nBOkdnPAv/MjduZ/
         7tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832322; x=1783437122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUrWRgHGWU8z5e51oajKgawX/7aP5NXC+F/I3KuFlZA=;
        b=MtBcekZ7TxrtKURN0Bod9q49mzK+bOUX3fb43RadE+GZDfCTo4rnjivp6c8R6UGjQE
         gO8d6GzRVzAV6tlDi1XvHMvB+Kiim2Jw1olHJ5a+KMa0s2TSM/NhBT7UpGmwLuHPvPx/
         l+GNTXwMVKfxz07AkA8yEIQRGQ/etaTQeBXoRmj7XrB9CjY7cjoBs9wnnuDMsvWdB/jP
         gwBoVrpLFNaUWdQ0CCqVTqxW1BXZfOs446iytcToofT4/S8UvzBUQ0i3NoxlNIutGJk4
         ZnF5E33df09aa7P6AEkQh9Q9zXOAa+HlwrfphN/bOvjXXYU9UIhczkiUDDeUjzf5zX80
         LCXg==
X-Forwarded-Encrypted: i=1; AHgh+Rqa52Md+7P1PAkD65G3rs3omdoo7VbvQty7a3T6+wd1j/jq4Wy0NGraA3xD7dzEFMiESw4udKW93KnQTPareJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjmNc/EUSdjF2iPpPDsqEiJn0twCksCk9mFBHwbH9nvI+FBDQB
	mp6VH4xOXIx7JakmwEiD+STQqmLIbXRuvim3/CotdzP+rsKlU+YxStmuxN76mv0E+5dpZRxjmcH
	52NcoJgytVsUt4SAUG2hwzWMh0uOwiQrY22XI2IDe
X-Gm-Gg: AfdE7cmnfBjyEXnCSp9hwqdRuAzUTgyI8Qt6am32uczkFGAbCVGUaO1Bu9doYgNyjS3
	f5ZvTn08v6zMNkXp3pLi9FfxQEyxU3LgmJ3gqZk1A3Kbv4fQTmR/4P5u0O4nC95TbrnUGpQ30T6
	2XCQWav/cl5t9ozpKxsgiSvvlTqxKcb01tZQO460OYsDEjzQnVD6/2MHI2L1I+It4CAIf7vf/6z
	r89wEJUTu61r/DfLQUcRvdEbzagKEfMQG5ACG46JKMdt8PHqUyb3GaANek6CcnEzYnXbqahCdqY
	aRprsJU=
X-Received: by 2002:aa7:df8b:0:b0:698:a99:445 with SMTP id 4fb4d7f45d1cf-698884f9fc5mr9376a12.5.1782832321436;
 Tue, 30 Jun 2026 08:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629125205.52394-1-zhang_wei@open-hieco.net> <20260629125205.52394-2-zhang_wei@open-hieco.net>
In-Reply-To: <20260629125205.52394-2-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 30 Jun 2026 08:11:47 -0700
X-Gm-Features: AVVi8CfmH7gR--RQmsRN3nohzSvaOtP7G-C4hCuuv52f12gENQAEu4z6Xj4jRFE
Message-ID: <CALMp9eQTXh5itog_mcmOB6b2dFys+gLNfrdMgMV1Do7q6uGEYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: nSVM: Virtualize DecodeAssists for nested guests
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 5:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> Hardware records DecodeAssist information, i.e. the instruction length an=
d
> bytes, in the VMCB for exits such as #NPF.  KVM does not currently expose
> that information when an L2 exit is reflected to L1, so a nested hypervis=
or
> cannot consume the hardware-provided decode state and may need to fetch a=
nd
> decode the L2 instruction itself.
>
> Advertise DecodeAssists to L1 when the host supports it, and copy
> insn_len/insn_bytes from VMCB02 to VMCB12 for nested VM-Exits that
> reflect a real hardware exit.  Gate the copy on L1's guest CPUID so the
> advertised feature and the propagated state stay in sync.
>
> Report decode information only for exits that actually have fresh hardwar=
e
> state.  KVM synthesizes several nested VM-Exits, e.g. VMRUN failures,
> synthetic #NPF exits, reflected exceptions, and interrupt/NMI windows, th=
at
> do not carry VMCB02 DecodeAssist output.  Track only the verbatim VMCB02
> reflection path with nested.decode_assists_valid, clear VMCB02's decode
> fields before VMRUN, and clear VMCB12's fields for ineligible exits.  Use
> insn_len =3D=3D 0 to tell L1 that no decode information is available, and=
 avoid
> exposing stale bytes from a previous L2 exit.

You can't just set instr_len to 0 on a whim. Per the APM, "The default
number of bytes is always 15. Fewer bytes are returned only if a fault
occurs while fetching." Every #PF and #NPF VM-exit to L1 *must*
provide this information, even in cases where you can't simply copy
the information from VMCB02.
