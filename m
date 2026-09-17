Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D2C23E334
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 00:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604519; cv=pass; b=hWUBbfqwZxeVtXA2E5Hc4blRi3eYcY7q3TWWjy24o9Jbt3DZTNc8WNWdHhE6kxlqT0KUm8LsyYyQYEeStrRKhcW7ExxArZOS+ZvlTT6Gef6NklYHcRL0AcKvhTOM9Oj039C0kCgcYQ9COGG3jAIN/Twb9kbNK0bqEZajv3z0u5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604519; c=relaxed/simple;
	bh=eE/70tI5lHBfiicghCy5PNB/8uOoQM6gLV3a2ZfYFM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEAzWUrhKtRLOANMuz28BbjWHCpvTra8zM8PvA5BXafO8SbelDLcImGTRm1sWRs25RpOas+aa5KtVyv4SaVyabvvScWPYFUJGFscPONQOJlUNATPG0alEwbmnlyTxYpR/J888A/kzFUoTgd0krJ3TKaMA2jZm5KEdNcekIirkEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAf0Hcwx; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAf0Hcwx"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4aae3147so264055d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 17:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789604517; cv=none;
        d=google.com; s=arc-20260327;
        b=Nun1onr8FdbpGgDxeQgghaqtLSnq2CLXvXNT56wK3NVH1gbZ5/IkaPs672TNczzuz0
         zWsop/I78F5qUCzBYaawayg3iOVQ5zp8mDCj+tvdFRLnb0Ebg2NQMnOryOIRwXDb4yqa
         SYIOSqkx6QYroJEd2R7RpL41/bQut7HVNWJ1pUfJMvJ3deC1l/9vPuVRh+La3+gb9RJt
         t91AD7pPNUKA19VP+xDTN37CviaxaJy3SlaDFfwONdeONmhSE5t/A9TTfaiHOFnqAACa
         ooY3gzsCD8mh+ZSPSiOVzzX6yPDLK5i32MV8ocp3fPEWmkIjCcIazR4qv2kSXoj9rkPg
         govw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MDCyJ4TOKuXbazw0rOc/QKvMAz2VNlILsoPCMfyFwJ8=;
        fh=oy9mdpUA0YI1aFYEBfTU5/q8ZQvx2o/a+qFI1i/YxXU=;
        b=CMg2spCpz/2eOx4v/f8PiyfM4UfEC+uIw4mTVhfPEm4+4r+wN1Oi8DpyS5yT7EwTXV
         pEaAiDYm8BjU6PI+NSmO8sWLi0587Drt+nXtyTegUWQMW7vMIAAl495dAh7Nyj9kRRNz
         PFl4jrl9exFp1VuZQX+czg7etoC41fDUSYUGa8x9vCzyfieyUBo5A1OypUBIDw4e/l/I
         E3Pk3ms6M0sZQbS7ZBSCIJmdCR9k7FRRIeIhipKW1LEV45FvPRwAt2iwXWEUgrL03L7O
         Obx9fK/s5UHpDN4GnY/Odt88jhAmOqBvuKZtr5utTGMZHwp0Jpi2mNn2KxiJUwxJd+En
         MuPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604517; x=1790209317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDCyJ4TOKuXbazw0rOc/QKvMAz2VNlILsoPCMfyFwJ8=;
        b=XAf0Hcwx0wGX1R/eahcYqcItKUB+ei7e0KMV4GnR24CdTGYaMdKYGr7mf9+AX8iSql
         RsVuoQ1OMmJ6BlqV3PChQ5GsQGV+4MdUdbl05Z5IS7iOAeZNpG7J8rvBRLMzSirKsiuc
         oIz4uKvI4TwBNsD8scJjk/PuQ1KRH85sa8azl6DDM7iEcBKkO1WkdNVUe+yyrmbzXyhd
         WEAgdtsKRdce4nk3PZ4WBsAw0+Innm2tSA2AJbqZDfeHb2o/cc33xjc+NElVB8ZsdtC+
         +9UkmcFZR37wrgVIf+wREgrwOMYnR596/rq8UFF17EfpGQnfK8Qn8XHE2DUE+lU/jHmN
         gbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604517; x=1790209317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDCyJ4TOKuXbazw0rOc/QKvMAz2VNlILsoPCMfyFwJ8=;
        b=KuQ0P1ZUUx0LiueT680m+S5zwE/MxBQVIE8o+th0i1lPwDgmehDsZeQIFFvuG75GoH
         L+uGxVrnYcd7YkgrOYXaPvDCczDWV66JwFJIf0n/lWyNgrSse1z6A4DLG7PJgT0h8fZ2
         J0cFBfHtXziGLfwNYBHIf+tZzCYzkVW+ykOK2/xLTtaLXeF1TT68f7iWf4jXht/24Snw
         2EOlN0xcTYlELih6OH2ilbEDyKDVFJ0Z2EjG+tAxyO2ZVPTd35c+vbMCm1YmsgpFGFP8
         lslnqdq0wMqg8yuka9evQNBTvLNwQ9o/e+08nyjZbxEZG0EJ6WVwR0WfmKzDnWvO7Nvz
         w7Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwSWzuY5MqLbFJIoZ4qV+1uJvB/2xUt0oeLy0jN/+EBUCxIkHKcwaOQ0emxro1svGrarf/d0CfClQwGRdU5m3A=@vger.kernel.org
X-Gm-Message-State: AFuF++mwmf6PVvEYVPGZbc7QUDdWkE7PKYebUkKcd9fUKc7CcTuo2Xhk
	AxIqydBQ6HNbrkAkQcKl35VNmMf2W9oq8ybzYy7V/HslY1hG+IxtK47KFFx/rk8RUInIVUz6jkz
	k4zG1W/X/Qj9EwXuIeQyMbwJMsXX4kBI=
X-Gm-Gg: AYBFou0EQd+qcCGeAXk269A11N6behYD6dq8Z5awET1HO+vLVWewArjVGiXNotrhie4
	HUl9w87mj7FgGHC9O5aJ6RkmlblOC67AGPjWQ4rzCCTFrsFUCOu3nrF7egMPb6+TNZcmhKbAykQ
	IS7b/kvWvd8evXeZ7Jfp0CfXVvf3Z4vY0XE8YPDaFgop+qlHASgp3y+BU1R8StmIlQCF815+cAz
	9CtIABC2mPxT1frrOm/Tndexuc24lyN0VQt0hjRIDR/NqpwWmCq23cpLzrA84j4TzKkt/e/Tj61
	R4BDASgPyeL20lI/JcGTu1xL94THRmblg5QsIGzVByPPrl4aT3LnRqqy
X-Received: by 2002:a53:d016:0:b0:671:4c1c:d571 with SMTP id
 956f58d0204a3-671632c9f51mr1604029d50.43.1789604516779; Wed, 16 Sep 2026
 17:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-psp-ktls-fix-v2-1-0eedc3b148ec@gmail.com>
 <178960039456.22033.8739239860645875280@kernel.org> <DLH4YA9CBAOR.302OMMH65TVUD@gmail.com>
In-Reply-To: <DLH4YA9CBAOR.302OMMH65TVUD@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 16 Sep 2026 20:21:09 -0400
X-Gm-Features: AcwNN1U4GDt9jigbNmv_Nr_CFF1szcdzklC14Mom0RTgeef43I5aY0c4jLpwzWQ
Message-ID: <CAF=yD-K2d4i2Jgc3v5okzuGy3GPLXD+E490r0FYBcW7+Rg1fxA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: psp: avoid conflicts with skb->decrypted
 and sk_validate_xmit_skb()
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, edumazet@google.com, ncardwell@google.com, 
	kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org, willemb@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 7:39=E2=80=AFPM Daniel Zahka <daniel.zahka@gmail.co=
m> wrote:
>
> On Wed Sep 16, 2026 at 7:13 PM EDT, netdev-bot+sashiko wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider:
> >
> > Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 0 =C2=B7 Low: 1
> >
> > - [Low] The patch adds a new, user-visible restriction to two already-
> >   shipped interfaces without updating Documentation/networking/psp.rst:=
=E2=80=A6
> >
> > --
> >
> > net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb(=
)
> >
> > This makes PSP and TCP ULPs mutually exclusive, since PSP and TLS both =
use
> > skb->decrypted and sk->sk_validate_xmit_skb(). A new helper
> > sk_has_decrypt_user() is added and checked from both __tcp_set_ulp() an=
d
> > psp_sock_assoc_set_rx().
> >
> >> diff --git a/net/core/sock.c b/net/core/sock.c
> >> index fa60b7494c586..9489d9c479493 100644
> >> --- a/net/core/sock.c
> >> +++ b/net/core/sock.c
> >
> > [ ... ]
> >
> >> @@ -2670,6 +2671,12 @@ void sk_setup_caps(struct sock *sk, struct dst_=
entry *dst)
> >>  }
> >>  EXPORT_SYMBOL_GPL(sk_setup_caps);
> >>
> >> +bool sk_has_decrypt_user(const struct sock *sk)
> >> +{
> >> +    return psp_sk_assoc(sk) ||
> >> +           (sk_is_inet(sk) && inet_csk_has_ulp(sk)); /* for tls */
> >> +}
> >> +
> >>  /*
> >>   *  Simple resource managers for sockets.
> >>   */
> >> diff --git a/net/ipv4/tcp_ulp.c b/net/ipv4/tcp_ulp.c
> >> index 2aa442128630e..b58045df101e5 100644
> >> --- a/net/ipv4/tcp_ulp.c
> >> +++ b/net/ipv4/tcp_ulp.c
> >> @@ -136,6 +136,10 @@ static int __tcp_set_ulp(struct sock *sk, const s=
truct tcp_ulp_ops *ulp_ops)
> >>      if (icsk->icsk_ulp_ops)
> >>              goto out_err;
> >>
> >> +    err =3D -EINVAL;
> >> +    if (sk_has_decrypt_user(sk))
> >> +            goto out_err;
> >> +
> >>      if (sk->sk_socket)
> >>              clear_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
> >>
> >> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> >> index 1a2a6b7516b0f..e9b53eedf8dba 100644
> >> --- a/net/psp/psp_sock.c
> >> +++ b/net/psp/psp_sock.c
> >> @@ -143,6 +143,10 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct=
 psp_assoc *pas,
> >>              NL_SET_ERR_MSG(extack, "Socket already has PSP state");
> >>              err =3D -EBUSY;
> >>              goto exit_unlock;
> >> +    } else if (sk_has_decrypt_user(sk)) {
> >> +            NL_SET_ERR_MSG(extack, "Socket has incompatible state");
> >> +            err =3D -EINVAL;
> >> +            goto exit_unlock;
> >>      }
> >
> > [Severity: Low]
> > Should Documentation/networking/psp.rst be updated along with this?
> >
> > Two already-shipped interfaces grow a new failure mode here:
> > psp_sock_assoc_set_rx() now returns -EINVAL for the rx-assoc netlink
> > command, and __tcp_set_ulp() now returns -EINVAL for
> > setsockopt(TCP_ULP).
> >
> > The "Securing a connection" section enumerates the restrictions of the
> > rx-assoc/tx-assoc sequence:
> >
> >       PSP encryption is currently only supported for TCP connections.
> >       Rx and Tx keys are allocated separately. First the ``rx-assoc``
> >       Netlink command needs to be issued, specifying a target TCP socke=
t.
> >
> > but does not mention that a socket with a ULP attached is now rejected.
> >
> > The "User facing API" section also suggests a TLS-then-PSP bootstrap:
> >
> >       The expectation is that higher layer protocols will take care of
> >       protocol and key negotiation. For example one may use TLS key exc=
hange,
> >       announce the PSP capability, and switch to PSP if both endpoints
> >       are PSP-capable.
> >
> > and "Kernel implementation notes" says PSP "follows the TLS offload mor=
e
> > closely ... and the use of skb->decrypted", with nothing stating that k=
TLS
> > and PSP can no longer share a socket.
> >
> > One more thing worth spelling out in the docs: the check is not restric=
ted
> > to TLS. inet_csk_has_ulp() only tests icsk_ulp_ops, so any registered T=
CP
> > ULP blocks rx-assoc, which is broader than the subject line suggests. T=
he
> > commit message explains this is intentional, but nothing in-tree tells
> > userspace about it.
> >
> > The follow-up patch in the series ("selftests: drv-net: psp: test PSP a=
nd
> > TCP ULP mutual exclusion") adds tests for both directions but does not
> > touch Documentation/, so the gap remains at the end of the series.
>
> I can incorporate some changes to psp.rst into a v3 if others think
> that improves the quality of this patch and the PSP code. Personally, I
> don't think this suggestion is worth while. What this code prevents is
> something I would be surprised if a user were to try without heavily
> inspecting both the implementations of PSP and TLS ULP first, at which
> point I don't know if using up words in this doc is worth it.

Doesn't seem worthwhile to me either

Reviewed-by: Willem de Bruijn <willemb@google.com>
