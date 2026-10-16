Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95273B840B
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138953; cv=none; b=fQbJ/SwevlytuLlTixKzH+bpPOOJ4Dg+hrFvaKE+xuTMjIpRAfDMqnkNgJLa6VTblKpdHKKF8+jjmU+uMg5NpG+MQJuyH+lRD+Y2co6E8kDnoUl/FUBtQNOQi0vIBRc5O6SMoKQWkH3f8BsV0nfcJdWDJ6RuaO9/xFbrt4e7FxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138953; c=relaxed/simple;
	bh=CT2UM6Jhu67KbLLdIzICiyzevSgLMbCH4BsymlH3F50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHMMPPWgoCrMj6FrcD8yN47ZmGWWSA7vxmZyfnQLZMfvCxoaxV1JGhHqeVXr8154K1qd2vDXZblYAcBW7LOnTsU1LwpNJ5d7c7CFFEJ6zpo4zwBBBvB/miCiQgOO3B/Q1SSOIkA2BBOKRmOrOzCHZiB+rcenQBVNz7pw1n9mbLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVKmpjVe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVKmpjVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D571F000CB
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792138952;
	bh=CT2UM6Jhu67KbLLdIzICiyzevSgLMbCH4BsymlH3F50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kVKmpjVeqa25mLAYRQuLE1P8+ZQJ36Coa/pdza9hclMIN9y8zZgUVpj0JwlVF2RdF
	 BxFEdVar5bVh8hi7rxTs1+Pdf0mW4dKxfgNGYvr5xmndCFS/e9+ceP0+e0FisxDt2f
	 FmuCiLpNs7bziEwN/oRAZlNlap/kWbEY1k+qG8qUvwN8vdCx1lgS/zzxnOoRKJWZYD
	 p1AyzvRZzo3YanoHG5H7vOAJIcDt+9L9PNNJVAFAdep/P21OlcoiixPmQmegZFGWrf
	 a0cm6zb1pF393DAG6Z7n+K/Qzp8y5E+1k7HzfP59P8IMXJ0CVO7AKk0hLVNDcfjD3P
	 nO3cy+FHPEnmg==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6faddda49e7so2910090eaf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 01:22:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAVa1wQutPh57kmGfUsOKiZmmwH1u+GqIDNdvRi8UukfA2F9KzQHmIS9xUemZtdPMSsEDEuxLSjXxRFYYuwqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7gfx8aYOICQBqFHN2kfJF/wkxznNvtPSxHUL4Tbd5vjVL6p0C
	C/bCxpwjZt16w2bKCFPsqHb39A59OtwyYULkIheuxvbr0BRvlRjUkdUplpJ5w6T+xlt2MQK4/Pk
	akeMkP+33SqZb5BnXkMAirDeahneUr0s=
X-Received: by 2002:a05:6808:50a5:b0:4d6:2545:b15d with SMTP id
 5614622812f47-50c52471033mr20298122b6e.23.1792138951871; Fri, 16 Oct 2026
 01:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <20261015073736.2944215-3-tavip@google.com>
 <CAAVpQUCpFC-7J=uEgBfh37hFb5BCJvhJQZx7_YKEDCtvbGrGWw@mail.gmail.com>
In-Reply-To: <CAAVpQUCpFC-7J=uEgBfh37hFb5BCJvhJQZx7_YKEDCtvbGrGWw@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Fri, 16 Oct 2026 10:22:20 +0200
X-Gmail-Original-Message-ID: <CAL4WiiozXgApewA6WWQA--YxaweezQASpiOiiLz7=ijrqbkqgQ@mail.gmail.com>
X-Gm-Features: AclHuK-H_6_SSjKnbDy6Z64lIVyJHl3ANaXr8rZtT8VsFNm3RYx19KAU4O0E5Jc
Message-ID: <CAL4WiiozXgApewA6WWQA--YxaweezQASpiOiiLz7=ijrqbkqgQ@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Octavian Purdila <tavip@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 16 oct. 2026 =C3=A0 09:54, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> On Thu, Oct 15, 2026 at 12:37=E2=80=AFAM Octavian Purdila <tavip@google.c=
om> wrote:
> >
> > Add a packetdrill test that drives sk->sk_forward_alloc negative via
> > tcp_collapse() on the receive queue while sk->sk_wmem_queued exceeds
> > sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking write()
> > under TCP memory pressure fails with EAGAIN rather than returning a
> > negative copy length from tcp_wmem_schedule() and failing with EFAULT.
> >
> > Assisted-by: LLM
> > Signed-off-by: Octavian Purdila <tavip@google.com>
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
>
> Thanks !

Are you sure this test is passing on arches with 6K pages (as some
arm64 and ppc64 platforms) ?
We might need to add a check to only run it on 4K platforms.
