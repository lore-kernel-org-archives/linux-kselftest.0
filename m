Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BD5377EC6
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048174; cv=pass; b=htLp48uhmTGXcR2mDBQttcNLFgheXUati2ldNc1qyC/YZhn9472ze7heUm57awLB7/dX8FHgpaPeLO19E2Rg2wI4pVW24EOnX9eZYwWMdwEbrW6wDbyoYsgk5cKng6yxiM1NKlJdcLwVGwBYqWyduqOtCJU8vrJKJpb5iitLYBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048174; c=relaxed/simple;
	bh=upio09NojrFHMRimK65FKWysiVde+qA9+o9ztExC8qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArmkWAz2Sbd8IOrJ2G9hQSwNX7IFmiT5YTNADOnTJvwibw1PEyxC2a/5HNoLfXA9rshBIaWHF5Pn0M/ShOnv+JjIi4XdoOSzovuOwllqLQ01c58dvjlUqR5OXXcxMu8OATFpHgnKp7zqNc3fryX3qDO4l3+RHyPp+ukc4kkCr8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fexixnws; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fexixnws"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506a747448dso102119611cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 02:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773048171; cv=none;
        d=google.com; s=arc-20240605;
        b=A1Tay/m22y041c6kZmiN3NPr0jk+daKrf/ALz9OZ3U360fExdJ7RzmPGxeDGsLrlUM
         JI6hrBCqf4riH2M7mwelkDQM3c/xDvTdLTnvEkqD11h+VdvtbECtNrkVkqWWvPQsXk+0
         r1VIlUnE6rqALif+j4DK8sHuqiCAnE54+6rtYkpdhg3kSEMQTkuM+4kD34wKhxMo2Rds
         2MXt7YPWfLzdm2rJ7Uhd2kFAZGTiI8AC6A+z4NjFGNGTFfUM2Obsej7zeCPEOSmSbVGR
         8MEMuFsg4fg1ZRBh9w40bYA5B7lmWfujTLZ98+ZFhaoxmP/Y1EGx1y21aumlqCWc632D
         2H5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N7fC3bjKwQcF/Me1NQG71BV/tCAMZf7S0tDB0ddNnBM=;
        fh=vikUWc4TApRxYWjFJYwqjDgr95HEux9VTnrKGsx6AAY=;
        b=RQSAXBlStmVvsYLG3MZQQGXXjIGMh0AReMRwSrCo2RBkI5oPVF1N+w+130zvm7lQ5P
         DQZcykwGXti1mbdthkB2I06ZQwcOpGenp4qs3tADzUbQ2onP5zTdfX91oW3nUcu3CDDS
         ksWL3mWVpRe4NRDjSuIF3p9J03GlEsrHnd8pY2e+kc0vZ3oXC9H+0SZDnk4pIt/sCRqD
         wEHyEuaP19ex3L4RjdSk24CWVRbycbsZGxGWgBI8vihPcEiBsNs/zT9/sGsup3ZH+r/g
         iVXZvgVPBkgufehhxslc7tLZcKSi+nhzfyucjEGWWDF4zlVpc+iFxm/Z7kwgbUAeaAPl
         4VGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773048171; x=1773652971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7fC3bjKwQcF/Me1NQG71BV/tCAMZf7S0tDB0ddNnBM=;
        b=fexixnwskWyap/xV0vuQW1vre2lrsKvrlUl4bS1mgw54DXmcLrk0oZJimMGz8kIarm
         Q3ELG5dzOKm6C5zpFk+F5FrL5QJFHGhnDCU13/B0yhT2a8HHxfZdOsbSRnyxhoxB/S0D
         yllytPkipre5Wq8gYM4/c85/LFZQS03gacEkv6bbKbQlyp/u1c4E/Ze0EbH1Oy/6i2Sy
         jeZiBBTSt1G8SRsAwldNqm5V/4Cebb0t36JrukuhrGTxwKAUc576eJXoYXIrEFAXM3l/
         Ba2HHiCLRMVQou9gdxUyP9Vpzh8HzjcDumT2c8HlRaCLamc/1Sp2sIrSQBmKd3860kcW
         DCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773048171; x=1773652971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N7fC3bjKwQcF/Me1NQG71BV/tCAMZf7S0tDB0ddNnBM=;
        b=Xfb3hOQeEQqkeqpaHTrEVCLZafV1vpLjUmR2FMIZsYdQ3riEHmb2+t2V+ThSn+jNB8
         jo1QvJgRqsGfGIsikrqAuYV0mEIPDce5A4jBHJK8J5TKi/N6ES7SH63QkTZy6LLs0IPU
         lGzsqV26/GdLcSMSefP51pgQOL6Bk67sRu9Pq4y0S8JSzWCzRJ+z8RbKRo0/MsFkITeP
         Je7URQZnzVq39WisIEsrhnzQ1Dlnc+IjhfiitfZxGQZulVV23irHW32RD3fQfshH2Xoe
         KxQ4ai5Dm9u8Hjh+51ntrxhMQ37ZtnACCG5wpZX/KaZm0RbEt/XOO3KZvLopzZ3W8fG4
         GDQA==
X-Forwarded-Encrypted: i=1; AJvYcCWtiDPvNwrCMIIhqul5OHeM2jLNbDX7ykvQ5LcS1njbYMEbuV7Av8gNjMqJaJUEv/hF2fICTIKQjGh/ExqxFa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyafLyZZYqRPQr0QkcEFOAEEooDDOhmg+xtkxiqTNUmO42dlkWL
	qMve4Hog8USjoJApZdoZSaidCbdY0j2L0tFwST0MTEoWMtv0aeqP/7OO+eoRUCOyX6zMFYaOhkw
	OD6ZklCTHQbgpK7MbUqWwDu0rZG102FhE4y6zhpPi
X-Gm-Gg: ATEYQzyRNdxILopzGJVa8l4tU09/ElD+3cVUg8gbcB53850n2/E/n4sQvcfvT+mIEDB
	mDdB7iDnsBtZMuOcgd93mx0PB28HDKwcGFyqEdrSKT83vU/VmgindU+nxJtLsKRzdhpaIPwn2kd
	JvsXElI62XfqXNvpK0YAJeHVzqFJ0wSNpQJN9XYnjIesOE+WPDWSfuq245135vpRgqENiVhEyiA
	HcFu9O35sEHdRBAHCJomTIpXSx12hCXSP0kfTMvtxkGUd+ZmedusH8cDUsCyWieVK3kUruA4wMV
	tdBq+aZd6mdQkfGSoA==
X-Received: by 2002:a05:622a:7c91:b0:509:882:9e72 with SMTP id
 d75a77b69052e-5090882e153mr50961191cf.1.1773048170529; Mon, 09 Mar 2026
 02:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Mar 2026 10:22:39 +0100
X-Gm-Features: AaiRm515VzWer9rfQTDKEwoECAFtXOyO-47wB6RLAYk2qz4MnRNOLIFCZe96lfc
Message-ID: <CANn89i+38t+PpB5duS_-FX_=PwyCQaN2HYohocJBAvZ7Cd8-KQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/6] tcp: implement RFC 7323 window retraction
 receiver requirements
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 9:03=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> By default, the Linux TCP implementation does not shrink the
> advertised window (RFC 7323 calls this "window retraction") with the
> following exceptions:
>
> - When an incoming segment cannot be added due to the receive buffer
>   running out of memory. Since commit 8c670bdfa58e ("tcp: correct
>   handling of extreme memory squeeze") a zero window will be
>   advertised in this case. It turns out that reaching the required
>   memory pressure is easy when window scaling is in use. In the
>   simplest case, sending a sufficient number of segments smaller than
>   the scale factor to a receiver that does not read data is enough.
>
> - Commit b650d953cd39 ("tcp: enforce receive buffer memory limits by
>   allowing the tcp window to shrink") addressed the "eating memory"
>   problem by introducing a sysctl knob that allows shrinking the
>   window before running out of memory.
>
> However, RFC 7323 does not only state that shrinking the window is
> necessary in some cases, it also formulates requirements for TCP
> implementations when doing so (Section 2.4).
>
> This commit addresses the receiver-side requirements: After retracting
> the window, the peer may have a snd_nxt that lies within a previously
> advertised window but is now beyond the retracted window. This means
> that all incoming segments (including pure ACKs) will be rejected
> until the application happens to read enough data to let the peer's
> snd_nxt be in window again (which may be never).
>
> To comply with RFC 7323, the receiver MUST honor any segment that
> would have been in window for any ACK sent by the receiver and, when
> window scaling is in effect, SHOULD track the maximum window sequence
> number it has advertised. This patch tracks that maximum window
> sequence number rcv_mwnd_seq throughout the connection and uses it in
> tcp_sequence() when deciding whether a segment is acceptable.
>
> rcv_mwnd_seq is updated together with rcv_wup and rcv_wnd in
> tcp_select_window(). If we count tcp_sequence() as fast path, it is
> read in the fast path. Therefore, rcv_mwnd_seq is put into rcv_wnd's
> cacheline group.
>
> The logic for handling received data in tcp_data_queue() is already
> sufficient and does not need to be updated.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>

...

> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index f0ebcc7e287173be6198fd100130e7ba1a1dbf03..c86910d147f2394bf414d7691=
d8f90ed41c1b0e3 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -293,6 +293,7 @@ static u16 tcp_select_window(struct sock *sk)
>                 tp->pred_flags =3D 0;
>                 tp->rcv_wnd =3D 0;
>                 tp->rcv_wup =3D tp->rcv_nxt;
> +               tcp_update_max_rcv_wnd_seq(tp);

Presumably we do not need  tcp_update_max_rcv_wnd_seq() here ?

Otherwise patch looks good, thanks.
