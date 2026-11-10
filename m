Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304784;
	b=T4bTV5CqI/IHSfNaQ8jNjIjRboAOllvuDWUrYxGz9Rws1YVm6AnXJSTuXlCfv9+Xu9D5
	 LhxAhJxTKT0SMI4N4D+h2EaZjdY0HU0WJVDLGiQ0Kgt7Drt6BCyw3d39CPQ8abG9CanIS
	 3Nn0+7eFxTOqGCTcSEvxXYU7QVZJEKMelZfpd8uNe2I7209bwF/zXn0bHVQFb2zEmWDuI
	 x8RLlp0lvPu+xAAe5sodUJkAVS05/br3RQ1wsM6AEjOh/qO48B0cJxj93BQdSvXNUKjYv
	 s2683pYkGkqtBkG2NdVc/q5aP0lU2rx5zXX1KFiqO7zAGn5AGD0+oCBN/H38fHbMGUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304784;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
	b=BKhstRK4Uf2lu2hXGQ2+bCiMY/8U09w2lmnhu98p9nWZmTw4hoIRgD9DPJyRnAI+fcgk
	 A/9RNcge6c3Sh62LNKxOGauaSf1gN1wgN7MQBcq0ixcRPvCSvugYTcDoNzu/c5fOun4mb
	 0aAzJ+pH5qKsOFQM/oTupM0UQU40HleVXJApAYi2DLoWuXoC6MxB3w3OHwuL5CRe4QMWW
	 c5Ld4o4eX7KnrjpOk/sWGQaV5q2PoE6Oe9c1Pa0IgtkkskqHd+u5WGuX9koJUDjpiLWyI
	 CoFZH90lvXsDVjelViQK3c/f5Iajznsf2vNJ8UFHZBv6CBEOoHyKrQ8xaCaUh+Frfbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sr8AcXcQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sPqnSeoi;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA5D606A338
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 09:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA5D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sr8AcXcQ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sPqnSeoi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794304782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
	b=Sr8AcXcQs/idA572AS4kHK5mkBfqbzDUhsVXooXETEkLQUhNdhAjrrhn1qTbuC+1RLV99Y
	3t9yLwAtfBq1GB52cSdNh84FMArl5mXWzx0Qsvx8gDze9t56Fu08T5o0AUqJnET7cvToqF
	KOJIb4WneTE/JXNiB/eY8Nt9kDXrIBo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-Kr2J2goAPIKlYabhK7ybMw-1; Tue, 10 Nov 2026 04:59:41 -0500
X-MC-Unique: Kr2J2goAPIKlYabhK7ybMw-1
X-Mimecast-MFC-AGG-ID: Kr2J2goAPIKlYabhK7ybMw_1794304780
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48df02b91f9so1041717f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 01:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794304780; x=1794909580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
        b=sPqnSeoi4vhi9k/Qk8upVc9av02O7XT2MLDS0rt0xhyMHyAOJTROqdLihjJ+H2zx6n
         frm0rtCZ2oIBy/C6ZHHpV2ob4KNI+PdWmcdWFh82/mVEmIN3CPH8Q+HhXpLubBaC4oBt
         oGJ0Ur1aYmxQqQpLEJGwhdWDUj/iJ0tP6tYm0BglzC+ZKE5E3qnCOP5O6zxLAIRdmmkG
         HN75xD4GDthIjKj6G45ZFnBSqwTeabEWIumblhGmjUKx8YhN7a73AxdkDrxW2XrP/ZZ3
         fGc6IR5e8EIgEe+03M1/3pUnLm2t/25VcRxYCteAYP1w1vIESf+zMfBEeEOHgzMLAp6v
         3gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304780; x=1794909580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
        b=WAgkI4iUfmd5YJCo4g49znvZPC+GjvzdAbDO973SxqWKVi7udfUcfM4XkUj2kRbpiM
         fqrbPLQUKxaTBatZzQcKaYZy1zrzt37lQO+OcLrgGmMbZ2h8pDcKt5Hjgyb+mFg3xI4J
         eqpsM1CXC896QMOivW/bIN+aq96YAlv73i1U7mkFBk67IWPnPOsBo0CMKTkbRU/fkQws
         Y65wkctPA+/2H/40HnJSa5VGfJwkJehP5SvBlUew+J+qcZmw97fuwc7EkayxPrWLeO3m
         F9cpShEp21zVCQy+BGVcDsdcjP3HyF/K/Fk8czGhreaKtTmNzLEof0YMIumcQdawOa0Y
         buJA==
X-Forwarded-Encrypted: i=1; AL+hErGxHKuafUUwH4OoRuh1dS0Lc4jAnt6jMe0d1ar4/1DqUV74fRbXXMVZURuK7WiKyTOFLjftBpufcMnAHXhVQWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8m8qgoRtIT+0aS5qvIIjCWyGYxYd7mSeZdQWOj/qiE+MUrLY8
	UHx6zY+wkJVEXtu8wmFkJ0Ra4MMhfn9TwERECVUXCNyLi6Iq6oUmIXNanlGe4czol6Cz7yuJWPf
	ppxozpZJ2I896u3v4aceAtVtiVe7LBMDb5EfqWmWfQUpqEQfq+3VYLRPZL5d1zM8pr03IJQ==
X-Gm-Gg: AYBFou305D00apQDbD6nJDUW/MuvgX3ywC3+Xiry8fqaXChD9kkkqMmZbQzK0X/YF8B
	XwrB756YG1pk+FiXjbQ5pkYfjESRLSqpFNUHbUju9mDfeGqGb/BDlDcmOaKAlDLEI8LjrxqbIXj
	QYE1CvD2x3iISM1EzhbgQPzqpMVy9V7CjVwqAbH8Axz6Y2b6NHk9mz6GCsO2F/cMwYBC/EoxRHO
	U4sa4B5Ju0g3TrK7jm/2/5gkA3v9thoA2QrTdP12o3NsyYxVTVNv5Eq9ZlLxGLd0IEFfGypfsKQ
	yw4F4Y0y3VnDZe6v77skxdZTt3P1gkdyNYlkfQtLZ8Qey4noYLSznoLmuhK/9WWyWF9id/07fpR
	g2HIakGwGvs+ogT3QAiz6a8n151x2dCarXpySIANGdNqF6/ZTMnAOhYgHwlt3ca1vg3K3QjHbVR
	e1Bx9lFaG4HWqi6DVi90iSUQ5cvk4TBoq170dL91BG7rZJ
X-Received: by 2002:a05:600c:4e0d:b0:4ba:cd:f45a with SMTP id 5b1f17b1804b1-4ba0234ee12mr34932785e9.14.1794304779736;
        Tue, 10 Nov 2026 01:59:39 -0800 (PST)
X-Received: by 2002:a05:600c:4e0d:b0:4ba:cd:f45a with SMTP id 5b1f17b1804b1-4ba0234ee12mr34932105e9.14.1794304779321;
        Tue, 10 Nov 2026 01:59:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba022fbf75sm44329265e9.0.2026.11.10.01.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:59:38 -0800 (PST)
Message-ID: <c3e7afde-65ac-48e2-a89b-9fc1ad42aa87@redhat.com>
Date: Tue, 10 Nov 2026 10:59:36 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: add SO_PASSCRED_THREAD to get a
 thread-specific SCM_CREDENTIALS
To: Andrew Halaney <andrew@amutable.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
References: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
 <20261102-halaney-scm-creds-thread-v1-2-0b4d75dbf35f@amutable.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102-halaney-scm-creds-thread-v1-2-0b4d75dbf35f@amutable.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 00:12, Andrew Halaney wrote:
> diff --git a/net/core/sock.c b/net/core/sock.c
> index e7405be8941f..6b443bd44581 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -1586,6 +1586,13 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
>   			ret = -EOPNOTSUPP;
>   		break;
>   
> +	case SO_PASSCRED_THREAD:
> +		if (sk_is_unix(sk))
> +			sk->sk_scm_credentials_thread = valbool;
> +		else
> +			ret = -EOPNOTSUPP;
> +		break;

AF_UNIX supports custom setsockopt since commit
de1c489b57c11fabc766aeb6777ed5b0038fa3bb

I think it would be better to move add the af unix specific ones
into net/unix/af_unix.c.

But that is IMHO more suited for a follow-up; the series LGTM,
thanks.

Paolo

