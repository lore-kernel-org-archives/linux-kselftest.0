Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EE74CB8C2
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499878; cv=none; b=hagEKM9nnmfdd9cdbmvkg1gp2hb0F9v1kQN9ZSrFx8RFNvoCPfDq2VoIYPt/erPx+NUpeyvVPgS0fjX2G61Bbq2iYiOHFb06l4wfShLoN/apVOMN48dVDdT6GGjoRzSYjdGp+UUerYKEhqM0fk1Vrv/a4b/UrpuOgxpDCaahQqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499878; c=relaxed/simple;
	bh=puphIDN6Txu2UgZfXjoi+84d6eP+qKhkJ6b+R2XKjho=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=q7MdteKYnSIlb+gTDvESKTGBZ63mGrnzlRz+gO4zo4V9L4trh8DJN5wxgJFSDW31tqtCi/x9Sch71hRFE/ULOGlTp0m9iXatcptYoKIPhSVSEenO80iSwTyTlb2Y/5zZ6TDG72dPN0KKK1+iDDgeGzHz79ZvVuCFmWCny4NqSqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3gOOjVa; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3gOOjVa"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb767cc97so547171cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 12:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499874; x=1790104674; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Vw/Gc5jnT+eYof+b4N2iMEbssMWUevRjmxXML0NG0A=;
        b=O3gOOjVao2g7nDqQjE6h3dmDO3ciiTv5mTJPSV9UM0iJVFXUPPT4My4NIO+8uzTIZe
         edfB61BuJ/9aw/Rk8TP0s+QWqguplCI+RcdI/2Xjd10TTTBWPI8NEVxTey+iEx10eMhy
         2g1kYQOFUZoKoyBsGlLY93LFrZkq6nxq21S3103AnXlmdzaSu050BZ0YZW7NTETJU2Zw
         n1HCI0ULKqHs1y4+HsJQfhdCMzqrR7v/PujPH4vVWG4SQyySogtpzWPMZom+NdfJ0vmG
         07WYxdrGuQ7OAHa4HIi8DidyVEnBBBcTJuvPiwqpAqkj+KBYV2sv9b6y8mHqgThH9X+1
         9q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499874; x=1790104674;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Vw/Gc5jnT+eYof+b4N2iMEbssMWUevRjmxXML0NG0A=;
        b=mmbh0VZI9id3RQRR967+A2vehUi0hLauiM1Yb1sHH7sJMgfANOFkWkusFil6LCcSKc
         uVDbx6oFf0l5WFqxM7WCaRUWbL5mTTj++RTEbpyjbVxlrcdIDNBPnMkjruK3GH+wTSI7
         9huJ9LrSh2RDWs5E4IuGWVXdXh0l8ZdhSdA8LDngPC7YnBNI3L/o3HoIxR/AhmoZofVa
         a6W2SERsZ8VOTj3oRgocv6KFntyNlxr1Fpy69bb1ydUbgvDtiFymbkOFcHAaNPFiQ8wR
         d9w3Ox840s49omBRIq2NeO0/TFJtZEQNnOJ55/dp1ZLaE8ENAjUEjslhAPTq1MsnykMm
         InWQ==
X-Forwarded-Encrypted: i=1; AKwUvByMUwCgywc+m/QQbZN8Tskiig2JP7W+Fw85YW8F8tGQA7dmBVzEEf140qFCAtpO9O/RKLn2s0mx2KQCME1iMmc=@vger.kernel.org
X-Gm-Message-State: AFuF++kGu+h0ye2WufBwCDlRk2s0X7RFoGKFUoKr6tSG94WeiinDX/xQ
	ohnKbgTA8071l22cQgWZYI+bks6iB+rBo/7g4snf/SPw9XzpS1I3Cf8M
X-Gm-Gg: AYBFou0rF7eagwMSCzLwY6dP2jjpqxGYCOuWqChrdiEXTfeWtB2VFugam5eQNhutkzK
	xUqwGVuxMrgftKS3TdOoNT7n9xCz8ZiQs90K3VdjCM9DLdas/jeqH+Yx/X9M4KwHR7meEH3etyh
	U74Or3MVKrOPw49pzzM5xv8pbBts8PRB4GzvcGR4PLT7jktj9R92zS/K1mjBR/+KrAoJvLPFKx6
	6WUk0aqsSHINMxJGAmm1rj4terpd7jgYn86jAjkkFTYOQn+Lp6w1O64tOUTFm75zTFopL662cTc
	/3/c0HXc6vUHV7JstKFYTITH8XvfI9X59YF+rupmB8f3Xh1z+P4gq4hxymz/Oltryn++peu6rQZ
	43d2V9MQ7CIRlsDkkZ+9NWKfM6H+A/q6w4VyLqnfZPjjqWpNGpVdT//mVMas5BSUNwaOC2CC9gY
	oeZKfK226YU8Q96jTNHKWF/I/UBLb8X8Mbo3VOnhpUMrA9cBlVDh6/8/HG99rNgwjno/ytFeWaJ
	7jg
X-Received: by 2002:a05:622a:164d:b0:51c:6b6:9d0b with SMTP id d75a77b69052e-53126101887mr35935981cf.2.1789499873957;
        Tue, 15 Sep 2026 12:17:53 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be915d5sm6224706d6.26.2026.09.15.12.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 15:17:52 -0400
Message-Id: <DLG4RGGCZ776.1UU67KP7TWDAH@gmail.com>
Cc: <edumazet@google.com>, <ncardwell@google.com>, <kuniyu@google.com>,
 <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <willemb@google.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net 1/2] net: psp: avoid conflicts with skb->decrypted
 and sk_validate_xmit_skb()
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260910-psp-ktls-fix-v1-1-e3f30aaeca4e@gmail.com>
 <178917294180.219967.2431474539892551274@kernel.org>
In-Reply-To: <178917294180.219967.2431474539892551274@kernel.org>

On Fri Sep 11, 2026 at 8:29 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> - [Medium] The new mutual-exclusion gate keys off
>   `sk->sk_validate_xmit_skb`, a function pointer that is inherited=E2=80=
=A6
>
> --
>
> net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb()
>
> This adds a mutual exclusion gate so that a socket cannot carry both PSP
> state and a TCP ULP, since the two conflict over skb->decrypted and
> sk->sk_validate_xmit_skb(). The gate is applied in __tcp_set_ulp() and in
> psp_sock_assoc_set_rx().
>
>> diff --git a/include/net/sock.h b/include/net/sock.h
>> index 51185222aac29..ba5e5092f192c 100644
>> --- a/include/net/sock.h
>> +++ b/include/net/sock.h
>> @@ -2312,6 +2312,17 @@ static inline void sk_gso_disable(struct sock *sk=
)
>>  	sk->sk_route_caps &=3D ~NETIF_F_GSO_MASK;
>>  }
>> =20
>> +static inline bool sk_has_validate_xmit_skb(const struct sock *sk)
>> +{
>> +#ifdef CONFIG_SOCK_VALIDATE_XMIT
>> +	return !!sk->sk_validate_xmit_skb;
>> +#else
>> +	return false;
>> +#endif
>> +}
>
> [Severity: Medium]
> Is sk_validate_xmit_skb a reliable indicator of live per-socket state her=
e?
> The field sits after sk_dontcopy_end in struct sock, so sock_copy() copie=
s
> it verbatim into a cloned socket, and neither sk_clone() nor
> inet_csk_clone_lock() resets it.  By contrast, sk_clone() does explicitly
> clear the PSP association:
>
> net/core/sock.c:sk_clone() {
> 	sock_copy(newsk, sk);
> 	...
> #if IS_ENABLED(CONFIG_INET_PSP)
> 	RCU_INIT_POINTER(newsk->psp_assoc, NULL);
> #endif
>
> So a socket accepted from a listener that had PSP Tx state installed ends=
 up
> with sk_validate_xmit_skb =3D=3D psp_validate_xmit while psp_assoc =3D=3D=
 NULL, and
> sk_has_validate_xmit_skb() then reports true for a child that has neither=
 a
> PSP association nor a ULP.
>

Sorry, I started a response based on viewing this report in the clashiko
web app, but then realized after I had sent it that I had received the
report in email form. For the record my response is here:
https://lore.kernel.org/netdev/DLCXDVPGGC8M.11EBKPBY2KNVP@gmail.com/

So, is this a blocker to merge this as is? I could drop the check on
sk->sk_validtate_xmit_sbk to appease sashiko, but in my opinion this
makes the patch worse. My ultimate goal is to defeature psp assoc
operations on non TCP_ESTABLISHED sockets in a way similar to tls ulp.
