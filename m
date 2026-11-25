Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626300;
	b=TGeXtLBKbYluTbd4NZMytIhsmzlMsbrCu3SwKidMhkfFeWUBoC+eWHKlHP5wx8oM/fo0
	 tzmC9S7HdNGmNVlusC11NzwxeVE1NmaPmaGbZVQzYKRgMDgs7rtXfbAi/uuP9zOs3ENbk
	 QioFCT9iALtLbxNgT5LBTY/ABo/x7hfUOezsu67HhcBiBBdUtpBxpjEuJnJO+wVepTZ0S
	 Iz7XeILudFCM/TiraA/wsPo+PoAVcdHK2RdaJbVOLakA/ejxK/HWkzsrWPbIXSO8LPsYx
	 I7WbRGcVpkxvZIuc9e1+wf61U06+LldIIJ3zOfDVJGQaW5TqjBX6S2NfnQKNEvQY3VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XDu0RE2qLqkN4F9FMA5I580EwKMJWPCFaxCVS6yhsfo=;
	b=DnsubVg0kPvwVeF5yBEg6Fh4zJcy+bs9FaP3TgR1bJGj8sRbidNX/3ZYcXT5ll5Yp81J
	 Js2ZGG8RLj6BztmBzvkQ5UTNTJJg69VgK/gKvIrvi+AKKT/JWR5zvKtRi3LZFuKQO/zRf
	 9pWifeo5rC3CbSsx1tWeXZfFcxmELKl5GQzHUWEI4grVxU2YjJ6oF7LjoCiuKC8MMesKq
	 ilhwacdbcs5C+/m4Z4gT6Ndg6N9s9kE8ijKccZza3XMg49tQzuIc7Zk6xll3bGtZ7oe5v
	 h4urBDi671wz+9TFh/f37sTFdONfVy5vIgsuEd5G5TQHpNvnUwpJEzFyUsm601zAZfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlI7NdZ6;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B350C606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 17:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B350C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlI7NdZ6
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so1176392eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795626299; x=1796231099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDu0RE2qLqkN4F9FMA5I580EwKMJWPCFaxCVS6yhsfo=;
        b=dlI7NdZ6HZjf1sqzJlDb5DOKhlVyFKple/gNDaS6e5XwpFA6jde3ic/2XTVBd5JpH7
         G9fLQ4zVM0COeUqOPDuUl1sop/G5hkHOCt/77+E8W1EeXCaNBRUZbPyBdMsIVtZrduao
         rdQj7Ik9foTfSEFMy2h5jmwJYxgAAQzB3gkHFRY3sD0v7vqgG6bB/Q+YvVR1yamfzzY6
         Hm1fku2bGC0M4ziUerbRDW3puxBZT3la5acEp54YUBPKHjv4xkw7iVxaYpqcG6Jc9QKS
         CrWbmHtCQB6DV6W+lu23KQ8nO66s9fAebnkMPYOPxxpWG0NK0QsGzRVFTAbx2HbCT35L
         JIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626299; x=1796231099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDu0RE2qLqkN4F9FMA5I580EwKMJWPCFaxCVS6yhsfo=;
        b=C2mT5fmNmf3z8D1SV1AAT09eANjAyV1jOV81MKCIKj5sNG8/SyROo5bfYMZwvC3CAg
         2c011BSsddzRrp2bDLSzY2uYwQgY7UzPs0xYx9CTbyu8iGxELTjacqqq1rM3sLmOQxl1
         z401vXArKe2WvrVAc78+2lP/wbv2OJxwutqUoTrKIQuBU5mGm/jZJKvW8fFs22Oden8n
         9j5ueCMNWOhpycJdZo6h3HauMRjhYsdwI0/B/OLlqK2B46E450s8s5nJwZBhVRh+pDtd
         VjU3TccD9ww6YmQiHop863Rv2TVaF5mjMqEpJTSiuNY7Eg3rVUUKc272ea8iMEjvQf6I
         Q7cA==
X-Forwarded-Encrypted: i=1; AL+hErFqq4pZzcJ5oJHoooOwCI22oX6C2sC84lVNwEarHvJfRJ3SfCB7HFCsnETlzX+Do0gb4LVaKUQyK4t41rE4p+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FOuKk3YGAlWdKK37vrrfmys4bMgt4jL5H+Tfg7poRdrNfZ6zB
	AQD5/+iWG+1XV7zJ8INJgpIH0nQp9kfwlX0NfuEXMSXlRfcFPVjdHzVL
X-Gm-Gg: AZFdTZdvmuTnRA3K7Jxdpw58klPAB0SiviP44hYQcGGAmTAZ3EW9ykfG+8ViFjCf0CK
	7jNJhmUx/OXVRR1JArU6XQNq63wTXdE4+kS6/l34DGTeMTLKensbDACYU3dJGiPT0WruY5OAQWn
	nq42RO5fvQDlSa5+r0y6An0NwqrVItQyWslmEfewB+5nGuuW2Ys3fO1FkBMeEP3PhrL1KHtc90k
	y/Yj7Jn2XrBqxzHbNCRYbXhPk/X0bqKpa5EGe4Y2yhUVfRCh9l7PatQ4LE9puzUpu2waGYg77Vx
	wwMQHJNf9h1m/Os7U9Plswlr0NL+DjsVlGPkjxbF3ZYbW5QbZLJPCxCk/rjZm3gT8AOh9JZrA2z
	Ze8nb8HfCz2uAA7iGzAuicOYHdqg2mffbh7clf+saxLIKsuJ55IJIE84QNU5cb7nY0pgD4UBqEr
	QaXdMB6mENTtluLG8bzAcBSRbUGBrv2vJHM7h6Bk0LIYxjUGnECHVJekaKshad0PAB7MW9kjx7M
	mQ+eQkkOAce+LdI2QLYpeqGeVf+MLr+0I0HdqH1eCS/looLHSrSfaKt3bssoKE9easgmtdWXtCP
	MuV8r4T/Ya6+VFgsKnd4o6I=
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr7888146eec.40.1795626298644;
        Wed, 25 Nov 2026 09:04:58 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:43::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm53837321eec.15.2026.11.25.09.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:04:58 -0800 (PST)
Date: Wed, 25 Nov 2026 09:04:13 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, kpsingh@kernel.org, matt@bobrowski.net, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Xu Kuohai <xukuohai@huawei.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/2] bpf, lsm: fix bpf_setsockopt() on a half set
 up child in inet_csk_clone
Message-ID: <awcUm4PvuYb3nGxM@devvm16445.scu0.facebook.com>
References: <20261125070330.16625-1-jiayuan.chen@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125070330.16625-1-jiayuan.chen@linux.dev>

On 11/25, Jiayuan Chen wrote:
> security_inet_csk_clone() is called at the end of inet_csk_clone_lock().
> The child is locked, which is why the hook is in
> bpf_lsm_locked_sockopt_hooks, but it is not set up yet:
> icsk->icsk_ca_ops and the ipv6_pinfo still point to the ones of the
> listener, and the timers are not initialized.
> 
> So bpf_setsockopt() from a lsm_cgroup prog is wrong there for:
> 
>  - TCP_CONGESTION: puts icsk->icsk_ca_ops, which the child holds no
>    reference on.
>  - IPV6_TCLASS: writes to the ipv6_pinfo of the listener.
>  - SO_KEEPALIVE, TCP_KEEPIDLE: arm the keepalive timer before
>    tcp_init_xmit_timers() sets it up.
> 
> Options considered:
>  1. Remove the hook from bpf_lsm_locked_sockopt_hooks, as commit
>     5416c9aea832 ("bpf: Fix the kernel crash caused by bpf_setsockopt().")
>     did for socket_sock_rcv_skb. Not done, setting options like
>     SO_PRIORITY on the child is what the hook is used for and it works.

[..]

>  2. Make these options work. This needs the child set up before the
>     hook, too much for a fix.

What is too much? Moving security_inet_csk_clone to happen at the end of
tcp_create_openreq_child? Or is it more involved?
