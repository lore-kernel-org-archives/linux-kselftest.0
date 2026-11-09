Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229408;
	b=b3pyC0FJ4JMYoKU21S7SNLkNXZj5+wpPQMoJLQuxEVJq7SAYBwRSyGyKDMmglvm1n87x
	 Nzjns34fu0LKRrjjq3DGgW7joGomU2jOhncs19U2d+bwPLmmZdWfltOA1DXEHPa/H19aZ
	 sR2uXDkkIEA0QYHcvkfg9+1sQH1/Q026u1k3Ae08Kfj4kLYYr7dwD9+dNQunFw4GHjn2T
	 u6ImiiiHTSwzRu14QGuL6xF2WZon3st2fFxUSn3sfB4qfRRe9FPJdy+xaQN+9QutTbtm4
	 nWB+wy2i70PigZL/TX29oOVuQ9M0wsrsTq5bGLVFgr1YmYpn++xZMoE+K41LI5d2YLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=72Pzf80vHJ6tg7h9s2yhzIcCJ8giywOh4xxajI0FVfE=;
	b=LOX6qEyTZ3Q+Eq4tAAYUNJaw+kvJUHWD/OTq3hC6AEVZ34OEZSFoXmrOX5Af7uPb8gsy
	 PiJUm+0Rz3wbIsBdKi3WIUbdZKiLrwMlLkLxtr+02LnU8aNlStxQLlUMH6NLVXK4A26Nv
	 nPQQNxPlf0yQCRcsJgzeaxCDEb7GOYMCBE4yJxfTIMqljeDo6ITGuG/iQ/f3YOqdHc99d
	 RJr8gbf2W/FAMJcCZR91G+EspSnmkvHEYHeYBeDWMrtVJb3dt4TUzXXVqmkCyPfcqZgx8
	 D0CdKaWKmPZrUCCGrXB2wRf+p/VvtKFQQfH+vVBDBh1excV4jLL+Kh3iuGa2l2Ub/Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Th6NR4gp;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3096606A31C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 13:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3096606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Th6NR4gp
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91ea16d8072so6588076d6.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 05:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229407; x=1794834207; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=72Pzf80vHJ6tg7h9s2yhzIcCJ8giywOh4xxajI0FVfE=;
        b=Th6NR4gpQlycRBLRjBND2+14b1JRjtLWr70u04hTBSAFERKPkfJOkUTK3TEdNyfRL1
         EdEWi4ne5l33XwRwB0IMecrK3EHlMksJaS2H9i4GxM3NATIPc+YcuZaUQ9+Us4vYWqu0
         a7opGItIC1bBR5aL256gy45CpuBuBzS9m6EJBcNYglPbaUfm6KjU+s0vzQDbqgTEukLK
         odJRimkIhb3JTbg75cf4GygFLOX8zJGE50MS07jGUEVGREv1k3k6wsr9OKQCh/zuCr0A
         1EKAsR/Sp/3331X2ZIGFsUFaefJHCQulLSSxIfqaMlOUKO31bI9O+oU65URNeAqzzp5C
         bNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229407; x=1794834207;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72Pzf80vHJ6tg7h9s2yhzIcCJ8giywOh4xxajI0FVfE=;
        b=JwYC1k6FtjTBmAoOyG16wUswvXh/ruJe2h6DFVo2d8XLZlPYgeljlYWuZsTFloOIvE
         lvgjCMWr4x/E1PnQMip2m2sNpBw3Ea6vZc+D3qzdj3axIL4lWxIZ3rqPzGEpXgFI3IZJ
         5t2gcZYnGyAMKMvf0g1RNGG8g3Q6i3jOaGYe8sps/nbw5kgmvRF9MMbUZ8X4e71tw+G2
         8t2GAQNsUDkvRcu4CY4G8VVYuzqoqt404PVc10x6fVD7Fyc1X9AG9L38SW0eBHApLgTE
         YGiHUD0wnz5wewg+AtBDBLaEhg2pSFdhR0fqtp9TDpm1FpmyQV3422Mlx4EN8zPu55SP
         wFeQ==
X-Forwarded-Encrypted: i=1; AL+hErHVZQyuim9UTVRhkEdiz2SkEQ8VPL/XL6H9lZ+JbMG3tlxg1wlk0OCLT9iEAaLpVqh1KVhLdMXfdzwCPlnFPvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V6SD8UR08ZP2d9Yf3g8WN35ej/f7ieuGa/TraCGl0KWK03Mbf
	hUrHDiwqbWodakXxnLp5pQXKTbSipCKmtGNfntjz++A0cXfkG6G4VaTf
X-Gm-Gg: AYBFou2tIgwcj9ccowUzxuVrlIDpGO/LvPX7lwJQJwg5YWrmD2FwpAUw1h9wBCFvyVJ
	5r1zBFbQlhwhVaZLPTbhG+ij0EV4Tw8LHXJloc+mi3PE/g+lXzJyJzQEgKqG9KOTdrLdHrZY3Ci
	D9IVl457wLtG6h3VkZEKocy3HWUVjCFLuY4/hLuRRChRBE3GmtrD/I9bNlmLWocD6xmy1t7+0dS
	4fsAfEA1tMmw5UeW86FHhpAnOVPEhlUMCrXl4gEO+msDTKP5C7PteeCX65a/vNKVAoiFxq1N/qm
	LEuVaGg2GQji2Cw5UP+MKAMeK84CEtKKBB4SWxdIlqGjmU9HDclkrPC3GekznR9dYSYhWMywV3g
	/ubyJ7qXtSyYB2t/Z7wpwbiD2vUKqw4ll9wHzNBVM5LxZWds+m2pepTV1pSvi7fXZ554JRRNO7P
	Cj3167QHvA0LFXsI1Uz0urHnDyn3ZuFEbYdCeo9gJl7fk4zbHCr+voxINcbfT65gsIkoHjT8lmX
	vphCrftMWMg0cemD1bx4xVzYwfNfQ/6rqpsWx3I+4IoUzbK6AZz+XMo8M/j/RvU4eXU2ZKEu6kk
	d6ZskV7vQ5NazMfxqYl4Ifx+dDRq6SoiIg==
X-Received: by 2002:a05:620a:400b:b0:939:fde0:a71b with SMTP id af79cd13be357-947846073e3mr613394785a.0.1794229405262;
        Mon, 09 Nov 2026 05:03:25 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782d61906sm469034185a.14.2026.11.09.05.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:03:24 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 08:03:22 -0500
Message-Id: <DMQP8OMF2NZ2.3K3MJRWBNXWW@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v3 4/5] selftests: drv-net: psp: factor out psp
 connection setup
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106-psp-v3-4-a8dd38f5a727@gmail.com>
 <179408516862.994134.13048510473902240219@kernel.org>
In-Reply-To: <179408516862.994134.13048510473902240219@kernel.org>

On Sat Nov 7, 2026 at 3:59 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The commit message says "Here we are adding some more error
>   paths, so we just handle errors by closing the data sock".
>
> --
>
> selftests: drv-net: psp: factor out psp connection setup
>
> This commit moves the PSP connection setup and the assoc uapi calls in
> psp.py and psp_responder.c into helpers. Other tests that start with a ke=
y
> exchange can then reuse that sequence. It also makes run_session() close
> the data socket when conn_setup_psp() fails.
>
>> The caller of conn_setup_psp() not handling errors was preexisting. Here
>> we are adding some more error paths, so we just handle errors by closing
>> the data sock to make the code a bit more robust.
>
> [Severity: Low]
> This isn't a bug, but is the "adding some more error paths" part still
> accurate for v3?
>
> Before this patch, conn_setup_psp() returned -1 in three cases:
> psp_rx_assoc() returning NULL, recv() returning < 0, and psp_tx_assoc()
> returning NULL.
>
> After the patch, it fails in the same three cases:
>
>     rx_assoc() returns -1 when rsp is NULL
>     conn_setup_psp() returns -1 when recv() returns < 0
>     tx_assoc() returns -1 when tsp is NULL
>
> The v3 changelog says the per-version key length table was replaced with
> the key length from the kernel's rx-assoc reply. That table lookup looks
> like the only new way this function could fail, so the sentence may be
> left over from v1/v2.
>

Ah darn. I let local sashiko convince me it was a good idea not to
ignore the return code of conn_setup_psp(), even though it is purely a
preexisting "issue". Then, when I was writing the commit message, I
think I was looking at the code from the next patch where
handle_tx_assoc() rekey handler, has an extra check against the key
length.

If I have to respin, I'll probably drop the code chunk below entirely.
Otherwise if we can just edit the sentence:

"Here we are adding some more error paths, so we just handle errors by
closing the data sock".

so it says,

"Handle preexisting errors from conn_setup_psp(). No new error paths are
introduced."

Then it would be accurate.

> The only behaviour change is in run_session():
>
>     if (conn_setup_psp(ys, opts, data_sock)) {
>         close(data_sock);
>         data_sock =3D -1;
>     }
>
> Could the commit message give the actual reason for that change? For
> example, the existing failures can leave a half set up data socket open.

