Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F194543BDDD;
	Tue, 13 Oct 2026 02:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791859739; cv=none; b=l9k8ZV5r2B6HvTtfIgamgeyMcZcFoi1Ti6JAqBHn7A4Y99ugnabNHZ6fJ97nEnlZ+tmLpwlEMUDU4sRN4PxQss0yD66Af1VHZKYb93Ac03vzKzde50hF7pfhRkMNnuZzXMRUZuvNB8I3JvxNb4YT2z5PYKPPHovmka3T5Utrq58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791859739; c=relaxed/simple;
	bh=YT7rhyZPn2QFWBPFePyF/e9vBCVAxt6ZXGK2xJFk6O0=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MAlMTznSRGpV7Pbvd8yp2X7uUHTjrc4RGhyrFyBUUw6CO96xbj54dmbeUqPBr+btIpnWqO7uu9k2C98QmzMXUi2d9A1eElG62D/F5rRNGAemNR3ZnbDzf8snbwaXxzbqIkJY31AubwfUGC4fflDP18Yc9b2fc4lxmUp+KT6TNUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l14PO/Tw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l14PO/Tw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15B91F000FF;
	Tue, 13 Oct 2026 02:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791859737;
	bh=yjo+sSuB0PitU7qef/nAlZsau4lxf6ulbjPzEJAM21c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l14PO/TwDhr2EjgZ99X+/FMRZheqX7gRVnCpF1hnKTy5HWq30xWY2yAZ6X+UaXspm
	 PlCeCEsJmLRra4XLX8ToQKme7uu8udks44bVByr8NGiHmkXuhCBS9eyl1REV653hIT
	 6DZckbYuc9w5je9PmWcfHXJ5sTmgitUvQdbGp9g902JXess7gYbWkMNRDB6vIVXIeQ
	 DTO2RxeMGTRk/WNmbx2JWW0O3KPDiLi4URryt+Ls6g10OJr1+aT5PgedkhZV9X8/0W
	 UVWDAf+lz2ddIgyh8arpkReWMY1kfEhEAfLd5h3/SlVhjk0kdMtoTCQGQ9e6AIbfgp
	 9IuJpYnPFelCQ==
Subject:
 Re: [PATCH net-next v5 2/3] netlink: specs: add genetlink-legacy spec for GTP
From: netdev-bot+sashiko@kernel.org
To: anilkaushikwireless@gmail.com
Cc: pablo@netfilter.org, laforge@gnumonks.org, donald.hunter@gmail.com,
 kuba@kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 13 Oct 2026 02:48:56 +0000
Message-ID: <179185973624.434549.6410423241897043806@kernel.org>
In-Reply-To: <20261012024800.400616-3-anilkaushikwireless@gmail.com>
References: <20261012024800.400616-3-anilkaushikwireless@gmail.com>
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

- [Low] include/uapi/linux/gtp.h defines `enum gtp_version { GTP_V0 = 0,
  GTP_V1, }` for GTPA_VERSION values, and drivers/net/gtp.c compares…
- [Low] The `family` attribute doc in
  Documentation/netlink/specs/gtp.yaml (line 96) reads "Address family…

--

netlink: specs: add genetlink-legacy spec for GTP

This commit adds a genetlink-legacy YAML spec for the existing GTP
generic netlink family. The spec covers the NEWPDP, DELPDP, GETPDP and
ECHOREQ commands, the GTPA_* attribute set and the "gtp" multicast group.
It also adds a CFLAGS_gtp entry to tools/net/ynl/Makefile.deps.

> diff --git a/Documentation/netlink/specs/gtp.yaml b/Documentation/netlink/specs/gtp.yaml
> new file mode 100644
> index 0000000000000..6a6b49ad2f067
> --- /dev/null
> +++ b/Documentation/netlink/specs/gtp.yaml

[ ... ]

> +attribute-sets:
> +  -
> +    name: gtp
> +    name-prefix: gtpa-
> +    attributes:
> +      -
> +        name: link
> +        type: u32
> +        doc: ifindex of the gtp netdevice the context is attached to.
> +      -
> +        name: version
> +        type: u32
> +        doc: GTP version of the context, 0 for GTPv0 or 1 for GTPv1-U.

[Severity: Low]
Should this attribute reference an enum? include/uapi/linux/gtp.h already
defines the values for GTPA_VERSION:

include/uapi/linux/gtp.h:
enum gtp_version {
	GTP_V0 = 0,
	GTP_V1,
};

drivers/net/gtp.c compares against these values, for example in
gtp_pdp_add() and gtp_genl_fill_info():

	switch (pctx->gtp_version) {
	case GTP_V0:
	...
	case GTP_V1:

The spec has no definitions section, so the valid values only appear in
the doc string. That means ynl clients see version as a raw integer and
cannot encode or decode it by name.

Other legacy specs reference their uapi enums like this, for example
fou.yaml uses "enum: encap-type". Would a definitions entry for
gtp-version plus an enum reference on this attribute work here?

[ ... ]

> +      -
> +        name: family
> +        type: u8
> +        doc: Address family (AF_INET or AF_INET6) of the context addresses.

[Severity: Low]
Is this description accurate? In drivers/net/gtp.c, GTPA_FAMILY only
selects the family of the mobile subscriber address, and it defaults to
AF_INET when the attribute is absent.

In gtp_pdp_add(), family only picks between GTPA_MS_ADDRESS and
GTPA_MS_ADDR6. The peer address is checked against the socket family
instead:

drivers/net/gtp.c:gtp_pdp_add() {
    ...
	family = nla_get_u8_default(info->attrs[GTPA_FAMILY], AF_INET);
    ...
	if ((info->attrs[GTPA_PEER_ADDRESS] &&
	     sk->sk_family == AF_INET6) ||
	    (info->attrs[GTPA_PEER_ADDR6] &&
	     sk->sk_family == AF_INET))
		return ERR_PTR(-EAFNOSUPPORT);

	switch (family) {
	case AF_INET:
		if (!info->attrs[GTPA_MS_ADDRESS] ||
    ...
}

The reply side uses the same split. gtp_genl_fill_info() picks the MS
attribute by pctx->af and the peer attribute by pctx->sk->sk_family:

drivers/net/gtp.c:gtp_genl_fill_info() {
    ...
	    nla_put_u8(skb, GTPA_FAMILY, pctx->af))
    ...
	switch (pctx->af) {
	case AF_INET:
		if (nla_put_be32(skb, GTPA_MS_ADDRESS, pctx->ms.addr.s_addr))
    ...
	switch (pctx->sk->sk_family) {
	case AF_INET:
		if (nla_put_be32(skb, GTPA_PEER_ADDRESS, pctx->peer.addr.s_addr))
    ...
}

As a result, a valid context with an IPv4 subscriber over IPv6 transport
reports family=AF_INET together with peer-addr6. "of the context
addresses" does not describe that case.

Could the doc say that family applies to the ms-address / ms-addr6
attribute only, and that it defaults to AF_INET when absent?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012024800.400616-1-anilkaushikwireless%40gmail.com
