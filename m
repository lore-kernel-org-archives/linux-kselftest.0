Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CAC3C4163
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233481; cv=pass; b=KmB6JW5rJXu8qbV27LsrOh0Q0UUL4ivsn3AE+PO3HcMeCJdK5W6igc8YPBM+dolHoZ/6lZ0AL5v7BJKTjLxan1E9KaCH3USiF6g+i4RNHxGjaGmgj0/jP9ApGiGZkC/J0WSMvowi4LU+Gz5vMjZuM8TQwgPcfDk+FQYaipN0o8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233481; c=relaxed/simple;
	bh=lpQm89oJ+ypIsAu728Xi2E+HeQLkTJDqgEphRq69EuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogwElfp6OTJzzTBzZmVS7+aiPWKijja3OQsqjV7zD9oG9Mk4k1B9WJ6ujVU/rC6c/MPWWyz0K4Z5bjmgRGSTv44ndssvvYwA2lVQIMJeKt4IBP4frA1IxbPHIKWN/whr2nTM3Xig10E9B0s6WAJUw1EBXeo+mOVYtGINTjaS1LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=uSrfBAHd; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="uSrfBAHd"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67990a45e02so629780d50.3
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 03:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792233478; cv=none;
        d=google.com; s=arc-20260327;
        b=iT9ZqFjs88aNTOZfnKActT9MFZk9Hnt1UoFPAiNsGG6xJgg+20nHtwAMfuk4ZgRnYX
         ahXBHU+Fv/+/jR4Kzi05rqg0S8cycmhk+bQDOvAeYPAaOQoOZgt5BwU4ZTSZlwgYHll0
         4cG2p7xGooohuwcY5X7vPMEsa6y3jYgT3Ij8Z2tZ0AcBA7oKSkIKIK2m1waUdOuKA6sA
         RS4QHqmzWJVGo5KywRkFmHVd+OpOC0J1PXyInOIlI6nWrAsuht3LFWPNdU1NGuBQiOpR
         8Q+H1jMRhAmS5KCNJdLxOyZOsWF6J/fvlL3voC2EMYaPIMDhPmQY7MFNHOifZPqAYyYV
         xZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MRmDjnl0l5zRiljfJEoqVKQPlK3YrtzEIxHy6EIjrqI=;
        fh=XQInNJyZv7jxONc3J8o55Oq1H9CQVdCt4aFav/78Gy8=;
        b=OUNYXyUzWGSaJUinQoAVLjgU9HpOPbE9NQIsCrocOMTlES+IQfkFEHRJC6cB4rbXoK
         PKEGGAwuE/Xk/jRUkFJub1WyNzBtWFjpMVek7U3v07x5ebspLquEXylYaKatiy3PSVZT
         OaAbdQGS2wTM+md5zeMLAyz3w86jJ7uOy3zi7vK25KaZoN2xZDW/MjHgtdZpirSiR+nj
         cVbxuF9RqVRutx+AuJGDqJNjTtVNaLeoF5O/f+/3fFIX9aKVIH+v5yRPajUqccRw93ug
         tD8Dn9jMK+64BO5Ad7PMpCFOsWgmzeq3ELjrzOm2zn5SmOUmCEIQ6K5tSpZBXdswtH3K
         GznQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792233478; x=1792838278; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRmDjnl0l5zRiljfJEoqVKQPlK3YrtzEIxHy6EIjrqI=;
        b=uSrfBAHdi1kw9pdt1rRTCQCehVBqjUEphMkLAn0rsLnrx+5ggEOimnaLY1KxVWaqt7
         MFA9g3PukgfK3de9suYNHp+wRQhMIdnXuVX8piqOwIdbYoqI2aqQis6r2p672DZUm2gs
         3XwloHvq4YrTg3wNq36EM1Ac+3ovf92RV0JIPE+C+vAtZdA5Q7Xe8XUdEhLA5Q5N1QfF
         shmTiDwC8XYNrOrNQi/qLkSkYM0BcY8Fciu14sFA2gEaD8tz18+6oM3O9/eBUwfYd0Gf
         6B30H42afOEQhvlU/HpurAov8omsrFT8lMItKRtDOtI48x/FfVgxst8Y5MwIW4GG26eG
         jUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233478; x=1792838278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MRmDjnl0l5zRiljfJEoqVKQPlK3YrtzEIxHy6EIjrqI=;
        b=OyY5SruKE9LxTnMLZoXusnGwaM569EP2X1DBUVOwTiAay8oTj58hxS5feS6PeVNURW
         szc9wLRe8Kldtakq4jp1RyxToeU4gE3YMVaC801XlTq9B/k5cGGXJNib2NPVddoai9dS
         zCmlLDaymyxKGidIOJcpG9DwBa4fVsqRqrVSIr+bTRNCHSmGNQw7VWg8Td/TrQfMoeZY
         ZDG2RNe/U6hWlHYXS+movBmHOT0yDxq6e9HapzgXpu1ilPdy8aFrutCtJ6MX2cEeIG64
         NUMGezBez5zsPzstFhd0DwOoNOG/Wl5W86h61CxlWljT28HGpn+JJBLp04EiKV4MyTzt
         Kt9g==
X-Forwarded-Encrypted: i=1; AKwUvBwk43JZyWDUyK6ZCOcOGq3f8OpbYbrircm3laqdomeV/XdAxmiB5XEsDecLq6J1ppiP3JiopkzUVhqdmgaIJoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYITwC5Yo6Ze8lAYSBxOZjq05SWVn3tZgqjBkPFesF8LjULNYLQZ
	iF2pkDUcq2hPosHr8ortXgPEHOw23xdh0guzidDd6NQORbxV3OGw169SJ0Oag/kg8+OoTRHFtEi
	qrBRu+4Vic6+xx23BGTOl7hGwtsuHmXyY/tFjtG/4
X-Gm-Gg: AYBFou0rlirUaMa91DMYnmb25g1HXYiPHkQ6qT/0lQn1JfIwI9B1XQ6G87zr1/zrjD8
	Pc0gjBYVuejvJBsQwL6jyKnHDzLh0fOTJQvSFnq7ST19dYVjno3M+N/idPv/CrivE+vRyUHzbcK
	KleffzOaYyTdZ65qpmuZzIscADbSCcG047FqMJLWpKxQmsCVREtNe3EzRVhTbb58odAxNcuO9ET
	dO7SdqWJfi3KGReR89em9UOxf6U+hcSA83w/lrddmVFMC5XWWIWUAcoGBYOOrkmga//j0ZE+sgS
	9An4ip7aCrSnMJv6BSqeP1i+nfLQDMusjUtWktojCKplB+EnhYx2AzJIcAOaEoGFDB3lFyGf7UJ
	D7wg4DWkRAk54hND4sjAq8yf4xciaWy6uh+eYe8U3l90HQshDs7pE/cfPWuP51nI6wZ4FCWXrfQ
	qV+iTJBTsgXU19FXw8KHZbj+RtDjejfWOQixC6VFdNPX1p8tyduOBuLh4x3+ipZW41g5f6g+eX9
	jwWSk7aQrRZBI/JsbTAXEeXQGtUbpeVMWCUi9d/b+1shR04M6PZ/jgEo/o5JGqDVAgC6r+/Ic9b
	DTlGBXLmkZEL5w==
X-Received: by 2002:a05:690e:4812:b0:677:ac49:ebc4 with SMTP id
 956f58d0204a3-679ca883777mr533948d50.67.1792233478237; Sat, 17 Oct 2026
 03:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004171628.3544978-1-julius@bairaktaris.de>
In-Reply-To: <20261004171628.3544978-1-julius@bairaktaris.de>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sat, 17 Oct 2026 10:37:21 +0000
X-Gm-Features: AclHuK82J-XBozK4zoTEoCCy3jbA2RmbzrDB-Adm8RVieBFQXiCNHqYkufTba4U
Message-ID: <CAC1t37JvSaXzbp_spXteQojKL6EvRLLUrwvwSO5e9pcJ4cpaPQ@mail.gmail.com>
Subject: Re: [PATCH nf-next v2 0/4] netfilter: offload a TCP flow whose reply
 is never seen
To: pablo@netfilter.org, netfilter-devel@vger.kernel.org
Cc: kadlec@netfilter.org, fw@strlen.de, coreteam@netfilter.org, 
	netdev@vger.kernel.org, geldot@protonmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Pablo,

gentle ping on v2. Let me know if you'd like anything changed.

Thanks,
Julius


Am So., 4. Okt. 2026 um 17:16 Uhr schrieb Julius Bairaktaris
<julius@bairaktaris.de>:
>
> A router that sees only one direction of a TCP connection, because the
> reply takes another path, cannot offload it: conntrack marks the
> client's ACK after the SYN invalid, and the flowtable only takes assured
> TCP connections. The setup this comes from is two subnets on one L2
> segment, with the server answering over the shared segment.
>
> The series adds no TCP state:
> - patch 1 hands that ACK to the existing loose pickup in tcp_new(),
>   gated by nf_conntrack_tcp_loose, as if the SYN had not been seen
> - patch 2 keeps the reply direction of such a flow on the classic path
>   until the connection is assured, as act_ct does for UDP
> - patch 3 offloads the connection in the original direction and caps
>   the timeout handed back to conntrack at UNACK, as
>   nf_conntrack_tcp_packet() does
> - patch 4 adds a selftest, which fails without patches 1 to 3
>
> Pablo, on v1 you asked how TCP tracking copes without the reply
> direction, and guessed right that the goal is flowtable offload. The
> connection is tracked like a loose mid-stream pickup today: window
> checks are off in both directions, and a FIN or RST still takes the
> flow off the flowtable.
>
> This series was written with the help of an AI coding assistant. I have
> reviewed and tested it.
>
> Changes in v2:
> - patch 2: the XDP flowtable lookup does not return the held reply tuple
> - patch 3: cap the conntrack timeout at UNACK while no reply was seen
> - rebased onto nf-next
>
> v1: https://lore.kernel.org/netfilter-devel/20260910090052.2034970-1-julius@bairaktaris.de/
>
> Gary Dotzler (2):
>   netfilter: conntrack: pick up a TCP flow whose SYN was never answered
>   netfilter: nft_flow_offload: offload a TCP flow that has no reply
>
> Julius Bairaktaris (2):
>   netfilter: flowtable: promote a flow offloaded in one direction only
>   selftests: netfilter: cover a TCP flow whose reply is never seen
>
>  include/net/netfilter/nf_conntrack_l4proto.h  |  9 +++
>  net/netfilter/nf_conntrack_proto_tcp.c        | 16 ++++
>  net/netfilter/nf_flow_table_bpf.c             |  4 +
>  net/netfilter/nf_flow_table_core.c            |  5 ++
>  net/netfilter/nf_flow_table_ip.c              | 26 +++++++
>  net/netfilter/nft_flow_offload.c              |  6 +-
>  .../selftests/net/netfilter/nft_flowtable.sh  | 75 +++++++++++++++++++
>  7 files changed, 139 insertions(+), 2 deletions(-)
>
>
> base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
> --
> 2.53.0
>
