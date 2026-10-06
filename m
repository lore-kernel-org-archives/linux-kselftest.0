Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC43A3563F6
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 17:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308933; cv=pass; b=uBhXplPukFb5751yI+px0K4Xx/Z6KfZcMQtyb4d7JvIGfNwtcpYD9rx8cv8b0WU1SHpjluLAB0/9AQJMHpCEg/fM7+lE0twQbGenFWXsso9FbFB9GKegmMkyeeyuibe4vSv69G9kOZXdRavwf3DqxhyNZ6IPuh932p9JhvSCE1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308933; c=relaxed/simple;
	bh=VRSArwJcRo79n9/mlWVHLIcO/a90TTkXWTwHqj889k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=li+U2Pr838aX+pkwYR+PH4PaxMmTLa8qyIApn1qAfYtHAlBWPRIhpnc+u7IYWhJRrQyz327LR/ZIkf4UHZM8rD5j38hqM3NK96uy5BpgWqoTRPqMpd4Sy9D8k2f26y8D1YIZNuQWgXdZ5lDuMCwyL22ouYh9W9ZsjNkLAs9x0bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=DzuzpwTr; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="DzuzpwTr"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4d7034a99a9so1761523b6e.3
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 10:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791308930; cv=none;
        d=google.com; s=arc-20260327;
        b=RSAFUrkxYVl5F9Zb3Tk/kQwT3i7zuJqm2OY+hNKKDa7LsLgJjMytD9fxoBDr1WarEf
         L0ynC45VCxoxiC1JAX8Z8Xw+Rrji+8YUHkKBm2pvzpv9Sr8o52MHuALxblBa+dFQeVNf
         I1fbWkJFZ6US2HoA1gMmlnFewnMMxNZEijz2VecVFq7d0zMoz/O1wDSt1427cJRuGr1u
         Zm8W5Su50hrH+nFKtJEBVvxWNncZWO2t0khLWn/9bCqXABOyVYxVaA3iOvaNpeeAMob8
         rFch5FgJ4lKtqIfL4Qln3kBx2n6sb0cIpsWCaWRBDx6PY98ecnMxYkiPU+uaRONsdT1V
         9Z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oKkGu4MISHQEsFFjUyIjKXrjUrAiNT5vrF+iXMX4HX0=;
        fh=fbMmsSVlzMCO1fv9DS4yUgJD3pq91xfwCpAn9im/53c=;
        b=jHsY6h2Pz7kw1rzTzvxNUiVZ6463n08bocbk0HHRsKsQK2LsHyY07q9LE77zmgGcaG
         6Ren5f9fiuGkUo4QY3Dy9YSar29HamQL7Bygf+zUGGBzfLi5WtWbVwc2C+8UKpNRJyHr
         aPcJ4/EjjahGJjBqX9xJH12CKyBDT7kqdl8Gm4jWMWnjdEv/nStvK/RMKx3AhcFfjmNp
         ubsuO+ifclz0hTEo8w3iyUVcOu481qR+RDmVAHjAC7BEJ1ZBRrY260THYYFxn6HV+0Lq
         URRQVfo5rl0xxaJNg55quakh566ovH+DM6xP7091UWLUfNIRhszYnuwYtCMLq74ucpgr
         0vuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1791308930; x=1791913730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKkGu4MISHQEsFFjUyIjKXrjUrAiNT5vrF+iXMX4HX0=;
        b=DzuzpwTrkKtcDnXxD0hn6+9TImm7VEOD/gPZJMllMEnmoAuwr3+WcTob2Gj1ovdhZL
         eqQSSWC4WpNbmKOjz24kYhbFtsNbDp32zvh/xmzYySlovLdpd+rXQb+4d7z2f5DjXFKT
         bxEvC+MjpsQgZj3dmWAwy9WD/Q3Fp80YQ0A3vYXYVsY1aUJ94fiexwxEpOq8SFHX1h+h
         12ZxVGmwdAdfxYorAXNo4fHNKJfr0E2lmk3m82/4bkunhEYRaqHvEIzWftroYAsh0ecg
         qnXhnvrF4RZ9s4iQMmZDeo32fxyCASjScRVd1sYnpQ+Y8o5g6xmvsmwetNMKYr2qyW2G
         r+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791308930; x=1791913730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKkGu4MISHQEsFFjUyIjKXrjUrAiNT5vrF+iXMX4HX0=;
        b=YAk62IdJJKMUFBTmnjowTAhqVvQpd6FmKo20i5MlmxyjKR0SypMbpVYHzNihjN9yiF
         EEVyTsggh5w7OK+VR83eVOIELWcGtA0tOI6AfJAYcj2iMfhaoeG12/LFtmClHNvMlb1g
         QiEEdUwodM5rbhh7LPVR/gSGYmnsVSS8CJJ6Ui3mOVrFsrpWtma7EBn6j2CSZA2POZO7
         6opv4wDekDCG6+k10/Hu7yJWcQ0rDlIUoblRDx0FXYR1EwpMWR9wJiTEQ+q7qWwEctFH
         ZvFulGaSDfp7+7zjjz1+/FYJyhlN4WWKrd6bFnmC4c0s7mhDayppDqYW+A2vLoNml48H
         6a2w==
X-Forwarded-Encrypted: i=1; AKwUvBxSrvceO4UAsba0vTeN4fPLalXR/iwucbCFSpyeLlhVlcJzHIlavP8EORuw1hzhejz6dzDNq6cA95mGisdPoIM=@vger.kernel.org
X-Gm-Message-State: AFuF++nQWr+bkyBqxsBSPbAqAzZCNQrzH5f4EGAxf1BLnHIfO5yh+ESZ
	i7NGaaqH7em6IPBGZLTZJpw68f4N73ngUVQxY7g85P04fmUvbw7c1ysVb5taXdj38QyNhC1KFyO
	vgVo8Ej4wS1GzSZBR9gMo/In/KWeveomFD0RbF+HX1A==
X-Gm-Gg: AYBFou0GDqaqDm+qPjiTK+HOfqHk1XQaBow0VXabqk/T3qXyM3PL3+sZ0PJIb8yyC/0
	FMaF2j+TGjHxmv58MNj8fR8RPrLbRnBwCjxbAtkvHRfUaP6ZLjv7npjTwXPTV9a8BJxvJ7fflvi
	WLjKwbsGYhNfY8Xp9MMXDMuTJ9XshpQIkiporgchcNJ9OopjnrvWxlzHkSBWuwVqwxDpZRpCTYK
	7MFyd2Jw84EcsfvDEf8Ly/v9s0S8ZVgeCs8Nt16lD1HJG7HlGbtlrvhG6va4NZ5BKSG1sq0eXzX
	flBJ8b27ptIC/2c1J5iCaDSsvB1BPBep97seTlbUAhDYIjN1kl5OQUtGkqS7XyGnssvqRYrmDkw
	E1WlIMPBb2w==
X-Received: by 2002:a05:6808:e305:10b0:4f6:a504:1897 with SMTP id
 5614622812f47-4f6a5042d3fmr7722009b6e.13.1791308930476; Tue, 06 Oct 2026
 10:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006173241.65945-1-tianyi@cloudflare.com> <179130839329.2231598.14859340679278349582@kernel.org>
In-Reply-To: <179130839329.2231598.14859340679278349582@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Tue, 6 Oct 2026 18:48:38 +0100
X-Gm-Features: AclHuK8tusQKzC0_fjG45JZf9NjrVrFoAQ9mJo_jQw5ddNkxc7dATehHk_JKOlk
Message-ID: <CAG4wq-eXM-mbZ=WOzL_M3u=yYm2YMoxshCJPjDqT2GB3FL0AbQ@mail.gmail.com>
Subject: Re: [PATCH net 0/2] veth: fix peer NETDEV_XDP_ACT_NDO_XMIT after GRO
 is toggled while down
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, toke@redhat.com, 
	lorenzo@kernel.org, horms@kernel.org, bpf@vger.kernel.org, shuah@kernel.org, 
	hawk@kernel.org, kernel-team@cloudflare.com, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, sdf@fomichev.me, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I was testing XDP redirect from a physical NIC into a
veth whose peer is in another network namespace, and found that the
redirect worked or not depending on the order of enabling GRO on the
peer and bringing the peer up.

Cheers,
Tianyi

On Tue, Oct 6, 2026 at 6:39=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
