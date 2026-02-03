Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AF32F7ACA
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770144260; cv=pass; b=JRtUD4ySHyxkKR87eqdfwWjinacft4WHue0sdXNbAfKqMpVpVqwadEoTPB5VsoHnW/452cNjey7kit9dRl/qAFPCnVfnODH8GFu1gluoDUeehlgzBtsIXzkogRTfr6S0f5eiu0eN7P7Vo5xyukG8rI5HmWUD3mTJI5GgmExk2yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770144260; c=relaxed/simple;
	bh=Im4rgwf3E6ZwNtN9dEhHYqmY2ELHiRifIkUXHstQmAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJI5o1y1+RqZsxKmS7H8TXEuDpDpoSL451RU7DdysaPh6Ft+UhLSeF3td6nQVr0VbUm7nZ4ISYQU/Bf/K43ZRhetoMGv+4eyEBTIXO2qdxev6AAKrsUtfqKPpfHbGiqrah6+9EYwNqh0IhhNVwkDgeII7aeh4si75xcU1m3JrQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQvnCaJC; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQvnCaJC"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fb2314f52so3545439f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 10:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770144257; cv=none;
        d=google.com; s=arc-20240605;
        b=Ej7/4gTPIFDXfZk/e9HJV0E+WCBQSe2CVmcdMCgYD2rEHIolW+w5kBN38QIa+wMkTs
         vBNFK8cC5rsWbp6Rb6y0VPJeXvCdWrf7NiKShwfJXPjIopHqeE/MyFsfwMmMSKHSjZLp
         0MxVoSqfAjzPdeOJpwsFFJ9tY7oIZucsu1GLCiPJgADyTTU3LrTF8bwvJ42swESN8Cpm
         kPzD5UtYlKIhmnlyahZmHQ0vIA75JBKh+TAImSeG1RnIXYKuY99pEprd0dP7pgecoyp2
         m5LasvrODhU8o2U3rdyzWwQwqsA7vFUjJD3OtFF8gGgoeHcxCjDcmpKBnFRjXMGA3yKU
         4GVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y/eSjMPi8545w/2b1wcpinwGLR1TY3uQV5L/lXYN5do=;
        fh=CR1GhaABLkyqjFbEJ9wb0LmoKDQOoNw8ZoLXidqVel8=;
        b=N2m7oM1LkaDgGPJp1NM1xoDGsYzK10xTbL464eAj6v8znp5VxPJCoBI2vPF/+ryjbI
         XxBETPqub9PhcknvjbdKQpK1IAhJ6/yYkRqSMeAqoSdg1mrhG1CR3VSMLm2exCZHPqv1
         jKt3jJxtizWd7DdCmDTYrteSel4TxgdeZuf/V08b29hlwaJI/5jxZE2NckswoeiJaSzV
         0YlA5Oa7319pil9pO42S+qRKXlXfHLGvER2oH4Lg75KVx7nGfrM/OHZ8eXVSeYdQdBHF
         IbSBDoU/akWQqss+5CJkZfyLEdX7XREgZZTsYNDplSwrvLaBmAAIplPW/vSMzhgm2sYj
         RlWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770144257; x=1770749057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/eSjMPi8545w/2b1wcpinwGLR1TY3uQV5L/lXYN5do=;
        b=iQvnCaJCty2JIWhQas86REZ9bYZlxyM45VOMQ6RnhCNLXlwVCSDYNvll931NLtifbR
         hkAryy+iivUzgKsYedtYuHtmaxe8G5f3R8gc2qYAuxCgSlZsIqkfuSNg9vKqMKQ4flX6
         A+0ZV3bocn46aKIp5knSSv1sW1k2DyLEPiUOuG2tOAOb4fjzFpC5PaLa0WBluIKQa14+
         +GfqN2SFNcHT1hgLr0RQD8prLprdnem9PGEpADRaR6mKEXRz2ksjz2R9g3GDISWVR9x4
         VVzqdY9fPgA6qrFBvFpVG6S5Txmqh640NKw+wswhOkQkr2IrNQqLll0UR0AKV7wBGE15
         +oQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770144257; x=1770749057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y/eSjMPi8545w/2b1wcpinwGLR1TY3uQV5L/lXYN5do=;
        b=jz1nDeeoWAovoB6qq3FuvdR7eRmz+agRaGYQ1z5fDMVhECKqqYSal+79zcfaoWR3qS
         BIqqnJ6VbSmie40ySh0xuEY36JSvmRimr4+PENqaZe9jL3Iz8WQOWnrDJPKzaGn4ZUqX
         y787RyeWrhmCdZMTfWF0xitxX0d43ydcKwxXbA7VYfgZn1/AjwfXTMyL6sAXmHepKcU8
         wIq07bNHCZh8YIIFEXyhQd/mDZUuPN5cLFZJJ1T1CVlZP0nMfHDNzRD9B2tfMLNiaYP0
         9hSPGEZn7cwayyvI25L2PoTeG+FZ4iVnpV8kWL5q2BByZ6+6w4lXiqiNqoJTwvK5nITZ
         4SWw==
X-Forwarded-Encrypted: i=1; AJvYcCU0gpikI1gS9NIa4KFTJudpT3sjVmBScmFlgGwj64XvaRXw/6NntQyiNBqbWsK6jCu428mC9IcMHmXlcW4yek4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcwtrECdGVLAp6T2F4tQh+nCwDHjQEpeJ+W4wGrV2R+8OVOOka
	ju83K0CqL7Nll8Zm46b2zxepVueZTpRaFgAm2ecCq0GRERdn/rUjfK92PlX9nSdg0ulPHUIw6Av
	E+SmWoSa0G91gJgPeNYUSXVV998QCqJQ=
X-Gm-Gg: AZuq6aKjDNu6t5TOWNYhFbGl9hFnE+UJvRxIiuOVLEm4AF86lDnSd+lPDe+IiZDmZ/4
	4Y3AJ20Ty79P6wGT65KOQ0Acr4/pokbeYmWq31vwnKjJ1bnM3zhzGCUv0isNfIA5qer7+k9geAh
	ArKTieq35tflhp7bvhxuKJhV5cMJit4cF/YqBdhJRLmK97mTA/aPfOPN2lP3LFful0PjxAmHLL2
	ZGzU+dn7CBv5YdDqtJASLLLBKxQ3y2hu+1bdSRHGyD/Fpbkrc0WgA1cSvFA6mDhDshts89G611h
	q8reWGE83iiKvvZZcZER+oYBJOJUgjoH3wAVkAWm/OgknRZb/zgmwGo1clocRE9cPCnuEg==
X-Received: by 2002:a5d:584d:0:b0:435:8f18:9539 with SMTP id
 ffacd0b85a97d-43617e3970bmr476836f8f.9.1770144256833; Tue, 03 Feb 2026
 10:44:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202144749.22932-1-git@danielhodges.dev> <20260202144749.22932-4-git@danielhodges.dev>
In-Reply-To: <20260202144749.22932-4-git@danielhodges.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 3 Feb 2026 10:44:05 -0800
X-Gm-Features: AZwV_Qjuc4yRZMN8e0jw82q4VJIVoJ4ryoLzyogKn1pKbtGVyVXGQl-iYAU8hyk
Message-ID: <CAADnVQJKjv5fZ0suJkOKtybMNsrDr9d+Au8T08AvHCPzP3z8sw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 3/4] bpf: Add signature verification kfuncs
To: Daniel Hodges <git@danielhodges.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Song Liu <song@kernel.org>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Yonghong Song <yonghong.song@linux.dev>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 6:48=E2=80=AFAM Daniel Hodges <git@danielhodges.dev>=
 wrote:
>
> Add a bpf_crypto_sig module that registers signature verification
> algorithms with the BPF crypto type system. This enables signature
> operations (like ECDSA) to use the unified bpf_crypto_ctx structure.
>
> The module provides:
>    - alloc_tfm/free_tfm for crypto_sig transform lifecycle
>    - has_algo to check algorithm availability
>    - setkey for public key configuration
>    - verify for signature verification
>    - get_flags for crypto API flags
>
> Introduce bpf_sig_verify, bpf_sig_keysize, bpf_sig_digestsize,
> and bpf_sig_maxsize kfuncs enabling BPF programs to verify digital
> signatures using the kernel's crypto infrastructure.
>
> Add enum bpf_crypto_type_id for runtime type checking to ensure
> operations are performed on the correct crypto context type. The enum
> values are assigned to all crypto type modules (skcipher, hash, sig).
>
> The verify kfunc takes a crypto context (initialized with the sig
> type and appropriate algorithm like "ecdsa-nist-p256"), a message
> digest, and a signature. These kfuncs support any signature algorithm
> registered with the crypto subsystem (e.g., ECDSA, RSA).
>
> Signed-off-by: Daniel Hodges <git@danielhodges.dev>
> ---
>  MAINTAINERS                |   1 +
>  crypto/Makefile            |   3 +
>  crypto/bpf_crypto_sig.c    |  89 ++++++++++++++++++++++++++++
>  include/linux/bpf_crypto.h |   4 ++
>  kernel/bpf/crypto.c        | 117 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 214 insertions(+)
>  create mode 100644 crypto/bpf_crypto_sig.c

Other than the issue spotted by AI the patches look fine,
but we need Ack from crypto maintainers.

pw-bot: cr
