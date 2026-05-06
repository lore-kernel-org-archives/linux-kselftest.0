Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3187530B501;
	Wed,  6 May 2026 23:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778109097; cv=none; b=JKyASCjQgU2dvmz3yW28SJ23VQxlbNGj+p9aAiPhv0YMe6WhJ9mSK5qqNGyaJ2TLpP/rmcRerSUK5bj2LC7PGHg1wW90XubsoUqTQYBwgTZLNsA81dt95w6q4sn/lP8EEb7A8m/ZgbnRf0dP+cpeOTCKmV+J12TF2elUBb5KuEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778109097; c=relaxed/simple;
	bh=z9+vpVvtGh3BJ+OblrI/f59Z5QRRDLi6Egfts89i6k8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmgT+SSu3pIyc9j6SRLnX+mXiP+ZG7UJ9FEKgxn8iE/DcT0DEjNpFqOTg5I+P89c3Se5emdaE3eMcYHH0amMYl9UUh5ZdRPrcirdkQsxMrAEVgDlhDQPyktkwyBuYYzv1eUBbRZDgmgQBvU6yOc9BBHvd1vXrXI01kSRcVB2WhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c10RidK5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c10RidK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5219AC2BCB0;
	Wed,  6 May 2026 23:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778109096;
	bh=z9+vpVvtGh3BJ+OblrI/f59Z5QRRDLi6Egfts89i6k8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c10RidK59FF1IzXQz5hrvJKwLc+VGOC2rDG0Qw4jvUdcxAHgp1lgVMC378W3UEFqh
	 /yfBvKXer+ppn+hY96ZZYhtpwpYM9USr8AitW8XC0PPAyb/Yt2pv94gNiqMVReGaPJ
	 J1znWCxe9urzlOEyWLDZ9a921I81OPgbq97mYhPs8P66kt0wlH32SQprcfOqY+Siqo
	 BwaDtC5kNzyN14U1RJ8Q5xtPSR7wMSOFVWCxxqHeQ7VtCA1ihLMb0Y1VZVNqa9Z4bA
	 VCkxitaqjZ6MIeRikwdWM/vcs2F87QXeSO1M8QGBtzUoqWJjC+ZepYH4ioD5lUKA0o
	 D+Z/IobhvD1/Q==
Date: Wed, 6 May 2026 16:11:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Antonio Quartulli <antonio@openvpn.net>
Cc: netdev@vger.kernel.org, edumazet@google.com, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, ralf@mandelbit.com,
 andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/3] ovpn: ensure packet delivery happens with BH
 disabled
Message-ID: <20260506161135.1db08c2d@kernel.org>
In-Reply-To: <9ffc1db1-3b67-453e-ae43-e986fdad3694@openvpn.net>
References: <20260504230305.2681646-3-antonio@openvpn.net>
	<20260506010035.1563280-1-kuba@kernel.org>
	<9ffc1db1-3b67-453e-ae43-e986fdad3694@openvpn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 May 2026 11:00:20 +0200 Antonio Quartulli wrote:
> > ovpn_decrypt_post() {
> >          ...
> >          if (unlikely(ret < 0))
> >                  goto drop;
> >          ...
> > drop:
> >          if (unlikely(skb))
> >                  dev_dstats_rx_dropped(peer->ovpn->dev);
> >          ...
> > }
> > 
> > Since dev_dstats_rx_dropped() updates the same per-CPU dstats structure
> > without disabling bottom halves, could it still be vulnerable to softirq
> > preemption and stat corruption?
> >   
> 
> Actually we were already looking into this.
> However, since this needs a separate analysis, I wanted to get this 
> fixed in a follow up patch.
> 
> Would it be ok to pull this PR as is, so we don't hold back the 
> outstanding fixes?
> 
> Then we will address the issue highlighted by Sashiko in a new patch.
> The problem is similar, but may need to be fixed differently.


Ugh, fair. The way the AI formatted the output made me think
it's an error path in the same function, which would make sense 
to address with a single patch.. Pulling now.
