Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC244A68B7;
	Sat, 10 Oct 2026 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636097; cv=none; b=slQnAe+309Ti5UlvDDOpKUbnbxyyfnTu9iiGShjGmM8BIiTI+XvdhM6phAJQ5a+lO+2udaMiGFtmXYzLpLvnIoyDlVcpCdUisxGGDvyNK7RdckkF8hNlu7Y1nve/VKWMM7TFoE/j15XtgK3tISIuQAWsCozldB3qQrV2pWsABRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636097; c=relaxed/simple;
	bh=OsxtmsYUtxW8JTZeHK14pG/xicsA0KzuYA0VrM3jlPg=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lovFAm64l0cAjkQHKVHJxQTF+g7kU58ZpL3mhLp+chsvmvTbvoyUgubkzoWHv8Z+xkNnJJfIe9p21/d56R3KF149vL6kzLmAhXFT7hTJmncMs0om3tDThtWyF5jGwwcLf45/cyS51kz7pCAALS7z5Uvo9gx7o5eIxpJSGZgwwBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQiXRl4f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQiXRl4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7FE1F000FF;
	Sat, 10 Oct 2026 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636095;
	bh=21w2i7eE9LPkpxmRB5AIMoQlewYwpPPt/GOP+up8u8I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IQiXRl4fDQpKQDekPFvqBX7D7YGh5sJgTWbNRA11Akh3SV621J//w00moGXIu4Z2P
	 /FXEYyGzASEr11Tyl12lSabbSfdmTFVniyxBQLZ5F9VgGK2YWVsrpK9zuojIHA4c8n
	 BPdP6gV3/dr4+9cc1IlZ0bQel+mR2R7iFj8AN3LU4tz4IFsA55iCClvaiOrQK/O7xv
	 xBRdgow26uNcp8fQwdA0vrpWZPuY7kUgifpEHs05i/1G3Y/2R0nk5DHJBRuwTotrFy
	 HgXmyQAJcnczTnVNcwTpyiZIIsKn2HsHGN3ZFX6rvY16Y9x6zYLqC99SMqTbYNemLD
	 5Hg2hRFzuZeBw==
Subject: Re: [PATCH net-next 10/13] amt: add netlink attributes for an IPv6
 outer transport
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 12:41:34 +0000
Message-ID: <179163609435.434549.4433701408065399687@kernel.org>
In-Reply-To: <20261009122426.551178-11-omar@blockcast.net>
References: <20261009122426.551178-11-omar@blockcast.net>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch makes amt_validate() reject a 16-byte
  IFLA_AMT_LOCAL_IP for every device, and a 16-byte…

--

amt: add netlink attributes for an IPv6 outer transport

This adds IFLA_AMT_LOCAL_IP6, IFLA_AMT_DISCOVERY_IP6 and
IFLA_AMT_REMOTE_IP6, so a device with an IPv6 outer transport can be
created and reported. It also makes amt_validate() refuse a 16-byte
IFLA_AMT_LOCAL_IP, and a 16-byte IFLA_AMT_DISCOVERY_IP on a gateway.
Until now the IPv4 policy accepted such values and truncated them.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 86f168cb222c5..fb199d98d29d4 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -3524,8 +3525,25 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
>  	[IFLA_AMT_REMOTE_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
>  	[IFLA_AMT_DISCOVERY_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
>  	[IFLA_AMT_MAX_TUNNELS]	= { .type = NLA_U32 },

[ ... ]

>  };
>  
> +/* The policy of the IPv4 address attributes only sets a minimum length,
> + * and an iproute2 without IPv6 AMT support puts an IPv6 literal in them,
> + * so the device would take the first four bytes of it as its address.
> + */
> +static bool amt_ip6_in_ip4_attr(const struct nlattr *attr,
> +				struct netlink_ext_ack *extack)
> +{
> +	if (!attr || nla_len(attr) != sizeof(struct in6_addr))
> +		return false;
> +	NL_SET_ERR_MSG_ATTR(extack, attr, "IPv6 address in an IPv4 attribute");
> +	return true;
> +}
> +
>  static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
>  			struct netlink_ext_ack *extack)
>  {
> @@ -3550,16 +3568,63 @@ static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
>  		return -EINVAL;
>  	}
>  
> -	if (!data[IFLA_AMT_LOCAL_IP]) {
> +	if (amt_ip6_in_ip4_attr(data[IFLA_AMT_LOCAL_IP], extack))
> +		return -EINVAL;

[Severity: Low]
The new code itself looks fine. Could this check, and the matching
IFLA_AMT_DISCOVERY_IP one further down in amt_validate(), be split out
into a separate patch for net with a Fixes: tag?

The truncation this check guards against does not depend on IPv6 outer
transport support. Since b9022b53adad ("amt: add control plane of amt
interface"), amt_policy has had this entry:

	[IFLA_AMT_LOCAL_IP]	= { .len = sizeof_field(struct iphdr, daddr) },

The type is left at NLA_UNSPEC, so this length is only a minimum and a
16-byte payload gets through. amt_newlink() then does:

	amt->local_ip = nla_get_in_addr(data[IFLA_AMT_LOCAL_IP]);

This reads only the first four bytes, giving 32.1.13.184 for 2001:db8::.
That address passes the loopback, zeronet and multicast checks, so the
device is created with the wrong address. The same thing happens with
IFLA_AMT_DISCOVERY_IP on a gateway.

This fix is part of a net-next feature patch and has no Fixes: tag. As a
result, stable kernels will keep creating the wrong device without
reporting an error.

The series already handles a similar case as separate net work. The
commit "amt: key relay tunnels on a union amt_addr endpoint" calls the
change to the IPv4 Advertisement source a fix of its own for net.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009122426.551178-1-omar%40blockcast.net
