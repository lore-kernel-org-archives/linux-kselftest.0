Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5993C385508
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 20:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776718361; cv=pass; b=nzxkaQw6suwWYGYXpqHi4N8WkHS+hAFey7dLNQ6kuTkymFkXNLzhIJh4sCT5TBxP62KgU8DU+wBfWu+mPR7tcl7Us7Abuu5sZ4dG63f8ZjZR+BfCZgce7r1ZPqRjBZwPItA+vgkEkjpWSLXevdbnGDu0zpu4JWHlAnpaN8CmewA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776718361; c=relaxed/simple;
	bh=Pnhnz1gyermNjSQP4+5/crpMQ9x95/YqL02Qcv52xEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dq5uhcGHMrAWOgTSLphCL0BN1AzcAa3E3pXHIzz3DjmUkZBqt+LdfdUvXvnFlh39dCye7BlgJQpCwV6hjMEFrMCUwvvFS6/i3mEI9G89pA6ep3FRuy8RSh1qX+w5CdJNCDRz6hDv1NO+Lu5Avr8XN22f5E9/DcZIm9oO7oecK4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjIZLrLI; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjIZLrLI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f8cebc935so1444778b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 13:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776718360; cv=none;
        d=google.com; s=arc-20240605;
        b=Bqrm2cT7T6s7YuQuWAlNwptdA2eIAxSPUrZQ99wZrkoBf6RAcl0bG7dyNn15ouRYdt
         VU0SE10juvmFTAcSSU6zJTV6cI7IR6Zzo7/uEO3kHHpzn5VOW41CyQZTUt58lrmXKvgu
         KhXntNbgT72wpipUbVCoNHKqf1r1b+KQ/rZ+5Z7Dzogn3Q8wXy4Lh8acyu2JXRo4ChrR
         08PHCKDFipJQRnI6L/If++HyCBhdgJyz/qSSunkYlt3DR6GaQ3DbI/KjM85PUOyVnUwJ
         p2efvFWnXh+aoZuCfvL+8tzLU0h/7wfEk5pvX0cDHYzXxgmmTv2DmWGulMFWXl+23j9Z
         FBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MxdD42vr//ngF98PTX13azQKwSAEPSKYCuEqwcGgkfs=;
        fh=MZBhXGASoMdvYhjOO9NBRr8Z7efi6T3IvKAVN1GCBHs=;
        b=C+aTJagkg25fG1dXqukS3WFBY5Uncp9n3o5gPnJPqY8lKETggDxOLXwqfncV7LSRlG
         d44JM9OSxIBOtOhM81GV2KddRSrBqwZ/mMpPaG0A7ISQy3wDLWZAovMhG9jyn7zZZp+M
         qm3hDm8nertBRgFRoSO7fhLaz1uh0MeebOZkUiEtHwGsmWAZ44VqiPnzZJfSqtTTroT2
         Pr6vfWMCeQ80+aTEll/LCuzLex+dWgBXJlTxvNuI0aoFHb5W/sdmOzWrLyi/XxBFRH5r
         k+fzGN8GgjdyHu9oqImdEAckNb6IpDCX+AATODojQPcg19hWKbp/nR+0oDhMaNcZdQ5q
         cDVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776718360; x=1777323160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxdD42vr//ngF98PTX13azQKwSAEPSKYCuEqwcGgkfs=;
        b=FjIZLrLI3KSkP9dhCKwgfkTNIuXNaYPG/XVG89sZwWDi+Lg5mTU+TIeS7qL8fIlP5Z
         9D2UZMCzGtnxdVpbyJp1cUEWpvLOIIoyUCMvzhyNSo8yRVJL3g2ToV1cBKEDM/aXg7gT
         //LIV2svgvvzAyQR80Sp0BLBm+jwmv74bzfOKz1Uz8KB1FF8oE2PeNK8CXhCpKdm/tyR
         Ehzm2Cr60Sr86eIQg3l/2mJogk6wZTBJgg1xtcAv2NQ6ocaOjEztzaMLlQjDz5AlO/E7
         /r5We0LGgS2WTO66XnvyjgPVPEI3K4NiwoC4Mx9BOfBeR2pM5DpGdVa6wt7RLoTNS7ss
         x5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776718360; x=1777323160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MxdD42vr//ngF98PTX13azQKwSAEPSKYCuEqwcGgkfs=;
        b=PbOCFv6khrcE7CPsbPhRLGI570d+ybpwLRsOgx8MTkDdkULeEHzQa5wDuU4ylO5EJZ
         YBEjvjL0sa4cLlVaNDMyC0zgWdMobJ7dAYHNPbqrK0oOGlekK7ZECsH7JJ9t7U0SXTV3
         jg8SpIJvj7Jga72zSJkYrSfSbiD+KXs2miMEFqChX9Lc4Bhl8Ms7LqFMdHMD6nN5QHQt
         xyIxbDyzXCA6rdgR2qGH3y8gs6PlRih6iZtyT7AlyiNXjoN5LuO01r2atuSTxPdC4sNe
         Wew9RqqbanNysxJp1pOc2Aqrd69ZFsi0je8aZBhXdOa8yoAixQkYTlD4jK/5Zq6WRCBc
         Af+w==
X-Forwarded-Encrypted: i=1; AFNElJ+xMiNtXy1vNoI+e5GWAx30LoX4d9q9RLRUGYvQ7Hzdyl+uKuxg/eAXFK+G9Kml+WsdOxC7W9ZwitvhrOHLSX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyMcCcSPgSgq/300i+Oz5FSoEwVblDAGY7y7Pa0NNx80kQnEIo
	gC+wOExk2s1+y+xXpOYuP4GuktJHafWoZfyWslv7LWzUTh+G/IdUzaxyloYJC/9vgjnfZniolA1
	b4didiKOQybRfoakugq7bLzvuDFrxNK8=
X-Gm-Gg: AeBDietyIfaTq+TnY2yuckDFQ+Bq/tM1fPckJoTDMjD+4QiMZg1KI9xtdhb76ic4XgP
	4QE7w89elZoqa0AHGlVe6JlSX4853uahTmil0Lp3aNeCsdfM8HJgEenpt+KNKkFTyty7Hc+eW31
	2p2C3h1zlknNhhPxfn4UsjFhqdx8PlGbtlXpZmUj8iAyg1ycYnbvw6rongo9FnuUgteEnYy+m4p
	LbHU/YNn/9XubUFomu6tT3Da3/ErICgDdn4K74kgnMjpkzScotHfIH/911dWZoCzBfd50Ijjb3I
	YY0L6aLHU9O3jSd7AEs4M39mmwkcLSwkAIE37KaT6Mn6Dcw9F1R2GkcppX5FczgfzqfKSm8qLSk
	9gWqJ1eXXyEauTD08lmxhqQSzQ2dPqa/ryr6c4I3wi3IWUgIU
X-Received: by 2002:a05:6a00:2d1f:b0:82f:7252:38cf with SMTP id
 d2e1a72fcca58-82f8c82c396mr13602325b3a.16.1776718359711; Mon, 20 Apr 2026
 13:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418195843.303946-1-yiche.cy@gmail.com> <20260420082334.7db8cbf4@kernel.org>
In-Reply-To: <20260420082334.7db8cbf4@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 20 Apr 2026 16:52:27 -0400
X-Gm-Features: AQROBzDGLUKJMnGtLHblO9Fg05E_lPRg8I9KEhfXLSlLZeyIegT3XxzFdfu_aUI
Message-ID: <CADvbK_cmmdqxXJC1q-5gDTzhq_XH1ESgRZCD6pO4Ws4GoWooYQ@mail.gmail.com>
Subject: Re: [PATCH net v2] selftests: netfilter: conntrack_sctp_collision.sh:
 Introduce SCTP INIT collision test
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yi Chen <yiche.cy@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 11:23=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Sun, 19 Apr 2026 03:58:43 +0800 Yi Chen wrote:
> > The existing test covered a scenario where a delayed INIT_ACK chunk
> > updates the vtag in conntrack after the association has already been
> > established.
>
> AI says:
>
> The conntrack_sctp_collision.sh selftest is now failing in the NIPA CI on
> both the normal and debug kernel builds:
>
>   not ok 1 1 selftests: net/netfilter: conntrack_sctp_collision.sh # exit=
=3D1
>
>   # Test for SCTP INIT_ACK Collision in nf_conntrack:
>   # Invalid netns name ""
>   # Invalid netns name ""
>
> The root cause is a shell variable scoping bug introduced by this patch.
> The new test structure wraps `topo_setup` in a subshell:
>
>   (topo_setup && conf_delay $SERVER_NS link0 2) || exit $?
Better to change it to:

topo_setup || exit $?
conf_delay $SERVER_NS link0 2 || exit $?

Again, please do not post the patch until the fix gets merged into net.git:

https://lore.kernel.org/netdev/cover.1775847557.git.lucien.xin@gmail.com/

Otherwise, it will still be failing in the NIPA CI.

Thanks.

>   if ! do_test; then
>       ...
>   fi
>
> `topo_setup` calls `setup_ns CLIENT_NS SERVER_NS ROUTER_NS`, which sets
> those variables inside the subshell. Those assignments do not propagate
> back to the parent shell, so when `do_test` is called afterwards, both
> `$SERVER_NS` and `$CLIENT_NS` expand to empty strings. The `ip net exec "=
"`
> calls then fail with "Invalid netns name """.
>
> The second test case (SCTP INIT Collision) would have the same problem.
>
> The fix is to avoid the subshell or ensure the namespace variables are
> visible to `do_test`. The simplest approach is to remove the subshell
> wrapping and call `topo_setup`, `conf_delay`, and `do_test` in the same
> shell scope:
>
>   topo_setup && conf_delay "$SERVER_NS" link0 2 || exit $?
>   if ! do_test; then
>       exit $ksft_fail
>   fi
>
>   topo_setup && conf_delay "$CLIENT_NS" link3 1 || exit $?
>   if ! do_test; then
>       exit $ksft_fail
>   fi
>
> Please also note that `conf_delay` references `$ROUTER_NS` directly
> (not via a parameter), so it too requires that those variables be set
> in the same shell scope.
