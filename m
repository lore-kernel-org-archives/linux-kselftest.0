Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B193E5A2F
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137256; cv=pass; b=qt2jTOcfbO7+nBJc1ARbAOamXS7fKORi+nVAfRobofMQHzi06eYs5YKOhL15YzLvRyACI2fHjQxidPgsdvaHsco3Qy91cYWS6OLKIdToF6SUdUdy7LD8Wm+LQmnylsfyIb5AtjgAb3H5nDrLtahCtmtfFqi/zULvufJEVE0lWdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137256; c=relaxed/simple;
	bh=KLwhpQm2UjBGZ/IU6JuN7xThtHaXDHsHEC+uZW/NhEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tj40rJUiDMWe9tmi9erhbzQ7b7DLmnd2O3l1V9d63XsAonbas/9GgFOI3VBt5+jPMSPeQ3VbrYUQwbzkWYMvhIFz3rhhOkfuibDUcbX2LFwDB/E9wEU8VMJq5JMNy3qber5Ux/BhtkqGa6wbcGbHT4NzKeucBBLdRMeOFISBaM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=weOufLrx; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="weOufLrx"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-170135e43c7so3557926c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 00:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137254; cv=none;
        d=google.com; s=arc-20260327;
        b=HvoTW4yAiH8OSg5A3KrHdkbtq8vH+4L7PjMjA4/B4pdyOkpKKTG+GJ+NwX/a3BgBoM
         0yqOJGSchOaaTNL+1d9e91h2OHbXxyYmjPtGetlHxB/wHn1vL2zzpZZ+oqJLkZd93Fmi
         YUDWFvO/IipnhVGduhIm+ho8yxb8LWmAAKTuYAlt0h+bTusXDnPTlidMilPNleOW6Mok
         A6idG5HW+YrFRKPv/2TMDyiu+ahpXCpEAM8rHXBEz9K45D3KAI4tD+qJYtU0xeyHTVtS
         dvRvMOlnVIeNDpzz69QQ3OEJAP80YmfdMEyq2+eKemjRsXWp2UvAc2qy0xrRKrd4VhGW
         2xsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KLwhpQm2UjBGZ/IU6JuN7xThtHaXDHsHEC+uZW/NhEQ=;
        fh=NLd0JCN3i+/PL3ZDtErj8lk6y2MEJiUlMMvY32Qnx6k=;
        b=EN/F4TMrhzhSD6DHLDK7KwS7OBx2t/tqJBzpBPxryRo7Mb73MfAEWVdEFO4qYzfGmH
         vFeoFHCkJGfYe2tWQ+CNCNuzlgkZy8jrCoGiL9o3dfEzUORNzEKLTLBHUrMX3+ZvZ9Nt
         YhbN35Jc2O741GHx+rbtVDWboflGr4egetBI78/cStkEFLinjEGPIGdCXj3xUKpezL4P
         so5WC6Z7CXCRNIQTg5uHSSxTUmkug/puZnqsNWiN4I7ydNXOXfKLUxmYm6MYMAiGvpIx
         GMn6aTAWLsUf6wap6oNMVtyha5QkBfM2krbl3Kc2X8eCnHfrQpQLVoCOwPOEdHPGuaqt
         +bOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792137254; x=1792742054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KLwhpQm2UjBGZ/IU6JuN7xThtHaXDHsHEC+uZW/NhEQ=;
        b=weOufLrxmXvntHLb6aF9ExyGYiZIKUoo/wDEnuwclKkgTxCAGctFjtSmJnXOS72Ofc
         qZqnR3IbGTjlvL1FnptfQqgOTN973+u6UXJ9zdgnALbBjg+uqkQchzrbOV1dhocS0hyw
         uiDYJcSljRap9nMVOV5hEPLDefUO5KIt3eR9xoSTS4xCWPojXifLN/F9ofzDC2QVyN7z
         b4i3UOnks6IZa2Y6GpdDRL2zfzDgNh/Pv5KxZtkIg/UtnekGCrc7bAyUUzXwD35Vy/6H
         oQ9cWw9bFOC23EeU/454+2xR2JmYSlRXkTiZnln9xaq5kMlVMLIHdzcfhxxcE886xcE9
         P+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137254; x=1792742054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLwhpQm2UjBGZ/IU6JuN7xThtHaXDHsHEC+uZW/NhEQ=;
        b=B9yWePaCysC6Ppf0asWTeQLWhCx07qT7hMI3Xr2glfNF+MbdS+cE8/LPXV1Sq95V7+
         9SzNiyxuQLyB1+02FW33YnhwB/OXhAc+Iwr2ya73bQdIiYYY89SF0G8hw8nWO3NBLAkn
         Io1ZuXoRu11VoMXPAYfwL3yBJbe0R829H8fE/Grp/x6V1RQ9S+Og5n3XQKTY1S4y7cPt
         4851AQFF/gxy00g8pSDIJXzx2hiUY58BPCH7u1aTyVteeNSJy+plBl02o7dJj4xl6e5z
         mLievV/POK4Q6h63PZumPwRnOGjaORsslp1dEjZlaLkxSDH+s46vAtqv7Mwi4/MNOPiS
         nJEg==
X-Forwarded-Encrypted: i=1; AKwUvBxJTBubyYdl1DbKSTeAPj5IYD/DpihB/03fmPtcmNuRX5vEB+PVgAbLFi9wpVe2dlKNLkIFWmQv+/cJ1rsSJfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrnr3/JAThaHGoAewNyTIcrAgvrNg3hyMq+zXtAF3PZTMlWraL
	OiuCUmewW7V7hOOcIHrDFz1vjg7IqCIaA//0SrAiczpYPRik5BElHlxaJK9VY9ohU9S5W6QUMjK
	3rimFXLe+I/Ot3UWeUt0paEh5gT9VDBjMRCl2lN54
X-Gm-Gg: AYBFou2RfTAN9Ha7YR8AnmKirQxl7dHIiK96FmIx/IN0UwVmjgU+PMn1XwO0Scst249
	yyG/z2GaWEIIwLYiHCQCFRHYSvuv7ppSBvx3Q110hfxltf+PB+BHYBCAGMmtmQZlDY6/a9Hb9NM
	YSVXxZc6cj4zWypalJ97FyGyHbc8U5+WUW2hG0LL6IR77ZFuQLc6NtfX1k6FNqA4sgm1fyysMLG
	z2NTrcAnIBFZWqIlSVwJ0rI4aBlvBkBPqtcgXDIYjUEbBbUt0RKYJGQfUtKfv8ed6dTTyS6PSzW
	R15C2vHjoGTXaCSo0hIg/CqKHgzEZU3/XYdTAKVifxgn7H0KV7bMqbLbS5fJMyDf0Vd3Vdp6vn7
	hI3hQZsrrMLs3pBiul2MBayZ7Lxbr5JS1f3wGzpHZ+M/R4gNrPvdMZ73wXYbjlZw3pDo=
X-Received: by 2002:a05:7022:ea86:b0:153:7a27:b7d with SMTP id
 a92af1059eb24-16a626f6e93mr26850863c88.20.1792137253208; Fri, 16 Oct 2026
 00:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <20261015073736.2944215-3-tavip@google.com>
In-Reply-To: <20261015073736.2944215-3-tavip@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 16 Oct 2026 00:54:01 -0700
X-Gm-Features: AclHuK-X0MEqM-qiZR_C1C8OlSnnVfLtG_uH9dpCSScAmzQL4uL378qfzqDiPp8
Message-ID: <CAAVpQUCpFC-7J=uEgBfh37hFb5BCJvhJQZx7_YKEDCtvbGrGWw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
To: Octavian Purdila <tavip@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:37=E2=80=AFAM Octavian Purdila <tavip@google.com=
> wrote:
>
> Add a packetdrill test that drives sk->sk_forward_alloc negative via
> tcp_collapse() on the receive queue while sk->sk_wmem_queued exceeds
> sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking write()
> under TCP memory pressure fails with EAGAIN rather than returning a
> negative copy length from tcp_wmem_schedule() and failing with EFAULT.
>
> Assisted-by: LLM
> Signed-off-by: Octavian Purdila <tavip@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks !
