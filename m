Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD78502546;
	Fri, 18 Sep 2026 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750529; cv=none; b=ISn1kAMUrIE/D6o4Hu7ULaxOnm0x1ly4OVB+Ipmr7TDJ5+9vp1kMDGhWCiRXK7XTmyqfg4QpYgpwIQSWWrVFg93jywJembFjZbMsoP0HYFLOIjMVucWUrlJXnEvXQ/tD6BuCutpd/GnoS5SbJd+xURL26lkJ2FJ0PDHDvR4zEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750529; c=relaxed/simple;
	bh=BkrTBUWgtEY3ZSDZV8TWluEgqo3j0w8r8xpczDpSQ8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxT5JQI8JiMLtuOklC6zFASZY6wm6wFaijA5hf2m7BpMXzDEtGFPKgPax9/2YcLHmb7+2XIgcQNOpKoXo7eVjA69Zc6l3ctL2CD4gxOopNkVVQR3fBw1UhZ5kQ5swPYW70xEeCb8zVZEJF/5ef0UWfD+SMQ6v039Xp3Nv2C08zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6BpMVdL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6BpMVdL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D4B1F000FF;
	Fri, 18 Sep 2026 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750527;
	bh=PvwBJ7+u8wV5by4QEYGYKiQPXw9/Ehg40Xjxdr7Muyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E6BpMVdL81jmC7IBcPG67lnce8x94k97ydWHTrsA8eoEV+P8rKu0DRpo3tvVFZcu5
	 IXEJXJkXcio0bnBnZiSFUoBa6Z1Ebt0FKmBlcPWIwlfE6XcOXQgwyaHXmXe76L6clI
	 vLzbljjppIW3bnB9W7N69Ox7YLexvc7GfwsLsDlYuNdbDf8TF3gzkUnSuRj8o/OZak
	 JshdBOUDm0FR0GU2HxfTgpevHuxTwF9lP/FKQ9pu6fWzADu+CPCjlsnpScN+nuKdLB
	 fOrPGrqoN6qG+ACLyeHqi6nt/efIA1wI328uj+HcU5OE2fhorZ/AXRlffelBKyHnDf
	 7txM+/X/ytTNg==
Date: Fri, 18 Sep 2026 18:55:21 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests: net: fix CONFIG_SYSCTL sort order in
 configs
Message-ID: <lf2colzrbojg7ob4qg5z2wldikuitjkls5x47m535h2zgr5ffy@2iqctneklykj>
References: <20260918-selftests-net-config-sort-v1-1-968ea6e8c1b7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zvjvgykwrsi2inxe"
Content-Disposition: inline
In-Reply-To: <20260918-selftests-net-config-sort-v1-1-968ea6e8c1b7@gmail.com>


--zvjvgykwrsi2inxe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 10:49:30PM +0900, Yuya Kusakabe wrote:
> Commit 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors
> CONFIG_SYSCTL") renamed CONFIG_PROC_SYSCTL to CONFIG_SYSCTL in place,
> which left the entry out of alphabetical order in the net and
> packetdrill configs. The netdev CI check for sorted selftest configs
> now fails for every patch that touches either file.
>=20
> Fixes: 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors =
CONFIG_SYSCTL")
> Assisted-by: LLM
> Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
> ---
>  tools/testing/selftests/net/config             | 2 +-
>  tools/testing/selftests/net/packetdrill/config | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests=
/net/config
> index 30d5fcb09a83..737e7e6327b3 100644
> --- a/tools/testing/selftests/net/config
> +++ b/tools/testing/selftests/net/config
> @@ -118,10 +118,10 @@ CONFIG_NFT_NAT=3Dm
>  CONFIG_NUMA=3Dy
>  CONFIG_OPENVSWITCH=3Dm
>  CONFIG_PAGE_POOL_STATS=3Dy
> -CONFIG_SYSCTL=3Dy
>  CONFIG_PSAMPLE=3Dm
>  CONFIG_RPS=3Dy
>  CONFIG_SYN_COOKIES=3Dy
> +CONFIG_SYSCTL=3Dy
>  CONFIG_SYSFS=3Dy
>  CONFIG_TAP=3Dm
>  CONFIG_TCP_CONG_DCTCP=3Dy
> diff --git a/tools/testing/selftests/net/packetdrill/config b/tools/testi=
ng/selftests/net/packetdrill/config
> index 83dde525c53c..b7df8bf30920 100644
> --- a/tools/testing/selftests/net/packetdrill/config
> +++ b/tools/testing/selftests/net/packetdrill/config
> @@ -4,8 +4,8 @@ CONFIG_IPV6=3Dy
>  CONFIG_NET_NS=3Dy
>  CONFIG_NET_SCH_FIFO=3Dy
>  CONFIG_NET_SCH_FQ=3Dy
> -CONFIG_SYSCTL=3Dy
>  CONFIG_SYN_COOKIES=3Dy
> +CONFIG_SYSCTL=3Dy
>  CONFIG_TCP_CONG_CUBIC=3Dy
>  CONFIG_TCP_MD5SIG=3Dy
>  CONFIG_TUN=3Dy
>=20
> ---
> base-commit: 46bc52d13594848023e681860df8700c8db14354
> change-id: 20260918-selftests-net-config-sort-4d13ed1f4927
>=20
> Best regards,
> -- =20
> Yuya Kusakabe <yuya.kusakabe@gmail.com>
>=20

This LGTM in the sense that it has no direct consequence for sysctl.
Reviewed-by: Joel Granados <joel.granados@kernel.org>

--zvjvgykwrsi2inxe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmqtbO8ACgkQupfNUreW
QU9L0wwAgpoP6YFACelPgtPRto4VMmIq9V6bG1FQaf+nbGhE4PZOFoVwe7Xj+LPK
hZeEhcsNAWTU+GmGQGI6OmV8p7Dq0V6zSspyB/pI7TN2RMZQXIrLEdXtizeLLCbW
zlXylPdvwz/EALdPgjGYymgBWNB1aOG1KsDyViBftQDsj4Q2uPf2wZyJKM1P17Yd
Njxa5iHycmW6RM7z1ckDUNHnDlVQGhBa5aWh1o+mBVyOXnMvdKW1gJ+8haIzUf4R
2FzmNNvAS74LOmagILuHUE4BXTWMiPTrIYbrFfdPWhr0aUaOgQ85ggYJMiaIi9Z9
JcJA2CeTgcX4wEtN8wY5yE71Jx4SE9vmYbjNnZcG2aOeDItbL1SlZJAh5kI3W+uC
YApQfri1i+rHoEltVFdvnA3P7X0msL1wjv+W8EEcKwa//spM85Y5FMbey4FgIA9a
7FSt5qJj/2BIXZxr48mqI/2fhhMBh+b44nwwsH5UXL8zscAmkoLD1GMPsvS8U6VD
hFaHh3mv
=gKQZ
-----END PGP SIGNATURE-----

--zvjvgykwrsi2inxe--
