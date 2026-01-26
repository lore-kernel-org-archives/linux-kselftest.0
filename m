Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00A733123C
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Jan 2026 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769424786; cv=none; b=u2gr9cwo/7uPfsg61emQYwAajdo9eU/nIzMwZEW/9QiS+Ec5tNLfM5pBZRQ/4+kE3CfQrBAAhkmd41I/BCKY7kwjytA0TN8xQ9caMvawdRAyYRF3KZrmF9/Kfc3Cw/boreuZs8UwIXBD6R8/Xk0P70tqI4rXGTlnf4OnuXaZJxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769424786; c=relaxed/simple;
	bh=wi91apMevgorcUoNdYgJdCJWvTz1n03aU7FKUWmZnAI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hms4YFFeGyZ5m79AOQdj/pS8vLwaLlJBJq95O2oYi+/QjLULrnXHXmYHU3+7CB4eQMLNSzrU0DbfV8rbfE8kwp3ekNS89yVDdenXuEZeftrWb7l14aiKhUIFa+eAfmlekM75s8fn7KMBE8WAoP22fRV/FmUIX1n+ENyJrcsCJkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=LMLl0CdU; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="LMLl0CdU"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b87677a8abeso668110466b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Jan 2026 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1769424783; x=1770029583; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7HQyMiysYGwMm5ScyZuRYthPeCj1mNuauMhUi+x7J5g=;
        b=LMLl0CdUhJ43KTJp9v0VbiAarCY6oEIqZZ7jGGOZTBcXw1st3dVaauwSKXKrr2EdBn
         9SdDC3EkaSzdIi7/Y+mfMU2R9jxZmt03ate7/fn+rzq8L1RQvXDyzgSYFQb6UTQ6n3ZV
         LUsWxBW6OUNaWfKDqUs5h3JIXbNM7ppsb23vDL9snkCsnYZdknYPcvOzUtWKp2DQM7lL
         gpdwUN/cku23XlvwSiUZVCL/0mzYzKEBwgLQQUKeCg2fqPUa7gbJFwAm1pWrdbRmS47I
         jQDNbiX/DxZa4b2DlysJl6cpVdDnRLWEXiDFf3Y2DUjQc830fM7w8AnFxGOHK0jxsHlU
         Cm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424783; x=1770029583;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HQyMiysYGwMm5ScyZuRYthPeCj1mNuauMhUi+x7J5g=;
        b=dpIJ3f24sp4WjUfyWDmYoDLKPLSTxYQQeDRzknV1EWnpR52ena/lyOUouyY+8tRzUD
         7XhS/hDQyY9VCZkV6sOc7MFA2CA7cngXprKXx8DadPy9k6TSlUaI5dDFQO4o1xmoUu/F
         l1SsuTZPPr313CVrLUWu7GCLv5/ET+nt0wPNdOvPfIb2P4PlYHM/q9FbpzYnDPu6IUP7
         X70I5RoQX9bvtuZrRWEuyZDsCJ0Yj2xQFatI431wntJPLAeoiImt2xLjmO9IZxBuTfmL
         A02Gjf6K1CLIGj66jRXrxC33K1lZUV62dCwTSv/BKldfrOBSgAZ1bNTBcln+FuMI4pLH
         HsJg==
X-Forwarded-Encrypted: i=1; AJvYcCVa9eJbza1f84H+aoTg5xurUOUNaMEaN6Lch4guwoJfC7pYGflYU+YuxXuwYaXlMg5eOqyiYF0tqs+DV+tPRBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWncQ8dM4Fa3WPVWbOrkV1smtPwZSaDFM2npsJXyKx/vEM28W
	5wK2zuKoeo4UK+FtkyhVWQ4n+0JKfmayUqkXwUTLdUS27P6awbXdLtJV+6ZRJIq2N0Q=
X-Gm-Gg: AZuq6aJcUfmX2lT4J70KJlBDi+hRcZbx180b8UvxiZUCLe14y7xa0X9VMN4I0gvKO8M
	VWmt/sIONWCpj3wx+XrNyEPxeLjlseOP/A5qqvo4VCaetMFRS4i0/YMtNv+L+hDllcjMpB/XroA
	qX/HgjyroQcofZC5stCNreelkrRXQo7FOwG1c2iuYDcPq4f1iy6D0F6cPL0RcB0qJWP+Qe4m6S4
	/BbHRGzxVfto5UCW/sH7hlsFdLLnr/EIgTjzDKNYFpj2bZ0pawAIbTBjzroJ84VlPsj+DZs8n6P
	/+X8esgoOoF/OguT5JGcbGO0PIGEpY8nQtBCyu4i1yoXTKf5y4Zv0nTOG4MGQsiXTS0rBqTqrCv
	AAhtarOtm5AC7dHw1iZDKaZyJl2fvKnkDEcJXvV2WuTda+1comCtZNt1Y1G8gtjgJb9LjfMGieP
	+ywts=
X-Received: by 2002:a17:907:3cc2:b0:b86:f194:9eec with SMTP id a640c23a62f3a-b8d20b4f26emr305487166b.18.1769424782815;
        Mon, 26 Jan 2026 02:53:02 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:5063:2432::39b:b1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b6ff080sm587357766b.38.2026.01.26.02.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:53:02 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org,  John Fastabend <john.fastabend@gmail.com>,  "David
 S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,
  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,
  Simon Horman <horms@kernel.org>,  Neal Cardwell <ncardwell@google.com>,
  Kuniyuki Iwashima <kuniyu@google.com>,  David Ahern <dsahern@kernel.org>,
  Andrii Nakryiko <andrii@kernel.org>,  Eduard Zingerman
 <eddyz87@gmail.com>,  Alexei Starovoitov <ast@kernel.org>,  Daniel
 Borkmann <daniel@iogearbox.net>,  Martin KaFai Lau <martin.lau@linux.dev>,
  Song Liu <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,  KP
 Singh <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao
 Luo <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Michal Luczaj <mhal@rbox.co>,  Cong Wang
 <cong.wang@bytedance.com>,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v9 2/3] bpf, sockmap: Fix FIONREAD for sockmap
In-Reply-To: <20260124113314.113584-3-jiayuan.chen@linux.dev> (Jiayuan Chen's
	message of "Sat, 24 Jan 2026 19:32:44 +0800")
References: <20260124113314.113584-1-jiayuan.chen@linux.dev>
	<20260124113314.113584-3-jiayuan.chen@linux.dev>
Date: Mon, 26 Jan 2026 11:53:01 +0100
Message-ID: <87zf60sl0y.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jan 24, 2026 at 07:32 PM +08, Jiayuan Chen wrote:
> A socket using sockmap has its own independent receive queue: ingress_msg.
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
> Previous work by John Fastabend made some efforts towards FIONREAD support:
> commit e5c6de5fa025 ("bpf, sockmap: Incorrectly handling copied_seq")
> Although the current patch is based on the previous work by John Fastabend,
> it is acceptable for our Fixes tag to point to the same commit.
>
>                                                       FD1:read()
>                                                       --  FD1->copied_seq++
>                                                           |  [read data]
>                                                           |
>                                    [enqueue data]         v
>                   [sockmap]     -> ingress to self ->  ingress_msg queue
> FD1 native stack  ------>                                 ^
> -- FD1->rcv_nxt++               -> redirect to other      | [enqueue data]
>                                        |                  |
>                                        |             ingress to FD1
>                                        v                  ^
>                                       ...                 |  [sockmap]
>                                                      FD2 native stack
>
> Fixes: 04919bed948dc ("tcp: Introduce tcp_read_skb()")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---

Thanks, Jiayuan!

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
