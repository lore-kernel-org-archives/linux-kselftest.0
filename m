Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9DA3BFE42
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 01:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789781163; cv=pass; b=O/9OUx+ESvjOJWzos1r+EjzCuacBFQvF3P0GB1XxhaGL2M62QXPL2nLxoRbThnLL690DUf5ZaO/3YPt9Ed/It4jb6qsSt1Z6fJi1fOp81YBtfBmtLhGhlfAnc5q0y4aWxpr8U39WDfEiERBrvUd2OTXkP99k4pje21Tncw0wfAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789781163; c=relaxed/simple;
	bh=XSgdQN2yictpDS59TUHTRXPj7NA5/+Qdu1X4xC4oFhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4Sl2EdxhlWKcZ25OOc15oNpUAcUv5UHLP5smSABZRWqejsDucgd0IR/1LBikcq1lyte10yRDdCwv6t1EQ9FzC1538y80DiRMWh0bqctmXMV0r8WYoJqoiHiMJDm8NMQIcutqyP59tfSn2BerbPzNxdqZoMYxYHuOT8v1TKovMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFlcyJbK; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFlcyJbK"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a58fef219fso5380831fa.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 18:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789781158; cv=none;
        d=google.com; s=arc-20260327;
        b=dmBkqDSFKL0lxj30ohIdaDT8pD/5cIrzvG+P38D3l2u7L+dJ8ozIrFr2E9jeeGOIMP
         0fN0TWC+x8dRqg/8AivQv9y0yPjY3O0XSpQHClZ0difVvQgcpqTUBAfhhAxNBZ6dD6uA
         pAWuub0ExQ8M6NB1P9yUd3of4pyuO9BoKSIK4GvSMi2VoBlMTzD2o3EZ0ftVP/sAPWkH
         yAA2tDuCjxENNQ2qurb/Hv4Qq5IYUEk/fncV4cGBK6bWxKyThOWy2FkwPE8v/zBEvncH
         e+axioyx5QkriVj7hSEFTiKQX3ZyZLIBh3jW5qGe81fDPO+DxDzNWDOHmevaXPnMs6Di
         TQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WAjkQmQffedcstioBR/bPz7WWF/kUAkcKil242Qiu6U=;
        fh=xtALwn7x45o6I7VSn7AYqURS8eD/EBdEU1o1zVPQXDY=;
        b=jJX4ogfWh83uF5d35JEQa96BcBCwfoqN3eG+Bcg6lU1Y8VsPa9N07qNKUDtnyD4LXc
         0XTDzPLgqXJ+RM3ILcQ+nmJnScs8aq+jzrzliLnUBjAzVYCTS5iHGWZu62eu6dEhh6Eu
         +KqZjzBiWVLIuNh8gTXtbRFmb97AU3GFSVxINrRYL8Wql/uwBUPQwQi7pzF8tL+mQSOd
         jFzM6rzaKzPNgu43vfM1zdbrSTj8DHYE3xdnizblvasvDS9sxH4gHvNBranG9OOUONmq
         WM9kXEhvTkOMz7R3VxxouHP6Z97VFSJgO/Uhzs6QvEle0MwgyuTiNoj06MViFNwpwwy/
         PbPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789781158; x=1790385958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WAjkQmQffedcstioBR/bPz7WWF/kUAkcKil242Qiu6U=;
        b=IFlcyJbKQZ1ErOnOi0LDEaqgvPiYJArojrTtIKp4QVqlRaXW45OnoOWbTiPaHtx1FT
         4IvSzcMkAxYHUhhvR6o3O/CKLNUXTN1waf8AU1UyidwjQT2yLv4ZsDdQQQML8qUJhTVc
         +sUb+5AMYmeaWLt05vdQKMVQs4/cDHRU+h4fUG0ijzIvaFXc33amookTzvGPWs2W6kpl
         5xyGKESlfKwhIK7D+v/DD+4Z00tjiR4yR94O2CW9tbWQ9T/yYPNNtmXYwvIlzhiYCoc6
         s29mix6pd2Rym4fXaXnyNC25wp2SQbhIO+P0mGtzWcF3YlrMfkoAonE9nf+T8krb6KXV
         STUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789781158; x=1790385958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WAjkQmQffedcstioBR/bPz7WWF/kUAkcKil242Qiu6U=;
        b=RFRSqWRXhcuM8pTV+Y73yI3TPjiO4KLk8iBLWCh3EPfi10W7HTdXQ3EiS5Bm5WZtBm
         84pH6hsQe3NgSfY0DLvhrFRfWnhZugVME0V27XlxycKPd/3T8WUeDMCXFmhQUsl61saR
         BYcgWmgJFSJYRsdYyWxgDv47IRSg3oLemjghf3MhScQ62jrdKmqbM96iYRtxmXXuZd0Z
         xwyjZHDndNAUYLb1bNY/twUhJnqUuWLWE31NXPIS5uhk7ZsrcXwXgaaE2lH9Iu7oKtlj
         sCbwbrMK0SXSXjljNDwIg/vDi1zi4A3ej6MYtLz0VnK5w8nqiMsLjr895Guym2cclFuD
         G7qA==
X-Forwarded-Encrypted: i=1; AKwUvBz9KCsI/oP22lYeOu4tw1FrmWjrMjlm8AIQzGcm1Zgp85ZlfbPXnMNLYFAZT4itEYBWYkFBBjLYOENhq+C7nw0=@vger.kernel.org
X-Gm-Message-State: AFuF++nSzJ12BQWEoObsOdk8zmgWEHi6yU50vRMrYPgexo67FY5G4lyv
	oL/4HnBFgvMxO6TlFgjsGf7df6gSTX8xKXd9C3T9ly5uTFbBXdamOlHhTUzs3TDy3CvvoguSvSu
	wY8bWTEMzQ/K/l1vzGqRzwGBwzgfRamk=
X-Gm-Gg: AYBFou0eqhtfct2OblP2FLK/T35srniYGFUADdnPdTcNHOPw55PVqvkwXDqvIAPA2SU
	aQp8kM/qvTiOi4c7YSR2GqaSnforguhRknYjeEIecGM9fuOeb4onSzASORr2DK3HJIGfgiOrNEL
	fxiHKY7sudhowoZ9zo1MN4IwKOO9zatF4arRGOH08v3Tdx+re1/6paV5975a1VFxGlPvpF1Jh3z
	4V8JUiqse3WnbVpxmJCR+d4kx+O5YJwfKCRDamt7rIA1F6OpMkcLaSvKYQhroLXIlNI8YrB9zto
	Y9JZL+aKGoBYygGVCJqeaNpYgWyJm7UbLvwMbdlUGBZZnS4Po+fFcSCiJxmMBWx1MbPrr//6/AE
	z3s0K56F+R8t/Iucnako4/XqcsWw5tYNkofqCVUqFqKnc
X-Received: by 2002:a05:651c:2213:b0:3a5:a4bd:bff6 with SMTP id
 38308e7fff4ca-3a5faeb291emr7755411fa.0.1789781157892; Fri, 18 Sep 2026
 18:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914014539.5015-1-sigefriedhyy@gmail.com> <20260916184748.52ae812d@kernel.org>
In-Reply-To: <20260916184748.52ae812d@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 19 Sep 2026 10:25:47 +0900
X-Gm-Features: AcwNN1VKSMsHXXhl9wsuuXYQn2cCHvXHrr3pGmCERUzA0N73AkVzctfHurZKado
Message-ID: <CA+7S2vKmeaPRBqu84FtVWUjo=U8jTm+LGO04BW6M9h2nRzkHkg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/4] rtnetlink: dump link-layer multicast addresses
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:47=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:

> You compare the situation to IP but for L2 the UC addresses
> are not exposed via RTM_GETADDR. Are you going to add it?

I'm not sure exposing dev->uc via RTM_GETADDR is useful: I haven't
found a use case, and iproute2 does not dump it today either ("ip
addr" only shows IFLA_ADDRESS). If you think
it is worth having for consistency, I'm happy to do it as a follow-up.

> Is that the only justification? To avoid reading proc?
> Are you planning to extend this interface with new features?

For more background:  we have some hardware offload control logic in
userspace that
needs the L2 and L3 multicast state of devices. L3 already comes
over netlink; dev->mc is the last piece read from procfs, so we have to
maintain two copies of the code, one for netlink and one for procfs,
and parsing procfs has none of the benefits netlink gives (e.g. per
interface filtering).

The same split exists in iproute2, where "ip maddr" parses
/proc/net/dev_mcast for the link-layer entries. I already updated
iproute2 to get rid of the procfs parsing for IPv4/IPv6 multicast; L2
multicast is the final piece, and I have something working locally.
Once this patchset is merged, I plan to send the iproute2 patchset.

Thanks,

Yuyang
