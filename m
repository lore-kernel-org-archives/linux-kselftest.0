Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383CF430BA2
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442480; cv=none; b=q+8gkxbEdzTsji/hepoj2m4ZbiPpIoISZ5UmSzNfSIVOT32d2s3EXCXX4nY8m3Hs774Qoz4QoucUHYXac2kVs+QNET22aeJmeOclPx+ya7NCTuYopybIHQbZ2hskV7DxFJqQTEH2DXtKTFop4C9r3o/9+uTqYSfspUkzRQW2G04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442480; c=relaxed/simple;
	bh=alesFxWLKQ1RbEU1q7w2q0nLU/y42g26XqlufkV/BJg=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=OSN1ST96pdIVc7q8R1LtBJArH1uurE97SoqBuR5yRIumMJS9WQQUx3yWmpvduxb7GOJmrH0Vbk0AYxi6GRmm1hWgc7SwI3TJM0kBmsCFZ2GIDQ06weGNmAh86OtqmT4fSNbeIpf8l9QFNVUJ4Jlc7Tkx+JU2nnn22La4B+J9F9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OnJ9nknP; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OnJ9nknP"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772442466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n+usEDmS/c1Ebz7KJq3/1GW9Sx+0gL4RCcuovwgh1jI=;
	b=OnJ9nknPP4bvs1PrLtsj3RTlzgxa6Gb2/3jFzvjDcJw3oq0/erbCidBzdl4/m25WgqzjOj
	lyJXko93MbUbd028prfSnEU3B7uglyFl6E07UkaKh90B58vJY35oUtiJmAQNFD3p6Vv14O
	taEBF6vSnZrdnV5AIXDqWAtwZ9pyeW8=
Date: Mon, 02 Mar 2026 09:07:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jiayuan Chen" <jiayuan.chen@linux.dev>
Message-ID: <80cf6abc40af7f2d072bd9c55758849bb05bfa95@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net v2 1/2] net: ipv6: fix panic when IPv4 route
 references loopback IPv6 nexthop
To: "Ido Schimmel" <idosch@nvidia.com>, "David Ahern" <dsahern@kernel.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, jiayuan.chen@shopee.com,
 syzbot+334190e097a98a1b81bb@syzkaller.appspotmail.com, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
In-Reply-To: <20260302082551.GA814377@shredder>
References: <20260302051132.66314-1-jiayuan.chen@linux.dev>
 <20260302051132.66314-2-jiayuan.chen@linux.dev>
 <20260302082551.GA814377@shredder>
X-Migadu-Flow: FLOW_OUT

March 2, 2026 at 16:25, "Ido Schimmel" <idosch@nvidia.com mailto:idosch@n=
vidia.com?to=3D%22Ido%20Schimmel%22%20%3Cidosch%40nvidia.com%3E > wrote:


>=20
>=20On Mon, Mar 02, 2026 at 01:11:28PM +0800, Jiayuan Chen wrote:
>=20
>=20>=20
>=20> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> >=20=20
>=20>  When a standalone IPv6 nexthop object is created with a loopback d=
evice
> >  (e.g., "ip -6 nexthop add id 100 dev lo"), fib6_nh_init() misclassif=
ies
> >  it as a reject route. This is because nexthop objects have no destin=
ation
> >  prefix (fc_dst=3D::), causing fib6_is_reject() to match any loopback
> >  nexthop. The reject path skips fib_nh_common_init(), leaving
> >  nhc_pcpu_rth_output unallocated. If an IPv4 route later references t=
his
> >  nexthop, __mkroute_output() dereferences NULL nhc_pcpu_rth_output an=
d
> >  panics.
> >=20=20
>=20>  The reject classification was designed for regular IPv6 routes to =
prevent
> >  kernel loopback loops, but nexthop objects should not be subject to =
this
> >  check since they carry no destination information - loop prevention =
is
> >  handled separately when the route is created.
> >=20=20
>=20>  An alternative approach of unconditionally calling fib_nh_common_i=
nit()
> >  for all reject routes was considered, but on large machines (e.g., 2=
56
> >  CPUs) with many routes, this wastes significant memory since
> >  nhc_pcpu_rth_output allocates a per-CPU pointer for each route.
> >=20=20
>=20>  Since fib6_nh_init() is shared by multiple callers (route creation=
,
> >  nexthop object creation, IPv4 gateway validation), using fc_dst_len =
to
> >  implicitly distinguish nexthop objects would be fragile. Add an expl=
icit
> >  fc_is_nh flag to fib6_config to clearly identify nexthop object crea=
tion
> >  and skip the reject check for this path.
> >=20=20
>=20>  Fixes: 7dd73168e273 ("ipv6: Always allocate pcpu memory in a fib6_=
nh")
> >  Reported-by: syzbot+334190e097a98a1b81bb@syzkaller.appspotmail.com
> >  Closes: https://lore.kernel.org/all/698f8482.a70a0220.2c38d7.00ca.GA=
E@google.com/T/
> >  Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> >  ---
> >  include/net/ip6_fib.h | 1 +
> >  net/ipv4/nexthop.c | 1 +
> >  net/ipv6/route.c | 8 +++++++-
> >  3 files changed, 9 insertions(+), 1 deletion(-)
> >=20=20
>=20>  diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
> >  index 88b0dd4d8e09..7710f247b8d9 100644
> >  --- a/include/net/ip6_fib.h
> >  +++ b/include/net/ip6_fib.h
> >  @@ -62,6 +62,7 @@ struct fib6_config {
> >  struct nlattr *fc_encap;
> >  u16 fc_encap_type;
> >  bool fc_is_fdb;
> >  + bool fc_is_nh;
> >  };
> >=20=20
>=20>  struct fib6_node {
> >  diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
> >  index 7b9d70f9b31c..efad2dd27636 100644
> >  --- a/net/ipv4/nexthop.c
> >  +++ b/net/ipv4/nexthop.c
> >  @@ -2859,6 +2859,7 @@ static int nh_create_ipv6(struct net *net, str=
uct nexthop *nh,
> >  struct fib6_config fib6_cfg =3D {
> >  .fc_table =3D l3mdev_fib_table(cfg->dev),
> >  .fc_ifindex =3D cfg->nh_ifindex,
> >  + .fc_is_nh =3D true,
> >  .fc_gateway =3D cfg->gw.ipv6,
> >  .fc_flags =3D cfg->nh_flags,
> >  .fc_nlinfo =3D cfg->nlinfo,
> >  diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> >  index c0350d97307e..347f464ce7fe 100644
> >  --- a/net/ipv6/route.c
> >  +++ b/net/ipv6/route.c
> >  @@ -3628,7 +3628,13 @@ int fib6_nh_init(struct net *net, struct fib6=
_nh *fib6_nh,
> >  * they would result in kernel looping; promote them to reject routes
> >  */
> >  addr_type =3D ipv6_addr_type(&cfg->fc_dst);
> >  - if (fib6_is_reject(cfg->fc_flags, dev, addr_type)) {
> >  + /*
> >  + * Nexthop objects have no destination prefix, so fib6_is_reject()
> >  + * will misclassify loopback nexthops as reject routes, causing
> >  + * fib_nh_common_init() to be skipped along with its allocation
> >  + * of nhc_pcpu_rth_output, which IPv4 routes require.
> >  + */
> >  + if (!cfg->fc_is_nh && fib6_is_reject(cfg->fc_flags, dev, addr_type=
)) {
> >  /* hold loopback dev/idev if we haven't done so. */
> >  if (dev !=3D net->loopback_dev) {
> >  if (dev) {
> >=20
>=20The code basically resets the nexthop device to the loopback device i=
n
> case of reject routes:
>=20
>=20# ip link add name dummy1 up type dummy
> # ip route add unreachable 2001:db8:1::/64 dev dummy1
> # ip -6 route show 2001:db8:1::/64
> unreachable 2001:db8:1::/64 dev lo metric 1024 pref medium
>=20
>=20Therefore, the check in fib6_is_reject() regarding the nexthop device
> being a loopback seems quite pointless. It's probably only needed when
> promoting routes that are using the loopback device to reject routes,
> which happens in ip6_route_info_create_nh() (the other caller of
> fib6_is_reject()).
>=20
>=20I suggest simplifying the check so that it only applies to reject rou=
tes
> [1]. It fixes the issue since RTF_REJECT is a route attribute and not a
> nexthop attribute, so it will never be set by the nexthop code.
>=20
>=20[1]
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 85df25c36409..035e3f668d49 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -3582,7 +3582,6 @@ int fib6_nh_init(struct net *net, struct fib6_nh =
*fib6_nh,
>  netdevice_tracker *dev_tracker =3D &fib6_nh->fib_nh_dev_tracker;
>  struct net_device *dev =3D NULL;
>  struct inet6_dev *idev =3D NULL;
> - int addr_type;
>  int err;
>=20=20
>=20 fib6_nh->fib_nh_family =3D AF_INET6;
> @@ -3624,11 +3623,10 @@ int fib6_nh_init(struct net *net, struct fib6_n=
h *fib6_nh,
>=20=20
>=20 fib6_nh->fib_nh_weight =3D 1;
>=20=20
>=20- /* We cannot add true routes via loopback here,
> - * they would result in kernel looping; promote them to reject routes
> + /* Reset the nexthop device to the loopback device in case of reject
> + * routes.
>  */
> - addr_type =3D ipv6_addr_type(&cfg->fc_dst);
> - if (fib6_is_reject(cfg->fc_flags, dev, addr_type)) {
> + if (cfg->fc_flags & RTF_REJECT) {
>  /* hold loopback dev/idev if we haven't done so. */
>  if (dev !=3D net->loopback_dev) {
>  if (dev) {
>

Thanks, this is indeed the simplest fix.

Let me walk through each case to confirm my understanding:

Case 1: Explicit reject route (with RTF_REJECT)
ip -6 route add unreachable 2001:db8:1::/64

cfg->fc_flags has RTF_REJECT before entering fib6_nh_init(), so the rejec=
t path is taken.
fib_nh_common_init() is skipped, nhc_pcpu_rth_output is not allocated. Th=
is is fine since reject
routes never need it.


Case 2: Loopback implicit reject route (without RTF_REJECT)
ip -6 route add 2001:db8::/32 dev lo

cfg->fc_flags does not have RTF_REJECT, so fib6_nh_init() takes the norma=
l path and
fib_nh_common_init() allocates nhc_pcpu_rth_output. Later, ip6_route_info=
_create() calls
fib6_is_reject() and marks the route as RTF_REJECT.
The allocated nhc_pcpu_rth_output is unused but harmless.


Case 3: Standalone nexthop object (our bug scenario)
ip -6 nexthop add id 100 dev lo

ip route add 172.20.20.0/24 nhid 100
cfg->fc_flags does not have RTF_REJECT (nexthop objects never carry route=
 attributes),
so fib6_nh_init() takes the normal path and fib_nh_common_init() allocate=
s nhc_pcpu_rth_output.
This fixes the crash when an IPv4 route later references this nexthop.
