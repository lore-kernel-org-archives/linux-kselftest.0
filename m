Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0934E388384
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451070; cv=none; b=ouy7E/UQN++AM9/Uxa4g3cfOEJBgijsHBcUxmgr3Fi2tdh3Bh56Bks7+hT5la0vPh38i+oQi0N72DwlfDsRqpu4SazXI8NBcp9tEGRwa4elqCa/OuS8S542N0Bmgb8HiGCzuTlSKZFB/3O3BILoOvPE2IRSZBQ8zw3ytXr8M7gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451070; c=relaxed/simple;
	bh=jgnZmK1VdRx3ekmhwpxasyn6+I4krYD1F/qr/XordPg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=i/U4AjNG8khlh2XT1bccR/IWeQ+9VFJBZ65HEJoP+Dl9/vSju+dDUJBBsUaM64DzxzE5uluFpHFF2y+R55pTjp2czkuwv+6XkyAmsjsM9e9EfGGz+0XDP5xmfd8BdN944hKIK4N7Ubga4jj7ia6ATvTWj4e+HIF0HWNGIfzOWl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=mHJcgEqT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="mHJcgEqT"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-846970f0acaso4457796b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 12:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1783451067; x=1784055867; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5w4HIvRYyzA63PhZxwpLU+obOAC5dfzpHXc/SonfN+A=;
        b=mHJcgEqTVdUt6WSh1PSPjMyWmjMviJPoxW6xjlF6OFw9z4OMHuF16/udeHvfKafztr
         zOjXj3IyqIKHE53NWoTNvn3oMMsFWX93tf86+3i0NLpadH1TO1YJOKleR+gpJIc+Nk+m
         jTBXUl3YqHiHoXZtiuCh37WTxeGylJzSxJlV2JXwCOQRd9eHd5T4QRfjd7zd1vSN+u7/
         SNPVjuAAWgt2+5ZnOWmYUmKuWggpoNEaJJCbc2oyKD7NwVHPLlBgCLmuQg8yLBntrjZm
         zgNnxUlYALBLV7VSjzgBlcGVDKFB/0/CdjUSwUuW1mgc9A5vwgKIX1mgNlbuXVVVN7HY
         aIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783451067; x=1784055867;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5w4HIvRYyzA63PhZxwpLU+obOAC5dfzpHXc/SonfN+A=;
        b=XKiC18a/8moaJfxEsDacUpSr4ryPFfuDy3/Hd2sytj/coX1pjzJuE2WGTn4IElHSN0
         xyLym8IaRak5i0RZPmOGWg8hfk4/Pvwyr8fhyPtEWotPrgxlH5HqitTIvDHAtb1Ooj/L
         pZ0URSU1TOBO3FJHsavAPoCMKL445gPu3325cFJJbek27nGUjjwgxEuo8RsI4YiqZSMy
         i1tNfmIj/LA8G2dhREG8dMzs6Nj5XIT+DzKYS29LHR5eeaXpGMH/yZdpBhWWPACJtfpI
         QY6jib/17+W97l+5YzM5nhEcxhRpUsW/QqGSzhK5o9AGicfrwxa/Xo/Hq/wBdy5SCYGS
         jdag==
X-Forwarded-Encrypted: i=1; AHgh+RqzJAkmxk7QJWlU7dhg+cTOfMfP6/Bmets1XlFqU1u0voj3GeyULxkPhPUeOfYAcQE/YUvLFVrZJ3uFoVAaRhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ8d/ACirS7I7t7V3EC5aZ6oCIrLPuLA/OePoLJE2WUnyKcQ96
	4Facier7bLDIH5bGqlyMccviuq8RxCwXoYuBrfDVCDapQpfltCAsPM2v0yLXO50F49Q=
X-Gm-Gg: AfdE7clbrTpISJyFDLoMk1DauYotP1eRvnsboJmW5QrZqYtkjy5ltbbGspAvfUhS5xZ
	O06VhugheQkxEzOrxfxaz2YJnj8D3R2eMua3rJuyr+a5Sxk2kSLTRRteOTl3BoWID1ey+0T+qNz
	nBMerZOaUdQzCs8DQLxqO8wwO27oWM8OiSvvWjaSaHJLaNiy6h44TokyzvvSSKZqBRaIxcIXidc
	WFxO1k7cJiV46C7f2HENi5S22vpIJMPdWX0HQvZes4lTVR5q442Cy7JRc6/jGmhxwbQovjR7wa+
	QykDARJFYE1sOYBhfFCvI6H+4aXjhuIbeiVc5vTKk4lD/uePyMY3myKTt+OGgjfiuU2dyrBiCAq
	izAr7VJxFQKSxPTqtSrNUz3wimY+Lm7xwEJIl0dxxngiyzKlURg202DJotJHOxAdAh7k12py1gk
	bPBgC4zuz3nc9O7USDJkfSEqzI+UVpN5qRJbuLxt9NZw==
X-Received: by 2002:a05:6a00:430a:b0:845:40d1:87fa with SMTP id d2e1a72fcca58-84826bca450mr6248982b3a.25.1783451067279;
        Tue, 07 Jul 2026 12:04:27 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a98asm5882783b3a.42.2026.07.07.12.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 12:04:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 15:04:25 -0400
Message-Id: <DJSKN0TVIESF.1RVIJ8SRZRRBE@etsalapatis.com>
Subject: Re: [PATCH bpf-next v6 3/3] selftests/bpf: Add bpf_fib_lookup()
 VLAN flag tests
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Avinash Duduskar" <avinash.duduskar@gmail.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>
Cc: <eddyz87@gmail.com>, <memxor@gmail.com>, <martin.lau@linux.dev>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <john.fastabend@gmail.com>, <sdf@fomichev.me>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <shuah@kernel.org>,
 <hawk@kernel.org>, <yatsenko@meta.com>, <leon.hwang@linux.dev>,
 <kpsingh@kernel.org>, <a.s.protopopov@gmail.com>, <ameryhung@gmail.com>,
 <rongtao@cestc.cn>, <eyal.birger@gmail.com>, <bpf@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <toke@redhat.com>, <dsahern@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260704092159.1256823-1-avinash.duduskar@gmail.com>
 <20260704092159.1256823-4-avinash.duduskar@gmail.com>
In-Reply-To: <20260704092159.1256823-4-avinash.duduskar@gmail.com>

On Sat Jul 4, 2026 at 5:21 AM EDT, Avinash Duduskar wrote:
> Cover both new VLAN flags in the fib_lookup test. BPF_FIB_LOOKUP_VLAN
> reduces a VLAN egress to its physical parent plus the tag, and
> BPF_FIB_LOOKUP_VLAN_INPUT scopes the lookup to a VLAN subinterface.
>
> BPF_FIB_LOOKUP_VLAN is XDP-only, since VLAN devices have no XDP xmit; the
> tc helper rejects it with -EINVAL, which the table runner asserts for
> every flag arm, and the egress result is checked through
> bpf_xdp_fib_lookup(). Non-VLAN cases run through both helpers and assert
> the path-independent results match; the XDP loop also checks dmac and,
> for the tot_len cases, the route mtu_result, so the VLAN-egress dmac and
> frag-needed coverage stays even though the tc path no longer reaches it.
>
> The egress arms pin the reduction (parent ifindex plus tag, including
> via a neighbour on the VLAN device, in OUTPUT mode, over a bond, and
> through a DIRECT|TBID table) and the failure contract: a stacked-VLAN
> (QinQ) egress returns BPF_FIB_LKUP_RET_VLAN_FAILURE with params->ifindex
> left at the input. That is distinct from a no-neighbour return, which
> reports the egress ifindex; only VLAN_FAILURE rewinds params->ifindex,
> and a guard arm whose input and egress devices differ pins the
> distinction. The VLAN_FAILURE arms are IPv4; the IPv6 path reaches it
> through the same shared code, so an IPv6 arm would only re-test that.
>
> The input arms use an iif rule that routes one destination to two
> gateways, so the asserted gateway reveals which device the lookup used
> as ingress, including VRF table selection through the l3mdev rule and
> l3mdev_fib_table_rcu(). A cross-netns subtest moves a VLAN device into a
> second netns while it stays registered on its parent and checks both
> directions fail closed at the boundary.
>
> A live-frames subtest (test_fib_lookup_vlan_redirect, with
> BPF_F_TEST_XDP_LIVE_FRAMES) drives real frames through the native
> xdp_do_redirect() / xdp_do_flush() path: a reducible egress is
> redirected to the parent and delivered to its peer, while a QinQ egress
> is passed to the stack, since redirecting to the VLAN device would drop
> the frame at flush (no ndo_xdp_xmit).
>
> The remaining per-case assertions are in the test table: resolution
> semantics, the -EINVAL and NOT_FWDED error arms, and the SRC/SKIP_NEIGH
> combinations.
>
> Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

Nit below.

> ---
>  .../selftests/bpf/prog_tests/fib_lookup.c     | 712 +++++++++++++++++-
>  .../testing/selftests/bpf/progs/fib_lookup.c  |  36 +
>  2 files changed, 744 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/fib_lookup.c b/tools/=
testing/selftests/bpf/prog_tests/fib_lookup.c
> index bd7658958004..18b6fdeca382 100644
> --- a/tools/testing/selftests/bpf/prog_tests/fib_lookup.c
> +++ b/tools/testing/selftests/bpf/prog_tests/fib_lookup.c

<SNIP>

> +#define VLAN_ID			100
> +#define VLAN_IFACE		"veth1.100"
> +#define VLAN_ID_DOWN		102
> +#define VLAN_IFACE_DOWN		"veth1.102"
> +#define QINQ_OUTER_IFACE	"veth1.200"
> +#define QINQ_INNER_IFACE	"veth1.200.300"
> +#define VLAN_TABLE		"300"
> +#define IPV4_VLAN_IFACE_ADDR	"10.5.0.254"
> +#define IPV4_VLAN_EGRESS_DST	"10.5.0.2"
> +#define IPV4_QINQ_DST		"10.7.0.2"
> +#define IPV4_VLAN_DST		"10.6.0.2"
> +#define IPV4_VLAN_GW		"10.5.0.1"
> +#define IPV6_VLAN_IFACE_ADDR	"fd02::254"
> +#define IPV6_VLAN_EGRESS_DST	"fd02::2"
> +#define IPV6_VLAN_DST		"fd03::2"
> +#define IPV6_VLAN_GW		"fd02::1"
> +#define VLAN_VID_UNUSED		999
> +#define VRF_IFACE		"vrf-blue"
> +#define VRF_TABLE		"1000"
> +#define VRF_VLAN_ID		101
> +#define VRF_VLAN_IFACE		"veth1.101"
> +#define IPV4_VRF_IFACE_ADDR	"10.8.0.254"
> +#define IPV4_VRF_GW		"10.8.0.1"
> +#define IPV4_VRF_DST		"10.9.0.2"
> +#define TBID_VLAN_ID		50
> +#define TBID_VLAN_IFACE		"veth2.50"
> +#define IPV4_TBID_VLAN_DST	"172.2.0.2"
> +#define IPV4_BOND_VLAN_DST	"10.11.0.2"
> +#define IPV4_VLAN_MTU_DST	"10.5.9.2"
> +#define QINQ_AD_VLAN_ID		200
> +#define QINQ_INNER_VLAN_ID	300
> +#define BOND_IFACE		"bond99"
> +#define BOND_PORT		"veth3"
> +#define BOND_PORT_PEER		"veth4"
> +#define BOND_VLAN_ID		500
>  #define DMAC			"11:11:11:11:11:11"
>  #define DMAC_INIT { 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, }
>  #define DMAC2			"01:01:01:01:01:01"


Here we add a bunch of shorthands for the topology we're setting up,
but not for all interfaces/IPs. E.g.,

<SNIP>

> +/*
> + * A VLAN device can be moved to another netns while staying registered
> + * on its parent. Neither direction may then cross the boundary: the
> + * egress flag must not publish the foreign parent's ifindex, and the
> + * input flag must fail closed rather than use a foreign ingress.
> + */
> +void test_fib_lookup_vlan_netns(void)
> +{
> +	struct bpf_fib_lookup *fib_params;
> +	struct nstoken *nstoken =3D NULL;
> +	struct __sk_buff skb =3D { };
> +	struct fib_lookup *skel =3D NULL;
> +	int prog_fd, xdp_fd, err, parent_idx, vlan_idx;
> +
> +	LIBBPF_OPTS(bpf_test_run_opts, run_opts,
> +		    .data_in =3D &pkt_v6,
> +		    .data_size_in =3D sizeof(pkt_v6),
> +		    .ctx_in =3D &skb,
> +		    .ctx_size_in =3D sizeof(skb),
> +	);
> +	LIBBPF_OPTS(bpf_test_run_opts, xdp_opts,
> +		    .data_in =3D &pkt_v6,
> +		    .data_size_in =3D sizeof(pkt_v6),
> +	);
> +
> +	skel =3D fib_lookup__open_and_load();
> +	if (!ASSERT_OK_PTR(skel, "skel open_and_load"))
> +		return;
> +	prog_fd =3D bpf_program__fd(skel->progs.fib_lookup);
> +	xdp_fd =3D bpf_program__fd(skel->progs.fib_lookup_xdp);
> +	fib_params =3D &skel->bss->fib_params;
> +
> +	SYS(fail, "ip netns add %s", NS_VLAN_A);
> +	SYS(fail, "ip netns add %s", NS_VLAN_B);
> +
> +	nstoken =3D open_netns(NS_VLAN_A);
> +	if (!ASSERT_OK_PTR(nstoken, "open_netns(a)"))
> +		goto fail;
> +
> +	SYS(fail, "ip link add veth7 type veth peer name veth8");
> +	SYS(fail, "ip link set dev veth7 up");
> +	SYS(fail, "ip link add link veth7 name veth7.66 type vlan id 66");
> +	SYS(fail, "ip link set veth7.66 netns %s", NS_VLAN_B);
> +
> +	parent_idx =3D if_nametoindex("veth7");
> +	if (!ASSERT_NEQ(parent_idx, 0, "if_nametoindex(veth7)"))
> +		goto fail;
> +
> +	/*
> +	 * input: the moved device is still in veth7's VLAN group, but it
> +	 * lives in another netns, so the lookup must fail closed
> +	 */
> +	skb.ifindex =3D parent_idx;
> +	memset(fib_params, 0, sizeof(*fib_params));
> +	fib_params->family =3D AF_INET;
> +	fib_params->l4_protocol =3D IPPROTO_TCP;
> +	fib_params->ifindex =3D parent_idx;
> +	fib_params->h_vlan_proto =3D htons(ETH_P_8021Q);
> +	fib_params->h_vlan_TCI =3D htons(66);
> +	if (!ASSERT_EQ(inet_pton(AF_INET, "10.66.0.2", &fib_params->ipv4_dst),
> +		       1, "inet_pton(dst)"))
> +		goto fail;
> +

The IPs are hardcoded here (and in the rest of the code below). AFAICT the
logic is that the defines are to make it more obvious as to what the test
is about. Is there a logic of this kind behind the naming convention?

> +	skel->bss->fib_lookup_ret =3D -1;
> +	skel->bss->lookup_flags =3D BPF_FIB_LOOKUP_VLAN_INPUT |
> +				  BPF_FIB_LOOKUP_SKIP_NEIGH;
> +	err =3D bpf_prog_test_run_opts(prog_fd, &run_opts);
> +	if (!ASSERT_OK(err, "test_run(input)"))
> +		goto fail;
> +	ASSERT_EQ(skel->bss->fib_lookup_ret, BPF_FIB_LKUP_RET_NOT_FWDED,
> +		  "input across netns fails closed");
> +	ASSERT_EQ(fib_params->ifindex, parent_idx, "ifindex untouched");
> +	ASSERT_EQ(fib_params->h_vlan_TCI, htons(66), "tag untouched");
> +
> +	close_netns(nstoken);
> +	nstoken =3D open_netns(NS_VLAN_B);
> +	if (!ASSERT_OK_PTR(nstoken, "open_netns(b)"))
> +		goto fail;
> +
> +	/*
> +	 * egress: the fib result is the VLAN device here, but its parent
> +	 * is in the other netns, so the swap must not happen
> +	 */
> +	SYS(fail, "ip link set dev veth7.66 up");
> +	SYS(fail, "ip addr add 10.66.0.1/24 dev veth7.66");
> +	err =3D write_sysctl("/proc/sys/net/ipv4/conf/veth7.66/forwarding", "1"=
);
> +	if (!ASSERT_OK(err, "write_sysctl(forwarding)"))
> +		goto fail;
> +
> +	vlan_idx =3D if_nametoindex("veth7.66");
> +	if (!ASSERT_NEQ(vlan_idx, 0, "if_nametoindex(veth7.66)"))
> +		goto fail;
> +
> +	memset(fib_params, 0, sizeof(*fib_params));
> +	fib_params->family =3D AF_INET;
> +	fib_params->l4_protocol =3D IPPROTO_TCP;
> +	fib_params->ifindex =3D vlan_idx;
> +	if (!ASSERT_EQ(inet_pton(AF_INET, "10.66.0.2", &fib_params->ipv4_dst),
> +		       1, "inet_pton(dst)") ||
> +	    !ASSERT_EQ(inet_pton(AF_INET, "10.66.0.1", &fib_params->ipv4_src),
> +		       1, "inet_pton(src)"))
> +		goto fail;

<SNIP>
