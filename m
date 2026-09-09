Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4D035E936;
	Wed,  9 Sep 2026 18:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978782; cv=none; b=Vv5ns7acnziOQZaPONABVNOqxL+8Y4S3RBqEbZZZyI0fGUnZiIc6gA7afwatBvRyIjb8yR0Z3rzbW9UCC3jWxii9waIb7vjqX7yMmAOYxgjy81pMadcP58zmSH/myAzhapXoxAJlHousrXXfYJPvEA1YNlA1Bp+PHPiiIZcy3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978782; c=relaxed/simple;
	bh=FN4MB9DrOkRAG5BwNAMUEc9rNHvBFaMmQ693wqgaX5c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fDV/Tc0ssmV3Gx+5sVkG5AhoOXLb+3FS927+fGrGOF9RpAxltB7w68Xq1LXZFC5i92GSs8VZe9+LG+w0oaNovoBdU2aVy/YAlf0YlGhGnEo41cj1pO50RDhqGqGdZVYYlfaI0bnU4YmbrPtRH5z4mGwoVbIoX01ZOv3i7goCTSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gj2czM5h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gj2czM5h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C101F000FF;
	Wed,  9 Sep 2026 18:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788978780;
	bh=FN4MB9DrOkRAG5BwNAMUEc9rNHvBFaMmQ693wqgaX5c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gj2czM5h9kqx1AKnVa6hdiW33xYFygqjhULtOk70b2F3CJWVg5MAuehIPPtEQNpWp
	 8wSSHAXA3IXgr7mcA2in5iGUGj0mHaqoNvhRbr4AVuE9neCtRo8HKiQNwAKEDMi2SA
	 tVhByVGnHGSjCuoftY33IVCreDMTNyEJMN76K06ApXh5dUNusix1iyRmjgqotieaNr
	 7RLoHNr8vYW9t6yTZ6dhpf//P4n7ex2ecv62dnumZbdthMh2A3ZfnnNIZTOen60YI6
	 3tICQ1c62JEKPZ20bmLjUDL/7rmqwWJxkEoPUlcaPEnT9D+NCVzxOkLCInoeOGawi3
	 KZDop7hc0X4OA==
Date: Wed, 9 Sep 2026 11:32:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: Yuyang Huang <sigefriedhyy@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Donald Hunter
 <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, Ido Schimmel
 <idosch@nvidia.com>, Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos
 Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Sabrina
 Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman
 <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/4] netlink: specs: rt-addr: fix the type
 of target-netnsid
Message-ID: <20260909113259.3d061483@kernel.org>
In-Reply-To: <a6836306-a60a-4bd9-8173-0bd759f73dad@6wind.com>
References: <20260909133247.113923-1-sigefriedhyy@gmail.com>
	<20260909133247.113923-2-sigefriedhyy@gmail.com>
	<a6836306-a60a-4bd9-8173-0bd759f73dad@6wind.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Sep 2026 18:09:17 +0200 Nicolas Dichtel wrote:
> Le 09/09/2026 =C3=A0 15:32, Yuyang Huang a =C3=A9crit=C2=A0:
> > The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
> > declares its target-netnsid as s32, but rt-addr.yaml has it as binary.
> >=20
> > Fixes: dfb0f7d9d979 ("doc/netlink: Add spec for rt addr messages")
> > Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com> =20
> This is a fix, so the target is net.
> Could you submit it separately?

We should just drop the Fixes tag instead
It never worked, and if someone cares they can use the latest YAML file
AI makes people slap Fixes tags on everything these days :/
