Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B18271443
	for <linux-kselftest@vger.kernel.org>; Sun, 19 Jul 2026 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784460311; cv=pass; b=dStI7fhl/nl7zU+1n3ueRQfrMFOSNiJuNUcl/spmpj3ExTSIlnfOwuzWrn/NCT5xgvLLitxL5wB72U8DczE3DQlyTxpvUhCzJ7Vr9n8/y0CtCxtVg+EM0EnNLjlIOIWYnRsVlovaq3+dY8d5GIqBslX0h3Imng+/0uY7bkvh3Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784460311; c=relaxed/simple;
	bh=FDGuXM2+ub+2Gvy8iCcaUBW9Y2EUIgzom8AF+wZPxmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCO+QOCeVh1BEbxQNP0oeUopGSFf0rQzwkKaG3+ZLNEq5DXTg9wXBeFd1xk0YytsIp0dnzTObDVo8VDCR1gBrzuJrvKfNXPAG8KoUiAyqag4j0ny7lmoNACcfMWRzttautjIZqyjU7hIulk+PEm3UjWDSnAlH41CfNU581o5NpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8szVpPa; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8szVpPa"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b28ce91111so3734540e87.3
        for <linux-kselftest@vger.kernel.org>; Sun, 19 Jul 2026 04:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784460308; cv=none;
        d=google.com; s=arc-20260327;
        b=fkZgw3pIw15BvssX5LmSy89jsO0+8lpDPfbvrUybYXBh8naWLh2aQfHoa/Q5jXKe3l
         6Rb9HZFzSpPQ0tW9folF9I0q2z257MLemIZjgtJsVFNzU9rhDh/1FYKyjoUWLXJm8JWJ
         f2PSEHI6M89o+t7Wg61+wPYZ/W73igMAK1U+zzXRfLRWX9a5BH1Sgdc2BfS7LCE988WR
         umnGLqekgmQdhdF/TM4Kz2EJXzlHXY5AY5hRxmoytA5sIEC+UkZZvErL5lZxpzc1t46B
         VNDJrEh/vlR3YlvYvfCeiNME8r3v4ckwfs0qRNktnhYZGwnEyFmjCJdRP+sOZCA7qGLC
         oVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FDGuXM2+ub+2Gvy8iCcaUBW9Y2EUIgzom8AF+wZPxmA=;
        fh=FyyTQxhBsJ6UKMzNCI7S6bwClAwjMr81fNN2ji2rboI=;
        b=AzF9GQNWgVgxCtzk3/xqScngdnhxceW7AnolMqRFnIZPpwerrKToF94Q6lkGqXDr6I
         k7gOF30uj/nqTLUvUaRG4zXWOgr/xn8UoZIkh68/ai6PNkPyIfhvkdRa1x1iDYLH11Dk
         ewFZHLMx3ReDsi+5CWijjRwVpq5z6/n43coD6YZLezvLt5F+nxz8edZeFdfsHX8YzCE/
         n9NnM1YxNtS3DL5zwODA3IczGNu7YgnGIUewzRhDkPi/6JAnr3CeNsL8lFywq6R3IvSG
         TenV2s6kHx5Dyp7KFBf4kjcxCR2uWJBqwOSPdIP5fz9JNSFz7TR0CXjqjm7PAOOQSnpk
         sQoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784460308; x=1785065108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FDGuXM2+ub+2Gvy8iCcaUBW9Y2EUIgzom8AF+wZPxmA=;
        b=I8szVpPabnLQ+g0PR3pWjGDsx8HYsGAGJgFBcLbMhaPIku/HJ8FrrmvQQJxSt3Og88
         AwueKiZvpKfHynpZx2pyTS/uDbXFy6sdqv7FAbWKU96TRAGBEz52KDaczC94b05YAyww
         c2a+APBQtqD97OXnGQKPQzdNdiL38SX+5Dr2KOBH08p3LIiRc8vjQjpyTrlOdRfYiQMC
         QB/oCjCglJ/V+O1BkEHZ58EsacqpHwRBorweUtqLIU4becd2qtYMaJaDohrNmRZEqI0w
         9VW1Rz9D67jiNeLpsYMuXlsZipa47w40pFLpTWyjftna2hrODkl28ggS5utjg/fvio7Z
         OADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784460308; x=1785065108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDGuXM2+ub+2Gvy8iCcaUBW9Y2EUIgzom8AF+wZPxmA=;
        b=bn83xOKMSSVNQYvbD0TPrMX7+//POuCBP9ntgV2HGFoRES3Ve5R/qJL3laf32BFARg
         bRf2Qlpztd6SHWR0gHZOSkXBhv1mS1yHMlbM+NqXZVPT6FvXQzBcZlevvN3c5YK/LNxw
         9LYK3GiHLarAuY4KDMZKS7AKUisIxcGneK1IGeN/P5uNJbldyTaqtrXsvRG5vf7pRHeh
         EodwRyI/rBYvyUCcyiMk7J8joSr29WjeK1p6KV9DzfRyuaqkFCiNNf6XuV5r49hbxrKg
         EIfRqTmwcq/QrahmEMcv0Qj7e9hPRRIuZf1C9Est8GmvrZJia6MRPM2EdbfxtU33tMrd
         g1MA==
X-Forwarded-Encrypted: i=1; AHgh+RpVLHFiHkJfEqY+EXaolhqqlJnqrOT5IDea4jY/O2IrNnI3zzJqe/EVHviQbuASXEFojZEtxkmajGHVto14stI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFsnVSfWRawpqFpE0VyZ88Tcxs5+stumS3nJ9ohNvOnUXlQhs
	M4lwsTObsEx8yAvQ/gE6f9PWRoMdsQMIMcVgR61PpPx2eVmBbcNar1E9jAE5xrk6537i0QefzUU
	T6xyguZwjHONHGWcD05aBHTicJStvLlY=
X-Gm-Gg: AfdE7cnQRrnF9K56g63si/NuVIq1GeQtwyelARvKEFsrUG0z59XaPL3FHeMhbhmvmTJ
	SfBPQX01lmdG2DeHBStIjMZMKe+NGfMrjE0O25lH+hNxaHOGomnTKfIV1HjiHn7IdCC8py1JbWV
	tk2lxUWulGA9TnfHVicG243ghhoWZS/FTe9jmnXYpwJWXOi+rUQWFrQh2GdufpTEUJ7Oo4diDGK
	91QAzUHpiNXl9KFaDW3keVdlpLmSiGMxDlZsHbBjfHMZNBQF8dPyOcD9sPD+7PQB7E5XcvPncc9
	OHk5CgGXNbO4GzYAOl6c36YC2jmabKaHnvseIC+Wbknp6nhUKd0zYXbU/uO67g==
X-Received: by 2002:a05:6512:6193:b0:5ae:bf95:38e0 with SMTP id
 2adb3069b0e04-5b28f98cb4dmr2253306e87.29.1784460307561; Sun, 19 Jul 2026
 04:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717222327.7398-1-sigefriedhyy@gmail.com> <20260719065310.GB1841238@shredder>
In-Reply-To: <20260719065310.GB1841238@shredder>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sun, 19 Jul 2026 20:24:55 +0900
X-Gm-Features: AUfX_mxUTfQs8aMMy0hPx-baK_D-_JWbPTpuux02IjsbinAwtVEgedfG8H7XjR0
Message-ID: <CA+7S2vK28H0diXR1bhKiMacwXHGHMcLfikzmf1bdS94bd0kMaQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] ipv6: report why a route was deleted in RTM_DELROUTE
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Chris J Arges <carges@cloudflare.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>, 
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 3:53=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wr=
ote:
> Please expand more on the motivation: Which user space application is
> going to consume this information and what is it going to do with it?

Thanks for the review, let me add more background information.

My current use case comes from Android devices, but I think it is a
general problem that any consumer device running Linux will face,
especially on Wi-Fi networks (multicast delivery on Wi-Fi is not
guaranteed, e.g. frames can be lost around DTIM for clients in power
save mode).

On Android, the userspace NetworkStack process listens on
RTMGRP_IPV6_ROUTE and today treats any loss of the IPv6 default route
as "router lost". To prevent the device from repeatedly gaining and
losing IPv6 connectivity on a badly configured network (e.g. a
misconfigured RA interval), when it detects the device is on a
dual-stack network with working IPv4 connectivity, it defensively
clears accept_ra_defrtr and restarts IPv6. The intention is to stop
userspace apps from continuing to use broken global IPv6 connectivity
(while keeping link-local IPv6 working). However, if the route was
withdrawn by a zero-lifetime RA (some ISPs do this intentionally for
various reconfiguration reasons), that reaction is wrong - with
accept_ra_defrtr off, IPv6 never recovers when the router advertises
again. If the route genuinely expired, the defensive reaction is
right, since the router failed to refresh it in time.

We tried to fix this in userspace but found we cannot get the needed
information from the kernel. RTM_NEWROUTE carries the initial route
lifetime (in rta_cacheinfo), but when a later RA refreshes the
lifetime, the kernel does not resend RTM_NEWROUTE. So to distinguish
the cause of an RTM_DELROUTE, userspace would have to open a raw
socket, listen to RAs, and track lifetimes itself. That is not ideal:
this logic already exists in the kernel, and userspace should not
need to replicate it.

I also considered sending RTM_NEWROUTE on every RA lifetime update,
but that would be spammy and is technically wrong (a lifetime update
does not add a new route, so it should not trigger RTM_NEWROUTE).

I think RTA_DEL_REASON is the architecturally correct fix: it tells
userspace why the route was deleted so it can react accordingly. In
our use case, NetworkStack should defensively disable global IPv6
only on RTA_DEL_REASON_EXPIRED, and take no action on
RTA_DEL_REASON_RA_WITHDRAWN since that is RFC-compliant behavior.

Feel free to let me know if more background is needed. If this use
case makes sense, I will summarize it in the v2 commit message.

> Also, Sashiko has some valid comments. Please take a look.

Here is the reply to the sashiko's feedback.

>Does this new attribute violate the Netlink uAPI guidelines for integer
>types? The guidelines state we should avoid integer types smaller than 32
>bits since they save no memory due to 4-byte attribute alignment padding,
>unless the value is a fixed protocol header field.
>Should this be defined as a u32?
...
>Since this deletion reason is a software classification and not a compact
>protocol field, it has no natural requirement to be 8-bit. Would it be
>better to document and serialize this as a 32-bit integer to prevent
>artificially limiting the enum space for future additions?
...
>If the attribute type in the YAML spec is updated to u32, this call to
>nla_put_u8() in rt6_fill_node() would also need to be updated to
>nla_put_u32() to match the 32-bit width.

Good point, given u8 saves nothing, will change it to u32 in v2.

>Will this operation cause a TypeError crash during test execution?
>In Python 3, using the subtraction operator between a set and a dict_keys
>object raises an unsupported operand type error. Since the caller
>ipv6_route_del_reason_ra_withdrawn() passes a set for the want parameter,
>want - seen.keys() will crash the test.
>Should this be converted to a set first, such as want - set(seen.keys())?

I don't think this is a bug (dict_keys is a set-like view) and the
test passes correctly in my local test. But the suggested form reads
better, so I'll apply it in v2.

Thanks,

Yuyang
