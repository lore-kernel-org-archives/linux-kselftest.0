Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122BD31197C;
	Thu,  3 Sep 2026 01:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788399802; cv=none; b=cjuzzL4Nt/JkdHruBTwCjzgCkEKSvhIHE3xRqZdaNdN0AgQyr68Ir7LBPB0PAjr9kXAXp20SGYIgdwLrd/QMVxW0NxWkIlq6/QMHX8TuXwWLaLTZdQNP6iEJ+8TCIJ/eJzMYz2IK+Hk3CN20JgGZfl4cfnPwUcFLAxlstemBDoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788399802; c=relaxed/simple;
	bh=I0hN6pPH2hQFP8uRRAcft4L/bDWBlJEKdU4XZegNXq8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bEs4Egbj6mW4htPfyu0jAAXRsFfLYO2eqluDkJBSdxNCtZDQz9EHMyA3L5bINJcFPGh2ySMn4bMrQBpwQD6JZuCvA54DGfKoobrFjEvdLRGHP/GKmKZjvbS9mU9J8eJ5/aVVAidBbNCsa6neucpr4okANQAQKMygLDaORPOGE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeVTwF8/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeVTwF8/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE511F000E9;
	Thu,  3 Sep 2026 01:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788399800;
	bh=VVo3wCNUvgKwbbQhBKZT7gJTeZDV3a15DCsFTQOrdgM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IeVTwF8/Bap2FbZpWMF56hbkPe6Z5d1oC9OHTJqSS+LoAuJ0qN3swW+cWAd8Jp1Pr
	 QwSL7fYyJmd1dpq8FhTmTPr3aW8pxS0kyZJkhAxTcn8fkWXIhd8gySSkzoCDTIlwQg
	 PAj53MqU1k1dJQROexkP+w2++xUHHxAl7D+I9Gx+iO+WuwtBXTw47iMab8O13oxh0v
	 yoSHiKBOK+m9AQ7tMSFSm+Eykxz3ZxvRLt6DadEE0wr/0LKngae9Yikp0Govj1oQ50
	 8FF20EZpErntZx9bTvGwRLs9QtuTD6j+1btTjvx7/UMhWPKlgp+ROM9B9aHLcQhWxz
	 398ZgmcTkKZ+w==
Date: Wed, 2 Sep 2026 18:43:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Ahern
 <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 10/11] ip6_tunnel: add drop reasons to the
 transmit path
Message-ID: <20260902184319.6ee0681c@kernel.org>
In-Reply-To: <20260831215137.549324-11-littlesmilingcloud@gmail.com>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
	<20260831215137.549324-11-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Sep 2026 00:51:36 +0300 Anton Danilov wrote:
> Do for the IPv6 tunnels what the previous patches did for the IPv4 ones.
> The situation is the same, with one difference: ip6_tnl_xmit() does not
> free the packet itself, it returns an error and the callers do, so the
> reason has to travel with it.  Give it an output parameter, and pass it
> down through ipxip6_tnl_xmit(), __gre6_xmit() and the three
> ip6gre_xmit_*() helpers to the two places that actually drop.

Warning: ../net/ipv6/ip6_tunnel.c:1113 function parameter 'reason' not described in 'ip6_tnl_xmit'
-- 
pw-bot: cr

