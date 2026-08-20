Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE014195C0
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223447; cv=pass; b=nDeof4LSQtDv7PaElFVRPc0L4h5rFc4qhD2NAb9b4Q0hFl4ktTDxwP520qDGhqC2U38BloFjyOcHy7y4qPF4upo7R+smiByIlp2c1rSo+Lp64d8g2ZAiksdNvsj7GF4KWM6ncaOKuq9ry/L8/24jejSrmX2VuwiHj708E9/eYTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223447; c=relaxed/simple;
	bh=9jYtyylx2W7dLCyVBh5w5flbhCU/+JBjP9aGJBwO6Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8E5NMNjEy42///z1/zX3ZsIID7e5aov6iDU/95LYrpTtxGkRoXhoHl60+cxC9Ong7CzJbh7CpyNICHoljUwbiJtABHJWw+PFq8lcnpAhTBUg5NalEGbGHb+z1vU8BjbKql8VG6OsQU4bMvdDJ7Lj2J9vH0othqwJqBTtVL+ljs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vH+PWZ4k; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vH+PWZ4k"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-930c0f9c1b1so134421785a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 03:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787223444; cv=none;
        d=google.com; s=arc-20260327;
        b=py9LeQZBzcx1+E0Rx1HwmMBxivfkuEVaG70SQL9s2Dox4yL5fAcklfsDoV+tf7PeSM
         brWiWTzP5Ap2x4L6e2Zy2vWbpHWIV/geV/HoRP66pN/Cm7sl73KiwChoAwroKqYL5yza
         OmX2zHcJK8R6nw4DfTCzI8doTHdK7YXKXJaV/pJ1tvQEOL9s1fPKsTURpmkUmIlagMJe
         Y+Y/LpAGcXpiBTTCNqBOdJ+xOAaracFURs6QnlmBPrBJgQ5lctRvBEc+XSQRh1FYqo6R
         6qPnsgBErUJK6QhakWonKKql+ofUf6mgm4FgMI+rejMJL0ov3edHrhzW2u3hI8qAnGjt
         7xCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9jYtyylx2W7dLCyVBh5w5flbhCU/+JBjP9aGJBwO6Iw=;
        fh=2C+m2iKRm6dDnzyNMtE9ME22prJSQ3rxbYIZ8b0B5v0=;
        b=qLt6OrJoVY7rZQkdWOncY7DklFCmsiCvIZuOZRd2HsqNsB2AfR8b54FhgD2QtjRIOu
         912qIE0n7UWBsNkxiyb0nmBTF5WPjN0StELzZqec+ea6ZJdp+nWhh4ByS9q5ShvJSF8Q
         43KmblMvxVoKZDd5Dka5rZWecTX3QIN7vzrdC0mossOmmgWLPv2IILkda7u3r8m7HseO
         qKzST+MwJP6YIANGbvjSvjAw32gmNzexkXBO5pd34LtD6eAG1RudY6pSS4jgg7iUnET1
         RTz7sh8bpuaZDhf4ZnDsgIQNQOV9IKop4Bii+Rfx8S0Q9oALy93em/vsVyIDfMcGG3Yp
         R5pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787223444; x=1787828244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9jYtyylx2W7dLCyVBh5w5flbhCU/+JBjP9aGJBwO6Iw=;
        b=vH+PWZ4kRaCk7q+/hoUeJPvKKLzE9mCR/GBiwYww1gvDQuQNSm4o3JABuI6JK/3fOg
         e9famN5/r17Dzglyxh57XsMbPhnYJag3eY+0EmkODlC/YPs5hbRf4WU+QVV5epNu79jl
         lfdKu4p7v2OGld7/A+GszvGy/1o9rR45TTFXC8GKzFYOUhHhg2EYfqBk5cXyLR9W35S1
         pHtjqs8wOwtr7Z9lPeREIEhwR2wdgjb0fkpWRvHw0SHxkyqDbYq350LefO/tdvZFBlnY
         hHUiatk99FC2Dh3hWqI7R0zs4sxTOZ81FBHcqDzhq82VxDhQM9Mx4NkhccH//Kro6oIr
         qq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223444; x=1787828244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jYtyylx2W7dLCyVBh5w5flbhCU/+JBjP9aGJBwO6Iw=;
        b=FGfjLf6zpIsM7hQVy9G7KM3IRpR9M9DWvH74eKVSjXb+gglsrD2Vl1BpqUbdCQbKJf
         Zg+zaHPMrPDjkrEXiVi+X8bnGdb5JvSrBoFYfu9WKSW0qANx33Ugx3iKsiNPZUnFDKBj
         zsGjr5iAuzSIKl16erRjJS/738omzZfD+hy87i6o+VKXLxNGw/CWMxB60FOZhLr3UGJY
         L7neFyMT1x4Preaj/fzV00Gd65aEy+pDNpEMADAvShX8lFTg2Q6pG1bkonolGRTuq4OC
         SiFQC2ZvTat5ugkdJ2Zwk0SGVO09KWBncee77Ni7+ekI+nbdvdzSqkE5EVhU8nAv3VxZ
         idkw==
X-Forwarded-Encrypted: i=1; AHgh+RrvJ4FQ/d8lWesE7wlO/R+d1aD1L/DeNtuHXTlMFbpfOWVB38bPagbjLQcJENLkJfFE+8mdU7bNrrMIlvNE4eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVeSR/G5O05P4nn/UoNyh9Hun9LbkWtGKiMFkhJVQbvlNwPz/j
	/voSu7jZkB5NuAYEHNbaPoVvoeEI9sOB5WuF7uFjo9jlXHW2h3t0PmH/fUPOWKTVAi9pFw0K4O5
	92Es6IGxcBQF9fwqW19zCP1lIBZT6/ik9ym5Un8Fq
X-Gm-Gg: AR+sD10euG0dvNPFdpLjGNHAjxI+KCIrG0Lznh/arOBg+JCVOaeeABVJCInIHBqHOhP
	kBYOeAn31daHNXXfIbAj6jIO8jEF05hPLNCKXaqzdxjAzMOWs+Wn2nQE8S7lVF8zE1RzdIDrZwL
	B/jcSyxSbYIEc1UTqDhUcy+TcQJjoBmtBSn4fiYJp8ijFROdfWnoUtT7t9hMpWeWpy00ULXROZi
	rgo7vDnrZ7fEdAN7y0aiNf1cX+PSlBE08xWaADvMTQtQEJVxQTuZXA0zrhgyo3eLyiSYRJl2BHk
	gtjyjoHyzxOzHUdrvRuNhV4tanElizr0/fH+9/pPJEhmlsc32Xibxl3212A8XU2GXtzIrMLRI6E
	igPkPQint7pr8dBSlsHKu93b8gHIW5hhNITOHKaUGAIZJdu3cmpOoD+QQGQ==
X-Received: by 2002:a05:620a:468e:b0:930:9091:f0ce with SMTP id
 af79cd13be357-9371e302067mr1049789885a.22.1787223443592; Thu, 20 Aug 2026
 03:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815070413.294559-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260815070413.294559-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 20 Aug 2026 12:57:11 +0200
X-Gm-Features: AcwNN1V-lDNNVkCSZufLYHUNnmdNTo3thCvZLBu1IvrTsUJT8e265xO6leh8BHk
Message-ID: <CANn89iJ7hfewnOEjD5SSf_3n3iSQAHN8TPspBCyp_Pvy-ibbYw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: advertise TCP MSS from the configured
 MTU, not the learned PMTU
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 9:04=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> The MSS a host puts in its SYN tells the peer how big a segment it may
> send us. Right now we can shrink it with a PMTU we learned on our own
> send path, which is the wrong direction entirely.
>
> On asymmetric paths this bites - think DSR load balancers, where the
> request side goes through a smaller-MTU overlay. We learn a small PMTU
> going out, then advertise a small MSS, and the peer stays capped for the
> whole connection even though its path back to us is wide. MSS only shows
> up in the SYN and never grows back.
>
> On symmetric paths we lose nothing by dropping it either: the peer runs
> its own PMTU discovery and usually already knows the real path MTU.
>
> So work out the advertised MSS from the configured route or device MTU
> and ignore the learned PMTU. Our send side is unchanged, still clamped by
> tcp_current_mss(). Add ip_dst_mtu_configured()/ip6_dst_mtu_configured()
> and use them from the two default_advmss() paths.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: 164a5e7ad531 ("ipv4: ipv4_default_advmss() should use route mtu")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Eric Dumazet <edumazet@google.com>
