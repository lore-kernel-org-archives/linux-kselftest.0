Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE4B38F253
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421709; cv=pass; b=JKRDiOaE7MTD1YI5pUmshmzgRf3US4J7ZzlWsUf98GrMsq9QHordO2biFS1PDg75L3D0tIscSt2NB/2jdHvmh2QY7wCEcH2vUqsT592Z08psF/wIKU377UrMjs4bymjljbF86QZzLg+Pk5L+uBAF50BdWwcC41lEIxmf6QGP2v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421709; c=relaxed/simple;
	bh=nD7LUp1TGjJhbOe9RG6LS0btJNgYnVlQKhEwxYeyMdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7KXWeOmoyMae+h1dyrq7MY23HhxhKMXv5pgrucyv3ogb3eqa+0w0q4Fp/jwhPr98NyEuVFCRzuhyXQLuB8GCyt6pqSNlAl3hZl/pia4UZJJR0RsG2nrEWc1lonTrq9uW9pRZUoShK1eD558PoBn9q14eI8VBTUlA8c13sEQxcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mfD9xvzy; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mfD9xvzy"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9a26ce21aso196a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 14:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789421706; cv=none;
        d=google.com; s=arc-20260327;
        b=Vud7ja7IyJYLCLcuwcgGlr45QVsRDK1a8RgZH2x9uQCxjGFS9VmSDGhIXKPBGtSLxF
         beXimumOD1wJJGvRdBVTPOEgo9VN6uC2OEoGj3v4z5fP9C4jXVna7UZVinKIauaB4HI2
         nvO/HAbgf3xwq+zmpwDOSH3tz49YhEGR338SLZa+33rUzzeNKOi+yrJTw5//1vNZlXeg
         F5vC40zmQGmi+cSkDFKde6W5lM4pf0ZEJ16Jc+qbuZs0UmVMO1J2AY2rPV3Y393kbm/3
         QFRvTsKhGiIRSMq0mXqgrt5OH6+s4teIjXvz3FwahOp80Ck+IzbD4GRSr22Tzl0cV2h0
         Tipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z4CU8owMLFOiT53jD0/3aR022cej9IEBn58BpJ7gK4Y=;
        fh=krPp85pK/CguCX9IE+P7cH7QE8/nGUFSh375/bcvvr0=;
        b=Yc9HDG10oa/I4Vlz1J59ZGw4ScxHkaWN2PQ8haSiBnfYtxJQxh3CvCw1IYGUADq/LA
         UDvBhw8Nj+Kfjp8tx88DOyKJ7jRMjDbmhEKBGFytVV5MEF78DDIwE/6uNr/XESgCOBYq
         oXnyYSYoaTgYxCdGQs5fKGYN+egf/gCggiMTZ9LIINonC31YBLkc909uvtkmypKjWSDX
         AuR6rtyq3BbQ9S1E7fZlaUvW7tVmtFYORW1sRDqPYbrDMV/dw/6FEBV+r9XGwQzO+M9L
         Rkk5BgBnqmu75NR3uRO3kE/ELXngpuODDdl+OdwZ9xZx3pyFYNCt4zmIyEdCvdkaD6SM
         GbHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789421706; x=1790026506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z4CU8owMLFOiT53jD0/3aR022cej9IEBn58BpJ7gK4Y=;
        b=mfD9xvzyWJGAPeq+d9eQYU+2z2VTXEuL0D0i6SsclMnFbpex0Vt7qTMC6F9qgeGDYD
         dZbcUKnNRezlqh8MsvgSeqjVus/74loRon24EC4i1pq4GLqsljGK9bOdT+yS5O9PY83t
         3PfXQNQ0QvalKofpIBhIi3BGDiYApF100nOigLlt9L6P5qNeD1deVSfU88AZ0bAO/uIk
         T1coE91kDijzV+eszTYGqzTnkFmE4tbB57U2q5xxqyhxBZ8I2Bje+qerphnSAxriwNkz
         A/P6OJrKiXa6J/HnhcLQvjM21Ml5BS9s2OZBgad3C6LKIt1VzEqzWeoZXAk3c5by65M6
         IoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789421706; x=1790026506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4CU8owMLFOiT53jD0/3aR022cej9IEBn58BpJ7gK4Y=;
        b=jEoJjUgVJRffJ0nm1dmVoDMh4dBL2po1dLKJazZlcET7eN79S6j7PTOV3xp9Ikw+ng
         EjvheQA5wGjdVxlikJS9w81gBsNfgMccoPLKVCNQWOlbOh4cYO4eWGBob1l8G650chqu
         rZv1w4Ww42g7GwZ7ZXsfJWS56SeCoj8/BD3lah14arnA8362eKg59DvGZzm3NJHtDfW3
         XUxsm1dzawZQLtuSO1GnJQxETRjoUcVKwwJ7l0GPMHpsvS8/XFwdD64BAH+EfsAB2lLS
         dgwlO81JL9384+QjNU6SvYUlj1KA5dRX+9Z3BJ6u3xKaol36RtPAD3LNt8NdJl1C4IGg
         Z1xQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF6d3X10Madq+goRrtuT8oY6zRi2MF4XykFfstOS0Ahys3sz54hwqo43rUOr19JW5X3JKrWt9H6dQ4FfbyskU=@vger.kernel.org
X-Gm-Message-State: AFuF++lIxgugoSyH7+qilVB7FzSezdOR/eeU6ho8DTJr1wHpBz5w0tcF
	pgVmDN4Fl7DMsY6bMAqitCg027xUc/bE+gGm1yOWtR7C0ODJmPWXTND38y6jJffIWojYAmDSBSc
	4cIxV/VF3JZDBJhynlQh1esCwv8cUBTrb4mTx0IWh
X-Gm-Gg: AYBFou1aj9roMExB0d6IzVehtehC9dLAwq8BtkSrxQ8mJloMLrsc3rIj0zvNBnTnAt4
	qKvxU80pnz6zQL0PeznGPEXRan598qAFhtGhvh1BBnDCJlOBZfAjuursmKcgbblxWH+0R8Xj/1Q
	X1verJtFMVMHx2cLkOWwS7z3X43WzE2Gu3Z+ZYGi5+QFcQaupcP+VDctMP/fit+k0V2GXWhXVjo
	wwwniRzfDkr9bgzndbVolKmOFlcl9CWSgs6SDBJG4j+owkC0Qbs9nfImLr8/G7DGMpDk5+PoQoY
	AgUatReriHkdFc9P594ln+pcuYnelWQjvEHRy8cWuHjBnfgEuj/dcxDH+BfjT7CpnQ==
X-Received: by 2002:a05:6402:a6ca:10b0:6a6:f2a5:1b4f with SMTP id
 4fb4d7f45d1cf-6aa0435f63fmr15092a12.4.1789421705458; Mon, 14 Sep 2026
 14:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <f991a17dc1833f94bd6b01a777ddbde1c934933b.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <f991a17dc1833f94bd6b01a777ddbde1c934933b.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 14:34:53 -0700
X-Gm-Features: AcwNN1W8DpIFYqNLRxuWVsKDVFF3RdiLezPbxp2u-Etse3aKt2NiEhNr2J6UFOk
Message-ID: <CALMp9eQ4Kg=50BhBZHAQVa8BMsqcB7U3OGrUYqfZWxeqqFM5sQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] KVM: nSVM: Use emulator bytes for synthesized
 nested #NPF
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> Preserve the bytes used by the emulator when synthesizing a data #NPF.
> Reuse the fetch cache only when the fault is the current emulator
> exception, identified by fault =3D=3D &ctxt->exception.
>
> Add an emulator accessor to copy cached instruction bytes, checking
> the RIP and cache bounds.  These checks alone do not establish that
> the cache belongs to the current emulation.
>
> Write the cached bytes directly to VMCB02 and fetch any missing tail
> through the instruction-fetch helper.  If the tail cannot be read,
> report only the bytes already available.  For SEV guests, retain only
> the cached bytes because KVM cannot fetch plaintext guest instructions.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
Reviewed-by: Jim Mattson <jmattson@gmail.com>
