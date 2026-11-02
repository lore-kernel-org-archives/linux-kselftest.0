Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793650973;
	b=pRj6S0eOVMwjG47NQ1QY1ThAeq/GDjJncrls5BCcrIvm2iy2DOv8YAtfOj8y/F63osnd
	 yEWfG7Ikuf8A7o5Y45KM88BdI1qeXw4xPofplmAub0TQPPTdLD+KD55nDZrMHK1RQTSi6
	 Z30eaqQ56pjpsDyLNrI1WMzFj2wJMzsOYet+/PNHMGxH/YY8dcBkbVYVHq3D6H47tcNjU
	 GfhVXZQ8shOHoJ2v6EgRrUtQavdtsp9V4LnjYEkw2GU9H/Gggj+ASUhTuf2SG894Fn73H
	 1XoG98SnIcETde4iz0C1yrF9VooYdxk7U8PSGXcsT+uI18zQShAXoHpYXlMEP6ISVgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
	b=JhENBAxufjkSxOn2KSsQqKC555upZNLLVWrqLtygP7kl9wv1GR/lso7eOOHycfg2yGDj
	 MB12Hdu8UCX7MekmRiigwyFPbyAp52hbVSyt5WZzV8MKH3XLpnKi+OM9wtgCfuFfVoYL5
	 Jb9JTj5BDmqMhyPxfzX6WlRLu5HglNyKNxbYr0BiK5NtEimR3t1KKzBQrg1K7agygjEnC
	 cpIItU4ykZvACwYSagC2T6OFi7ItRQs6uHJcnGrcpy4WEcQaU7C2Soypm6QYtnqR3euJh
	 ZwotV1KIv2Z27t7KlgwxF2QfBuAaukEga/6nbIuC0gu1KNNlDXgWBJhgFoJqaciCpMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xuj0cyZ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DAF606A329
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DAF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xuj0cyZ4
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1648a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650972; cv=none;
        d=google.com; s=arc-20260327;
        b=aRB8ihFXVR4aTEWWDBHMGZhesW0oxjECfN6wNWtLD6DP791sceU6yrXuXoQlAghfEo
         sWpKtaQRXrl/sjzrI3gPXObIeGNtpP+Ar46dfJEzfwC7u6WB8Uv6wW3DqPA83zqJsf3M
         P3C2Wjv2klqvZdBoS58I7N1618Pn9lpf1lzdR9cHgsFexppr0PD6p0rh4luhCISYoYUf
         tdlq9mAnJUfZOH6NymiSDnBP7UDDnqwlIpLTgwpCkaINWzJNp2PK0n2eRyPJ9UFEPENV
         rH9ZXUiq0t1em0ZaCndPTLqgFdTdICWWtiVVIWAiNnJ98qJ1THDzvpfAi8Ruq6jOpv89
         xkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
        fh=YzqbUdKWdLlgj/ZTsBO+L03uRQ1hZTmW+t4ehfsAaDE=;
        b=a769D8xtI9xnMIXs9SLyjGJaFw2q4fFgFEXpsJLnSz3n3EVOBGqIe6MGLJ4b002W9o
         66EpxwAHaxbIMbULTxjpDLgxQVWPbP2P/BbqTgHVXecX7huBI9SWXaXQaCQ9JP2kB34p
         kJGjqPebXzpOgTfSdoRE+4t18FWZ5DoL5jMQwnZJI8y9nn7au9Xfegj8WunpoHkeqBwA
         qMk5kA4LWqeTs5lrr8QSNE7Ku06FvWHe4bSJ2pRTHFpyhGPeiznFHI/+2A3pT0+V4qOx
         YxwMOA5jTW8K5MX4AGUZ0IGcqq7UVf8F2KbFYpg9yWh0+tqo8492HF+1n/tDPxLvY8YU
         wQNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793650972; x=1794255772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
        b=Xuj0cyZ4emQb1iCBxP+MN2UJGJzsbWOms4z/k2g2RQzUR0FwAme4c5ZkYjCgOB2CU7
         iMeBNnzO9gjmOq3gRDuDFcNiXWDfChvkjvK3wfirDwEPKD+pdNpcVXwwF/ZC9DO6Afxr
         o5sPOMnYusljsvrxxu5b9Lq/8FpYF1Ka6bLAEWcZlRzMIQe2xe56by117331u530ceb9
         cHxgyIQ6hUKyUrgJCUfeyP7MyIsw8Sn4fRgo7SLgeEcWb5DYvaKFnFZinrrDjo0eS31t
         y7kLbmugsHME1CI/r+BjLGWUS4a66mt16RN+QagEcXFyq/NIiGYkBVaG8bqCWz35Fk+c
         2URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650972; x=1794255772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
        b=vv2UyzpdybvnfgJ995p2gNmMT+q8xuFgLSPloIxGwlwxSxRz6nGcr2XbOtyXPYNzmP
         s346TsyjwlSoRXLQP6NCJ6rZbhfHFpbic+TB+Ts1P2U02I4IdePFi51UtlAW8rY8Erh5
         ppJfnxcPZ2woKk++tuecDAlFI2jqTydTDw7FmQt7oeEm3Xp9c2yafRDN/79vnC7FED1u
         DA89axO6jcQU4Y5FD5+CfCQRTvL51h7WthSExGMKg4imHwVD/37109avKAiKchokVsCE
         xOS5GMe0YP0P8bAs3ror9AJj8x5WQ0veYyQ6VilSbZfpS8MudisHK1w2RWkbI0P86bM2
         FeJA==
X-Forwarded-Encrypted: i=1; AKwUvBx0W6UZy0ScSCZCM0uFlgFa0rpKJt0zXmxeyhkXSg6yFhMIs5HHbD9FJvMTFjamlbcAedi7s4B8FiVO2+yKvKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WFz/1OmSpMOPIIxQpr+PTiaSkZBUDD/1ymAvl5AkUpzKBcbcD
	QedviAaVTlvNyTnaw0su97UzWA0v6fGFgE/966vF5if9YphFVUQBrNjJc9BhREDE1Dwu27AClPN
	5CLfETv/VpcmbZVsnw5Xr5dGrCo7JAIzhua5VhyYC
X-Gm-Gg: AYBFou37/mKNEbFQvGHZb0nd6E2REhnXpjLivHeUXaF+qRoFLPdMutaOl21UfN418aE
	IbmcDQAwJeOpISbK/BUDEUi8mn9Pr+MFb8dZcGTsYdtSLGfC/r7C3J5TiIRMyqekJTGLDssmjfF
	Elr4JCzEMSLKpMzJmLm3hVfaAHq5UBvQlTksAdd+Rw3pE3f6jYJR4PhHLxvngsj+L/dWcqb5FCw
	9qJKsQlFS1s/JqB7FtzUqdgmTkrZuwk3TNRjESmdx+BS4esZx08A1r5s6r+J5UWUnz3peju487q
	xBAY34gvuMEL7A+8sT9ctOtE7KTo4ilQ6z3K2ka3POg03TwvqgJkW/6g6HoS3PQ+3UGaK3gL0Jj
	Y6Y2Qhuai9B41YC+YUTBb9fjrVSwutagQ3BhSIyUj+sxvK3Wq0ys9LRmzlYG2x1dGy2w=
X-Received: by 2002:a05:6402:15d4:b0:6b1:aa31:a627 with SMTP id
 4fb4d7f45d1cf-6b539cf5521mr2845a12.4.1793650971061; Mon, 02 Nov 2026 12:22:51
 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-3-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-3-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:22:39 -0800
X-Gm-Features: AclHuK-QodshQH_GCQKz7_frUweWOEIBaSlwEKwxSIRLVgKwE5w2Aav3CTXsWCY
Message-ID: <CAHS8izPefhGytGNeDWZzgZOi=gLeigZ63nFnkq1ERXXGwrNkeg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/7] net: devmem: charge the frag length to TX
 skb truesize
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> truesize isn't well defined for devmem TX frags: they point into a
> dmabuf which stays mapped for the lifetime of the binding, and freeing
> the skb releases no memory. The charge only feeds sk_sndbuf and TSQ,
> which limit queued bytes.
>
> Charge the frag length instead of PAGE_SIZE:
> - TCP uncharges in bytes (tcp_trim_head(), tcp_fragment(),
>   tso_fragment()), so the charge must not be smaller than the frag.
>   PAGE_SIZE only guarantees that while net_iovs are PAGE_SIZE.
> - Frags shorter than a page now count their length, not a page.
>

I don't know about this patch. The justification reads a bit like.
"net-iov charging is weird and broken anyway, so we can do whatever we
want. Charge size instead of PAGE_SIZE for no reason."

I agree that charging for net-iov is extremely weird. Neither of
today's net-iov types actually allocates any memory. Of course when I
was developing the original infra, I took every shortcut I could and
just charged net-iov as regular memory, but that doesn't mean we can
do whatever we want.

I think either:

1. say net-iovs are not really occupied memory, so do a global cleanup
that charges 0 for all net-iovs (optionally making it conditional on
the net-iov type, so in the future someone can easily add a net-iov
that actually can be charged)", or
2. change the net-iov size to be actually size instead of PAGE_SIZE,
and keep the current 'we charge net-iovs even though they're not
really memory', and then this patch makes sense.

But I welcome disagreements.

--=20
Thanks,
Mina
