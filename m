Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAE833F8C5
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627594; cv=pass; b=FiiQciwgQGeUgT3B9a4GyOnmrKugzGWosPdcNg2jBWekEBG7I3pNJxSYd69UEW2KffWNgYm0xzh8UdtanE7mAeKin8000Bsk/mrWLFv4paqY9IK59Z1DPVVgLqO0CE+tVDRpeRf7ujf85XU5rN3EB2JLLvmfveIjVWd7zdbGnKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627594; c=relaxed/simple;
	bh=uuVxpM7LF5kw2WNIv6qy7jHXWY4BosGrwNU6w0pJ0Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kat+/HBMeVCXRCTNZMLuCuwj8EObcKQjc5EKn5f5vXEFy6O5VVDpWFqgvcD8QzD4Dyi6O/aZSOqJ08noa3qylGCv91xAFwWSbIxdULpPQs88iqzkCWeUwhSRYrYV0WQVrNHTdm9veS0gvH9kw+tu5CQ9phtC73Tn8LLq2VNovH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYlP4bMk; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYlP4bMk"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b982b0889d8so281316566b.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 09:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774627591; cv=none;
        d=google.com; s=arc-20240605;
        b=FrmIzd1aVxh49lPjCLOUpaRtfOp93q/V6/fVlj6N8vHRxVvZlltgkBknSNeKXvf2aQ
         C9L7EVvpwtBhl2cGHsED6gXjIradJq3logoRLGazBwSA7xyDN6III66it/bne8+8knfg
         JUCqXBb7kjuCHFa9TdzITEfr7qIVcSIy3g10b+cQegJ34CmXeO+ihBp+mozZcxqYpIxN
         VCVxvbqkvDHntmCbNfzqBn8EVgy7+ku5t7HjajBVeapHq4rY5tylBgy8QHFiD/ar+Q4q
         yrj+UcQ7qZ2IPPFMbIAoC+WRTJW9i7d2e6VXHZAZY9CocU8zfuEmEcjMCvztSdgVLeeJ
         tQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uuVxpM7LF5kw2WNIv6qy7jHXWY4BosGrwNU6w0pJ0Po=;
        fh=Ac35d4PpVIyeKU0IAKQBacAhYiwZJc9S4jqC5173vZU=;
        b=gH5N19Y61qa/dWsjX3b6yInolKZsEP6e1ZaPBs/tMRjMBL0KPT3NAl2Nsox0x0bWUd
         dLUDkNXzUzCPjrtu1e1fStDKjpsFqLnen9NtYe6NIh2kZ1niPurdL80Ht44nMDyPc3qf
         CTWjLRjrtkihX/u/yOUi9kEwUybZHSCf2aegXU4ava6xhvA7gj4ei9XQVBEByg44Gtuv
         s5Vx13vQDXjb1H07/L3kqkiP7bnraRTmMqUDXkF/PPkTDnT2VxfUETCzEAPsg89RZpuR
         NJdmbG4bpXeNhcqldlm6YpeB2iG2omd3X2Z4Lne5tZUROGVzML8tEt37j9xpZV6m5xjU
         bcBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774627591; x=1775232391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uuVxpM7LF5kw2WNIv6qy7jHXWY4BosGrwNU6w0pJ0Po=;
        b=qYlP4bMkKM9Qf7EfTyvUfZ1aTSvR2JRE7PR/6xgrAmcjQeeB5Vr8zxh/lFYvBjh3bK
         Q65snC1o9YMW9vyTgHxLURaex/iEZARuynQJpkogPxiFZdE4GQqLjom12LWNWP1JBldI
         n7aofixE3VfuB1V/LYnWkOmfIYEzVdflGZLMbuTexF9J3ndI941e7d8iYtzocqiqTfg8
         OuBvvK6w1dORkoqlOXciD0QwfyDqOM+fXPnef/gUtrjtkBIiW5z7Wq5WP+QTpT2O6tg4
         aKwOcb1LFXVR9AjEt2VAWxvL29tcVAAluuZfFgKhQwRKJ8yNNDyA/iTqEfb6PZC59KYa
         QIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627591; x=1775232391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuVxpM7LF5kw2WNIv6qy7jHXWY4BosGrwNU6w0pJ0Po=;
        b=emHSalC9g7tU81AfpBBjCH2jGp0xXBJ8XaPu4jccM7391na/yI9tDIhtTFxA4yEvCM
         U7cbPlCJ88Liy88iIi6i4fsRNbMZwyCxFte0AWN0zEw0lJoyfSHGwN+NrRqXyQArkaSe
         yuxTQc84qwULP0CAj5ZalnEO5c4HmESPUGdwbi5YA/q+i2ytgSWr1Vc0S2r5lsaHdRqD
         vYb/KpoePvODbJOO9cOPkcVVaJ11Qfj1z0IqVYIyAmoZAEcDxXc+sYLq1hCALxUQhzC/
         2KyoSXHDarr1xtH6xypPJ3bpuaaeewi3W6phMQqKdgDOylwB7CHCYNELwNoefYsHySUb
         3kDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9+xp04xu0UwcUa2t0fxTkjNec3NW+ADSGese5i7TzWZCRY8T5kQul/DyEqSizNOtbBMHrQ+xlNDHRV3BrqGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YynCUDAB4WmWZ3zsVF7XS/LtBQYjJKRE2EzCbxJCYUqJA4BN3tM
	IL2JjJLZkqjKCie0XpQImnzHitqH0z5UgBtziHaO6bLGDvxLaV+tSBB90alYyqjH0XxkJGSqXIu
	xRxFrIk/JbFzWb4C7IhRRqt7Uvf2Zy7//NBHI
X-Gm-Gg: ATEYQzwcob/ooVY/vIQkV8M7M5hX9YtyWqu/O+gr/Z57M80YwwBeJw82vEN2Gl/vkQy
	Ishso5rn3d2W5jLlJ5noUkDC+xm/0jtuVFlDcM1/F6r/UN5pCCVmC1lUda1kgeETfzsgwFjYIqj
	OYwGuniRWx1VfYr67o4e+jH2vlCt66MQUNcpFvUYGX5/+XJSHNlwSp0AHv0j3ZTLxhP/r0PMTTI
	+YaqcAHTjVZOpzzMgp37LtX5qro0m24RnKbarY1Jf5d5Ec90y4zs2srCZZjEAJIkO7hjKGbbO8M
	djL2kIG2c59LkLeMARjIs6PU/zd8ufsYmYXcnoY=
X-Received: by 2002:a17:907:9c07:b0:b93:81e7:8454 with SMTP id
 a640c23a62f3a-b9b503017c0mr202275066b.6.1774627590602; Fri, 27 Mar 2026
 09:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327141616.1961457-1-hayatake396@gmail.com>
 <20260327141616.1961457-2-hayatake396@gmail.com> <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
 <CADFiAcLvdjE7zwqf-hpH01jnbxtnWQNoj4+zBwK0+RU80-k9bg@mail.gmail.com>
 <CAADnVQLR6Y94wKo1G_4w0-xTPdR8ws38oGu3xfHOXxNKcqjyWA@mail.gmail.com>
 <CADFiAcJtjVHYVQeYJ_znVsjiJkEBmLfOafp5srY0HQMGwVtiQQ@mail.gmail.com> <CAADnVQ+0EwaJXgS1WSDf12+Ds2Uxbh9KMpDcyq+gyZjcQ_6+dw@mail.gmail.com>
In-Reply-To: <CAADnVQ+0EwaJXgS1WSDf12+Ds2Uxbh9KMpDcyq+gyZjcQ_6+dw@mail.gmail.com>
From: Takeru Hayasaka <hayatake396@gmail.com>
Date: Sat, 28 Mar 2026 01:06:19 +0900
X-Gm-Features: AQROBzC8MI29tPLHd2U4dUVGpUgNYaq_j3Fxz59f6kM9vlrisGKIzkfQq4eQSvs
Message-ID: <CADFiAcJFy-n5Zz+Wj1dWEH0WcK+PhKXi7cbvdsLnPhMXRcVktg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, x86: patch tail-call fentry slot on
 non-IBT JITs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Sorry about the top-posting.

That makes sense, thanks. I agree perf can provide visibility into which
BPF programs are running, including tail-called ones.

What I am still unsure about is packet-level / structured-data
observability. My use case is closer to xdpdump-style debugging, where I
want to inspect packet-related context from specific XDP leaf programs
in a live pipeline.

That feels harder to express with perf alone, so I am trying to
understand what the preferred direction would be for that kind of use
case in tailcall-heavy XDP deployments.
