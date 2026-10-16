Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B30364052
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 07:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136557; cv=pass; b=Jm91d0TOw0Nmw750QZvSI7SJCRhm3IM+nv63E4EDrghCehd+I9Ff2mVC3tR4FSh35+abVzmR9Zzh8SmY/2S+nbrfjIulqZnn0PFN7sB0Dy/gBwTIktfrvW1n2j+24szPWoMAMjFreX94ljVTt3KBCpDzaGV1GlfIYaFDTCy/4jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136557; c=relaxed/simple;
	bh=VX0h5Bm2UY47Tt2z8myprdx9WcuYmLn5gM77krDjH6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWf7rNWXHjfs1/EJ1kUgDAe3BqiznOdzmQEZU42tyCJhh9e+FmTKArJaP3Q9mmPuL+ZEeiV58PFmxNQ+lbzw19v+fkICQAk1OKprAT1BO4Fno5YReX8+nH2m82jAH8MjKogK1y8bHrCQDEwc43t6sIe/e49IyTZkHg+02CDkXEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QBzDCDG3; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QBzDCDG3"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15354aa70e8so2271241c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 00:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792136555; cv=none;
        d=google.com; s=arc-20260327;
        b=hpkkdplqwu5GOiJTJYutioNki1Y+Is8JmOEYqEvd6hUlnLUfSz0LMB52iz9qqTFXB2
         uG4RwRPzZ3VcdTHFtO+4UUhXWNlQNcbI5hXRChWzkLk277XEGOyS+3DCTGgZgoatZmV7
         SP5m6y2GtMu9rpf3YlUDJajnLdGcmY8JKGOS4nH6qm8wBACwtXTVow9h6h9tf8beYkYh
         6G4u4e9jYC/eNyZw8DhrtxBsgrBVuyLh1/S1UNGLeDVwBHQq6xGZv71uVBMVILCTSh52
         iCwXB/G89qPyqgWyfywUs0AtdTn9fWqVXJUGEYqQD8KR8kyMo7998LBgUUeiAmgUzyh+
         9y2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VX0h5Bm2UY47Tt2z8myprdx9WcuYmLn5gM77krDjH6A=;
        fh=Jq5lX5CuHSPG5SYKQn9/31UF0WvBhho0alacJI+9o1Q=;
        b=pTbuVPIbbxGSbRxyio0KjkG7rhLstoAWh2/KjY2sHPuCT3YHk8kN3e5qLMv+z626Is
         b87BLosH4ncSbUncLLyWr07utW5GUoSxkJN8f3IHgO55fyDW3gchS81bhbw9jdONYLI4
         CgP+75IylT95+iKaIQgdIPt8UPVAS4Tq4TURwm8CSqxjLLrBYZFOKzy2ps16Cu5YakNu
         XN7y5MacRpQCVuRqTpugbKhUnLtq4fbh8j8HjC69DpPpjC2qK1DqErlHZe5OraGwcGmA
         rUHNa1Aq5xUP/O1r/et0/nQiKvAkpkRiol7+8BenIV1PPnIzkNCDhznJtamP1mz9pAU8
         WLgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792136555; x=1792741355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VX0h5Bm2UY47Tt2z8myprdx9WcuYmLn5gM77krDjH6A=;
        b=QBzDCDG3El9nnvMxpifvH7SBsJiKvYtDrWLShE+su9ih/U+GvGYJ+S6yM+rptayoy9
         C6VzxcQWUCXQldIxfKhu8Xz557igSOD0OJ2A1ZI5yC7/EM1Q2QqeArj+lPCxPER25QOd
         Ux7gvSCopIgoY5BGcUZnFu0KOcOtY+rbSbiJ+SSnq6Vqk5yDY48zrTlExQOkczy+MHze
         IL8VKzhG1nC0UcakoQdsX9PqXVQk+NnNiQ0wrggR3dYTh1RVnt/5mGW+GuO7saQOloED
         /56lrDh+jz78wWtH29orfm3Kziwd7axNYuD8hGZtUk05nrrArxzTTYEcwyyZ8DAmWVW9
         PDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136555; x=1792741355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VX0h5Bm2UY47Tt2z8myprdx9WcuYmLn5gM77krDjH6A=;
        b=EAvLnFWpg9HH2CZiNn9yYLy8tjLD7wds6cv+BvMcPkYU2Ydms2AuCoMtXse6HStzCR
         vI5pPc3m9BWwwyBIDG3EmUBYZwKgu/bfdjlmdYHAIngFWeNfL2mfnF3J+ag6gRoxXbtV
         nBBNMP/Nnh1jEmMdtqC0m9lT/KZ4i5kB3Vs/TwKQzd8P7+OIJzB9gf/fae/wIGusEvz5
         2Xoh77UpbUB2PP0vifBrBeAad0ZUXQT2PF+GCAKbod0yQyzmw1JaVzhBV6dQGGjKmw5t
         dQrle/tlpfPSFvjsLntXkScQKoml3ZKtfsTnDtI2+1nUFTmVmE5WXLFQC4m9seL0CfRP
         Cqwg==
X-Forwarded-Encrypted: i=1; AKwUvBwWR0Neq8Lutn62ASr+diDffuBZe8PuD47u5h00xqixSU7sfxC3tlhGt9FbVeHyqvXbJI/dpDoF9jlLnqodWbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1AVKIGzcwaIc4qY3vvKvuRvzZGFWgyqAU+YJBgayt3hgJFzAD
	wbCN1W2A2PAu+8+2sb4femmvuSCRfbmNU5DnH4rknVx9vXi28qQ5RB/NebOZacDuAz5KpaQo+4X
	VKbyIK0mchmjn3gT0kzovcG65MjcPpuGvWfwo6lsw
X-Gm-Gg: AYBFou1/XzNHwc7nw450D8+TXinn6ddvJ0kxH5HrRshUnu+P2mzhgMyAXDY7XQfM2Qq
	UNYhScvZs1NNKtoSftkLe8hG60M6Mq5uNSH1+2X5Z910jh6gExY+8sN/CXNf37briSdiSEpC5cH
	3bUMZ37Qqhf2TJXb4DP0G8ZrLXYHwN8Jb5BkNqhKAqmI8jNEuLlfvgE/B2Zqwo7EttjzgIcI2aC
	yTwravSlcme8dJRX5UGQfwCm4MPFIP4TRk6/MbnEGsk09aNY0QBuXWHgMsY+NyeJMuGATKmsLYo
	179wOXw3lm6PR9byFs/aR3M8Q0wFGJ90fu777r/f3kHyelOZAAQqwVDAuNHdEckc8xWaGuA27/p
	bBxgCAJ8uaa8oRqMQoXP8CRSv969Z73PAgRLDRGenRygpMEhO3/pPqHvYfIi/Y6pN/z8=
X-Received: by 2002:a05:7022:3f0c:b0:151:2e62:fe8d with SMTP id
 a92af1059eb24-16a5dcf817bmr31361642c88.9.1792136554133; Fri, 16 Oct 2026
 00:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <20261015073736.2944215-2-tavip@google.com>
In-Reply-To: <20261015073736.2944215-2-tavip@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 16 Oct 2026 00:42:22 -0700
X-Gm-Features: AclHuK_wCNAhqJf4c__nZlElCjEEiY8MOOLk1kNiLFXSjiYnruSv8DQvpSl-nBM
Message-ID: <CAAVpQUAnURtwVgKmRYXTZBjEyb58mxXkeJoMkh7Mc6+ESb1Sfg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
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
> When sk_wmem_schedule(sk, copy) fails under TCP memory pressure and
> sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0],
> tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc).
>
> However, sk->sk_forward_alloc is a signed int that can transiently
> become negative when tcp_collapse() re-packs partially read or high
> payload-to-truesize SKBs in the receive queue and charges newly
> allocated SKBs via sk_mem_charge() before freeing the original SKB.
>
> If tcp_wmem_schedule() returns a negative value, tcp_sendmsg_locked()
> passes that negative copy length to skb_copy_to_page_nocache() ->
> copy_from_iter_full() -> check_copy_size(), where it is converted to an
> unsigned size_t > INT_MAX, triggering a WARN_ON_ONCE(bytes > INT_MAX)
> and returning -EFAULT instead of waiting for memory or returning
> -EAGAIN.
>
> Clamp the return value of tcp_wmem_schedule() to [0, copy] so callers
> treat negative sk_forward_alloc as 0 available bytes.
>
> Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pr=
essure")
> Assisted-by: LLM
> Signed-off-by: Octavian Purdila <tavip@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Basically sk->sk_forward_alloc should not be negative, and
I was able to avoid that by refactoring tcp_collapse(), but it was
a bit invasive for stable and late in rc8, so I'll post it in the next cycl=
e.

$ git diff --stat HEAD~4
 net/ipv4/tcp_input.c | 158 ...
 1 file changed, 109 insertions(+), 49 deletions(-)
