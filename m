Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B99E38DC50;
	Wed, 30 Sep 2026 03:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740344; cv=none; b=Z2CNqaD0jBXiAywqp0PY8fRZFrepnd7EP6SVSN7KFWHAGIB561MI55e2ZKvlOMpUz1ZuhpTbtD2kS/kZbyJtFxkVn1QBJlNW/Ar1w1tEKhbCtDaWzTSU6V+eavIpIKGHTKPZH7HEXsST04twmyzsZ3g1xLCnuvV1Q3fS2Clw71s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740344; c=relaxed/simple;
	bh=HWjuypE/QgtXVJhiD3MpGvtxLq9AQJNjLdynRrrrhlw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=emYiVRy/Wcvp9ZQffJGkRM8Wah8saGCNgLXJoa5U1nBFDGiPhkg8H8ED+Iq2z0Ua0hHCXsYbJytWRz6P0NqKBNeuVV/7jHzpllHgvdawoQzw8n/cckVpLT62UNR90c2K3avNr+A/XIPgUrfKp5TzPO6zlW8Tuvj2d0SD1nlhW/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezSen5d9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezSen5d9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B581F00893;
	Wed, 30 Sep 2026 03:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790740343;
	bh=s41UKHmjIRCegPwcfxCv2MQeBjOAfersOgANyjjFq8s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ezSen5d92i8EA8iL8AHoZxMC6FPIEvmvjGVbK/2rdq6JMjn5OAr7kRor5hi1yDvKN
	 wVip92QU94xvd3fW5Ezw6PNg07YXai2LHYtviWX5kTxYbT81F6mosc9QJLg6Eg2SQy
	 7wiO0E9eZaa5FQQjkgPjz1N9rIPJozyaUkfFIXr72+rr0VqSsDlalWvNKul37zmQjQ
	 RR9WWQysKxWtkcUa9N50jB/lg3BmnAvdU1KG6Au6ZfFxU5IBYW1YIVR8lnokb5DkRm
	 rJMsa4WuMgf4BTa2dWBryzKtksgPUVm9XmhxYEdkAgfN4ybLApUC0XOPh5daF+jPUO
	 I7/pjlt1sWucg==
Subject: Re: [PATCH net-next v3 4/6] vxlan: vnifilter: clamp the dumped VNI
 range to the request limit
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 30 Sep 2026 03:52:21 +0000
Message-ID: <179074034181.434549.1824812445002430210@kernel.org>
In-Reply-To: <20260927215209.2581830-5-alishmery18@gmail.com>
References: <20260927215209.2581830-5-alishmery18@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch limits each dumped VXLAN_VNIFILTER_ENTRY to
  VXLAN_VNI_FILTER_MSG_MAX (4096) VNIs.
- [Low] The dump/replay mismatch this patch fixes comes from the previous
  patch in the same unmerged series, commit "vxlan: vnifilter: bound the…

--

vxlan: vnifilter: clamp the dumped VNI range to the request limit

This commit caps each VXLAN_VNIFILTER_ENTRY produced by
vxlan_vnifilter_dump_dev() at VXLAN_VNI_FILTER_MSG_MAX VNIs. It does this
by ending a merged run of contiguous VNIs once the run reaches the limit.
The goal is for dumped entries to be accepted when they are sent back
through RTM_NEWTUNNEL.

> diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
> index 13f4e115701ac..92ea1fc94f458 100644
> --- a/drivers/net/vxlan/vxlan_vnifilter.c
> +++ b/drivers/net/vxlan/vxlan_vnifilter.c
> @@ -382,6 +382,7 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
>  			continue;
>  		}
>  		if (!dump_stats && vnirange(vend, v) == 1 &&
> +		    vnirange(vbegin, v) < VXLAN_VNI_FILTER_MSG_MAX &&
>  		    vxlan_addr_equal(&v->remote_ip, &vend->remote_ip)) {
>  			goto update_end;
>  		} else {

[Severity: Medium]
Does this clamp work at the same granularity as the input-side limit? It
bounds each entry. However, vxlan_vnifilter_check_msg() adds up the spans
of every VXLAN_VNIFILTER_ENTRY in a message:

drivers/net/vxlan/vxlan_vnifilter.c:vxlan_vnifilter_check_msg() {
    ...
		vnis += vni_end - vni_start + 1;
		if (vnis > VXLAN_VNI_FILTER_MSG_MAX) {
			NL_SET_ERR_MSG_ATTR_FMT(extack, attr,
						"Request asks for more than %u VNIs",
						VXLAN_VNI_FILTER_MSG_MAX);
			return -EINVAL;
		}
    ...
}

The comment above the define also describes a per-message limit:

/* Maximum number of VNIs one RTM_NEWTUNNEL or RTM_DELTUNNEL message may add or
 * delete, summed over all of its VXLAN_VNIFILTER_ENTRY attributes. ...

vxlan_vnifilter_dump_dev() still opens one RTM_NEWTUNNEL nlmsg per device
per skb. It keeps adding entries until the skb is full, so nothing limits
the total number of VNIs in one dumped message.

For example, say a device holds VNIs 1-8192, added with two requests. The
dump now produces one message with the entries 1-4096 and 4097-8192.
Wouldn't resending that message unchanged still fail with "Request asks for
more than 4096 VNIs"?

The commit message says:

    the two representations then agree on the same bound.

Is that accurate? After this change, replay works only if each entry goes
in its own request, which is what the selftest in this series does. No
later patch in the series changes vxlan_vnifilter_dump_dev().

One option is for the dump to count VNIs per nlmsg, end the message early
and resume through cb->args. The other is for the commit message to state
that the guarantee applies per entry only.

[Severity: Low]
The final state of the series is fine. However, the mismatch fixed here
comes from the earlier patch in this series, "vxlan: vnifilter: bound the
number of VNIs one request may touch". The commit message says so:

    Now that a single request is bounded to VXLAN_VNI_FILTER_MSG_MAX VNIs,
    replaying such an entry in one RTM_NEWTUNNEL is rejected

At that earlier commit, vxlan_vnifilter_dump_dev() still merges a
contiguous run of any length into one entry. A fully populated device
therefore dumps as a single 1-16777215 entry, and
vxlan_vnifilter_check_msg() rejects it.

Could this clamp be squashed into the limit patch, or moved before it, so
that each commit in the series is consistent for bisection? A Fixes: tag
would not be appropriate, since the cause is not upstream.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927215209.2581830-1-alishmery18%40gmail.com
