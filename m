Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B63806A6
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196816; cv=none; b=brMcqvXZExAoeaDLHBOSVKgmbHKddc06ZKCtiQqA6bWSlIO5mFg7xbPeiag2avxne35dBBvURtBBcEU45Qter5aG3yLiWEPFeelAX7nM9UHmtAM0EhGGu1VQPJLzsYdFjWjNNeaapbK5MBP70uWz7ULkzuXExC7XIFvN6rElfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196816; c=relaxed/simple;
	bh=uwl27xER1N3ExBcQz8DVI3o7oLFjRiI18UHcNqtO6cw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VnMf2VaFnsShiCFLHseWkXgOeLV+YWtlWcjiLv5m7nKAAd1AUxLwv86uaju4cQLI8Nr7ngC55D+IrCBcm6+FobRt4UWJMrC88TkfbOkHrtfcytWKjxVzxm/FcY0/GokYnTPdDNeELT/Z4P8+JKy8+wO+7sDdqo6Q4+4GucfYuQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKQVYimn; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKQVYimn"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e71b2d527dso36743a34.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781196814; x=1781801614; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIeyQioPSS+ypmU64tqp46eHDd1B4WTlu7Q2LysWAls=;
        b=LKQVYimnENtgP6ahsni+MYrsF4pXC8Deu15pJhfJAXmSzejHALx7VNjhUdQ3r/zPt3
         ZOH1niUkf/OiFf0JPuXSdwRLnUqAHTVri8f78KDewjXBXvhuwd878nEP8x8K6f1bO5n0
         7dyDVNA0Y73Peia0vF5lXG+xoQYkL2QYbpKtvx3fsbjeerPjb37qNA9+J2l8R1vAEqny
         mjfTsof+R0DGVNmGKRBWjseM4D75V2PdQ4XYtxBv+vtcqMFdvlort4votJxas0ojomNc
         PeFTkq56vT2lnQWYRKmnC5oFp7hKNt1BCAhgZgqC6EJDVNv7fUyd+QcKSFujVUOe/rwy
         UUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781196814; x=1781801614;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UIeyQioPSS+ypmU64tqp46eHDd1B4WTlu7Q2LysWAls=;
        b=Clf+xhiSgakpkgCUxKJSXBhkmWgcD/0gQEskTWSqMWCr2mF+6AJouS+CrwChlosJ59
         Z1iJ0E2qJxdNSrYtVrbc0MXm+dK6vHjMYf5e34zsAvgMG3M+Wl5VC0vWJ5oJwuuutuLF
         mlhMCtwU+AdDhGNWPp8ZcOvJVIwPf8TAVcDTVwiQCf6jm3quH5UGIO+kQ6rzvzMwdoeQ
         VO7ytwLDNEdKK5+fimmK7VhQPsKqcknc9TmW/4pzKSOaPzwIP2zAK1FVfM53g9YpzFHp
         IFFWb04F+7+jylRNu+vHPvu4LF7fcWhlKVe+Wc6h2LpQ4Rf3g3x8U6Croc92CZv2sM9S
         Rjwg==
X-Forwarded-Encrypted: i=1; AFNElJ/RXo9nJ0JU/EA8ehdR6DUbklejMlZ+Zwef1VbUN1VqsPGrgz0Yusf+I7dAQ1UXqMBvGieszCGOntkG5OG8QTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9bn8oQ62R8ahij4lZouRwfNHWYFF058zVML+7rJOVWeOzd8Jm
	JGBhgAuhbKWuK/gT5qYwhQVY+QFcRpI3YQOUnYVlrAExUO51AaAnlhQs
X-Gm-Gg: Acq92OG+xOb4TFnn/89/Ef0pT3qEopGoZiB0fNs37wIXpdzQ5AoZUG2Th/uVZ7rIfe2
	ZVLw72k0eoev2ykO2NzccNoG8Xuh4vUFI//iqJAOe4jvblW7q0NUHd+3ehqLB3UxbAXQ93aKOGH
	2RAtV/7mQRDDV6nLAdzxjXi47/gB4ew+ANzMyBnkqcO/QdfG30Mcuo29i8g8cVHpEMtFcHkijgH
	sLWZoohdWoytNQJp6Q8XgGO7dKMQdcE4hzwSpoYG2suqaOruAl14h4B0DxTiXAoNMKaZSVT/cZl
	QCELRN5Z72Xhi7vwABIpEPygiOJLlAdoq1V1ith2HAonodhDon0XPyltvG6jeJu6UiKC3ld34mH
	61odXUOVN76RDjZTmQYzawI4aJtENJptPepGBfp2Jc0PVtQ+dzzJDViZxbehHu8KAqhnaeQ3bmJ
	TKmLOauY6aEG/iuhaSEH7PTItpoIzCtae5qCUFP0nctpW7t3kKP7i7+3XSrOOio7MBpsKhR1Hkx
	AjJnsC8ds0bvKLtZw==
X-Received: by 2002:a05:6830:640d:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-7e7731bef18mr2745759a34.0.1781196814289;
        Thu, 11 Jun 2026 09:53:34 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:15::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e774812262sm1656901a34.0.2026.06.11.09.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 09:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 09:53:31 -0700
Message-Id: <DJ6DKMNBR4UX.27HEZMGEPEF7T@gmail.com>
Cc: "Weiming Shi" <bestswngs@gmail.com>, "Xiang Mei" <xmei5@asu.edu>, "Xinyu
 Ma" <mmmxny@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "John
 Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "Shuah Khan" <shuah@kernel.org>, "Jesper Dangaard
 Brouer" <hawk@kernel.org>, "Sechang Lim" <rhkrqnwk98@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Cong Wang" <cong.wang@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf v2 1/7] bpf, sockmap: reject overflowing copy + len
 in bpf_msg_push_data()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc
References: <20260611123538.156005-1-jiayuan.chen@linux.dev>
 <20260611123538.156005-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260611123538.156005-2-jiayuan.chen@linux.dev>

On Thu Jun 11, 2026 at 5:34 AM PDT, Jiayuan Chen wrote:
> From: Weiming Shi <bestswngs@gmail.com>
>
> When the scatterlist ring is full or nearly full, bpf_msg_push_data()
> enters a copy fallback path and computes copy + len for the page
> allocation size. Since len comes from BPF with arg3_type =3D ARG_ANYTHING
> and both are u32, a crafted len can wrap the sum to a small value,
> causing an undersized allocation followed by an out-of-bounds memcpy.
>
>  BUG: unable to handle page fault for address: ffffed104089a402
>  Oops: Oops: 0000 [#1] SMP KASAN NOPTI
>  Call Trace:
>   __asan_memcpy (mm/kasan/shadow.c:105)
>   bpf_msg_push_data (net/core/filter.c:2852 net/core/filter.c:2788)
>   bpf_prog_9ed8b5711920a7d7+0x2e/0x36
>   sk_psock_msg_verdict (net/core/skmsg.c:934)
>   tcp_bpf_sendmsg (net/ipv4/tcp_bpf.c:421 net/ipv4/tcp_bpf.c:584)
>   __sys_sendto (net/socket.c:2206)
>   do_syscall_64 (arch/x86/entry/syscall_64.c:94)
>   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
>
> Add an overflow check before the allocation.
>
> Link: https://lore.kernel.org/all/20260424155913.A19FDC19425@smtp.kernel.=
org
> Fixes: 6fff607e2f14 ("bpf: sk_msg program helper bpf_msg_push_data")
> Tested-by: Xiang Mei <xmei5@asu.edu>
> Tested-by: Xinyu Ma <mmmxny@gmail.com>
> Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>

That's not the right way to post somebody else patches.
You need to keep their authorship and SOB (as you did),
but you also need to add your SOB after theirs.

also pls target bpf-next.

pw-bot: cr
