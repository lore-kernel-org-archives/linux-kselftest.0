Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1C23CBE62
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774336747; cv=pass; b=PlI8qqpyXtIyEud7om9SvcxOu9uB3w9SKINbjHU3URnz6wvCiEZ+bcVNbp8HvxjKQ/IW5c+qe7joo7mw4nnesfO0Ubv95RlMUc3kwHIjOgx24JC314k0f4M7iqysNGCxSx4hTmWMuq3KZq3ltWjScely7WOs407yGzmjcmCJcyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774336747; c=relaxed/simple;
	bh=GioMay0z3RvGrI+bvOMxrRrL2BGI3lbKrkimRkrS1VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTe0IiEvRl7TfQF7hSzy0naDjCf+bFmHJm452nYBbHyHLp40i2xqSjGUW1jM2RL+U9Ha0q9PtMKR4Cyx4cCDlZVjt+7li0Zar+EESiiKamls9N+H4pJD0i+XjkADf6At/30d/VuSJPXPLDJYgUQEarvJPWBWdR/toI23dVbSkyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IvM/fOVX; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IvM/fOVX"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899eabc5292so50136406d6.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774336736; cv=none;
        d=google.com; s=arc-20240605;
        b=RABbjpSDLM1hkEdV5z8ELPNfaYU1/wo+XG2zZYFmK604t1ZrJyBpWPr2oDjk+pMeiW
         LZWpDQxdtqyhsuSfYwcxlTdqtc2eVeKgWwCT9PVrJtJ92zrZD/6Sy/EAe0O6OVklKC1v
         b73Y4ZQc+/gdcOSnsZWPXhx/qE/oEnOOt2bUZK15BzpML/HvKcWRjjSIpc29eetvSgI4
         BrJmxhNr3wXfQ3RbTfWbCJZQ+rzN2oY4h68aVxKZVX3Kx8dRm74HMraffCETaL6vCkMj
         vbzrDGCAoOmnPRZmKKr/VVeETvd07Gx+6VeJusjMVLiGPpuQVfpmwC/BNx4Dtt+aAYn0
         OoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GjKVYMKloW8tN0wIDskwyEALoOphOGhC8hi08Q33Ro4=;
        fh=TFqBqNL/4hQKJijq5hBz2PGVueimS0Uw8/JVUe1KK7E=;
        b=QGELUbVmPgp6HUPSw+NfYhrVlkhE2wPr9/aaVIU2+DMI0N42Vv8lpShywRtkmjoYH6
         f7PlRryP8VkcI01i3RoyQd36BcCnrVmmdC5ikQkYwiw2DQYSKmXwZklLSAdM6uPjtQq/
         dTa+PoCkwMHlxx0iVJ9U5SEcdMAWPAeAMXrNGk9L/d2WKjs1lFepMcvfTIFsfprOIEtu
         sCZkPbav0dEhswLdKAXiEkAwy/pf2eDwrrqCPllATIClNz7uPUvHGsBtuWH7NMonwFUb
         hJyK7HtIIIkSmYBYIoMVIg6yQpPmKU9zY8UYKjvYauLjhvtc4iYL75krB+NmAUtc5BcY
         WALQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774336736; x=1774941536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjKVYMKloW8tN0wIDskwyEALoOphOGhC8hi08Q33Ro4=;
        b=IvM/fOVXU9bHWYMI2i3KLpf7CgqflDPFXvbsTBxM5OUsjehGJ5sChkQ5tmvkx09f8R
         Nh/zm1lJxAP40rdsFU2lPcsLpRuwpTt6V665hMIsA121jKa7bsigBKgdoS5p9mKzCZEu
         GsBk0gU0HoowmJp6k+2B93l72qAuPNwgvNEF2tWqREJU5nNe4T3nR7S8YZtYpTaMtdbT
         fEXWKk+mqPAHpYV4GiQjdSIU9oNdBWAn9HJvcWprM9bGHAxe/aowUa45w2wZnlXibgwz
         VnFmhv7Z6WPTbcd4rLJz7470iZwH6dhjSEQGJiMNDovFlJM3mhupFNuFmDq6WfK+tIaI
         LtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774336736; x=1774941536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjKVYMKloW8tN0wIDskwyEALoOphOGhC8hi08Q33Ro4=;
        b=pxaI418WvX1XJbM09QcgLNINPVGUBoRxRUFPPoC7Zys+1x6zEN5JX36ZT5OPEVQ1QS
         PYoWYgMyXAjp8oaeeZR1EDgTSCFNnd2eOuOXu4wBTb7GpPOpUQqJPMWW1YVpR8ZFjhnR
         tDHWU8cwfVQ1MPeqFmOFzaEXAxTeXuKFFUpVE7kfBeO4DU/orpOMo7VsA3zbrMz/UgPd
         5vDfdUDW4LWVkDIz7pF8nnP+hfOniP6v8hvY7aNMgmxrIPwVzIxM79TZ6BavhTuJDuD0
         9KbGskgjSRqvRzNe5WOf37qp/OI1pDYlyId7W9DoJpGtcYVmF+XNVzcwMU3jNPaEYndX
         M4nA==
X-Forwarded-Encrypted: i=1; AJvYcCVjpYSzvVQjlwZVFZtkBuVPYnaeWTXT1gCzhePLHlE5dmq2SeBUoWaeGvNYSwfAZDlehajRPR/2SQfk2Tl1lSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP7xOa5Pi5kVsMUjUmMH1ghbgus1dcrXIiVHwMq6xrZCKT8KJh
	KaggiR5SZ8EUR5CwM1bvLv1E5PJ9xlw6szHKSf0NjcLlurnftYyT8x8s4p7dZEecPBNdoFWi+1j
	uNcdzwTtLpsX6dH8IOYtJfXQlp+9+ga7GcF+tAst6
X-Gm-Gg: ATEYQzw1tq7wYyDRQFeDhxGkhu2PdWNAfTMrqZORc19dulQ8VO+nolkl/DP7Ysa2Eqy
	JaqS5t62aePYH25XEKxdb51qwl7afk/JmCU9zzwp32TMfx6oK+YzkQ+10mCB01EHNYpHw74NdNS
	uNzm9ftmMOIeiCwajJb9h4fiHJdLc8Xjs+1eAN2GWbbRa0WNXv5CLt8PDYMaJ0BZ53/4rlM/pWy
	e0DJ0x0dZgqRwia/cmB56epl27nkgu8baMVxJ73pMeCE/XDwA/lgAzoJwSuno2xeCo2B65DLSij
	eXD2CQ==
X-Received: by 2002:a05:6214:4e81:b0:89c:44f9:e87c with SMTP id
 6a1803df08f44-89c85a8cdffmr245118496d6.48.1774336735971; Tue, 24 Mar 2026
 00:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324060410.1137199-1-atwellwea@gmail.com> <20260324060410.1137199-3-atwellwea@gmail.com>
In-Reply-To: <20260324060410.1137199-3-atwellwea@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 24 Mar 2026 00:18:45 -0700
X-Gm-Features: AaiRm53LVuqc3tgPkdjQ5OCud-oJjiexn1bWMClLsMt295YllL2swqwujHey-r0
Message-ID: <CANn89iLFT_JF_h+EXFBUBrtqKRRsS5nRySYbX5sLisDV4LKKVQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] tcp: keep scaled no-shrink window representable
To: Wesley Atwell <atwellwea@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davem@davemloft.net, ncardwell@google.com, 
	kuniyu@google.com, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, gmbnomis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:04=E2=80=AFPM Wesley Atwell <atwellwea@gmail.com=
> wrote:
>
> In the scaled no-shrink path, __tcp_select_window() currently rounds the
> raw free-space value up to the receive-window scale quantum.
>
> When raw backed free_space sits just below the next quantum, that can
> expose fresh sender-visible credit beyond the currently backed receive
> space.
>
> Fix this by keeping tp->rcv_wnd representable in scaled units: round
> larger windows down to the scale quantum and preserve only the small
> non-zero case that would otherwise scale away to zero.
>
> This series intentionally leaves that smaller longstanding non-zero case
> unchanged. The proven bug and the new reproducer are both in the
> larger-window path where free_space is at least one scale quantum, so
> changing 0 < free_space < granularity into zero would be a separate
> behavior change.
>
> That representability matters across ACK transitions too, not only on
> the immediate raw-free_space-limited ACK. tcp_select_window() preserves
> the currently offered window when shrinking is disallowed, so if an
> earlier ACK stores a rounded-up value in tp->rcv_wnd, a later
> raw-free_space-limited ACK can keep inheriting that extra unit.
>
> Keeping tp->rcv_wnd representable throughout the scaled no-shrink path
> prevents that carry-forward and makes later no-shrink decisions reason
> from a right edge the peer could actually have seen on the wire.
>
> This removes the larger-window quantization slack while preserving the
> small non-zero case needed to avoid scaling away to zero.
>
> Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
> ---
> v2:
> - rename gran to granularity
> - clarify why representable tp->rcv_wnd state is required across later
>   no-shrink transitions
> - clarify that this series still intentionally leaves the smaller
>   longstanding non-zero case unchanged
>
>  net/ipv4/tcp_output.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 35c3b0ab5a0c..e5c4c09101be 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -3375,13 +3375,19 @@ u32 __tcp_select_window(struct sock *sk)
>          * scaled window will not line up with the MSS boundary anyway.
>          */
>         if (tp->rx_opt.rcv_wscale) {
> -               window =3D free_space;
> +               u32 granularity =3D 1U << tp->rx_opt.rcv_wscale;
>
> -               /* Advertise enough space so that it won't get scaled awa=
y.
> -                * Import case: prevent zero window announcement if
> -                * 1<<rcv_wscale > mss.
> +               /* Keep tp->rcv_wnd representable in scaled units so late=
r
> +                * no-shrink decisions reason about the same right edge w=
e
> +                * can advertise on the wire. Preserve only a small non-z=
ero
> +                * offer that would otherwise get scaled away to zero.
>                  */
> -               window =3D ALIGN(window, (1 << tp->rx_opt.rcv_wscale));
> +               if (free_space >=3D granularity)

@free_space is a signed integer, and @granularity is unsigned.
If @free_space is negative, this first condition will always be true,
because the comparison will promote @free_space to a very large
(unsigned) value.

> +                       window =3D round_down(free_space, granularity);
> +               else if (free_space > 0)
> +                       window =3D granularity;
> +               else
> +                       window =3D 0;
>         } else {
>                 window =3D tp->rcv_wnd;
>                 /* Get the largest window that is a nice multiple of mss.
> --
> 2.43.0
