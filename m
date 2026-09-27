Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16BA3BB57;
	Sun, 27 Sep 2026 01:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790472302; cv=none; b=SFSJH9CnHADVHEP81L7mFW/mHE760spNrXzCVClxfzUhGWgq1XmzOUqSAenkQkx+2j20HeDVHQQc2cDf+KKqrnaqm++IYnv8IJCdhf+2/qRCPd1WO/2Yf/j042Teg98UQlwnxO20HYxjZjlYfhsozO9YjQART63hvbS1fo42fZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790472302; c=relaxed/simple;
	bh=pv+w9ij0G1ixmcHiK76DUpQYeLfN8Tg5uhG6E8P5QPs=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gvNRyOCoQiYM8YR+r6FTAfyf+JKepx+u6i7zAVauUTkRDM5OM4sPVKWWQWhu6DrsCIja5TXy6mo54CbmBZ5IUaDVYpLKhVYB9BTuxTjX0ytJtQ0uVFEFf7ZUuDYEkvOTJp91MbHmU3hMF5i1JPzO5bkvrvel7iTvN3u4GqwjJOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EP0fFBff; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EP0fFBff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA591F000FF;
	Sun, 27 Sep 2026 01:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790472300;
	bh=M7LDpw+G4B1vu0bCA2ym0pEac+k56d/AFVNOHal+gtg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EP0fFBffBMOsAYBUjl3CdP147nWYg2z6Du3G/gNDhuihDgSCvh1Jk1oHggZGqN3GQ
	 /0IL9vVxEdYKJzyRVVHCBLreflD/ED3IONvy+NeQlAcYrvAG606g8/t2YMWtSndI/B
	 Lg3JdKavo0G8JZgHwSzNRSGw6A/tvswCwdBJozU1gHlZfe8pK1d9ArtMJA6dtFX39W
	 D6TiZq1klpxXbOv5m91gOfBR3P5cTiRQemGr/vLDWIaJsxFiMZuY02VX7pe33UGEW2
	 kwONFj6SNs5nv2k8wyU5AMWXlFwbRE9pxvpplKe4poP/S2nljos2/qChvZxaT1RecS
	 0iFxfUqERXKgw==
Subject:
 Re: [PATCH net 1/4] net: lwtunnel: accept RTA_ENCAP without NLA_F_NESTED
From: netdev-bot+sashiko@kernel.org
To: yuya.kusakabe@gmail.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 justin.iurman@gmail.com, alex.aring@gmail.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, razor@blackwall.org, eyal.birger@gmail.com,
 nicolas.dichtel@6wind.com, lucien.xin@gmail.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sun, 27 Sep 2026 01:24:58 +0000
Message-ID: <179047229879.2160803.8451334852998395120@kernel.org>
In-Reply-To: <20260923-lwt-encap-noflag-v1-1-8de7ab6c86e9@gmail.com>
References: <20260923-lwt-encap-noflag-v1-1-8de7ab6c86e9@gmail.com>
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

- [Low] Concern: the patch fixes rpl and ioam6 but leaves
  xfrmi_build_state() (net/xfrm/xfrm_interface_core.c:83) on strict…
- [Low] Concern: the IP/IP6 tunnel encap options (LWTUNNEL_IP_OPTS /
  LWTUNNEL_IP6_OPTS and the GENEVE/VXLAN/ERSPAN entries) are dumped with…

--

net: lwtunnel: accept RTA_ENCAP without NLA_F_NESTED

This adds lwtunnel_nla_parse(). It parses the attributes nested in an
lwtunnel encap strictly, but does not require NLA_F_NESTED on the encap
attribute itself. rpl and ioam6 now use it, so routes dumped by "ip route
save" can be restored with "ip route restore".

> diff --git a/include/net/lwtunnel.h b/include/net/lwtunnel.h
> index 26232f603e33c..046978d6224c2 100644
> --- a/include/net/lwtunnel.h
> +++ b/include/net/lwtunnel.h

[ ... ]

> @@ -37,6 +38,7 @@ struct lwtunnel_state {
>  };
>  
>  struct lwtunnel_encap_ops {
> +	/* encap may lack NLA_F_NESTED, parse it with lwtunnel_nla_parse() */
>  	int (*build_state)(struct net *net, struct nlattr *encap,
>  			   unsigned int family, const void *cfg,
>  			   struct lwtunnel_state **ts,

[Severity: Low]
Do other build_state callbacks still break this contract after this
patch? xfrmi_build_state() in net/xfrm/xfrm_interface_core.c still uses
the strict parser:

net/xfrm/xfrm_interface_core.c:xfrmi_build_state() {
    ...
	ret = nla_parse_nested(tb, LWT_XFRM_MAX, nla, xfrm_lwt_policy, extack);
    ...
}

lwtunnel_fill_encap() emits RTA_ENCAP with the flag cleared:

net/core/lwtunnel.c:lwtunnel_fill_encap() {
    ...
	nest = nla_nest_start_noflag(skb, encap_attr);
    ...
}

Would "ip route save" followed by "ip route restore" of an "encap xfrm
if_id N" route still fail with "NLA_F_NESTED is missing" at this point?

A later patch in this series, "xfrm: lwtunnel: accept RTA_ENCAP without
NLA_F_NESTED", switches xfrmi_build_state() to lwtunnel_nla_parse() and
carries its own Fixes: tag. The series as a whole closes this gap, even
though this patch does not.

> @@ -53,6 +55,31 @@ struct lwtunnel_encap_ops {
>  	struct module *owner;
>  };
>  
> +/**
> + * lwtunnel_nla_parse - parse the attributes nested in an lwtunnel encap
> + * @tb: destination array with maxtype+1 elements
> + * @maxtype: maximum attribute type to be expected
> + * @nla: encap attribute passed to &lwtunnel_encap_ops.build_state, or an
> + *	attribute nested in it
> + * @policy: validation policy
> + * @extack: extended ACK report struct
> + *
> + * The encap attribute, and some of the attributes nested in it, have always
> + * been dumped without NLA_F_NESTED, and userspace such as "ip route restore"
> + * sends a dump back unchanged, so the flag cannot be required on @nla.
> + * The attributes nested in @nla are still validated strictly.
> + *
> + * Return: 0 on success or a negative error code.
> + */
> +static inline int lwtunnel_nla_parse(struct nlattr *tb[], int maxtype,
> +				     const struct nlattr *nla,
> +				     const struct nla_policy *policy,
> +				     struct netlink_ext_ack *extack)
> +{
> +	return nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), policy,
> +			 extack);
> +}

[Severity: Low]
The kernel-doc says some attributes nested in the encap are also dumped
without NLA_F_NESTED. Is the IP/IP6 tunnel options path still rejected on
restore after this patch?

In net/ipv4/ip_tunnel_core.c, ip_tun_fill_encap_opts() and the
geneve/vxlan/erspan fill helpers emit the option nests without the flag:

	nest = nla_nest_start_noflag(skb, type);
	...
	nest = nla_nest_start_noflag(skb, LWTUNNEL_IP_OPTS_GENEVE);

The input side validates them strictly in three places.

ip_tun_policy and ip6_tun_policy:

	[LWTUNNEL_IP_UNSPEC]	= { .strict_start_type = LWTUNNEL_IP_OPTS },

ip_tun_parse_opts():

	err = nla_validate(nla_data(attr), nla_len(attr), LWTUNNEL_IP_OPTS_MAX,
	...

ip_tun_parse_opts_geneve(), and the same in the vxlan and erspan parsers:

	err = nla_parse_nested(tb, LWTUNNEL_IP_OPT_GENEVE_MAX, attr,
	...

lwtunnel_nla_parse() calls nla_parse(), which uses NL_VALIDATE_STRICT. If
a policy had NLA_NESTED children without the flag, it would reject them
too. Could the kernel-doc sentence "The attributes nested in @nla are
still validated strictly" mislead callers that expect unflagged nested
children to be accepted?

This restore failure for the tunnel options has existed since
ed02551f58b9. This patch does not change it.

A later patch in this series, "net: ip_tunnel: accept tunnel options
without NLA_F_NESTED", makes three changes:

- It moves strict_start_type to LWTUNNEL_IP(6)_OPTS + 1.
- It adds lwtunnel_nla_validate() and uses it in ip_tun_parse_opts().
- It switches the geneve/vxlan/erspan parsers to lwtunnel_nla_parse().

None of the policies passed to lwtunnel_nla_parse() in the series have
NLA_NESTED entries. In practice, its strict mode never rejects an
unflagged child.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9%40gmail.com
