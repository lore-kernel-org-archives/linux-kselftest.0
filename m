Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F2D404BEC
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 15:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538759; cv=none; b=jdZJ1FBkogHyE4qCychguuj5qQnDrxAHjOSHp2w32veyDHEaFHg6z30SZGF6C4IiJwROiLvwF826u3zop2gkcfF0TRAFNQ+Qlc+Zc4bkZISBIIYgH6pm511gp2/D2784aHXK0m2uC2ffTdkN8Go99brAiCCtxZZGLKkU4rGfk3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538759; c=relaxed/simple;
	bh=gVCzstdGdJHforHW4RhCYTTN0c3nLSAJ9c8rWzvGcUU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fBpznImkdg+Mpuvs3/E0ddaPGA7aEtoDDM9WoQw4ZSD/q6uc9jbIkMKocjywmt9G1NZa77QbUD5GH1ReWZqmRkBTY5toXx7SWQs3UeEXC1POWBPpNowSVPmCC015U8xFqFGyuUuQLGqBNLYmi5B9hrSBwp1qgSl4JUPul7Ht8Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHfTa2SK; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHfTa2SK"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e615efd7d7so3441301a34.2
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 08:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538757; x=1782143557; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVCzstdGdJHforHW4RhCYTTN0c3nLSAJ9c8rWzvGcUU=;
        b=cHfTa2SKBJW/DuvPVURpMajouETppdl6WJG0b2biQgyyT9yj58FkG0H2Hvnr9bN6Qj
         3iwNKzisS2/7s4XM3quSi0MldqVmMN4OwqWFwQI677UqZU0oZPA+oChwuTefNrUI1Qe1
         LXq443/4yXO9qpY6+g+GTKdgB3QZxzRUz6yE6sBJ66z9T7R3iu6CFRUKt4gKjc8Dk61T
         ki0ketiUmvWzkQ0ZPBaMdOfG3wZ2EXyBKeO7jXBciuGkJRhtAKbkeEV9vuICYpe8dT/4
         s7JNvUYr+tdhCrlxOF11xVpGTkK7DWyHsFqId9rqXcrMtytk3atT9ir1vgjrVyDxLj57
         xDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538757; x=1782143557;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVCzstdGdJHforHW4RhCYTTN0c3nLSAJ9c8rWzvGcUU=;
        b=VsEFXwrjodDDP2kD8xEJQrAAMZ2a4/dgvEqiF2eTU/0dDrbeoWEb1qQCycCuAjPiFH
         SZjZZ4MzQQJNkehfOV7z2kpHZi2z8uhMUHXo7vsNntDQNJXgucGmhBvrYVTLsaqNhEyl
         Xjrhv60I9sKmC5QdkSwsYFlBYdAD5Ah1QVRr9clNvRg6YT90KmNnCvGCy/dvnfkXJaol
         /LKn92UIjANS1zFW0xAoKxrS59UPXqvwkbKv9UT8o+azmj/LbuILwLQbKA/lnKzSchUt
         Q4iloMipaE4q+jZn2rnUPvooidR/kpd+umRGL2xoog5NHUC3cktaQbgbNCGql6XaL5zR
         Hvlw==
X-Forwarded-Encrypted: i=1; AFNElJ9Vrw1UxPSMJWXEFxML5m29a7fXKFBTUrXNTUqSNrJCUbGtSG+JzgM6Z0YVk7/S4VupOKcgcfMLDnJ55Mdba50=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLbXOvFMMGLFgV9zMht6fpEPu21MB6pQ0LKjTogcbPldP8gMK0
	S6nT6rNNw3CWxP3roIM2DDkO4Ie9zMto4b5vw1nf/RhDG3dtz0bYf3UN
X-Gm-Gg: Acq92OFiLmDQkP4XwgndC27mJbaExjeU7WUpPSBM+xutLeL97t7luyf72hlfuhdaDEq
	UtJ4dGxZZmGfgf80ubUrCHyjlakMWcBIOHnVd/LmqB1QvkIDJE9G9biA7zlHqWGLa/MgyoR+dxr
	U6uF9Ek6J7NdTv9A3pS3eRMGi5sfNlaGRUWs5pITSIuuvadS3lG0XNs2Jw1MROoihvHOLqunfxq
	p6cWf2693nIbrf7U8j2969EqZ3J3qBzfCRT2QZmSRpzboMikgxkR3RJ5M0GEWI7dfp9sPNABMFa
	V2Nmgbv72VW6WIUFdrsD7n+EmrjyOzG0+/kF6uSML86Nx6dwRagGmMerHtAhx+E3KklENtoTHCH
	Jrge+0DHc31/HDE+glniI92K2bA/5Z84nkq7jY0cp5TDgbitLDl48uZQbcfqo9mym/iELkTRGZs
	IyNraQnDSWmflCh6YxUb2n3dXRrDNM+hHV4LOLYZIZYGF2As54ggwWYD5vCilK634kFT47LOIew
	oYpFf+s/Lg7/ugDaA==
X-Received: by 2002:a05:6830:3c0d:b0:7e4:163:49cc with SMTP id 46e09a7af769-7e784660540mr10242231a34.7.1781538756976;
        Mon, 15 Jun 2026 08:52:36 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:54::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f6dfde9sm4374723a34.24.2026.06.15.08.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 08:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 08:52:35 -0700
Message-Id: <DJ9QS5OUJTSG.1DSRYHG6GAG3H@gmail.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "John
 Fastabend" <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf v3 1/2] bpf: Fix packet pointer invalidation for skb
 dynptr writes
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Yiyang Chen" <chenyy23@mails.tsinghua.edu.cn>, <bpf@vger.kernel.org>
X-Mailer: aerc
References: <cover.1781525896.git.chenyy23@mails.tsinghua.edu.cn>
 <cover.1781531784.git.chenyy23@mails.tsinghua.edu.cn>
 <baea5363a0e35d1dc16d41b972d9a9e89cc85b46.1781531784.git.chenyy23@mails.tsinghua.edu.cn>
In-Reply-To: <baea5363a0e35d1dc16d41b972d9a9e89cc85b46.1781531784.git.chenyy23@mails.tsinghua.edu.cn>

On Mon Jun 15, 2026 at 7:14 AM PDT, Yiyang Chen wrote:
> skb-backed dynptr writer kfuncs can mutate packet data, but the verifier
> leaves checked direct packet pointers usable after kfunc calls.
> The bpf_dynptr_write() helper already invalidates packet pointers
> through clear_all_pkt_pointers(). Make skb dynptr writer kfuncs
> follow the same rule.
>
> Keep two verifier predicates for this. CFG analysis runs before register
> states are available, so conservatively mark dynptr writer kfuncs as
> packet-changing for subprogram summaries. The normal verifier path uses
> the checked dynptr argument and invalidates only when the written dynptr
> is, or may be, skb-backed.
>
> Global subprogram dynptr arguments are prepared as unspecialized local
> dynptr pointers, so treat CONST_PTR_TO_DYNPTR local dynptr writer
> destinations as possibly packet-backed. This keeps packet pointer
> invalidation sound both after global subprogram calls and inside global
> subprogram bodies.
>
> Fixes: daec295a7094 ("bpf/helpers: Introduce bpf_dynptr_copy kfunc")
> Fixes: a498ee7576de ("bpf: Implement dynptr copy kfuncs")
> Fixes: 5fc5d8fded57 ("bpf: Add bpf_dynptr_memset() kfunc")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>

nack.
pw-bot: cr
