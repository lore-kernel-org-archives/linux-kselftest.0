Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7E28632A
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 02:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769307016; cv=pass; b=scm8Kj+vBPuRlVvcpkGPIlS4q/oCj+dkMCOb7/DEFbKfoweiAVwaW1jK9q8++hgtvO0LQLU0IucIBRtpoDr1ICaGY2E3AQbCKI9PdWYbxhq2wJQqAZO8r8fNUxlDm5PgGzwuXKzPsEMpi3mWNa1glZEUw8Hn/6/Grip7hvFTmiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769307016; c=relaxed/simple;
	bh=XLZyAyp5UIrnE16IaKCD9XtL/eqE6lBlGhHJnAAFVHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDz5EDGFxPzlLEQKXCkEmNCOkcSGJt1CB+COZba1wCl5wBZ6o3uRW6nuXyzwldh1QN0Oh6h2WvICPB5nyTegQyY7x3lBuXwTm2HvJ2RHkusqIvPfRDYStFi/PduhQf7rYuvaF3wURBKEswADGl9IQotOQ95lYJW6+GCxoJ7L7Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUjbdJwH; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUjbdJwH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801bc328easo39344785e9.3
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 18:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769307013; cv=none;
        d=google.com; s=arc-20240605;
        b=dJoAUJSiQz67VhAVD2YJ096D/9X73vbtYoJPMSz2hk4ZzERY1OLF2sBToF1jQ/mTQO
         luDxecfj38Xs7FwN7AC62veHdYgXOg4rnnpEEGBeKZzhvOrn0Ad9AL/mjnNdOqta/rCz
         SC2F9AsZKOjHWOJUEA2Zr/0WgxMeBYif1fuDVHbODav8QVYMHySRkcE9mX02RJZugDZ7
         xDEEvQE9q0egAdXJRNptG4RX3vSEFpWgWSMcGtDP0EZH4vW2FyzXhjWj1oJScwIq9k85
         Gc5H4bAxc1MAh2cL/9DH5AN8bpJoPzM5mwVN5k9Uv0STfYZHlrRZzOLh0iB/flEBztHl
         K2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rgZwVVbLFRja+NPlNhTLut3FqFbwxjNQ1zZe8RLLWeI=;
        fh=750SyzVugcEYzYR5D0MbjSxccY8LqFdDcbrjBu9Becg=;
        b=ff5+duBCXUdgOSkFgg8hJPUn/u9pQvZsmyUGC8aP8q3NcCos7F7CGVLS+ISJVBwnMN
         ++P3NllK6BA9QYOAqavPm7BdqE72GaBWZZom2DXpS61SSfF6QR2NrtZEcWzviVZYg33x
         hirku1VgIJbyI9OiEOaOMAkh35ujDA0gt7r9Xy0m+ziSQ3yE13i4fcMSv7qrCgCm+KoP
         gLxByfHsSMUTZMTXo4tyBWQxjGTYpFgC7m24ijiaxLtMCgSOJUfdDYg/MG9+pWpphOMo
         YN2fvpSbr/DOWvdWqd9ntjxaJxmC3xBSYMwjEGAeXf0Gm1ijDvLW0yetJ06QHuli8LX0
         I78A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769307013; x=1769911813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgZwVVbLFRja+NPlNhTLut3FqFbwxjNQ1zZe8RLLWeI=;
        b=SUjbdJwHyDUnyCgfDnC/proUrN8BT2d7uSQd2AcybskPpAS6dHhVlW9UNsCrCpjo+L
         Gui/lz+XR9VeAz1KAd9SoEdWdCmdOLCSHpMT4F/QajAEyOQqLxXqZNtdJWGX0cgHMUdI
         WlikwMA1Bsvsw8BT0LLEJjGU9iRCxNC3ZTEF/lCLZRhpV31WF3m7PHFbEakXZLOMuOEk
         bT8Hd87kRe2pI/2X8sE0H1fxDSB0HnIfP/f8jQNzjAy3Okjo6tNvvC0a7wHccW1UrWwS
         kF70mjkx7f0XPJpL0g2eCJldUjJomCPVBkqwNdfuQXbmKCV0NW3HSDYvTv6SqO0TbhKZ
         xYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769307013; x=1769911813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rgZwVVbLFRja+NPlNhTLut3FqFbwxjNQ1zZe8RLLWeI=;
        b=rmrWPOZ3BJ0udsvLdc0RhbXR/mA+UxrraOWuhWbt5GxKJI+xnRrf2set2jun9LHfTd
         dPqQG6siaNwlXV9cD8b4/4aFqLGR3YzfflZvgIfZN+4h+3R8y0o+JVdVvoRAZkt5lr6F
         rGsKraLxLjzh6XPCOuMa7VE5G//7nm1wZucWNWpWoMpwJBuyE1U+UrWYLGicbvPAugvj
         Uo2fbKP/1QBZ3aJXI0zSKngPptZFxkfQ6Qh8OTMq3dbm9URE9GsmsC8SOfqo49jx5r6+
         p4oTxYWdEWVz94p2Y7GJ6kQbdeTk4SuCx1cUldhkNnVyXMS2TMuq7YKPyUtzBAJaWtkX
         YNDg==
X-Forwarded-Encrypted: i=1; AJvYcCVCOhUqVKob4hrJ4cTXcvVJnI7E5K5RqVhyt2eD4gNzSCYTTjCRbiHTTL/M9t6pqsnWkBbWoLCjQsK0NeoROUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNM/Ib+Wc5zpgNWMhQB1MwIe2vtOc9nLr5RAQnNDVL1xN2qpPr
	b8LcNPaNZcHdztlZxA8odIMQ20XTdM07yaWNUYCHqGx7iDNsLFNl/QBsQr7jf6EJNnZGkYXAf3W
	PDnNI11Tht4qEbBV4o476S9iFcudFStk=
X-Gm-Gg: AZuq6aKiWfdDIUnFRV3HWzbX3h6dSQw0hhmxRD0dkJwFi0bv3/6sj+1Mks3wHSawgmG
	r3wafNqOc/+Mb/vTFoK+bbkDnMZvX3PRSsNjEra5ai/cDWsjrVoxCfCbk+a967LH09hUVtkpEg3
	GSSKewJ/ZcmtpLHDdg2zLA5MuVU2J2CJPrapkTitvq+4V8wgf03BuhgRv+7B7JkR1zhfaDZU30H
	1IHI79/w+XnQxrr6TcNvq156EzNJOW5Xudyy4iU95f1818mCbxeXXtVTmcdEKTF+1GI5ZHZDE2h
	+dhHQLb7fNI/gaZg5bhahJAMM8B3E5kii4SR6OWMii/2tcdkpHyP09u+pQuBkDlO8fi0KKBFLhf
	hth23wcib/ZWVEA==
X-Received: by 2002:a05:600c:530e:b0:47d:403e:4eaf with SMTP id
 5b1f17b1804b1-4805ce4e67amr6595865e9.10.1769307012798; Sat, 24 Jan 2026
 18:10:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124113314.113584-1-jiayuan.chen@linux.dev> <20260124113314.113584-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260124113314.113584-3-jiayuan.chen@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 24 Jan 2026 18:10:01 -0800
X-Gm-Features: AZwV_QjbA50cTkj4c5-gGI9H_-Xy1D3AWqQcM96i4DXaFF0Q5FjjiG99twxjLXM
Message-ID: <CAADnVQ+TGhrAhUfbhCtnN-EEWF=Vb3AHVqs=Vd7xoSJoptKcwA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 2/3] bpf, sockmap: Fix FIONREAD for sockmap
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, David Ahern <dsahern@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Michal Luczaj <mhal@rbox.co>, Cong Wang <cong.wang@bytedance.com>, 
	Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 3:34=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> A socket using sockmap has its own independent receive queue: ingress_msg=
.
> This queue may contain data from its own protocol stack or from other
> sockets.
>
> Therefore, for sockmap, relying solely on copied_seq and rcv_nxt to
> calculate FIONREAD is not enough.
>
> This patch adds a new msg_tot_len field in the psock structure to record
> the data length in ingress_msg. Additionally, we implement new ioctl
> interfaces for TCP and UDP to intercept FIONREAD operations.
>
> Note that we intentionally do not include sk_receive_queue data in the
> FIONREAD result. Data in sk_receive_queue has not yet been processed by
> the BPF verdict program, and may be redirected to other sockets or
> dropped. Including it would create semantic ambiguity since this data
> may never be readable by the user.
>
> Unix and VSOCK sockets have similar issues, but fixing them is outside
> the scope of this patch as it would require more intrusive changes.
>
> Previous work by John Fastabend made some efforts towards FIONREAD suppor=
t:
> commit e5c6de5fa025 ("bpf, sockmap: Incorrectly handling copied_seq")
> Although the current patch is based on the previous work by John Fastaben=
d,
> it is acceptable for our Fixes tag to point to the same commit.
>
>                                                       FD1:read()
>                                                       --  FD1->copied_seq=
++
>                                                           |  [read data]
>                                                           |
>                                    [enqueue data]         v
>                   [sockmap]     -> ingress to self ->  ingress_msg queue
> FD1 native stack  ------>                                 ^
> -- FD1->rcv_nxt++               -> redirect to other      | [enqueue data=
]
>                                        |                  |
>                                        |             ingress to FD1
>                                        v                  ^
>                                       ...                 |  [sockmap]
>                                                      FD2 native stack
>
> Fixes: 04919bed948dc ("tcp: Introduce tcp_read_skb()")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Jakub, John,
pls take another look at it and ack?
