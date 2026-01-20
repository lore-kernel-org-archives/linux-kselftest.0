Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F373DA7CD
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907101; cv=pass; b=WHBcg5NfW9eAhXtlTxm5zvoS4G1tLy6Exe3TNMADqP4+wx6R3C/HoNW/cgSy21ckasvcouK4vtsear3f05krf6z/v2l3aICq7d/60EMVKjLa83bL8NZC2i1K9j+UyP38491qm123Ib+a0NZIDm2h+Vq2D1TLU6CNXT10JYXuIy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907101; c=relaxed/simple;
	bh=cnNo9W12NhCz5DB49rDqOpnrfJrsY5xjkCHj5l6IZJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/S9wuv8WBUEsPyVac0HZmseCrO63XBCXMUMDezh/NGgoBYKySY59z5Mv3EAQ6SaezHj45Gj86gwJYsdTGo+hLoSGT9tXqb0ghMlrQ/8djuQ0SkrAEa/mrsf5DVXE38HHkwGqRv6Etc9ttvJBhDenNWlnd7hKHPD4PBGi0UBFro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aAum8dNR; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aAum8dNR"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-501506f448bso29780541cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 03:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907098; cv=none;
        d=google.com; s=arc-20240605;
        b=NRLBEkmnEJMozlIROh3A7n8G8RSvHeh/7aUJnu0GXm7YxEgIVLK1j5R5Fj0DkcD6kD
         eY7zfmeis+U3ZHvONwtFW6MHtJwCrlMZKJzdQqwST/uC8MJMUE4LjNjqqhDG5U+O2M8I
         lpuVDGglVuIAeC9ND9EwcS0Bxg5YlBFgJ1oqxTL3i6H9/Xb1f57T4ZTVAVdEMgLtHfPT
         PZHXiHa/jIrrW4SKw2O2dby+Bfilugepmb5yUEBHNx0aeEDV1DVinCQjElkgSdK2d1aB
         dCVUB6Bq3NoX39Q3RGUmZHOqg0/JDQLQQmCkmj+BXq77K/3zVy0yGpgsWYK2ZUAPI1xa
         G2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KC9nK0KpQPdmvTA7SrKRg+ar3wUw4irfinZL9hXebI=;
        fh=Kc/CsJvCuq6c6tSTfL/iYqVLpGkbObWuoGtLEucR/Ns=;
        b=Va1iv14Iw7J9qRBYLkexNZLSjIkt9lKPGYfNzUExp5FubpPYxcvO3LO/0czdc2WpyH
         MEWjIN7cQw0vVP0TYFGwtpCgOv8pN4xc/2ciSe3bHVDzlllzsuw5QqbRMrNn7/3R+zv+
         oLoNooGFgHpwtzjYdqunXYgx607wNMrfY2YOOB/umdybg9W2yzfMW0L3fWUljxfpxgGX
         ux144LeEvkYxgy2aABxc4g/wJlJl6BK/6elN6O2nrD5UFiJqjxK+9UbJVGiLyPdKxdYF
         g979xn0vFpU75TEBSWzdcw/9+SvI7Nzr8PYHHRz5rHueiwwABk0sMP0seYosHZ3gorXA
         b7BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768907098; x=1769511898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KC9nK0KpQPdmvTA7SrKRg+ar3wUw4irfinZL9hXebI=;
        b=aAum8dNRtFuM12p/XTI/44w/QzyBcNFdHNXzZq2ZQcbYak/dfwBEGL1Nbqy1oms5+r
         NCR5LuHMCJ5NMM6B2/WGkjmlTgHEu+j+jCnwvwATa8ou/i6Lj6s+s2G2qHBbZOLRygOm
         HAEZFKaWywAUQYqjrGwp6qZQzvYOg0JWr7HxU/8eMs/0nKVZyH46rYb7leHwQHPlsW2j
         Q68wXz+SLJDnY1ZH3Aebf+XvtN/LyXbwEwsRVrr8wX1uu5JVPEazIeNIb1Qv2PXfFfqQ
         MpLIG2ziqpW8dnNCitlu1W4+tFag3WRY52IzxILyReCKt2tCPOGayeUa6zZc6VMdBQah
         951A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907098; x=1769511898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+KC9nK0KpQPdmvTA7SrKRg+ar3wUw4irfinZL9hXebI=;
        b=NVAe6/Md+Mtu0IY35oI/dSzuT02mS+nW8Z1Tplx9gDK9+Zaz/Zi86iC51OCHFpjTiw
         a5bcQZFw5Lo2g04ErQx4p+kK6LoHHrRgFfYWXFnG927RjDM6HK2vssa80zBWESSBmNn3
         007y08W4lmHpueSNbWF5ZBFc0GDI27BzK3/ozS9LAG1pKnaT3oBQLDoQKi9cnAOQDaee
         y1yzZuP28Qr2sshWzg/T97seButRjDAMH8pYfUoq4utvHmRGsevx20+kaTpXC9/6+W7U
         HhZCkfva0QsmeLAICGk5D1GvBVngVrk/egWmXyzlQ+/uNYZdMF3RUx94NzGoRBoL2y0h
         f2OA==
X-Forwarded-Encrypted: i=1; AJvYcCUx3AgHgEhiAOdRJGFJbIIY1JMhpfZyHcN27vLoKYamP6NLokgCW55oF1o3xhhfSFB47556JqtAMkoeda54Nvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0WbDqjz90QjpyQbYxGTk33m6Zx3oP1gCrqwXFqh6wZ/lTcqdB
	rR39dfD2xmj+GKBziTyjABNt2t70US1/xDAOtoH/1UlPIgfWIrlCWyBU1gN7a93rhNgy/O4qI1J
	61kdvvQKz2eDYfF2QoxVoge9/Ct8Lz/QfqLa4QJHy
X-Gm-Gg: AY/fxX7OX98Ok/dzZ+zm0/zieWIKzmsWUNmDcTWBoHrcUy2g+GlsHEjIlGXlxcKgApB
	VwPNuIePxKxTOD5BIFRlhgPGhmhI1kmwiSr+CVyWNXnIh6gRKL7bvMtQLCvHFuS9ISznET+t9sX
	gFppQULsakmSorJathvqw3tsmh/z4IJkK769z4HJib8rNw8Li6EsGCj6kpcwb+RtAKEnosIF4dG
	VJaoFmn8u7dcl8tnvwXqqzVFsa/nYsFZFLw/m4oa5xqf4ORVvhkyo6f0o4UjXoHi3Z799M=
X-Received: by 2002:a05:622a:148:b0:4f3:5961:3208 with SMTP id
 d75a77b69052e-502d82776d6mr12850331cf.12.1768907098103; Tue, 20 Jan 2026
 03:04:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-11-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-11-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 12:04:47 +0100
X-Gm-Features: AZwV_Qgu9ZDw1Q07OvyxlnkIP9uze425ltlSjgpCGKeRZRntsHDU01ieZ5kjIGg
Message-ID: <CANn89i+NEyZ+1R1pouUcroarCfNrQEN01azsEhOuZoeR0Y3mhA@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 10/15] tcp: accecn: unset ECT if receive or
 send ACE=0 in AccECN negotiaion
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:59=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Based on specification:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
>
> Based on Section 3.1.5 of AccECN spec (RFC9768), a TCP Server in
> AccECN mode MUST NOT set ECT on any packet for the rest of the connection=
,
> if it has received or sent at least one valid SYN or Acceptable SYN/ACK
> with (AE,CWR,ECE) =3D (0,0,0) during the handshake.
>
> In addition, a host in AccECN mode that is feeding back the IP-ECN
> field on a SYN or SYN/ACK MUST feed back the IP-ECN field on the
> latest valid SYN or acceptable SYN/ACK to arrive.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> ---
> v8:
> - Add new helper function tcp_accecn_ace_fail_send_set_retrans()
>
> v6:
> - Do not cast const struct request_sock into struct request_sock
> - Set tcp_accecn_fail_mode after calling tcp_rtx_synack().
> ---
>  include/net/tcp_ecn.h           |  7 +++++++
>  net/ipv4/inet_connection_sock.c |  3 +++
>  net/ipv4/tcp_input.c            |  2 ++
>  net/ipv4/tcp_minisocks.c        | 36 ++++++++++++++++++++++++---------
>  net/ipv4/tcp_output.c           |  3 ++-
>  net/ipv4/tcp_timer.c            |  2 ++
>  6 files changed, 42 insertions(+), 11 deletions(-)
>
> diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
> index 796c613b5ef3..f5e1f6b1bec3 100644
> --- a/include/net/tcp_ecn.h
> +++ b/include/net/tcp_ecn.h
> @@ -97,6 +97,13 @@ static inline void tcp_accecn_fail_mode_set(struct tcp=
_sock *tp, u8 mode)
>         tp->accecn_fail_mode |=3D mode;
>  }
>
> +static inline void tcp_accecn_ace_fail_send_set_retrans(struct request_s=
ock *req,
> +                                                       struct tcp_sock *=
tp)
> +{
> +       if (req->num_retrans > 1 && tcp_rsk(req)->accecn_ok)
> +               tcp_accecn_fail_mode_set(tp, TCP_ACCECN_ACE_FAIL_SEND);
> +}
> +
>  #define TCP_ACCECN_OPT_NOT_SEEN                0x0
>  #define TCP_ACCECN_OPT_EMPTY_SEEN      0x1
>  #define TCP_ACCECN_OPT_COUNTER_SEEN    0x2
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_s=
ock.c
> index 97d57c52b9ad..9d16cb9c3db4 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -20,6 +20,7 @@
>  #include <net/tcp_states.h>
>  #include <net/xfrm.h>
>  #include <net/tcp.h>
> +#include <net/tcp_ecn.h>
>  #include <net/sock_reuseport.h>
>  #include <net/addrconf.h>
>
> @@ -1103,6 +1104,8 @@ static void reqsk_timer_handler(struct timer_list *=
t)
>             (!resend ||
>              !tcp_rtx_synack(sk_listener, req) ||
>              inet_rsk(req)->acked)) {
> +               tcp_accecn_ace_fail_send_set_retrans(req,
> +                                                    tcp_sk(sk_listener))=
;


Ouch.

I think you missed the fact that a listener is shared by many SYN_RECV requ=
ests.

Consider it as read-only here.
