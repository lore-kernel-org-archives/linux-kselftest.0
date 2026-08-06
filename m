Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D0831E848
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 18:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041581; cv=pass; b=lrQi7zwCrs0iwXQTjCgXSH/WsGbCJDT8Opo8NAEATBbi9LHkMOlaVSZyxIQN+F6DqV7YW/En8vR09FD1Yh7mvC/xmaJ1SdZfLS0vY7nMIvFvr89eOvPuNEYVaott6FSR+JWKBBRk6IHeDnG8YXI99BFKuGRj/1U50x31cZLd1Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041581; c=relaxed/simple;
	bh=pfOAB7MYMROfo5498xDO1h7pY/r3KP7/Hy1QpeqQUSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKnQN3d6SCOMycgxoqDq9Fbio35j/c1GArhAMDxU0AGcId0AXT83OLAwfKo1H8csRwrJkmkTjIZwjlfk6x/WAWL5a8bXXrv9A6K8jv3sWFlFBRMO6lTZRN16vgAzKyXKs/fuIsefANTZmvl8I2nR0co5L2N0+IbsW/fpvczAQjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=okDMR+YC; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="okDMR+YC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848479c9bd5so2376400b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 11:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786041579; cv=none;
        d=google.com; s=arc-20260327;
        b=UemRlf6VRfW73jheVOgF4roXd+LxB3ThFSSyr8nb9uTrTAc3cn1okrtq/XSN3gcaar
         Iti9gv+03s7vJoZzTFBYuISUVGXiX/VcTQmYKP78mZgvdyKj0UoUfJ56hjIs7A85GSmW
         3jwWm1ztyMGRNcZzhkWoAvSML0kNWY7hY++bHy9xevKkggUqcc9WoxyDAOWXHU61mVpS
         pBTnQ7sfL6daIlhPNuVrLt22rKP+J/IrI3/K8oU1CiOdenFfDzAch6qRfctbZfUSakdu
         5qgRqeX6zS9fKcP3TFi+9LVbCLqXjw++0Q56eBOrKZ3e590aTVHDVT1csUOmHHPqAE4i
         qmHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3BRHjZhbdz4WOUONSDd4bnXv2txqD1N3uSMMQ8P4FTQ=;
        fh=3BhyrzHEGw9E4+VZMCyTxVUH2N3k4nWw+awEeS+iXwo=;
        b=e6Od2/nw9a7+Tdbx1UabQUvuSuWM7aSHA4rBUCErnsqgxTRBonFB9L+nRvuQ/44bee
         odsrfacBc6GsC08ZDRUmr29JJtRFYwpIrgn0HKHGWL4VQKW+cFlelT7SnvkbZuoUNuv8
         huBmJ4HohwxQozL5A55sENjpTH2F6VEHiPbDjC5AYVVq4nNrCalAAVaC46+q+auXt2EB
         V7WpqIt2PYrxXeTlL6dT1s7q+BCUo2nUqQPFrL0nhiTztoUCb5XQ6cUYNyAuRZB0rI6Y
         LSrH61s8eTuRgD1iaOtdmwgYCEmDYzjkhwjVAVZ5A9ey2CVVXfVw52sjLeGaWFnpHJJf
         VrkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1786041579; x=1786646379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3BRHjZhbdz4WOUONSDd4bnXv2txqD1N3uSMMQ8P4FTQ=;
        b=okDMR+YC3r/K6ebLDdh1fDkmFho3lzO1GiizEYaTOe4F5JGo/YBpmaKGAAXZjufHMh
         Ucn77prweppmaHEEcNh47R2ZUWbKFytLb2XMRqvdzyCukpqYV8wsA6yjaczGgcUV2Pht
         PDWtW6oySKeT+AkY6GS3McRkn07sU+7UL3l/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041579; x=1786646379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BRHjZhbdz4WOUONSDd4bnXv2txqD1N3uSMMQ8P4FTQ=;
        b=hkb7r3GVKo/FIO2cVZ9Wm5J1rCEwvpBudAckPcxjXj2atmRSkHkbSQ6MCQlh1B6O6Z
         cIZ0TvZPxWdT7c0NEbN0u5T7/jqnYR/4t0/MEOlIWslwwESQ+Us0JOE4qMtrig9n1KzD
         j0OIvgNDvmurGNC2kp997D8FQXdduq10EEOfKQLowr/qyLs4uBltku8rkn7XCbY+2qG2
         qP/V8f67+Pd6J2MpwlRT1y6Q1D816BPvoGHHdbMMPcchZdn+iwtek2eEh2Li+l0rf6Ul
         ov5wA5w3umh9N/JvtS0+jbLBmz737JgbvaCYN56IxnuccxqAHQVe654qc3oqSj2gmoGb
         dJzg==
X-Forwarded-Encrypted: i=1; AHgh+RrA6jsWSCT+jq3YZQj1lhpORqG/wedyq8YqSkkFTm71RQ24F9OfxPDw3MGxWIb2T3u/6G2qAvVC2RwosL34v3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMJE5Prk8I61QYHDVa60cl8kHd3mBqmDim45eYqcCzsyk9gFw9
	WUxnkFmOnFFHgDX9kEsARR1KHuT0O+auyfXtfemxlANDFzhjsNv0VuWFKS1yzvGwVzvO7RSPFdn
	YFwsQ0/A5AzfAumxBPTAJ/NZNh44uwEIs5hc96l0C
X-Gm-Gg: AR+sD11eQYS0XzwaiEy7LurdSEdg+B1f3kgmTYLOkecoV2wttj/9/hF88cQb8p/1ghE
	XDLjOUBeuZrEYbSpZGhrSufq3MLimHscTW26hig6ILzmTa+93p/kPpC4ueVFmUFFbpZXGzmd76a
	4nvdFe51yRpzsngvO/v+9UYEfNiJe90gKv/vhlxZ+Pgi2W6fm0RplNUJYCJa1QAXzmvNIxO5uPN
	NIcNchrmz2c42NqHrlfiVWwanZWKOhqpMJ3mDVYTYMK8fGNMbDQqT7RqYxT8gr9S0HbhzyyKZ67
	FK+58k3EUK0r2c+P9k1mmyHTMZa5Kq/uijXl/J/9SecXXw==
X-Received: by 2002:a05:6a00:1250:b0:847:97a4:d6b3 with SMTP id
 d2e1a72fcca58-84f2e05124dmr17666312b3a.16.1786041579110; Thu, 06 Aug 2026
 11:39:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806101235.809370-1-hj351016@gmail.com>
In-Reply-To: <20260806101235.809370-1-hj351016@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 6 Aug 2026 14:39:28 -0400
X-Gm-Features: AUfX_mwGGPywD_1dowwU0s_efYIn1MurbHEiZqupPcf9R8cv8u4CnYQDZq14Uho
Message-ID: <CAM0EoMnj4egE+MnjgqzLxPzucbKnuOJFvEBkcrfSnREL=02tHA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net/sched: act_ct: fix sk_buff leak when the
 header checks reject a packet
To: Hyunjung Ko <hj351016@gmail.com>
Cc: Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Tao Liu <taoliu828@163.com>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 6:12=E2=80=AFAM Hyunjung Ko <hj351016@gmail.com> wro=
te:
>
> tcf_ct_handle_fragments() runs its header sanity checks before handing
> anything to the defragmentation engine:
>
>         if (family =3D=3D NFPROTO_IPV4)
>                 err =3D tcf_ct_ipv4_is_fragment(skb, &frag);
>         else
>                 err =3D tcf_ct_ipv6_is_fragment(skb, &frag);
>         if (err || !frag)
>                 return err;
>
> tcf_ct_ipv4_is_fragment() returns -EINVAL or -ENOMEM;
> tcf_ct_ipv6_is_fragment() adds -EPROTO when ipv6_find_hdr() fails. None o=
f
> them frees or queues the skb, so on that path the caller still owns it.
>
> tcf_ct_act() however funnels every non-zero return into the
> ownership-transfer exit:
>
>         err =3D tcf_ct_handle_fragments(net, skb, family, p->zone, &defra=
g);
>         if (err)
>                 goto out_frag;
>         ...
> out_frag:
>         if (err !=3D -EINPROGRESS)
>                 tcf_action_inc_drop_qstats(&c->common);
>         return TC_ACT_CONSUMED;
>
> TC_ACT_CONSUMED means the action took ownership of the skb, so no caller
> frees it - sch_handle_ingress(), sch_handle_egress() and
> tcf_qevent_handle() all deliberately skip the free for that verdict. The
> skb is therefore orphaned: one sk_buff plus its data buffer is leaked per
> malformed packet, unbounded. Note the drop counter is already incremented
> for these errors, so the statistics claim a drop that never happens.
>
> Three different ownership states reach out_frag: today - the skb may be
> queued by the defrag engine (-EINPROGRESS), already freed by
> nf_ct_handle_fragments(), or still owned by us. Tell the caller which of
> those it is, and free the packet ourselves in the last case, which
> restores the TC_ACT_SHOT behaviour that predated the Fixes: commit.
>
> Reproduced on v7.2-rc6 with a 54-byte frame carrying a 40-byte IPv6
> header with nexthdr =3D 0 (hop-by-hop) and nothing after it, on a
> clsact ingress chain with "action ct". kmemleak reports one leaked
> 232-byte skbuff_head_cache object plus its 704-byte data buffer per
> packet; with this patch it reports none.
>
> Fixes: 3f14b377d01d ("net/sched: act_ct: fix skb leak and crash on ooo fr=
ags")
> Cc: stable@vger.kernel.org # v6.8+
> Assisted-by: Anthropic-Claude-Code:Claude-Opus-5
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>

I actually have tested and reviewed this. So:

Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal
> ---
>  net/sched/act_ct.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> v2:
>  - add a tdc selftest (patch 2/2), as requested by Jamal
>  - add Assisted-by: tag
>  - no functional change to the fix itself
> v1: https://lore.kernel.org/netdev/20260805095539.204356-1-hj351016@gmail=
.com/
>
> Reproducer needs CONFIG_NET_ACT_CT, plus CONFIG_DEBUG_KMEMLEAK and
> kmemleak=3Don to observe it:
>
>   ip link add veth0 type veth peer name veth1
>   ip link set veth0 up; ip link set veth1 up
>   tc qdisc add dev veth0 clsact
>   tc filter add dev veth0 ingress matchall action ct
>
> then inject at veth1 a 54-byte frame: ethertype 0x86DD, a 40-byte IPv6
> header with nexthdr =3D 0 (hop-by-hop) and nothing after it, so
> ipv6_find_hdr() fails with -EBADMSG and tcf_ct_ipv6_is_fragment()
> returns -EPROTO.
>
> Before, one sk_buff plus its data buffer per packet:
>
>   kmemleak: 50 new suspected memory leaks
>   unreferenced object 0xffff888103ed13c0 (size 232):
>     kmem_cache_alloc_node_noprof+0x2f1/0x3e0
>     __alloc_skb+0xe5/0x860
>     alloc_skb_with_frags+0x82/0x750
>     sock_alloc_send_pskb+0x658/0x7e0
>     packet_sendmsg+0x1833/0x4860
>     __x64_sys_sendto+0xe0/0x1c0
>     do_syscall_64+0x102/0x5a0
>
> After: kmemleak reports no unreferenced objects.
>
> Note /proc/slabinfo is not a usable check here on a KASAN build -
> skbuff_head_cache active_objs still grows because the quarantine holds
> the freed objects. kmemleak is the reliable signal.
>
> Patch 2/2 turns the same case into a tdc test, using the clsact drop
> counter as the discriminator: before the fix act_ct returns
> TC_ACT_CONSUMED, so tc_run() never reaches its TC_ACT_SHOT arm and the
> counter stays at zero while the skbs leak.
>
> diff --git a/net/sched/act_ct.c b/net/sched/act_ct.c
> index be535a261fa0..e250969c84ac 100644
> --- a/net/sched/act_ct.c
> +++ b/net/sched/act_ct.c
> @@ -840,8 +840,15 @@ static int tcf_ct_ipv6_is_fragment(struct sk_buff *s=
kb, bool *frag)
>         return 0;
>  }
>
> +/* On error, tells the caller whether it still owns @skb and must free i=
t
> + * itself.  @skb is ours only when the header checks below reject the pa=
cket
> + * before it is handed to the defragmentation engine; once nf_ct_handle_
> + * fragments() has been called the skb is either queued (-EINPROGRESS) o=
r has
> + * already been freed by it.
> + */
>  static int tcf_ct_handle_fragments(struct net *net, struct sk_buff *skb,
> -                                  u8 family, u16 zone, bool *defrag)
> +                                  u8 family, u16 zone, bool *defrag,
> +                                  bool *skb_is_ours)
>  {
>         enum ip_conntrack_info ctinfo;
>         struct tc_skb_cb cb;
> @@ -859,8 +866,12 @@ static int tcf_ct_handle_fragments(struct net *net, =
struct sk_buff *skb,
>                 err =3D tcf_ct_ipv4_is_fragment(skb, &frag);
>         else
>                 err =3D tcf_ct_ipv6_is_fragment(skb, &frag);
> -       if (err || !frag)
> +       if (err) {
> +               *skb_is_ours =3D true;
>                 return err;
> +       }
> +       if (!frag)
> +               return 0;
>
>         cb =3D *tc_skb_cb(skb);
>         err =3D nf_ct_handle_fragments(net, skb, zone, family, &proto, &c=
b.mru);
> @@ -977,6 +988,7 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *skb,=
 const struct tc_action *a,
>         int nh_ofs, err, retval;
>         struct tcf_ct_params *p;
>         bool add_helper =3D false;
> +       bool skb_is_ours =3D false;
>         bool skip_add =3D false;
>         bool defrag =3D false;
>         struct nf_conn *ct;
> @@ -1012,9 +1024,18 @@ TC_INDIRECT_SCOPE int tcf_ct_act(struct sk_buff *s=
kb, const struct tc_action *a,
>          */
>         nh_ofs =3D skb_network_offset(skb);
>         skb_pull_rcsum(skb, nh_ofs);
> -       err =3D tcf_ct_handle_fragments(net, skb, family, p->zone, &defra=
g);
> -       if (err)
> +       err =3D tcf_ct_handle_fragments(net, skb, family, p->zone, &defra=
g,
> +                                     &skb_is_ours);
> +       if (err) {
> +               /* The skb is still ours only when the header checks reje=
cted
> +                * it; returning TC_ACT_CONSUMED for such a packet would =
leak
> +                * it, since no caller frees an skb it was told it no lon=
ger
> +                * owns.
> +                */
> +               if (skb_is_ours)
> +                       goto drop;
>                 goto out_frag;
> +       }
>
>         err =3D nf_ct_skb_network_trim(skb, family);
>         if (err)
> --
> 2.43.0
