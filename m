Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7813C81B6
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 11:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733084; cv=none; b=TCNQG7EkFZpVpSUNXz7dgK4nV0/v2lCljJFmLMzR6eqPsQEyqeKsl14UX1xwu7vPQJaUL9+LMl2Ac1D7qLmi3P9txhotjaFxHxNNTruTQRaoGrLfznB7FdN63nkPXeZrsecYKbYjB4kymMCFDA/FACfuhCXYL7JxFH/NEygxtSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733084; c=relaxed/simple;
	bh=hlmaqdyJeKGEvjfmMwcdchUWTlUnrqFhj6hHVaVVdRE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rXhAJKcHEN0996j1dxTmuKxd2bXzDfV332D2wDL9AvCd65Cymswhm/1sjzEBwM/O1Mqox92AOdWjztNm2iq/Jk1ZDTw0VUTRotakSx5xjYc+gMt++IJVznCQz0ycPDCpAk9zIrjvFdbozbD680/+oR4H7VGsO5HOTrQ57ADfzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Gkk611Jv; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Gkk611Jv"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1269e4721aso118564566b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1782733081; x=1783337881; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q4j0J7ecW2SntxG8Jcu8wz/94ArS1e5wO0N1ClDdsWM=;
        b=Gkk611Jv6oFA/Q0Dw+AmY9jQBJXLxe/qb/Ws8V2rB3CJaQVuTRd7Bs82oHrwF1j7My
         xtufsjTZCUIJwm9QeqOBY+mxkvkvyQOuPk8IgiSDA9jsueDcmacO2c58mprdYpsK5dQJ
         pzOz4BMgAlkbUUTDvB1I0zdopvHtgsHsrG0nzSooYV8V/7Hmf9Xg3Pw0HzOCGtE/Lsbx
         kCumAtwPGgG9Hzhgy31vRBITqtLYzY3kfUvJWrIVHylHDamquuoZH95+u8XVi0bLNEb6
         xxhjeeYODQdqqHBk1ro/SMiQozlRyXtsjPARftMeI4m1b6xBjuKgJl7GHSuIkoG93ifJ
         ZFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733081; x=1783337881;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q4j0J7ecW2SntxG8Jcu8wz/94ArS1e5wO0N1ClDdsWM=;
        b=SEs90/rNg+qw17Bi9HPvac0ZyQ6SHGGZ0aBbA0yVbrJlJ6ZfeaTdcxfvF6ntLjNXax
         fIiuz8jPx5alV+tbu72x0cOSfh2rWbC48n8l5cVR7cMADBL773f9fokBZBuBEN42ggSX
         1W319FqywFvhSWIfKA5ARciNQURf6DkV/qGFR1Q9GGtB8Ql72X4m+NCygUN4Ff7XYSR6
         1gPW9+gra8qHikdqLsVVTOfnvTcKQSJO+/lFYEkhVhBWivm369uKB+fVll/6OHetj83I
         OX6mpS0gX3YI3cI4o10rget37LEdM/VWOb5jgaGjgmsDlV6g0l1e0cC8yR9cCEirVhGD
         G1Lw==
X-Forwarded-Encrypted: i=1; AHgh+RrNdOKb/sohz2oL+pMGOEfIh/FSKv9Ul0X0dUWmM9wJKJ0P49bSd40GDGHY0s2Mi/+PjHPZcATdywpgEN9rsns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi5C4VZYpacchetl3j4DjekWZpN7Nx3Vpr1I40DqTIBfLFKc9L
	d99UTxJLIWmX2/PRs/0Aw5lO6Bce3TVfe0bh9cZFLEWiPor3FpSbX/eq8oJDeYh7NrI=
X-Gm-Gg: AfdE7ck3jjq4FpZ6gfBeJ4Qu8WCGFWjOL8qY1Aer3F3o+CVYPdzNJ1uDgyBwx16l/ID
	oVWF0Vm3RFCRYcJRvfeWueYa06zVwC+2y4vjVzqX6+XaM8LgfUTSBiCA7UUjav7x7/jVA0724+8
	2L6wNikHkjzjMCnRgdq4tP//MtjDVOrdLVyD4s8yocj3tI7toXdFk3DF0B3OT2R3pt+sXi3Ew0N
	4B6eejIPbp7KULf4ar8W1Ltt3WCWHscOKfOyTk1KQt3e6vGGp1F+was8ykA1+FYQ+QLhVHpQvLR
	RBVZiHNFJFfstc8qUjlCmQ/ycXycP16o2jPyD42dh1laAXduIrlUTQrwl80BjeudQp4eyTzR6J+
	J2+60Ew4L36/ZKFLrhHQ97jzbaEzLBtFGyX/v3RBYqAdkRONuo8oaeEnbVcavo1iLTvx9sl21Sm
	qSOUEMbom6l4AQZwY=
X-Received: by 2002:a17:906:f5a2:b0:bfe:ed06:5a20 with SMTP id a640c23a62f3a-c12061a4554mr955436766b.53.1782733081465;
        Mon, 29 Jun 2026 04:38:01 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1268fdc5b7sm142329066b.30.2026.06.29.04.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:38:01 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Eric Dumazet <edumazet@google.com>,  Kuniyuki Iwashima
 <kuniyu@google.com>,  Paolo Abeni <pabeni@redhat.com>,  Willem de Bruijn
 <willemb@google.com>,  John Fastabend <john.fastabend@gmail.com>,  Jiayuan
 Chen <jiayuan.chen@linux.dev>,  "David S. Miller" <davem@davemloft.net>,
  Jakub Kicinski <kuba@kernel.org>,  Simon Horman <horms@kernel.org>,
  Alexei Starovoitov <ast@kernel.org>,  Cong Wang
 <cong.wang@bytedance.com>,  Daniel Borkmann <daniel@iogearbox.net>,
  Andrii Nakryiko <andrii@kernel.org>,  Eduard Zingerman
 <eddyz87@gmail.com>,  Kumar Kartikeya Dwivedi <memxor@gmail.com>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong
 Song <yonghong.song@linux.dev>,  Jiri Olsa <jolsa@kernel.org>,  Emil
 Tsalapatis <emil@etsalapatis.com>,  Shuah Khan <shuah@kernel.org>,
  netdev@vger.kernel.org,  bpf@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/4] bpf, sockmap: Reject unhashed UDP sockets on
 sockmap update
In-Reply-To: <20260626-sockmap-lookup-udp-leak-v2-1-7e7e201c951a@rbox.co>
	(Michal Luczaj's message of "Fri, 26 Jun 2026 22:36:29 +0200")
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co>
	<20260626-sockmap-lookup-udp-leak-v2-1-7e7e201c951a@rbox.co>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Mon, 29 Jun 2026 13:38:00 +0200
Message-ID: <87pl1937c7.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 26, 2026 at 10:36 PM +02, Michal Luczaj wrote:
> UDP sockets get SOCK_RCU_FREE set when (auto-)bound. This means
> sk_is_refcounted(unbound) = true, while sk_is_refcounted(bound) = false.
>
> Because sockmap accepts unbound UDP sockets, a BPF program can increment a
> socket's refcount via lookup. If the socket is subsequently bound, the
> transition from unbound to bound causes bpf_sk_release() to skip the
> decrement of the refcount, causing a memory leak.
>
> unreferenced object 0xffff88810bc2eb40 (size 1984):
>   comm "test_progs", pid 2451, jiffies 4295320596
>   hex dump (first 32 bytes):
>     7f 00 00 01 7f 00 00 01 d2 04 1b b7 04 d2 00 00  ................
>     02 00 01 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
>   backtrace (crc bdee079d):
>     kmem_cache_alloc_noprof+0x557/0x660
>     sk_prot_alloc+0x69/0x240
>     sk_alloc+0x30/0x460
>     inet_create+0x2ce/0xf80
>     __sock_create+0x25b/0x5c0
>     __sys_socket+0x119/0x1d0
>     __x64_sys_socket+0x72/0xd0
>     do_syscall_64+0xa1/0x5f0
>     entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Instead of special-casing for refcounted sockets, reject unhashed UDP
> sockets during sockmap updates, as there is no benefit to supporting those.
> This effectively reverts the commit under Fixes, with two exceptions:
>
> 1. sock_map_sk_state_allowed() maintains a fall-through `return true`.
> 2. In the spirit of commit b8b8315e39ff ("bpf, sockmap: Remove unhash
>    handler for BPF sockmap usage"), the proto::unhash BPF handler is not
>    reintroduced.
>
> Historical note: this issue is related to commit 67312adc96b5 ("bpf: reject
> unhashed sockets in bpf_sk_assign").
>
> Fixes: 0c48eefae712 ("sock_map: Lift socket state restriction for datagram sockets")
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
