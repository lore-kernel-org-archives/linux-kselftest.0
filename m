Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F356D4CF48E;
	Fri, 16 Oct 2026 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177855; cv=none; b=WMJK8N/kDiKk52IYTBU4KKPM/CovNvijNGUFZ0sIbGjGu0wDXF6OfjNoMuIb4Lh5wxaV8G1POVVk8iUKas6ekk4NLiJYvJCYUa35lMFp1K3/YflEIq1E2d/jeXv6lKMaouznbzaFiGfzYKFBcdo/Ngw525JEFfz8/nrKRwVkdNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177855; c=relaxed/simple;
	bh=606KlGMo0MVhzdtR12lakgMQf+fqG6H2vYyxgDLPG/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ep8JY20JnIWK81SP8LjLBymVtuCe5GcSQks84vAvclZ7G5tYFvS9UCnSRlQ3+lgncWFVPEixZzh2F0q9Hd75dqITBvZaAr7UJhULKa4MLWuR4BeJvwXXAFiscdKQLU2uLcJ5+c/kw7ZbnCwHOFOaT1zAAvgNozGL6pU8ltLWRa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fD9gPJZ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fD9gPJZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432F71F000C4;
	Fri, 16 Oct 2026 19:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792177853;
	bh=p1Zz/PiCYcCVVY65MsA8HndDLlvQUQID6r8srmwlFSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fD9gPJZ7Zbt86fI7xeagIWG1hbxt3DYzPC/VHspoLFERmXJgOfyI3M8algfzp0FR/
	 6VSUDvB3cqLoDq73Ln730YB/2hbRbFYeATa1TKzXe2IhyJHRqGIk8OXd7KjEUs9vIM
	 ydjIiUlj6Zeokh0mU6Pg9LQr/TU+MafSo2RvG+hlactArx4k2w9D1KYfUg34QN0PyA
	 D0Nya4gM9Cql8pn1T1lniHJ8yLcRnJnnKKoTylMzoHFTrAM6QDbtoRzpWMsJDK6ITg
	 OC9zNDKJ3VgoLvNLA+69jq/Ph4lap6nRVDabg44uY8f4Laxa9oRrPd9S2EApFwZ+KC
	 WW0A2Ab00xncw==
Date: Fri, 16 Oct 2026 20:10:49 +0100
From: Simon Horman <horms@kernel.org>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/2] bareudp: Enable BIG TCP packets
Message-ID: <20261016191049.GP363352@horms.kernel.org>
References: <20261011102023.1603595-1-yanhaishuang@cmss.chinamobile.com>
 <20261011102023.1603595-2-yanhaishuang@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011102023.1603595-2-yanhaishuang@cmss.chinamobile.com>

On Sun, Oct 11, 2026 at 06:20:22PM +0800, Haishuang Yan wrote:
> Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and commit
> 03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP on vxlan
> and geneve, after the preceding patches of that series made the common
> UDP tunnel transmit path handle GSO packets larger than 64KB.
> 
> bareudp transmits through the same helpers, udp_tunnel_handle_offloads()
> followed by udp_tunnel_xmit_skb() or udp_tunnel6_xmit_skb(), and does
> not fill in any length field itself. Bump tso_max_size up to
> GSO_MAX_SIZE so that the admin can use BIG TCP with bareudp too.
> 
> The default gso_max_size and gso_ipv4_max_size stay at 64KB, so nothing
> changes unless they are raised explicitly.
> 
> iperf3 TCP over bareudp (ethertype ipv4, IPv4 outer) between two netns
> connected by veth, MTU 1600 on veth, 3 runs of 20 seconds each. This
> was measured in a QEMU TCG guest, so only the relative numbers are
> meaningful:
> 
>   gso_max_size/gso_ipv4_max_size 65536:
>     4380.6, 4404.2, 4354.5 Mbit/s, average 4379.8 Mbit/s
> 
>   gso_max_size/gso_ipv4_max_size 196608:
>     5509.4, 5454.7, 5497.4 Mbit/s, average 5487.2 Mbit/s (+25%)
> 
> With 196608, about 90k to 100k packets larger than 64KB were
> transmitted on the bareudp device per run, none with 65536. Without
> this patch, setting gso_max_size to 196608 is rejected.
> 
> Assisted-by: LLM
> Acked-by: Alice Mikityanska <alice.kernel@fastmail.im>
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>

Reviewed-by: Simon Horman <horms@kernel.org>

