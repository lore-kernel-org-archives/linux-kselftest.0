Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B13FF88E
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375289; cv=pass; b=pvZazhLF6NkTSro4PIREGAjpifKzhocr+QcxPeK0T8MsdOhY/CoLAjF8vd8dvq29NaKrf/d1doliMH0L0QGcSVqMvUY23WeP78zX0qb3AMEDBy9QZ8SRUSsGMjLOAvP1ZyTz4VT2jXtomOcmHSUQPz2EtKD81uOUcm7MGgA0LR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375289; c=relaxed/simple;
	bh=7hoGj8/xuNHMHGnipzfbn6G/BSAJOVMpf5JmEo1pNO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z51CpUz50NmLbTKRr9oV4a1d1LyWTRIAQnMyGBTxmbJOCI39ZkaETsnZ3vn9VQMKjVlX3hrgqR6FZS+B8qar78GticfmgC6yRPrpQZbVprCHVAg5VmUKhbfKvbQLqM7QlYTacD/JjpWgShf5u7E/IcSd7nx/MTnsQcy8FlK4ihM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fHtWFyYk; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fHtWFyYk"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8ef5776530bso729461085a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 04:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777375287; cv=none;
        d=google.com; s=arc-20240605;
        b=agZoiHm1bor47pt3TqSjm8msMm5KFcKaLXTLnbhzOq0IbcPQoyJf8N7Qs7bC1dfr/q
         r2x0NJ3SF9X7XQGi1cw0iZaBYtPggiQbPNDpTw9EzWpNFSav2Z2xpeMlXq64nBc39Juu
         RBroiLHT0XAsLTTxA8h0x8LDvF6c8FPsHWpZD7ltZhjdAx2q9OhzBYiv52AWmLtdUdnS
         NMoL+01+qRpJNRes2/lqWUNQlPigHrfxxL+XVg2fis8XaR6uHS1idqAm5J9fwuHlS8cF
         23/FHRDOpk5Zpl+FFGVy1WDhwmF3rAr9Qc0Szy9yhUKS3GrSAGe0JJBAhu806O5QUPgB
         Opxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7hoGj8/xuNHMHGnipzfbn6G/BSAJOVMpf5JmEo1pNO0=;
        fh=vXhYUJCvx1+Qzu1pqKN/M3wr/h4rAWqxLMZQ3hucKhY=;
        b=Ef9Ih8NvOBQUOm5DDrkRfX19tAATv0an2gYmiY2NHvw7AcS5hO75ubNiQ540aDNFCA
         COHAOnGFi4lewzNhVeVEQZDR7Z6qLm+h/Ly7r5azvnxgH8pAN3B1ZoamYRNe1HIZInkq
         9FvFkzRyp5/GuRJ+KtnJXwlUu0KG7rINpNSjerUUzZ7gd3VMvVijf4k8+FYHQdUbRx5G
         ycwwEQpN2RGxabApwwX/g/CY84nBDNpRUdDhM5x/xNp9VL5xQTw5lLxZdbZtCZIKkB7w
         17JqAOVPYUpcsFH79SdJlGHLqnR5B2chz5zmqDWcLYIi1/gfPMjQMmfHDsH0C4dDUaIW
         LEbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777375287; x=1777980087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hoGj8/xuNHMHGnipzfbn6G/BSAJOVMpf5JmEo1pNO0=;
        b=fHtWFyYkGiXWbruSBwdLdiIYVcsM86ZR3y6Fd549rx+NazqYR1CzaJCY9c2Damjsj4
         G/BO6Y/cWBZrCTVNMLV9XWuBFFeMiIYmEiT6RYmDenkkRfEv6Gf60eemeT/b+FOBOULN
         6MERbUDiQwJXk4Tj41lzmLlUO5DgjZTp16VSYye0n6OF7h4ZoCuRJhYwACgfVdFHDqFZ
         iDV3c6Q8//+5aSKY05tVJMSa74IbPku3sVLI9PtTQCTtiAFwb327Ya8PBkzokeVzEvui
         07bW5WOk/4X/jw1rRG/In+7X1GDVORMpu2qlxrCCkZpbEwnh1zInBzfdCvSqcpFLiHTx
         dCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375287; x=1777980087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hoGj8/xuNHMHGnipzfbn6G/BSAJOVMpf5JmEo1pNO0=;
        b=UxHE5XAjgEf2YJWJcxXZv+gmWEleaivKWCVopUVKhf3wGyVecD53hiCqzTnRv61e1v
         M0J3a6P/Mnn4QrmJc3YObmTxUndfUR3Afj+A5qM9onjhzENYIzGE+S3wyBbKYcg8EBkE
         wuX8tUymfSFLLfnPt/CYOdO9n3RajkAChE7ULvk57ntPZ9bAVxb6Er3q71A/VJAkmxCq
         Ntox7jURXPw88c4F1H0G8lj2uY7uUnuSIkFTIG2/RK+rXvk5ucz/J+oWHVfvI7m/VDp4
         0MhBEf1xuzo6hqN+2a8sxYagoGWfkIJ3sNtn3/6WuQPyO+aiuug9lfxdJwcW3w8rNTFi
         NnUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yZ7qCkYIwK+SnGBP1/xLxGBlZuJRAtgFojWcuUBhPZH/t1PyMVcpTw+qvgwbDs1iv1SAYTmSxkkreDgO8Gco=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTyNaCj8Xj5MXKmTXxDCiktUxfLo6oYk9Txs5FV6kBWaF+AaHL
	XClIekx1aCVuXoR51m3TitxY2Ab4FjuzkZNdFCNvp7u6kF+TkGOO0AbYDxKNHf1rWf+Brw5lt5B
	wagY8g6FUZBqo2pRReu3Y9Q71eCzzI3C88m8w40lK
X-Gm-Gg: AeBDiesEOZBCMusTTzZ2AOU46+gKsNoGvAHRJZJTf2X5plZgPTzA8SWC+ODyZWd5RKh
	HZZ9h1Xj5laPDhqXbMWF8fM1u32gCKDMbWWUhvdmDu/ysd2eL2w9Btieh2I9XR4an3kcQyRi2ox
	XgMTjZ5MMT/FIuu4UUrQR8p4jvrfLMbi4tCs7mXB0oWKqO6bZiVBvesIPspcmVCFZKBqYdx81yA
	IKBmLoB0bCLqHjAdmN+XUo7Tv05Bbdgx0spkHA1uDC31nJFAJSsl8XNbSkPCpeuMfRKpX12RemJ
	YGShU9KP/pImKI5WjmpLU5sah6BfkowUBOahwlR7zX5ad7JZAHRz+Ohzra5e7ZAxH1KTBWRp87Y
	5iNRaEODq
X-Received: by 2002:a05:622a:4d4c:b0:50e:614e:4433 with SMTP id
 d75a77b69052e-5100e19ab26mr32850641cf.30.1777375286472; Tue, 28 Apr 2026
 04:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427224243.3499162-1-sharmasagarika@google.com>
 <20260427224243.3499162-2-sharmasagarika@google.com> <20260428110708.GA571865@shredder>
In-Reply-To: <20260428110708.GA571865@shredder>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 28 Apr 2026 04:21:15 -0700
X-Gm-Features: AVHnY4LMXCaEBa5uvR4wqE0QzYjHTahqHeIugW5yAVMSZFazKczpzJjPrXgJqLU
Message-ID: <CANn89i+aaWE11Fttpdbq-OvFAkhtkqQwkWzDACvh=Do_wStJqw@mail.gmail.com>
Subject: Re: [PATCH net v1 1/2] ipv6: update route serial number on NETDEV_CHANGE
To: Ido Schimmel <idosch@nvidia.com>
Cc: Sagarika Sharma <sharmasagarika@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 4:07=E2=80=AFAM Ido Schimmel <idosch@nvidia.com> wr=
ote:
>
> On Mon, Apr 27, 2026 at 10:42:22PM +0000, Sagarika Sharma wrote:
> > When using IPv6 ECMP routes, if a netdev listed as a nexthop experience=
s
> > a carrier change event (e.g., a bond device generating a NETDEV_CHANGE
> > event after its slaves go linkdown), established connections utilizing
> > that nexthop fail to fail over to other available nexthops. Instead,
> > these connections stall or drop.
> >
> > This happens because the IPv6 FIB code does not invalidate the socket's
> > cached destination when a NETDEV_CHANGE event occurs. While
> > fib6_ifdown() correctly marks the nexthop with RTNH_F_LINKDOWN, it
> > leaves the route's serial number unchanged. As a result, sockets with a
> > previously cached dst do not realize the route is no longer viable and
> > continue to try using the non-functional nexthop.
> >
> > This behavior contrasts with IPv4, which actively flushes cached
> > destinations on a NETDEV_CHANGE event (see fib_netdev_event() in
> > net/ipv4/fib_frontend.c).
> >
> > Fix this by updating the route serial number in fib6_ifdown() when
> > setting RTNH_F_LINKDOWN. This invalidates stale cached destinations,
> > forcing sockets to perform a new route lookup and fail over to a
> > functioning nexthop.
> >
> > Fixes: 51ebd3181572 ("ipv6: add support of equal cost multipath (ECMP)"=
)
> > Signed-off-by: Sagarika Sharma <sharmasagarika@google.com>
> > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks!
