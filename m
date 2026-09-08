Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA8557C738;
	Tue,  8 Sep 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883018; cv=none; b=Zi8xl4q0Acz+z3QkESe5Um/SIEJwXknxLDpZRDRwZ3Jbqciw31QMhCoVO8ZfFPjXhWpi1rzcJH8DQ+UBGgrL44MAwSzNLHkpbqzZTSflOStJtLypHNqJB9QNjmRWzxkCHvx8u3lf7/49u1sPTC4gehAAcqgKcuOm57e3AcpEdn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883018; c=relaxed/simple;
	bh=SYBL6JqyoQ76N8dx/qhGcs7E92Sv5vj8oJSL3lQKEzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6Ooj++VYVeHaYpIzwPfT9e9ErT+5fLAMn+UEN5eV4uMFjqVDjAxld67QCe1Tg4Fc1llSadg45PX//0QSAWYu1m3kf47pyRx6tWEAhHmembX7Np3E84p1Y0e8roefxuRJ/TSeFx0P+sWdz0O4AyriKobPvrVHy3VZGor9+m/JwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaAb6Cao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaAb6Cao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295801F00A3D;
	Tue,  8 Sep 2026 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788883015;
	bh=D2+EB8N23BWkXyn3BS2+m2U6FpYOtn54CY3uZ3y8YJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SaAb6Cao2iGX8tN4Xu800roPEU65yamNP1bauJE3x9rhEaor3zDWsgJusfIpMUdx7
	 Ox5NYnmwCVp5nj7rHq83u0xvbw8rdpKc3JHPIpTGB4p4uXJ2yi10Pzg/IAp5nxzhiO
	 2l5vcfFagM4XqqpbHtppKno5C2GJZP+FaAjZ/mFWvS9pbIw8aJcFp/XcRvtWnRU5au
	 JC0GwyBQx5gLgEioUNwtDf56/cPi0o71i2xbwn8EhBdWgZVzwaE1nPrKEKYxN4Rko7
	 oF71x82KM+ysYVdVhDJQSKfqCS1afgT1IUF+kw/3/HmE44AGPq4fnsZJH2O+jQMAnV
	 qBwE3Kz8heHNQ==
Message-ID: <1673485d-5529-415b-b1b6-60e27291e3bf@kernel.org>
Date: Tue, 8 Sep 2026 09:56:54 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] rtnetlink: add AF_PACKET multicast dumps
Content-Language: en-US
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260905093932.43726-1-sigefriedhyy@gmail.com>
 <20260905093932.43726-2-sigefriedhyy@gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260905093932.43726-2-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/26 4:39 AM, Yuyang Huang wrote:
> +static int rtnl_dump_mcaddr(struct sk_buff *skb, struct netlink_callback *cb)
> +{
> +	struct net *net = sock_net(skb->sk);
> +	unsigned int flags = NLM_F_MULTI;
> +	struct {
> +		unsigned long ifindex;
> +		int addr_idx;
> +	} *ctx = (void *)cb->ctx;
> +	struct net_device *dev;
> +	int ifindex = 0;
> +	int err = 0;
> +
> +	if (cb->strict_check) {

this is new code. It should only work with strict checking.

> +		err = rtnl_valid_dump_mcaddr_req(cb->nlh, cb->extack,
> +						 &ifindex);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	rcu_read_lock();
> +
> +	if (ifindex) {
> +		cb->answer_flags |= NLM_F_DUMP_FILTERED;
> +		flags |= NLM_F_DUMP_FILTERED;
> +		dev = dev_get_by_index_rcu(net, ifindex);
> +		if (!dev) {
> +			err = -ENODEV;
> +			goto out;
> +		}
> +		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx, flags);
> +		goto out;
> +	}
> +
> +	for_each_netdev_dump(net, dev, ctx->ifindex) {
> +		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx,
> +					   flags);
> +		if (err < 0)
> +			break;
> +	}
> +out:
> +	rcu_read_unlock();
> +	return err;
> +}
> +
>  struct sk_buff *rtmsg_ifinfo_build_skb(int type, struct net_device *dev,
>  				       unsigned int change,
>  				       u32 event, gfp_t flags, int *new_nsid,

