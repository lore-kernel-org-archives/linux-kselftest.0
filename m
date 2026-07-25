Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97A12BEC5E
	for <linux-kselftest@vger.kernel.org>; Sat, 25 Jul 2026 02:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784947722; cv=pass; b=JmIBlDydN5taj9rj1LdWJmWtthigRfYWuA5Kp+kIl8W4pQvyW9NHvbw3TchlA0NHStqwrDAQ81K3D2TO2PxcuL8agArY2iPqtk94l1rrx+HWm+HYR9ddXRxOy9N8z3EInwY05S8zgwg5s/G7OYJ3WG/0H+xMYMU8sMD2DhZuQCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784947722; c=relaxed/simple;
	bh=ZsZ5RhL6Pxi2O/Ji94WC7wH2eSbisV2u7eSo0rbOB68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ff/6dt4jQOYsNE1H+9aix7L7v2TTyNsZWIqzwxR1vn+E3P4bUJLq6usyB2wPRly5yTSAcCzx4mX7aftGXXtchcmfDJjsp1QYXl3oEqyuJivVAPm089vHIJmTg87YHvffcTJaiwWI/sPnocTpqdXRb9kzjYMHfykDIiP9qgAUmlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4FyhrS6; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4FyhrS6"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2aab18795so1023398e87.2
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 19:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784947718; cv=none;
        d=google.com; s=arc-20260327;
        b=O2HJF4so8E2ABY9OK5iRKqViBk+HF+pMAvKxwmagFw7dKetFNrbA96ZjhF3ylgarnA
         Yj2uFVRblhbgxGph8qguuS29fGZPj7euSkVCWqhEL3ZjRnDIoCNaGaZoiBP6t2En1N77
         PM2UZVC9mqT1v4pTSi6GHlCMn7aCFh3F35djetmJX3KNdGJGkrhLwPLE0avKCco7cVad
         IAl0efC8flXe6v5e5Uf9NcxR1jT4l8L25neJ4q2bVqQLzPLM4E6W2YBJYwU9cCQnr0eU
         9Lq8gXESbjf6YWUKl1RmbNZDICq2/0UfjH+kwsqMp681OxEyKdofqiA43CwBPEFJGJIQ
         snmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F63BcNcA1MgA28eVZUuyD7PObe4MiI/SFy8haAO5wh4=;
        fh=Z8Nm6NP4ZwEhNMrlhmJH4L/G2VmrHtjUqVpHwldefuk=;
        b=PCwMBZHH0DlVTzxLUtzuRkDB2krVSSj5AlfJRtkeMFoZOqV9Q+FDKatg8mmjX9/ArB
         pL4jM1nYkZnJrpkx4gim6U1/akIop+Es7jOGDQvvdg8THPxy7WI7G7x+UqGDeMcZlGvp
         w5d88ekLiY3CHEyYf1IAdb+DjwtH+oYj5HlPpoIwzUW2E2bixzuOhphvMTrrQZRjiExv
         fL8l+XA+qSc/EIqQQoOa9S5tkI8Trelvut10hrgVsGnulm5on+MXyi2V8c5x8/PZPKhS
         DDAn71hVSUREUHJbHPkMBGsB4N5QxBLZ0LF5jEa6OhjP6yVXEfKpNuOWOu0hwmjKZGQ/
         XXig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784947718; x=1785552518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F63BcNcA1MgA28eVZUuyD7PObe4MiI/SFy8haAO5wh4=;
        b=R4FyhrS6ybVWaPW0kPv7mM2LEFdnznc7mX9yMIrfOXn/0+Q6595IGPSWt+MjVAaqSu
         JvJT5PIgd3oGeG6iNGoNnFu52MdynnLiWRljDvygrM4Ti1qtjH8Y1dAJcXzGhmNNnEdB
         6WHXSxyFGzHZmHJcpBcV0EfwvFhpewA0ihCUDW1fLYhrH41OSnxg777GaiMa2CpDk8LO
         W6JbgD6zPbcrtxrLa/wToTqdrLEWUMFmmBooliIZWMlj2l1PkulUqJHKhRs/WYr1AYlx
         UQbPdklH9LRXy4/qL6cktIeY++PSh+d6ofpBJiObb3dGlCBm0j3EScmL/YWpp2k8ReIg
         cXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784947718; x=1785552518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F63BcNcA1MgA28eVZUuyD7PObe4MiI/SFy8haAO5wh4=;
        b=GuK3PfUjxvCwh/FeDr0Izb4Ko7n/QPPDahnOfHQq8AWe2BM564j3cqTJMkE3LrnuDD
         nRyW8PFHAoDgBgSFG3SUyr+JBzi8g4IMYZGvfpztftpQ1O2EmHZ5rbD7jk3PvDqH9rge
         FB20cswpC4YJVifzY/IQ7VLJAQfPDbHbPALNBgZP+bE0N3POs2XBRVdHOEdfHcGnlDMc
         R7xIttqaTOm6O3r/tc//I6PxqOeHE3Sfqggm221hLYh8AljBuBXeUlxlxmdHiXHaXfoM
         ovkoPn78Iqf13v+fc78q4X3aWxuvSMTPkK3wtzlUGBfWEwWN3qy+i7i/f0Y1/T2FwDw5
         xEzw==
X-Forwarded-Encrypted: i=1; AHgh+RqjCjVQWhyDnkZ8UB/JdTuqi8LYytMYwzYlx0qdHaEXFYIMJfONyO1ffd/VIht48LggDXFX1WF9TDpEB1RKVaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziZ1N0qmG5+RovP/i8yhVUd0mpLFK9Slx/vy5o9y0zrd1Ykqtg
	OYkX4JXn9FNPwyCXLanXTKyl2BCWMa50SH9msOCugi0UT+wZKLq9xHhgYBfu4qnweOMlnea8dqk
	Ngd7BX3OFBGvs5ZVXCxGt8ZJ1KxTvkyc=
X-Gm-Gg: AR+sD10NpmHR0X+kS+NBPzJJv/Twth+YUCp9HqNRRy1LH4FAHG5Q+kO/PDenkyaSj2q
	TKmExGVHNR/jmyXTm/NqkhbaWDP66yqz9RnWvfLnXf/sapdvof1hf4rJwu9/wADgkwAPo97r/Wc
	kD3gkOJ7Dqd4JyQLRStvmWXhWqwbfnTWTkxYrEWYPw1kB/pAciA+Z+Efu7TkJDvnzm+UBBTDqqZ
	uWsHO9B1XP6wDJsOQ+IAsrg+rDX87aSNfKPrET1g8j7umhhDxK1ZBMNHNpUdEDlDebvljAsmSdl
	MCc7mUjyL41oV9dzf/jiX73WO6Lgeb3g9Ie4dGki4Fs3WUpivwvOP/4D6p4SJQ==
X-Received: by 2002:a05:6512:b89:b0:5b2:c159:ac9a with SMTP id
 2adb3069b0e04-5b2c1b2980bmr87783e87.40.1784947717468; Fri, 24 Jul 2026
 19:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723104403.7970-1-sigefriedhyy@gmail.com> <20260723104403.7970-2-sigefriedhyy@gmail.com>
In-Reply-To: <20260723104403.7970-2-sigefriedhyy@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 25 Jul 2026 11:48:25 +0900
X-Gm-Features: AUfX_mzfOlNMdfVfNBfTERYtAPwykHjsyDIy_kX21bk6WdUhgdeEIvFQcwrWjVw
Message-ID: <CA+7S2vJzi=QkOcnw5ThoMe+W6SeseC_XApcX1H9HZ=TrHKAGzA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] ipv6: report why a route was deleted in RTM_DELROUTE
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Chris J Arges <carges@cloudflare.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>, 
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

review feedback from sashiko is correct

https://sashiko.dev/#/patchset/20260723104403.7970-1-sigefriedhyy%40gmail.c=
om

I will send another revision to fix them.

On Thu, Jul 23, 2026 at 7:44=E2=80=AFPM Yuyang Huang <sigefriedhyy@gmail.co=
m> wrote:
>
> Add RTA_DEL_REASON (u8) to RTM_DELROUTE notifications to report the
> cause of kernel-initiated IPv6 route deletions, so user space can tell
> routes that expired from routes explicitly withdrawn by Router
> Advertisements.
>
> The two causes call for different treatment in user space. An expired
> RA route means the router failed to refresh it before its lifetime ran
> out, which points at a misconfigured or unreliable router; user space
> may want to react, for example by disabling IPv6 on that network
> entirely. An RA withdrawal (zero lifetime) is valid, RFC-compliant
> operation and needs no such recovery. Today both surface as an
> identical RTM_DELROUTE.
>
> Plumb the deletion reason through the IPv6 FIB and notification paths:
> - Update `fib6_del`, `fib6_del_route`, and `inet6_rt_notify` signatures
>   to explicitly pass the `del_reason` (u8) down the call chain.
> - Update `rt6_fill_node()` to emit `RTA_DEL_REASON` attribute when the
>   reason is not UNSPEC.
> - Record the cause in the kernel-initiated IPv6 deletion paths:
>   - RTA_DEL_REASON_EXPIRED: for routes cleaned up by the FIB6 garbage
>     collector.
>   - RTA_DEL_REASON_RA_WITHDRAWN: for default routes, prefix routes, or
>     route information option routes withdrawn by Router Advertisements.
> - Update the `rt-route` Netlink YAML spec to define the new attribute,
>   notifications, and multicast groups.
>
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> ---
>  Documentation/netlink/specs/rt-route.yaml | 33 ++++++++++++
>  include/net/ip6_fib.h                     |  4 +-
>  include/net/ip6_route.h                   |  2 +
>  include/uapi/linux/rtnetlink.h            | 17 ++++++
>  net/ipv6/addrconf.c                       |  3 +-
>  net/ipv6/ip6_fib.c                        | 19 ++++---
>  net/ipv6/ndisc.c                          |  7 ++-
>  net/ipv6/route.c                          | 66 +++++++++++++++--------
>  8 files changed, 116 insertions(+), 35 deletions(-)
>
> diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/ne=
tlink/specs/rt-route.yaml
> index 33195db96746..234f502fb35d 100644
> --- a/Documentation/netlink/specs/rt-route.yaml
> +++ b/Documentation/netlink/specs/rt-route.yaml
> @@ -78,6 +78,15 @@ definitions:
>        -
>          name: rta-used
>          type: u32
> +  -
> +    name: del-reason
> +    type: enum
> +    name-prefix: rta-del-reason-
> +    enum-name: rta-del-reason
> +    entries:
> +      - unspec
> +      - expired
> +      - ra-withdrawn
>
>  attribute-sets:
>    -
> @@ -185,6 +194,10 @@ attribute-sets:
>          type: u32
>          byte-order: big-endian
>          display-hint: hex
> +      -
> +        name: del-reason
> +        type: u32
> +        enum: del-reason
>    -
>      name: metrics
>      name-prefix: rtax-
> @@ -299,6 +312,7 @@ operations:
>              - dport
>              - nh-id
>              - flowlabel
> +            - del-reason
>        dump:
>          request:
>            value: 26
> @@ -322,3 +336,22 @@ operations:
>          request:
>            value: 25
>            attributes: *all-route-attrs
> +    -
> +      name: newroute-ntf
> +      doc: Notification about a created route.
> +      value: 24
> +      notify: getroute
> +    -
> +      name: delroute-ntf
> +      doc: Notification about a deleted route.
> +      value: 25
> +      notify: getroute
> +
> +mcast-groups:
> +  list:
> +    -
> +      name: rtnlgrp-ipv4-route
> +      value: 7
> +    -
> +      name: rtnlgrp-ipv6-route
> +      value: 11
> diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
> index 9cd27e1b9b69..7ca0e2124e79 100644
> --- a/include/net/ip6_fib.h
> +++ b/include/net/ip6_fib.h
> @@ -468,7 +468,7 @@ void fib6_clean_all_skip_notify(struct net *net,
>
>  int fib6_add(struct fib6_node *root, struct fib6_info *rt,
>              struct nl_info *info, struct netlink_ext_ack *extack);
> -int fib6_del(struct fib6_info *rt, struct nl_info *info);
> +int fib6_del(struct fib6_info *rt, struct nl_info *info, u32 del_reason)=
;
>
>  static inline
>  void rt6_get_prefsrc(const struct rt6_info *rt, struct in6_addr *addr)
> @@ -531,7 +531,7 @@ static inline void fib6_rt_update(struct net *net, st=
ruct fib6_info *rt,
>  }
>  #endif
>  void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *in=
fo,
> -                    unsigned int flags);
> +                    unsigned int flags, u32 del_reason);
>
>  void fib6_age_exceptions(struct fib6_info *rt, struct fib6_gc_args *gc_a=
rgs,
>                          unsigned long now);
> diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
> index 09ffe0f13ce7..98f1684fe378 100644
> --- a/include/net/ip6_route.h
> +++ b/include/net/ip6_route.h
> @@ -128,6 +128,8 @@ int ip6_route_add(struct fib6_config *cfg, gfp_t gfp_=
flags,
>  int ip6_ins_rt(struct net *net, struct fib6_info *f6i);
>  #if IS_ENABLED(CONFIG_IPV6)
>  int ip6_del_rt(struct net *net, struct fib6_info *f6i, bool skip_notify)=
;
> +int ip6_del_rt_reason(struct net *net, struct fib6_info *f6i, bool skip_=
notify,
> +                     u32 del_reason);
>  #else
>  static inline int ip6_del_rt(struct net *net, struct fib6_info *f6i,
>                              bool skip_notify)
> diff --git a/include/uapi/linux/rtnetlink.h b/include/uapi/linux/rtnetlin=
k.h
> index 27265fd31e5f..fe00e624f3c3 100644
> --- a/include/uapi/linux/rtnetlink.h
> +++ b/include/uapi/linux/rtnetlink.h
> @@ -399,6 +399,7 @@ enum rtattr_type_t {
>         RTA_DPORT,
>         RTA_NH_ID,
>         RTA_FLOWLABEL,
> +       RTA_DEL_REASON,
>         __RTA_MAX
>  };
>
> @@ -407,6 +408,22 @@ enum rtattr_type_t {
>  #define RTM_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(=
struct rtmsg))))
>  #define RTM_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct rtmsg))
>
> +/* RTA_DEL_REASON: why the kernel deleted the route. u32.
> + * Emitted only on RTM_DELROUTE notifications, and only when the deletio=
n
> + * path records a cause. Absence means either an older kernel or a
> + * deletion path that does not (yet) record its cause - consumers must
> + * treat "absent" and "unspec" identically. New causes may be appended.
> + * Currently only IPv6 deletion paths record a cause.
> + */
> +enum rta_del_reason {
> +       RTA_DEL_REASON_UNSPEC,          /* cause not recorded */
> +       RTA_DEL_REASON_EXPIRED,         /* RTF_EXPIRES lifetime ran out (=
GC) */
> +       RTA_DEL_REASON_RA_WITHDRAWN,    /* zero-lifetime RA / PIO / RIO *=
/
> +       __RTA_DEL_REASON_MAX
> +};
> +
> +#define RTA_DEL_REASON_MAX (__RTA_DEL_REASON_MAX - 1)
> +
>  /* RTM_MULTIPATH --- array of struct rtnexthop.
>   *
>   * "struct rtnexthop" describes all necessary nexthop information,
> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
> index f1fe9ede1edb..1ca9d82b5721 100644
> --- a/net/ipv6/addrconf.c
> +++ b/net/ipv6/addrconf.c
> @@ -2874,7 +2874,8 @@ void addrconf_prefix_rcv(struct net_device *dev, u8=
 *opt, int len, bool sllao)
>                 if (rt) {
>                         /* Autoconf prefix route */
>                         if (valid_lft =3D=3D 0) {
> -                               ip6_del_rt(net, rt, false);
> +                               ip6_del_rt_reason(net, rt, false,
> +                                                 RTA_DEL_REASON_RA_WITHD=
RAWN);
>                                 rt =3D NULL;
>                         } else {
>                                 table =3D rt->fib6_table;
> diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
> index a130cdfaebfb..32b9a00956a0 100644
> --- a/net/ipv6/ip6_fib.c
> +++ b/net/ipv6/ip6_fib.c
> @@ -1286,7 +1286,8 @@ static int fib6_add_rt2node(struct fib6_node *fn, s=
truct fib6_info *rt,
>                 rcu_assign_pointer(rt->fib6_node, fn);
>                 rcu_assign_pointer(*ins, rt);
>                 if (!info->skip_notify)
> -                       inet6_rt_notify(RTM_NEWROUTE, rt, info, nlflags);
> +                       inet6_rt_notify(RTM_NEWROUTE, rt, info, nlflags,
> +                                       RTA_DEL_REASON_UNSPEC);
>                 info->nl_net->ipv6.rt6_stats->fib_rt_entries++;
>
>                 if (!(fn->fn_flags & RTN_RTINFO)) {
> @@ -1317,7 +1318,8 @@ static int fib6_add_rt2node(struct fib6_node *fn, s=
truct fib6_info *rt,
>                 rt->fib6_next =3D iter->fib6_next;
>                 rcu_assign_pointer(*ins, rt);
>                 if (!info->skip_notify)
> -                       inet6_rt_notify(RTM_NEWROUTE, rt, info, NLM_F_REP=
LACE);
> +                       inet6_rt_notify(RTM_NEWROUTE, rt, info, NLM_F_REP=
LACE,
> +                                       RTA_DEL_REASON_UNSPEC);
>                 if (!(fn->fn_flags & RTN_RTINFO)) {
>                         info->nl_net->ipv6.rt6_stats->fib_route_nodes++;
>                         fn->fn_flags |=3D RTN_RTINFO;
> @@ -1966,7 +1968,8 @@ static struct fib6_node *fib6_repair_tree(struct ne=
t *net,
>  }
>
>  static void fib6_del_route(struct fib6_table *table, struct fib6_node *f=
n,
> -                          struct fib6_info __rcu **rtp, struct nl_info *=
info)
> +                          struct fib6_info __rcu **rtp, struct nl_info *=
info,
> +                          u32 del_reason)
>  {
>         struct fib6_info *leaf, *replace_rt =3D NULL;
>         struct fib6_walker *w;
> @@ -2055,13 +2058,13 @@ static void fib6_del_route(struct fib6_table *tab=
le, struct fib6_node *fn,
>                         call_fib6_entry_notifiers_replace(net, replace_rt=
);
>         }
>         if (!info->skip_notify)
> -               inet6_rt_notify(RTM_DELROUTE, rt, info, 0);
> +               inet6_rt_notify(RTM_DELROUTE, rt, info, 0, del_reason);
>
>         fib6_info_release(rt);
>  }
>
>  /* Need to own table->tb6_lock */
> -int fib6_del(struct fib6_info *rt, struct nl_info *info)
> +int fib6_del(struct fib6_info *rt, struct nl_info *info, u32 del_reason)
>  {
>         struct net *net =3D info->nl_net;
>         struct fib6_info __rcu **rtp;
> @@ -2090,7 +2093,7 @@ int fib6_del(struct fib6_info *rt, struct nl_info *=
info)
>                 if (rt =3D=3D cur) {
>                         if (fib6_requires_src(cur))
>                                 fib6_routes_require_src_dec(info->nl_net)=
;
> -                       fib6_del_route(table, fn, rtp, info);
> +                       fib6_del_route(table, fn, rtp, info, del_reason);
>                         return 0;
>                 }
>                 rtp_next =3D &cur->fib6_next;
> @@ -2252,7 +2255,7 @@ static int fib6_clean_node(struct fib6_walker *w)
>                 res =3D c->func(rt, c->arg);
>                 if (res =3D=3D -1) {
>                         w->leaf =3D rt;
> -                       res =3D fib6_del(rt, &info);
> +                       res =3D fib6_del(rt, &info, RTA_DEL_REASON_UNSPEC=
);
>                         if (res) {
>  #if RT6_DEBUG >=3D 2
>                                 pr_debug("%s: del failed: rt=3D%p@%p err=
=3D%d\n",
> @@ -2400,7 +2403,7 @@ static void fib6_gc_table(struct net *net,
>
>         hlist_for_each_entry_safe(rt, n, &tb6->tb6_gc_hlist, gc_link)
>                 if (fib6_age(rt, gc_args) =3D=3D -1)
> -                       fib6_del(rt, &info);
> +                       fib6_del(rt, &info, RTA_DEL_REASON_EXPIRED);
>  }
>
>  static void fib6_gc_all(struct net *net, struct fib6_gc_args *gc_args)
> diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
> index f867ec8d3d90..c3537fc0ec63 100644
> --- a/net/ipv6/ndisc.c
> +++ b/net/ipv6/ndisc.c
> @@ -1361,7 +1361,9 @@ static enum skb_drop_reason ndisc_router_discovery(=
struct sk_buff *skb)
>         defrtr_usr_metric =3D in6_dev->cnf.ra_defrtr_metric;
>         /* delete the route if lifetime is 0 or if metric needs change */
>         if (rt && (lifetime =3D=3D 0 || rt->fib6_metric !=3D defrtr_usr_m=
etric)) {
> -               ip6_del_rt(net, rt, false);
> +               ip6_del_rt_reason(net, rt, false,
> +                                 lifetime =3D=3D 0 ? RTA_DEL_REASON_RA_W=
ITHDRAWN :
> +                                                 RTA_DEL_REASON_UNSPEC);
>                 rt =3D NULL;
>         }
>
> @@ -1396,7 +1398,8 @@ static enum skb_drop_reason ndisc_router_discovery(=
struct sk_buff *skb)
>                         .nl_net =3D net,
>                 };
>                 rt->fib6_flags =3D (rt->fib6_flags & ~RTF_PREF_MASK) | RT=
F_PREF(pref);
> -               inet6_rt_notify(RTM_NEWROUTE, rt, &nlinfo, NLM_F_REPLACE)=
;
> +               inet6_rt_notify(RTM_NEWROUTE, rt, &nlinfo, NLM_F_REPLACE,
> +                               RTA_DEL_REASON_UNSPEC);
>         }
>
>         if (rt) {
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index a1301334da48..e8ed95dc5665 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -111,7 +111,7 @@ static int rt6_fill_node(struct net *net, struct sk_b=
uff *skb,
>                          struct fib6_info *rt, struct dst_entry *dst,
>                          struct in6_addr *dest, struct in6_addr *src,
>                          int iif, int type, u32 portid, u32 seq,
> -                        unsigned int flags);
> +                        unsigned int flags, u32 del_reason);
>  static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res=
,
>                                            const struct in6_addr *daddr,
>                                            const struct in6_addr *saddr);
> @@ -1020,7 +1020,7 @@ int rt6_route_rcv(struct net_device *dev, u8 *opt, =
int len,
>                                         gwaddr, dev);
>
>         if (rt && !lifetime) {
> -               ip6_del_rt(net, rt, false);
> +               ip6_del_rt_reason(net, rt, false, RTA_DEL_REASON_RA_WITHD=
RAWN);
>                 rt =3D NULL;
>         }
>
> @@ -3973,7 +3973,8 @@ int ip6_route_add(struct fib6_config *cfg, gfp_t gf=
p_flags,
>         return err;
>  }
>
> -static int __ip6_del_rt(struct fib6_info *rt, struct nl_info *info)
> +static int __ip6_del_rt(struct fib6_info *rt, struct nl_info *info,
> +                       u32 del_reason)
>  {
>         struct net *net =3D info->nl_net;
>         struct fib6_table *table;
> @@ -3986,7 +3987,7 @@ static int __ip6_del_rt(struct fib6_info *rt, struc=
t nl_info *info)
>
>         table =3D rt->fib6_table;
>         spin_lock_bh(&table->tb6_lock);
> -       err =3D fib6_del(rt, info);
> +       err =3D fib6_del(rt, info, del_reason);
>         spin_unlock_bh(&table->tb6_lock);
>
>  out:
> @@ -3994,14 +3995,20 @@ static int __ip6_del_rt(struct fib6_info *rt, str=
uct nl_info *info)
>         return err;
>  }
>
> -int ip6_del_rt(struct net *net, struct fib6_info *rt, bool skip_notify)
> +int ip6_del_rt_reason(struct net *net, struct fib6_info *rt, bool skip_n=
otify,
> +                     u32 del_reason)
>  {
>         struct nl_info info =3D {
>                 .nl_net =3D net,
> -               .skip_notify =3D skip_notify
> +               .skip_notify =3D skip_notify,
>         };
>
> -       return __ip6_del_rt(rt, &info);
> +       return __ip6_del_rt(rt, &info, del_reason);
> +}
> +
> +int ip6_del_rt(struct net *net, struct fib6_info *rt, bool skip_notify)
> +{
> +       return ip6_del_rt_reason(net, rt, skip_notify, RTA_DEL_REASON_UNS=
PEC);
>  }
>
>  static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_confi=
g *cfg)
> @@ -4028,7 +4035,8 @@ static int __ip6_del_rt_siblings(struct fib6_info *=
rt, struct fib6_config *cfg)
>
>                         if (rt6_fill_node(net, skb, rt, NULL,
>                                           NULL, NULL, 0, RTM_DELROUTE,
> -                                         info->portid, seq, 0) < 0) {
> +                                         info->portid, seq, 0,
> +                                         RTA_DEL_REASON_UNSPEC) < 0) {
>                                 kfree_skb(skb);
>                                 skb =3D NULL;
>                         } else
> @@ -4064,13 +4072,13 @@ static int __ip6_del_rt_siblings(struct fib6_info=
 *rt, struct fib6_config *cfg)
>                 list_for_each_entry_safe(sibling, next_sibling,
>                                          &rt->fib6_siblings,
>                                          fib6_siblings) {
> -                       err =3D fib6_del(sibling, info);
> +                       err =3D fib6_del(sibling, info, RTA_DEL_REASON_UN=
SPEC);
>                         if (err)
>                                 goto out_unlock;
>                 }
>         }
>
> -       err =3D fib6_del(rt, info);
> +       err =3D fib6_del(rt, info, RTA_DEL_REASON_UNSPEC);
>  out_unlock:
>         spin_unlock_bh(&table->tb6_lock);
>  out_put:
> @@ -4196,7 +4204,8 @@ static int ip6_route_del(struct fib6_config *cfg,
>                                 if (!fib6_info_hold_safe(rt))
>                                         continue;
>
> -                               err =3D  __ip6_del_rt(rt, &cfg->fc_nlinfo=
);
> +                               err =3D __ip6_del_rt(rt, &cfg->fc_nlinfo,
> +                                                  RTA_DEL_REASON_UNSPEC)=
;
>                                 break;
>                         }
>                         if (cfg->fc_nh_id)
> @@ -4215,7 +4224,8 @@ static int ip6_route_del(struct fib6_config *cfg,
>
>                         /* if gateway was specified only delete the one h=
op */
>                         if (cfg->fc_flags & RTF_GATEWAY)
> -                               err =3D __ip6_del_rt(rt, &cfg->fc_nlinfo)=
;
> +                               err =3D __ip6_del_rt(rt, &cfg->fc_nlinfo,
> +                                                  RTA_DEL_REASON_UNSPEC)=
;
>                         else
>                                 err =3D __ip6_del_rt_siblings(rt, cfg);
>                         break;
> @@ -5381,7 +5391,8 @@ static void ip6_route_mpath_notify(struct fib6_info=
 *rt,
>         }
>
>         if (rt)
> -               inet6_rt_notify(RTM_NEWROUTE, rt, info, nlflags);
> +               inet6_rt_notify(RTM_NEWROUTE, rt, info, nlflags,
> +                               RTA_DEL_REASON_UNSPEC);
>
>         rcu_read_unlock();
>  }
> @@ -5739,6 +5750,7 @@ static size_t rt6_nlmsg_size(struct fib6_info *f6i)
>                + nla_total_size(sizeof(struct rta_cacheinfo))
>                + nla_total_size(TCP_CA_NAME_MAX) /* RTAX_CC_ALGO */
>                + nla_total_size(1) /* RTA_PREF */
> +              + nla_total_size(4) /* RTA_DEL_REASON */
>                + nexthop_len;
>  }
>
> @@ -5775,7 +5787,7 @@ static int rt6_fill_node(struct net *net, struct sk=
_buff *skb,
>                          struct fib6_info *rt, struct dst_entry *dst,
>                          struct in6_addr *dest, struct in6_addr *src,
>                          int iif, int type, u32 portid, u32 seq,
> -                        unsigned int flags)
> +                        unsigned int flags, u32 del_reason)
>  {
>         struct rt6_info *rt6 =3D dst_rt6_info(dst);
>         struct rt6key *rt6_dst, *rt6_src;
> @@ -5954,6 +5966,10 @@ static int rt6_fill_node(struct net *net, struct s=
k_buff *skb,
>         if (rtnl_put_cacheinfo(skb, dst, 0, expires, dst ? dst->error : 0=
) < 0)
>                 goto nla_put_failure;
>
> +       if (type =3D=3D RTM_DELROUTE && del_reason !=3D RTA_DEL_REASON_UN=
SPEC &&
> +           nla_put_u32(skb, RTA_DEL_REASON, del_reason))
> +               goto nla_put_failure;
> +
>         if (nla_put_u8(skb, RTA_PREF, IPV6_EXTRACT_PREF(rt6_flags)))
>                 goto nla_put_failure;
>
> @@ -6055,7 +6071,8 @@ static int rt6_nh_dump_exceptions(struct fib6_nh *n=
h, void *arg)
>                                             &rt6_ex->rt6i->dst, NULL, NUL=
L, 0,
>                                             RTM_NEWROUTE,
>                                             NETLINK_CB(dump->cb->skb).por=
tid,
> -                                           dump->cb->nlh->nlmsg_seq, w->=
flags);
> +                                           dump->cb->nlh->nlmsg_seq, w->=
flags,
> +                                           RTA_DEL_REASON_UNSPEC);
>                         if (err)
>                                 return err;
>
> @@ -6103,7 +6120,8 @@ int rt6_dump_route(struct fib6_info *rt, void *p_ar=
g, unsigned int skip)
>                         if (rt6_fill_node(net, arg->skb, rt, NULL, NULL, =
NULL,
>                                           0, RTM_NEWROUTE,
>                                           NETLINK_CB(arg->cb->skb).portid=
,
> -                                         arg->cb->nlh->nlmsg_seq, flags)=
) {
> +                                         arg->cb->nlh->nlmsg_seq, flags,
> +                                         RTA_DEL_REASON_UNSPEC)) {
>                                 return 0;
>                         }
>                         count++;
> @@ -6336,12 +6354,14 @@ static int inet6_rtm_getroute(struct sk_buff *in_=
skb, struct nlmsghdr *nlh,
>                         err =3D rt6_fill_node(net, skb, from, NULL, NULL,=
 NULL,
>                                             iif, RTM_NEWROUTE,
>                                             NETLINK_CB(in_skb).portid,
> -                                           nlh->nlmsg_seq, 0);
> +                                           nlh->nlmsg_seq, 0,
> +                                           RTA_DEL_REASON_UNSPEC);
>                 else
>                         err =3D rt6_fill_node(net, skb, from, dst, &fl6.d=
addr,
>                                             &fl6.saddr, iif, RTM_NEWROUTE=
,
>                                             NETLINK_CB(in_skb).portid,
> -                                           nlh->nlmsg_seq, 0);
> +                                           nlh->nlmsg_seq, 0,
> +                                           RTA_DEL_REASON_UNSPEC);
>         } else {
>                 err =3D -ENETUNREACH;
>         }
> @@ -6358,7 +6378,7 @@ static int inet6_rtm_getroute(struct sk_buff *in_sk=
b, struct nlmsghdr *nlh,
>  }
>
>  void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *in=
fo,
> -                    unsigned int nlm_flags)
> +                    unsigned int nlm_flags, u32 del_reason)
>  {
>         struct net *net =3D info->nl_net;
>         struct sk_buff *skb;
> @@ -6377,7 +6397,8 @@ void inet6_rt_notify(int event, struct fib6_info *r=
t, struct nl_info *info,
>                 goto errout;
>
>         err =3D rt6_fill_node(net, skb, rt, NULL, NULL, NULL, 0,
> -                           event, info->portid, seq, nlm_flags);
> +                           event, info->portid, seq, nlm_flags,
> +                           del_reason);
>         if (err < 0) {
>                 kfree_skb(skb);
>                 /* -EMSGSIZE implies needed space grew under us. */
> @@ -6410,7 +6431,8 @@ void fib6_rt_update(struct net *net, struct fib6_in=
fo *rt,
>                 goto errout;
>
>         err =3D rt6_fill_node(net, skb, rt, NULL, NULL, NULL, 0,
> -                           RTM_NEWROUTE, info->portid, seq, NLM_F_REPLAC=
E);
> +                           RTM_NEWROUTE, info->portid, seq, NLM_F_REPLAC=
E,
> +                           RTA_DEL_REASON_UNSPEC);
>         if (err < 0) {
>                 /* -EMSGSIZE implies BUG in rt6_nlmsg_size() */
>                 WARN_ON(err =3D=3D -EMSGSIZE);
> @@ -6463,7 +6485,7 @@ void fib6_info_hw_flags_set(struct net *net, struct=
 fib6_info *f6i,
>         }
>
>         err =3D rt6_fill_node(net, skb, f6i, NULL, NULL, NULL, 0, RTM_NEW=
ROUTE, 0,
> -                           0, 0);
> +                           0, 0, RTA_DEL_REASON_UNSPEC);
>         if (err < 0) {
>                 /* -EMSGSIZE implies BUG in rt6_nlmsg_size() */
>                 WARN_ON(err =3D=3D -EMSGSIZE);
> --
> 2.43.0
>
