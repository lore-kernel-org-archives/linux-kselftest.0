Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE77407597
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542561; cv=pass; b=MTIEkaLKZ3ubxYqT+9LWd0ZK98kK6m1XHlKtdL6LbW/q7ovaJIYipbc689yt6ZPAWzlnj9gwHbbgL8Um90xlvvicy7e5VukN2Fe0EqFArA0kKUD8Nhw2mMrICsJxlLlBmt7RmhcXDNWB2+o6DLWe1KQ/usbEgQHGsPmqW/zVXEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542561; c=relaxed/simple;
	bh=4YPWMK+0WYWJceGQjSJj/WOQ+Iz5+dRnHqH63ccwQUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8mledXdZTZGJU2fDQ9iNGgdQzdjHw2LGhWvl42Vq8S0OiKk2UBoQqAa3P9iFaiVti41PhZis/kp/zIL8Fv7JLuIlOI/aMOS+FDledVP3rcX5/pxQ6BhkfRIxvWYsMzE4vVqOzehP17XRaMsjQ3vsC/1nNBjma5vQAk6gTsVUQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mcSXSTgB; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mcSXSTgB"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5177b1a7441so49835031cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 09:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781542558; cv=none;
        d=google.com; s=arc-20240605;
        b=FX3wWrB/cGMjViVgaJRHb14N7hHEMdNL/p6K9Rxkj09BnkPTMHwVhU8pWO16srVt35
         yQZQP/bwhxGlS40jqDnnRJAPyV/1bwskYCiU1GfbQ8EmYs+r2dmlMKIIZvkG/yTs9ZxQ
         HXSNw8GWfGAWDIYgXVDkc7Irgv+5VuMVcWx+yKa13sfUWWyx5JUtq3RCnFXA8bJ2zS//
         JbyjggyB6DZPxVP4CVpMMwbDN3+MYYwaRzL86E7j9ySQGqEvQvuJ3A5PTKn0USPxPcS9
         /UbF+OYVAhY6fo0kJo7A4OxMr3CXqpr+JiRn+veB3/NbZ1TGmX8JzE9xijMCDTHspbhi
         3G8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=op3KaiCmJCT9futuSMniceaWe5Q/wKrwv8uwA7WTvb8=;
        fh=n+VmT1ete7D09vmKIKsceZsTg/g96uFnTm9rblWCT2E=;
        b=MnjXILa+RzNC/KUxidP8QBgg3XyfssrXPWRzy+s2javDirOQA+0/4elkDTn7kWfG6i
         AhdGdfrFMPk7v1zILYziuJ+fNMgE5dzw78tWcmW9n/s7ICptgUyRUpTVUqRa0HUKhEMJ
         w3/rMUim4xpqVcLl3LkNsmyKXT3X1Eujld5UnIBP/nMePSQVOAvTSVxxcm+YYYeQomCY
         CUjFZC5NxplNzh31OF0zQGgRmg+lvz+uA3uJ8QN9Xp26Rl27liJbFS97D5HujZOu2LoI
         QCdn0n44v7LN/WeeCS8QwCFKhnErlScmHUlK8aX6KUfxuLmDpUXOvvf7/2LT3h9Ds4Hq
         fyhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781542558; x=1782147358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=op3KaiCmJCT9futuSMniceaWe5Q/wKrwv8uwA7WTvb8=;
        b=mcSXSTgBoO4O/qL7Qd87hqo3I3Z0I3BGtkW9A2FPKwCQFvqqU09+es8L6ET2ATj6TS
         7Y0ystcfUhQ/69kFzrPWyYo4/gCZKYKTX9HxxAuBBHdMxPhm+t2G5A6hZdnB2nyYOxen
         cj+Dw6ZJfmjy6XyY1hcyb+h/1CJuYTQ0VV0GiRrIFZ8Hj647FS/PEPXYNyij5GXyqWhB
         9iZtnFD/rWWi1xRU0fKOZRhwyEtUxr6w2fgymUImnNv1IGHiMFQdxkid2CVucz4H/za4
         uxWKCbj5fDTA13HQiDMrAaIyoxWuWw99510D2QSPmEa5OkPiBhGLoBdmiacTXBZRJZn0
         //LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542558; x=1782147358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=op3KaiCmJCT9futuSMniceaWe5Q/wKrwv8uwA7WTvb8=;
        b=ZrpbCXtQu1HU8gmqPhUWCDOMwws1x6HWO1D3G4LkwaF8TskKhScWVAVesU3y3Qdnw8
         soYTYTaz6JnV+ZV74NaqtIK0NJAyiQM4erKClcMJnRed70GXR+PKIpqiEIQJ3596YFBf
         +ZKEkB2ezE6ZTlWCyCT9frAuumObQ+VIOUZ6+5nVMj+Vh4yizVICuR0iY1bopumCJwx8
         +ygP4vBSxYSqJeFcuAjqPEudY8WbLJLg4/xsS3pTxCBw6j+XrNKTtPHOua8gilUb/A2Z
         t1+A81n44LpqRC9eA0Krvvo3ekRfpHFw/gMoMlKeqMl0R9xX4LhMZZTcRX40clgSlzP7
         22Zg==
X-Forwarded-Encrypted: i=1; AFNElJ/Slc5F8h4OKnbFGzQeEIKRWdDGDm7k9EowSyVqCplKA4hP/CS88DsDGXwG2tbAMiZrf3/Il1037VAzcPEvzeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJRWYUoWUgqFSexrOO7T+E77hl7HWhX0RvrunEDkn2ww3U9lEI
	zFtGhFbLB+xPsad8BV3W8Jlfu6k4K91rYDzDNadYrBVdKo1F6V5F61mVo5M9k0enxBCzGeJelVA
	4U28RWM+2xZTnLr3FlPvGlLP3UyrjsS4nx2YqUJPi
X-Gm-Gg: Acq92OEezV1/SY/CizhBmdwatp02ZloSU9boUgLfOy4PdAPxnkdd5IySpe5HOCrRT8L
	1TUfC0BQT1NYSfRbYhs7fiinqLVkCw/+QXVVhuZySo0J3dD1cGHCNULU5Abt5CnQSV3VA0uDUXT
	h//ug1YzRg9xWt/2+LUvMqO2SKjofXPMiBkELHyHj3geoovxkJAjbXao6OGaSnd7Mj/6xnr29Dd
	t//36vJMLcjVyBrFgQHJpHEmfzti+ASKcKwUbL2GRNJ6UzpkOCmc/t2ooXCgdIkBisPQb5FQKr6
	JQTBlyycaTFlFA9jiJAnPuLhi0+viYt0tk+iEcMnFdpCqsg5TH8Fq9TWU9EVtdm/VugKOAmM+FB
	v3vW5iVVrjTExh380myHG
X-Received: by 2002:a05:622a:1115:b0:50f:b4c0:630f with SMTP id
 d75a77b69052e-5195357c228mr175976161cf.54.1781542556797; Mon, 15 Jun 2026
 09:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615042158.1600746-1-ntspring@meta.com> <20260615042158.1600746-2-ntspring@meta.com>
In-Reply-To: <20260615042158.1600746-2-ntspring@meta.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 15 Jun 2026 09:55:45 -0700
X-Gm-Features: AVVi8CcLt4JINR95JUJ5Pig2rgeZiW8v5j_nnToRd6BeBcgfvgXVPVQccUrwbf4
Message-ID: <CANn89iLjf-d08s1ofLo3fDUQENYji9qwG6fQbiAN3fyvxP=+BA@mail.gmail.com>
Subject: Re: [PATCH v14 1/2] tcp: rehash onto different local ECMP path on
 retransmit timeout
To: Neil Spring <ntspring@meta.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, martin.lau@linux.dev, daniel@iogearbox.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 9:22=E2=80=AFPM Neil Spring <ntspring@meta.com> wro=
te:
>
> Currently sk_rethink_txhash() re-rolls the socket's txhash on RTO, PLB,
> and spurious-retransmission events, but the cached route is reused and
> the new hash is not propagated into the ECMP path selection logic.  Two
> changes are needed to make rehash select a different local ECMP path:
>
> 1. Add __sk_dst_reset() alongside sk_rethink_txhash() in
>    tcp_write_timeout(), tcp_rcv_spurious_retrans(), and
>    tcp_plb_check_rehash() so the cached dst is invalidated and the
>    next transmit triggers a fresh route lookup.
>
> 2. Set fl6->mp_hash from sk_txhash (or tcp_rsk(req)->txhash for
>    SYN/ACK retransmits and syncookies) in tcp_v6_connect(),
>    inet6_sk_rebuild_header(), inet6_csk_route_req(),
>    inet6_csk_route_socket(), tcp_v6_send_response(), and
>    cookie_v6_check() so fib6_select_path() picks a path based on the
>    new hash.
>
> The mp_hash override only applies to fib_multipath_hash_policy 0 (the
> default L3 policy).  Its hash includes the flow label, but that is 0 by
> default -- np->flow_label is unset, and auto_flowlabels only computes
> the on-wire label later, per packet -- so flows to the same peer share
> one local path.  Keying the hash on sk_txhash makes the local path
> per-connection and lets a rehash re-select it.  Policies 1-3 are left
> unchanged.
>
> The mp_hash assignment is factored into a small helper,
> ip6_ecmp_set_mp_hash(), shared by inet6_csk_route_req(),
> inet6_csk_route_socket(), tcp_v6_connect(), inet6_sk_rebuild_header(),
> tcp_v6_send_response(), and cookie_v6_check().  It applies
> (txhash >> 1) ?: 1 for policy 0 (the >> 1 keeps mp_hash in the 31-bit
> range; ?: 1 keeps it non-zero, since 0 would fall back to
> rt6_multipath_hash()).  inet6_csk_route_socket() calls it only for
> sk_protocol =3D=3D IPPROTO_TCP so that non-TCP callers (e.g., L2TP via
> inet6_csk_xmit) fall through to rt6_multipath_hash() and retain their
> existing flow-key-based ECMP behavior.
>
> tcp_v6_send_response() also sets mp_hash from the response txhash so
> that a control packet (a RST from the full socket, or an ACK from a
> time-wait socket) selects the same local ECMP nexthop as the
> connection's txhash rather than falling back to the flow hash.  The
> time-wait socket's tw_txhash is copied from sk_txhash when the
> connection enters TIME_WAIT, so it reflects any rehash that occurred.
>
> Setting mp_hash explicitly is necessary because the default ECMP hash
> derives from fl6->flowlabel via np->flow_label, which is not updated
> from sk_txhash (REPFLOW is off by default).  ip6_make_flowlabel()
> cannot help either, as it runs after the route lookup.
>
> As a consequence, for policy 0 the local ECMP path of an IPv6 TCP
> flow follows sk_txhash even when fl6->flowlabel is non-zero, e.g. a
> reflected (REPFLOW) or explicitly set (IPV6_FLOWLABEL_MGR) flow
> label.  This is intentional: only local path selection changes, so
> rehash can recover from a failed path; the on-wire flow label is
> unchanged.
>
> sk_set_txhash() is moved before ip6_dst_lookup_flow() in
> tcp_v6_connect() so the initial ECMP path is selected by the same
> txhash that subsequent route rebuilds will use.  This avoids
> unintended path changes when the cached dst is naturally invalidated
> (e.g., by PMTU discovery or route changes).
>
> The rehash sites (tcp_write_timeout(), tcp_plb_check_rehash(), and
> tcp_rcv_spurious_retrans()) call __sk_rethink_txhash_reset_dst(),
> which re-rolls the txhash and, when it changed, drops the cached dst
> so the next transmit re-runs route selection.  The dst reset is
> guarded by sk->sk_family =3D=3D AF_INET6 since IPv4 ECMP does not
> currently use sk_txhash for path selection.  For IPv4-mapped IPv6
> sockets this produces a redundant dst reset on a cold path
> (RTO/PLB); the subsequent IPv4 route lookup returns the same result.
> The helper is deliberately separate from sk_rethink_txhash() itself:
> dst_negative_advice() calls sk_rethink_txhash() before its own dst op,
> so resetting the dst inside sk_rethink_txhash() would skip that op
> (e.g. rt6_remove_exception_rt()).
>
> For syncookies, cookie_init_sequence() computes the cookie value
> before route_req() and sets txhash so the SYN-ACK selects the same
> ECMP path that cookie_v6_check() will use when the full socket is
> created.  cookie_tcp_reqsk_init() derives txhash from the cookie so
> the full socket's ECMP path matches the SYN-ACK.  Both the SYN-ACK
> assignment in tcp_conn_request() and the full-socket assignment in
> cookie_tcp_reqsk_init() set txhash from the cookie for IPv4 and IPv6
> alike.  On IPv6 this drives ECMP path selection; on IPv4, which does
> not use sk_txhash for ECMP, it only affects TX-queue selection.  That
> selection scales the hash by its high bits (reciprocal_scale()), which
> are uniform in the keyed secure_tcp_syn_cookie() output -- the MSS index
> only perturbs the low bits -- so the queue distribution matches
> net_tx_rndhash().
>
> cookie_init_sequence() is split from the former version that also
> called tcp_synq_overflow() and incremented SYNCOOKIESSENT; those
> side effects are now in cookie_record_sent(), called after
> route_req() succeeds so they are not bumped when route_req() fails.
> cookie_record_sent() is guarded by CONFIG_SYN_COOKIES to
> match the guard on tcp_synq_overflow().  route_req() receives 0 as
> tw_isn for the syncookie path so that tcp_v6_init_req() still saves
> ireq->pktopts for REPFLOW flowlabel reflection and IPv6 cmsg
> options.  The ecn_ok clear for syncookies without timestamps stays
> after tcp_ecn_create_request() so it takes precedence.
>
> Signed-off-by: Neil Spring <ntspring@meta.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
