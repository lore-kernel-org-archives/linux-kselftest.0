Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76550283FC4;
	Sun, 27 Sep 2026 01:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790472303; cv=none; b=OB9RzJPZvTD2JXYQ3XKMX4+QiyrO4jRTGGeCH2ZdNR9RAR2+5qLtidU60Dj6cpAx9UDCgo0OZ85+VMi9ndJ7AEucujiZKQbUUTflg/OsZXD1bDnLQ63Maub7LbOj51Op2d1QXmeownqNw8rAGp7XWxDUyYGXiBqAkaaGX8h+RYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790472303; c=relaxed/simple;
	bh=Jg+i7tOLlFGLu87O0HOn84N5Zb752V/HNrcXNM2tO4I=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IMYPmLO6s0Df0c2zNUPJoVRejekRt/QQDPp3lGLnAXZa9eewWurG1tNZ4E94iUsnn+f5VydmJqkL0dPpDt6b7MfjLC4iO3SVgBDpiViEqIBqiiZDI2EXTvGcaPh1LslBzQNVYKbFHq4kV0H1vYaxxKKtFp10+Bzmn3JRsPWvSrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtyR4iUo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtyR4iUo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1769C1F00893;
	Sun, 27 Sep 2026 01:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790472302;
	bh=3cFJZKP//HXSd8HxiX9y+/cCBjrnliGpiniW1BiGwUI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AtyR4iUoP3wYsDADTBhC9+LC9cwsgnZ3sObJH2W2Dq6qUGvN0/LCfbkg5d9aVp6bf
	 Cb9XxWC00j8al8VuDDf/VbGVl67SF0XktwGmb+CZ2VgDXPK4uo++iZGghwnIUAhJs0
	 hxQUMYwET9XVy5sqaZBuZGhFoJv0dLFa7u/YOhBBkcbJ3Zvh5ucJZVRjPoc7Hcwyx9
	 pab9T/cXN4XD28snz7IpZCZpM3PErJBaMwd/5qD82AKQdBt9TK6tscHlBPPFPGKVKy
	 DyrmD9LLtmEJt7Geo1lzd+WH0X8470QNGHCiGfEUzDs1fJAubj70KfuQsDRNWLoUjm
	 GFWxqitZythuw==
Subject: Re: [PATCH net 3/4] net: ip_tunnel: accept tunnel options without
 NLA_F_NESTED
From: netdev-bot+sashiko@kernel.org
To: yuya.kusakabe@gmail.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 justin.iurman@gmail.com, alex.aring@gmail.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, razor@blackwall.org, eyal.birger@gmail.com,
 nicolas.dichtel@6wind.com, lucien.xin@gmail.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sun, 27 Sep 2026 01:25:00 +0000
Message-ID: <179047230067.2160803.12584347081635948798@kernel.org>
In-Reply-To: <20260923-lwt-encap-noflag-v1-3-8de7ab6c86e9@gmail.com>
References: <20260923-lwt-encap-noflag-v1-3-8de7ab6c86e9@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Restoring a saved route that has two or more geneve options now
  succeeds, but the kernel keeps only the last option.
- [Low] The kernel-doc for the new shared helper lwtunnel_nla_validate()
  (include/net/lwtunnel.h:91-92) says it is "Like nla_validate(), except…

--

net: ip_tunnel: accept tunnel options without NLA_F_NESTED

This patch makes the LWTUNNEL_IP_OPTS and LWTUNNEL_IP6_OPTS parsing
accept attributes that lack NLA_F_NESTED, so that "ip route restore"
can replay routes that the kernel dumped without the flag. It moves
strict_start_type past the OPTS attribute and adds a helper,
lwtunnel_nla_validate(), which validates with the nested check turned
off. It also parses each option with lwtunnel_nla_parse().

> diff --git a/include/net/lwtunnel.h b/include/net/lwtunnel.h
> index 046978d6224c2..59d7ec7b04f2d 100644
> --- a/include/net/lwtunnel.h
> +++ b/include/net/lwtunnel.h
> @@ -80,6 +80,28 @@ static inline int lwtunnel_nla_parse(struct nlattr *tb[], int maxtype,
>  			 extack);
>  }
>  
> +/**
> + * lwtunnel_nla_validate - validate the attributes nested in an lwtunnel encap
> + * @nla: encap attribute passed to &lwtunnel_encap_ops.build_state, or an
> + *	attribute nested in it
> + * @maxtype: maximum attribute type to be expected
> + * @policy: validation policy
> + * @extack: extended ACK report struct
> + *
> + * Like nla_validate(), except that NLA_F_NESTED is not required on the
> + * attributes nested in @nla, for the reason given for lwtunnel_nla_parse().
> + *
> + * Return: 0 on success or a negative error code.
> + */
> +static inline int lwtunnel_nla_validate(const struct nlattr *nla, int maxtype,
> +					const struct nla_policy *policy,
> +					struct netlink_ext_ack *extack)
> +{
> +	return __nla_validate(nla_data(nla), nla_len(nla), maxtype, policy,
> +			      NL_VALIDATE_STRICT & ~NL_VALIDATE_NESTED,
> +			      extack);
> +}

[Severity: Low]
This isn't a bug with the current caller, but does the kernel-doc match
what the NL_VALIDATE_STRICT & ~NL_VALIDATE_NESTED mask does?

The mask differs from the doc in two ways.

First, NL_VALIDATE_NESTED also controls the check in the other
direction. With it cleared, validate_nla() no longer rejects a
non-nested attribute that carries NLA_F_NESTED, although nla_validate()
would:

lib/nlattr.c:validate_nla() {
    ...
	if (validate & NL_VALIDATE_NESTED) {
		...
		if (pt->type != NLA_NESTED && pt->type != NLA_NESTED_ARRAY &&
		    pt->type != NLA_UNSPEC && (nla->nla_type & NLA_F_NESTED)) {
			NL_SET_ERR_MSG_ATTR_POL(extack, nla, pt,
						"NLA_F_NESTED not expected");
			return -EINVAL;
		}
	}
    ...
}

Second, a policy with strict_start_type turns the bit back on for
attribute types at or above that value:

lib/nlattr.c:validate_nla() {
    ...
	if (strict_start_type && type >= strict_start_type)
		validate |= NL_VALIDATE_STRICT;
    ...
}

For those types, NLA_F_NESTED is required again.

The only caller, ip_tun_parse_opts() with ip_opts_policy, is not
affected. That policy has only NLA_NESTED entries and no
strict_start_type. However, the doc invites use on any attribute nested
in a build_state encap attribute.

Could the doc describe these two cases, so that future callers don't
rely on semantics that differ from the implementation?

[ ... ]

> diff --git a/net/ipv4/ip_tunnel_core.c b/net/ipv4/ip_tunnel_core.c
> index bab42b9e277f7..c87827ffc3475 100644
> --- a/net/ipv4/ip_tunnel_core.c
> +++ b/net/ipv4/ip_tunnel_core.c
> @@ -466,7 +466,9 @@ int skb_tunnel_check_pmtu(struct sk_buff *skb, struct dst_entry *encap_dst,
>  EXPORT_SYMBOL(skb_tunnel_check_pmtu);
>  
>  static const struct nla_policy ip_tun_policy[LWTUNNEL_IP_MAX + 1] = {
> -	[LWTUNNEL_IP_UNSPEC]	= { .strict_start_type = LWTUNNEL_IP_OPTS },
> +	[LWTUNNEL_IP_UNSPEC]	= {
> +		.strict_start_type = LWTUNNEL_IP_OPTS + 1
> +	},
>  	[LWTUNNEL_IP_ID]	= { .type = NLA_U64 },
>  	[LWTUNNEL_IP_DST]	= { .type = NLA_U32 },
>  	[LWTUNNEL_IP_SRC]	= { .type = NLA_U32 },
> @@ -509,8 +511,8 @@ static int ip_tun_parse_opts_geneve(struct nlattr *attr,
>  	struct nlattr *tb[LWTUNNEL_IP_OPT_GENEVE_MAX + 1];
>  	int data_len, err;
>  
> -	err = nla_parse_nested(tb, LWTUNNEL_IP_OPT_GENEVE_MAX, attr,
> -			       geneve_opt_policy, extack);
> +	err = lwtunnel_nla_parse(tb, LWTUNNEL_IP_OPT_GENEVE_MAX, attr,
> +				 geneve_opt_policy, extack);
>  	if (err)
>  		return err;

[Severity: High]
Can restoring a saved route with more than one geneve option now succeed
but keep only the last option?

The dump side puts all geneve options into a single
LWTUNNEL_IP_OPTS_GENEVE nest, as repeated CLASS/TYPE/DATA triples:

net/ipv4/ip_tunnel_core.c:ip_tun_fill_encap_opts_geneve() {
    ...
	nest = nla_nest_start_noflag(skb, LWTUNNEL_IP_OPTS_GENEVE);
	...
	while (tun_info->options_len > offset) {
		opt = ip_tunnel_info_opts(tun_info) + offset;
		if (nla_put_be16(skb, LWTUNNEL_IP_OPT_GENEVE_CLASS,
				 opt->opt_class) ||
		    nla_put_u8(skb, LWTUNNEL_IP_OPT_GENEVE_TYPE, opt->type) ||
		    nla_put(skb, LWTUNNEL_IP_OPT_GENEVE_DATA, opt->length * 4,
			    opt->opt_data)) {
    ...
}

The parse side expects one LWTUNNEL_IP_OPTS_GENEVE attribute per
option. ip_tun_parse_opts() calls ip_tun_parse_opts_geneve() once for
each GENEVE attribute, and each call rebuilds exactly one option.

When nla_parse() in ip_tun_parse_opts_geneve() sees repeated types,
__nla_validate_parse() just overwrites tb[type] without an error, so
only the last triple is kept. The function then returns
sizeof(struct geneve_opt) + data_len for that single option. As a
result, ip_tun_get_optlen() sizes the state for one option and
ip_tun_set_opts() copies only that one.

Before this patch, a restored message like this was rejected with
"NLA_F_NESTED is missing". The rejection came from the strict_start_type
check in ip_tun_policy/ip6_tun_policy, and from nla_validate() and
nla_parse_nested(). With all three relaxed, the multi-option nest is
accepted and truncated with no error:

  ip route add ... encap ip id 1 geneve_opts 0:0:12121212,1:2:12121212 ...
  ip route save ...
  ip route del ...
  ip route restore
    ip_tun_build_state()
      ip_tun_get_optlen()
        ip_tun_parse_opts()
          lwtunnel_nla_validate()   <- no NLA_F_NESTED check any more
          ip_tun_parse_opts_geneve()
            nla_parse()             <- second triple overwrites the first

The same applies to ip6_tun_build_state(), which goes through the same
ip_tun_get_optlen()/ip_tun_set_opts() path.

The commit message says this fixes "ip route restore" for routes with
tunnel options saved by "ip route save", and lists 2f1d370b997a
("lwtunnel: add support for multiple geneve opts") in Fixes. That
commit created the mismatch between one nest on dump and one nest per
option on parse, and the mismatch is still there after this patch.

No later patch in the series appears to address this. The selftest
added in "selftests: net: add lwtunnel route save and restore test"
uses only a single geneve option (geneve_opts 0:0:12121212), so it
would not catch it.

Should ip_tun_parse_opts()/ip_tun_parse_opts_geneve() accept repeated
CLASS/TYPE/DATA triples inside one LWTUNNEL_IP_OPTS_GENEVE nest, which
is the layout the dump produces? If not, should restore keep rejecting
this input rather than silently dropping options?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9%40gmail.com
