Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D91D301493
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 20:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469546; cv=fail; b=RR6a8ndMUoiufdtQTqEdtvgfv1x+9dngWaZU1qY648TtKWVA1nKE5EyvSfmGXEGWqZxsmNr40vY+MecGIroTrz3BlquW/eCkwpTMv0SzIfrQuYhQZDqC9vggBYfnpx0pD/ltVgCQFw1pIoOKKomWwnqU/zV5RUI79k7+C9Z/DUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469546; c=relaxed/simple;
	bh=eHU6HTc6KnTWuuFM2OJtR7l0CvhJwObW7krX8I/yEfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRoDqGKeBXWAcfF1dSFGwTAfBHtwNTORISOve2oz4v8dfwc/Gib65lgpNLhQ9t/L6GTlSO1ytWVL40RVRkRzSZEDOaDi7S2ql/gCKQZhxmM6MymI9jFeHekmejpw/Fgi3uJX5co4K9Ej/R/g3r+jh8dlsgNYopwZ8p2c/IQBV/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=vQk5E4x1; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="vQk5E4x1"
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65EKLXrK145571
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 13:39:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=vzkgNRR8Jfjz2ksYou42bR8+4eh3BDLeRQp9bJoabj0=; b=vQk5E4x1p9px
	adYhNTu9fBYlM2+l6IdQfzFTeAMvksj8/I/zMvEYdp62CKauGySxWa9tOvXLqjVF
	PQlGYGb6Chox83ynGT1XVsl5dZOxf/D8Wah7za1H5pYnzePIxHlApEzFU/Xs0/9K
	LTfoY4YbmWZ/1i3xjkKpFpeNH6lDXN4bVps4tXXYUvPAsRHFY7GPEubP7QcpwE1b
	4LCKwqQz8VwzGykULuJxNmT1Vt8bSLXz+Bjy1XaKkYoHIAkhPAp71iqW/sDEJ7h1
	8z5eRwl5bTDNrggcA0ZkR2ihusAraYAUdQB0R+s1ShVeLok8bkgJtQXiXJYnb7Td
	5mBnUJvYpw==
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4esuthh8hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 13:39:02 -0700 (PDT)
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-68b5941a81bso3299049a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 13:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781469541; cv=none;
        d=google.com; s=arc-20240605;
        b=NFVAEYCAnkpuciT5zf572gUeGedYvBvydbCFiLY90O0ZRBRQaQvY/eoZ2mHUlaXwv9
         YCC74jUMPRwX17A8SV4Ja28PGEHL+H5MqqOqB6GJ4bOEcv6y/gwipnSBX2JRv4RVHSOi
         OGVuPZfDRxLdqHkTBPZhv2eqSad22dx8O6/h3tdXpYfysDCcBvSLLO5bHTaYg/fx7HVi
         W55bnyxrBPCotXAt+AezEc2xjGTMx59f4H6VaDzPG5nSfmA6rA8XvxGvtE7KMT7mR2gS
         BDkesZURwEoUFPHKdX0bOv8WkGVvJ7voHA1UBlJy1XStji2AaR18RAyKAe3S/xIlNOtu
         fZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=LgVmeDT2yFFv7D7NHZlGfD46fKi2Kd63IeyevXfF6qg=;
        fh=PPxgc2ouajP9k/obuUD2VrNbTClO3RF4e9xk/kcXvqk=;
        b=TlL/sV1c5EfiyIxq0+PGxAvqN3BT4DiAqTG3UUKSTZIDkqE5vOaS7XOtyvJA+NizNL
         UBNvJmuBN09/86dWAJohEmfuVpEosPBkqr27UZDtTEiu5TKODqexFAgGY+9JM8n/7i3p
         a663KepCjT7YW9zeU67mRGLTpGh7fewomwkZzmHl40r9iMOz/5iG6/YZEfTsYV+Ul2jw
         uL80fGm8ges7Iz1b9t+gBeh6l+Konz1wFhzBOK8wuKbv/vFdU1EIW81tIYd8gEvrlhpe
         1Aqpl/AAIbvsjrFYte8OTepOb2Onpvt6NEMhOGWFevESiBkriSDB+iyiPGAI5VfOFk4Q
         Mdpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469541; x=1782074341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LgVmeDT2yFFv7D7NHZlGfD46fKi2Kd63IeyevXfF6qg=;
        b=oG67XOZC3FXXpxVex4MfWfc+khKYAeip4Fkp/Pdi2M4gmMCASI8vtNZyQaOLasVoLW
         6g1VDwp2V2dNcqXgejUKXuDc0A78NQu97P6RPE1ITm2hOxXtSt5ODJ41WdW4zn5EmVO1
         ZwtZVZgzTFJgzUHY271eIpMFAHrw9xldraftxhgYl9iy0AyadNWPccq3jGfwWdc6oES6
         3Qmy8LHVuAodNRuUl3emygE9tjVzEkucw/6X/e9E87InWL3z0dH/bUxnU8V6RfHz/Sa2
         IM9LnYLI+vJMlqyULOVs0NThYK4MFoohHdryxyHeYuxrt+T7DWEkxgJIYLAPtaESJ7/o
         /iDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9c6DBceeZyFHF/wb2lbqJTXSx+qcKr3gNywHM7CV2Gkg5r3DrBPCMCnVg0NSzt6/I6BXyO93jL0euNAwG32/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMfFTYCJ75BDnv4v06hv9bQdwyDbKCXFc1F0gG7PnBwb/K8Ou
	ccW7jLg2ee3K5d14Tw9TeU4uIqZ6I8qm1RexPJwPLs+9ECXdI6fNctr0QQaT6el0aOBQMVDzx+W
	EkGhk+uu17txTNCPcQZRc6h/DfhBHPrTlo1/PfeHyZUetXu0r/L9leHsullNS639xHsm7Ujd0cu
	y0ikjQOr+IM5gQ5RmeDcQ6xdfW3RBmGQtA/JSmJpjetQ==
X-Gm-Gg: Acq92OFz7sT/GLUWMCZuL21AXD6hZWcbmWu809z2c99PYtw7oNl79XMIJ453b5iEU4I
	2yGsEkVgBFmxFhxYmKRGsm9ZYs7iSFZNU1YmZD/yB+jN2Cd6i8Zo73MYetrZXz+flU4Oj98y9k/
	MGLW9UhsjzwmM1MZg9vjbGxvzo41MHNUwViygi/30uea6azNNRn3+Lm17MhDzQyTJ/bjPv+Nwb5
	FTOe3A=
X-Received: by 2002:aa7:d1cd:0:b0:691:acd4:df83 with SMTP id 4fb4d7f45d1cf-6936890b94cmr3190491a12.5.1781469540770;
        Sun, 14 Jun 2026 13:39:00 -0700 (PDT)
X-Received: by 2002:aa7:d1cd:0:b0:691:acd4:df83 with SMTP id
 4fb4d7f45d1cf-6936890b94cmr3190482a12.5.1781469540353; Sun, 14 Jun 2026
 13:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612010047.1377331-1-ntspring@meta.com> <20260612010047.1377331-2-ntspring@meta.com>
 <6ab86192-f0d4-4a00-83c9-3fd6449dc9dd@redhat.com>
In-Reply-To: <6ab86192-f0d4-4a00-83c9-3fd6449dc9dd@redhat.com>
From: Neil Spring <ntspring@meta.com>
Date: Sun, 14 Jun 2026 13:38:33 -0700
X-Gm-Features: AVVi8CfVyAEglHhJ1KSN0z5otEja-ADCDtBWuoT03y643yoO6doeRS0y2nFQuVQ
Message-ID: <CAGy2EQY0b2y9xCShqM3JVu7FprPn8qNdoH=THJ=MWY+01dBENA@mail.gmail.com>
Subject: Re: [PATCH net-next v13 1/2] tcp: rehash onto different local ECMP
 path on retransmit timeout
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
        kuniyu@google.com, davem@davemloft.net, kuba@kernel.org,
        dsahern@kernel.org, horms@kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
        martin.lau@linux.dev, daniel@iogearbox.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: s-SEVawB156OvajBBNPv9UF_IdsPaKQ3
X-Proofpoint-ORIG-GUID: s-SEVawB156OvajBBNPv9UF_IdsPaKQ3
X-Authority-Analysis: v=2.4 cv=SY3HsPRu c=1 sm=1 tr=0 ts=6a2f1166 cx=c_pps
 a=DTy5UCxgudPLKrSn28m7Kw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_1IyUuN4QrATX339ibzo:22 a=20KFwNOVAAAA:8 a=VabnemYjAAAA:8
 a=TjoYT3vZz40Pw0TJUQcA:9 a=QEXdDO2ut3YA:10 a=VzYV69SsQLkmnS9OQLw-:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIxOCBTYWx0ZWRfX6KRMpnkIN+b5
 wKw5+/WuYo20VUO7wusf7uR/l6aOBj8Ukj3sB27i77vPb9m881OTadcLe18u8Pct4Cud6nMB381
 Y82twxmdHvXjJjQaNp1dPQaNpsDAJOfcZbHVKLSrj8PLDrKjSMgoUp1MEnMOlCKykNKsiz/iyNt
 qMCR82y9G2Nty70LPPWpOoVuPaOj0ygvzADbX0DIup3FAi6UL09g30blp6jRnc+hPO+St8E+pSO
 KZkw20gLofXG/6zFkW6+3gG+SSt0A3ZPx5LQ7kELTe68spiTuY6lJxblWrDbgXGLhmd5dcK6YvD
 C9nOgYNOglG+7DhcPULfeWrVcv+20HFIuDaJwuDvhmiErQMRNBvLG83BfWzwMQhqj3YiSHHOD03
 rZtiqphEr8iCsHfCCqo+HsTxOk09M8rgsqcChKEh7jzyn6OHoqaMC6TOA9lVE3W7WRBigCKUAJy
 MyZC/ZsxMWxybMh7diQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIxOCBTYWx0ZWRfX97S/sPWy61II
 HaHYP9SJlYw3ZmH40+CAFBqFN8dnVGU+51STqwCqlwNmYjYh6h6nP0bgdycFOLtzKWIm+7GjByi
 2Lpp2IypbvMbT8XHsJbWzMxE0bemVcc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_04,2026-06-12_03,2025-10-01_01

On Sun, Jun 14, 2026 at 6:54=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> >
> On 6/12/26 3:00 AM, Neil Spring wrote:
> > Currently sk_rethink_txhash() re-rolls the socket's txhash on RTO, PLB,
> > and spurious-retransmission events, but the cached route is reused and
> > the new hash is not propagated into the ECMP path selection logic.  Two
> > changes are needed to make rehash select a different local ECMP path:
> >
> > 1. Add __sk_dst_reset() alongside sk_rethink_txhash() in
> >    tcp_write_timeout(), tcp_rcv_spurious_retrans(), and
> >    tcp_plb_check_rehash() so the cached dst is invalidated and the
> >    next transmit triggers a fresh route lookup.
> >
> > 2. Set fl6->mp_hash from sk_txhash (or tcp_rsk(req)->txhash for
> >    SYN/ACK retransmits and syncookies) in tcp_v6_connect(),
> >    inet6_sk_rebuild_header(), inet6_csk_route_req(),
> >    inet6_csk_route_socket(), tcp_v6_send_response(), and
> >    cookie_v6_check() so fib6_select_path() picks a path based on the
> >    new hash.
> >
> > The mp_hash override only applies to fib_multipath_hash_policy 0 (the
> > default L3 policy).  Its hash includes the flow label, but that is 0 by
> > default -- np->flow_label is unset, and auto_flowlabels only computes
> > the on-wire label later, per packet -- so flows to the same peer share
> > one local path.  Keying the hash on sk_txhash makes the local path
> > per-connection and lets a rehash re-select it.  Policies 1-3 are left
> > unchanged.
> >
> > The mp_hash assignment is factored into a small helper,
> > ip6_ecmp_set_mp_hash(), shared by inet6_csk_route_req(),
> > inet6_csk_route_socket(), tcp_v6_connect(), inet6_sk_rebuild_header(),
> > tcp_v6_send_response(), and cookie_v6_check().  It applies
> > (txhash >> 1) ?: 1 for policy 0 (the >> 1 keeps mp_hash in the 31-bit
> > range; ?: 1 keeps it non-zero, since 0 would fall back to
> > rt6_multipath_hash()).  inet6_csk_route_socket() calls it only for
> > sk_protocol =3D=3D IPPROTO_TCP so that non-TCP callers (e.g., L2TP via
> > inet6_csk_xmit) fall through to rt6_multipath_hash() and retain their
> > existing flow-key-based ECMP behavior.
> >
> > tcp_v6_send_response() also sets mp_hash from the response txhash so
> > that a control packet (a RST from the full socket, or an ACK from a
> > time-wait socket) selects the same local ECMP nexthop as the
> > connection's txhash rather than falling back to the flow hash.  The
> > time-wait socket's tw_txhash is copied from sk_txhash when the
> > connection enters TIME_WAIT, so it reflects any rehash that occurred.
> >
> > Setting mp_hash explicitly is necessary because the default ECMP hash
> > derives from fl6->flowlabel via np->flow_label, which is not updated
> > from sk_txhash (REPFLOW is off by default).  ip6_make_flowlabel()
> > cannot help either, as it runs after the route lookup.
> >
> > As a consequence, for policy 0 the local ECMP path of an IPv6 TCP
> > flow follows sk_txhash even when fl6->flowlabel is non-zero, e.g. a
> > reflected (REPFLOW) or explicitly set (IPV6_FLOWLABEL_MGR) flow
> > label.  This is intentional: only local path selection changes, so
> > rehash can recover from a failed path; the on-wire flow label is
> > unchanged.
> >
> > sk_set_txhash() is moved before ip6_dst_lookup_flow() in
> > tcp_v6_connect() so the initial ECMP path is selected by the same
> > txhash that subsequent route rebuilds will use.  This avoids
> > unintended path changes when the cached dst is naturally invalidated
> > (e.g., by PMTU discovery or route changes).
> >
> > The rehash sites (tcp_write_timeout(), tcp_plb_check_rehash(), and
> > tcp_rcv_spurious_retrans()) call __sk_rethink_txhash_reset_dst(),
> > which re-rolls the txhash and, when it changed, drops the cached dst
> > so the next transmit re-runs route selection.  The dst reset is
> > guarded by sk->sk_family =3D=3D AF_INET6 since IPv4 ECMP does not
> > currently use sk_txhash for path selection.  For IPv4-mapped IPv6
> > sockets this produces a redundant dst reset on a cold path
> > (RTO/PLB); the subsequent IPv4 route lookup returns the same result.
> > The helper is deliberately separate from sk_rethink_txhash() itself:
> > dst_negative_advice() calls sk_rethink_txhash() before its own dst op,
> > so resetting the dst inside sk_rethink_txhash() would skip that op
> > (e.g. rt6_remove_exception_rt()).
> >
> > For syncookies, cookie_init_sequence() computes the cookie value
> > before route_req() and sets txhash so the SYN-ACK selects the same
> > ECMP path that cookie_v6_check() will use when the full socket is
> > created.  cookie_tcp_reqsk_init() derives txhash from the cookie so
> > the full socket's ECMP path matches the SYN-ACK.  Both the SYN-ACK
> > assignment in tcp_conn_request() and the full-socket assignment in
> > cookie_tcp_reqsk_init() are keyed on the packet family
> > (skb->protocol =3D=3D ETH_P_IPV6), not sk->sk_family: a dual-stack
> > AF_INET6 listener also serves IPv4 connections, and the v4 cookie has
> > mssind bits that would bias TX queue distribution if used as txhash.
> > IPv4 connections retain net_tx_rndhash().
> >
> > cookie_init_sequence() is split from the former version that also
> > called tcp_synq_overflow() and incremented SYNCOOKIESSENT; those
> > side effects are now in cookie_record_sent(), called after
> > route_req() succeeds so they are not bumped when route_req() fails.
> > cookie_record_sent() is guarded by CONFIG_SYN_COOKIES to
> > match the guard on tcp_synq_overflow().  route_req() receives 0 as
> > tw_isn for the syncookie path so that tcp_v6_init_req() still saves
> > ireq->pktopts for REPFLOW flowlabel reflection and IPv6 cmsg
> > options.  The ecn_ok clear for syncookies without timestamps stays
> > after tcp_ecn_create_request() so it takes precedence.
> >
> > Signed-off-by: Neil Spring <ntspring@meta.com>
>
> This looks good to me, with a minor commit below.
>
> > diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
> > index df479277fb80..cc71d84df42b 100644
> > --- a/net/ipv4/syncookies.c
> > +++ b/net/ipv4/syncookies.c
> > @@ -280,9 +280,18 @@ static int cookie_tcp_reqsk_init(struct sock *sk, =
struct sk_buff *skb,
> >       treq->snt_synack =3D 0;
> >       treq->snt_tsval_first =3D 0;
> >       treq->tfo_listener =3D false;
> > -     treq->txhash =3D net_tx_rndhash();
> >       treq->rcv_isn =3D ntohl(th->seq) - 1;
> >       treq->snt_isn =3D ntohl(th->ack_seq) - 1;
> > +     if (skb->protocol =3D=3D htons(ETH_P_IPV6)) {
> > +             /* Use the cookie as txhash so the ECMP path matches
> > +              * the SYN-ACK, where txhash was also set to the
> > +              * cookie.  The original request socket (and its
> > +              * txhash) was freed after sending the SYN-ACK.
> > +              */
> > +             treq->txhash =3D treq->snt_isn;
> > +     } else {
> > +             treq->txhash =3D net_tx_rndhash();
>
> I'm wondering if it would make sense always using snt_isn for txhash in
> the syn cookie case, regardless of the IP protocol. Beyond reducing the
> differences between ipv4 and ipv6 it will make the code a little simpler.

I added the conditional in v11 after the AI review poked at how this wasn't
plumbed for IPv4; it seemed safer and clearer about v6-vs-v4 use of txhash,
but I wasn't weighing a goal of avoiding protocol-specific paths.

I will try no-conditional again in v14 with this feedback, happy to change
back if anyone has a strong opinion.

-neil

>
> Not a blocker in any case.
>
> Still I think this could deserve an explicit ack from Eric.
>
> /P
>
