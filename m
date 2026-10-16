Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6463BE16C
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138801; cv=none; b=NjCyJ+SSPME7uzlIxdpfFAAIjEuPBKKNknhrHpFGtKL0Y9LyTNPujH/15dnXuLc5ExzlEdvvubXsZ2Cp7a7L+UGkRmmeW5xPievx8aauO5h/luxU71dre9uCc+Hgu9Oe/1tXGKHuSciex/HMPl7kqpv25vc4DkLqqml+vCWovf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138801; c=relaxed/simple;
	bh=Q/VFJDeaY/23ZJwVigeNwes0ycOyUM1dhiVYAZgu9lE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLSWm24RP0p0wQBarWL7w/E7yAcBFjNILBD0OFlJTwKejWNN+kMhd0Ae1agwuI68zfXRB80oAXiOJVGkzCLzm870REDtt0SlzFzzUWnoGdutOi40d83YRDFwHiu5oHDp07L0M+CZUPrh2ZpIB9gdGELRuZVGez7fO6gqUCWXLz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKxlHMUo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKxlHMUo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADF81F000CF
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792138800;
	bh=NQNdQ79CqehE3MN8JBQ8cGNawuMei/JypxZtTt4YpYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iKxlHMUo+/1GZcAn9zFCZJrdBiM4xpOj7aQo/0biOZE99rPXdb9j84gzoYcPY3MQL
	 n/vzJrQYSYACTqxmx/rxDWNdYugxZfkWiXvYgc6XW4MINFf4Br37NBRmQI7V9nw5vk
	 e7lZJa8fl3D5k0KHMwV/Rg/qYUt3z1f6h3o8jAyRfc6NdkoGyOPLHQFX07bVm6B7G8
	 snxa5s3JukuEMx+ugj0XqfA4DSQs3jawv/jwA3SsRPIGxcoYO/Df966VlkutDzq23b
	 HeiTGXGGke2+QgOmf3/uXIOp5HxVSGPK9gm4OAlGKi1XAciFRVX16J5QOnnkYL9gjd
	 c5dB4fQdnxYgg==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-70094949641so842319eaf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 01:20:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGmw0D4K46uokHIE2az9Vq7TPPTLknS+j5ma6OmIHzCMw1RwrhndUM4nqunlScD/O475M9gTI66BH4L7oJf0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWwOZIrdSLsSa2Ix0/hOa5bnr5pJpJAAbOIfc6pEGr9gGDtEcB
	jSfPc00qH9WLPkg0p8j6F/GGWrzb51G89l3lrkxtwmuse504W0FaBTghu3nUAsI0pV69hvkgUWI
	e7TD0EWtecyba6Y64ATMrXM9zs5RUBo0=
X-Received: by 2002:a05:6820:f02a:b0:6d8:462d:2755 with SMTP id
 006d021491bc7-70114debb9bmr1594715eaf.37.1792138799204; Fri, 16 Oct 2026
 01:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <20261015073736.2944215-2-tavip@google.com>
 <CAAVpQUAnURtwVgKmRYXTZBjEyb58mxXkeJoMkh7Mc6+ESb1Sfg@mail.gmail.com>
In-Reply-To: <CAAVpQUAnURtwVgKmRYXTZBjEyb58mxXkeJoMkh7Mc6+ESb1Sfg@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Fri, 16 Oct 2026 10:19:46 +0200
X-Gmail-Original-Message-ID: <CAL4Wiipff3Aai0f=iwXmvc1MKessWzO2fojVu67BQ6e-pGPk3A@mail.gmail.com>
X-Gm-Features: AclHuK_ghVWdNzfqvDun0kKrC7LGzJBYtDJxzI9zBA3uy3mDqEmjWu5L0M5ujAU
Message-ID: <CAL4Wiipff3Aai0f=iwXmvc1MKessWzO2fojVu67BQ6e-pGPk3A@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Octavian Purdila <tavip@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 16 oct. 2026 =C3=A0 09:42, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> On Thu, Oct 15, 2026 at 12:37=E2=80=AFAM Octavian Purdila <tavip@google.c=
om> wrote:
> >
> > When sk_wmem_schedule(sk, copy) fails under TCP memory pressure and
> > sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0],
> > tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc).
> >
> > However, sk->sk_forward_alloc is a signed int that can transiently
> > become negative when tcp_collapse() re-packs partially read or high
> > payload-to-truesize SKBs in the receive queue and charges newly
> > allocated SKBs via sk_mem_charge() before freeing the original SKB.
> >
> > If tcp_wmem_schedule() returns a negative value, tcp_sendmsg_locked()
> > passes that negative copy length to skb_copy_to_page_nocache() ->
> > copy_from_iter_full() -> check_copy_size(), where it is converted to an
> > unsigned size_t > INT_MAX, triggering a WARN_ON_ONCE(bytes > INT_MAX)
> > and returning -EFAULT instead of waiting for memory or returning
> > -EAGAIN.
> >
> > Clamp the return value of tcp_wmem_schedule() to [0, copy] so callers
> > treat negative sk_forward_alloc as 0 available bytes.
> >
> > Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory =
pressure")
> > Assisted-by: LLM
> > Signed-off-by: Octavian Purdila <tavip@google.com>
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

> Basically sk->sk_forward_alloc should not be negative, and
> I was able to avoid that by refactoring tcp_collapse(), but it was
> a bit invasive for stable and late in rc8, so I'll post it in the next cy=
cle.
>
> $ git diff --stat HEAD~4
>  net/ipv4/tcp_input.c | 158 ...
>  1 file changed, 109 insertions(+), 49 deletions(-)
