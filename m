Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7533340DA6
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139003; cv=none; b=VdmDhs2/1sfCn+E1rInhE83NvFIhvxKb81jgRi4wGDII5/H8DO0CiKJwGygMjHPwAt0SDEjzyiBISB87sgXEnBMMTZsy66zX59Md9cRqL/jKPeqivO8a5d1R55+sklTEkCtoDkAdiixgqtAsllwcbKn25lu7l5aRd2h6/qo4M6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139003; c=relaxed/simple;
	bh=oN8eUitwwNXlNWMV6fer3OLGhSyJBfwnxPpO0+hBr1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcjVzoj10evJol6ZruN17efSbW8XiTrdRxzG4WFBDeHXM9pwRpZMoQiTTKHKMEktbPeygdTtFtoqD/+ljLgobs+BOo6qIQpC3OIUS5mUBMevbUx5ACkYlxSIbuTNMO8MCn/Y3ec40MImwkMLXG9W9oRHgymKu3Vpfbt0f81Tt4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Di0gfyvR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Di0gfyvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFA61F000CC
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792139002;
	bh=oN8eUitwwNXlNWMV6fer3OLGhSyJBfwnxPpO0+hBr1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Di0gfyvRqBM+0yZrmva33+BfTwUfy2QfCp5UD6nNNAI2OaPMnu+9o1S/l7dTO3nmp
	 w/YFkRjr/CGE/Z4TGLlZdhj9D4oZ4+vDGP8uLBhgbd0Pay0E+BqMhw9mE/JUTzMUmn
	 HrI0preXy+EixVqwMp6OaaG9hGy2POqrxUBnBVfh1M1hHhH1H84l9ADGFkbpfu0s/q
	 OPFWpGCF+LqjDnp4Q+mDr1D0SzhyxD9Rcn4zR/9G7nary5jVMYjQYRM2FOKW7uFvmf
	 4rJq/vFkgVZ2AXcLZjkwfZfHc7pCtCJ7/4RIOHxVtnTQUd7RBY72Y+A/hBaZJFU7BN
	 1XggGgR44mZIw==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6dcf573c429so3931353eaf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 01:23:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxUw/+jSMFNgg/e1mtvvy8SUGyw0v9zRvmOHqzTTTPfVnhX1ZQD1VaNH0C6DVfJEzztRk3eDyPqfpCL266iTiA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpimqbdrID/2L/SXy6CYUvb48rhcCJY1WYItOm2uszAagdvZ2W
	ehW39czbt68xwAv5nM69HHuFRiAWwbO8//iVcQhxuW5myD/vH+tCf6OLHYyfJMX8+nK6X7rqpbK
	6RrP+ioRF03msC2YkL5pUeokdCKPwJfQ=
X-Received: by 2002:a05:6820:d0e:b0:6dd:696d:b222 with SMTP id
 006d021491bc7-6ef0fdb0ac9mr16267832eaf.67.1792139001923; Fri, 16 Oct 2026
 01:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <20261015073736.2944215-3-tavip@google.com>
 <CAAVpQUCpFC-7J=uEgBfh37hFb5BCJvhJQZx7_YKEDCtvbGrGWw@mail.gmail.com> <CAL4WiiozXgApewA6WWQA--YxaweezQASpiOiiLz7=ijrqbkqgQ@mail.gmail.com>
In-Reply-To: <CAL4WiiozXgApewA6WWQA--YxaweezQASpiOiiLz7=ijrqbkqgQ@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Fri, 16 Oct 2026 10:23:10 +0200
X-Gmail-Original-Message-ID: <CAL4WiioJjvno8r7YeLCTf00q9L5w+OOGLbGz-t330R=NZ8ATkQ@mail.gmail.com>
X-Gm-Features: AclHuK_u3lR1D2ljkRGIQeZr4gzrwuVUaxoazNDubSWnSNscw9cZRLoBFUMJFNA
Message-ID: <CAL4WiioJjvno8r7YeLCTf00q9L5w+OOGLbGz-t330R=NZ8ATkQ@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Octavian Purdila <tavip@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 16 oct. 2026 =C3=A0 10:22, Eric Dumazet <edumazet@kernel.org> a =C3=
=A9crit :
>
> Le ven. 16 oct. 2026 =C3=A0 09:54, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > On Thu, Oct 15, 2026 at 12:37=E2=80=AFAM Octavian Purdila <tavip@google=
.com> wrote:
> > >
> > > Add a packetdrill test that drives sk->sk_forward_alloc negative via
> > > tcp_collapse() on the receive queue while sk->sk_wmem_queued exceeds
> > > sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking write=
()
> > > under TCP memory pressure fails with EAGAIN rather than returning a
> > > negative copy length from tcp_wmem_schedule() and failing with EFAULT=
.
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Octavian Purdila <tavip@google.com>
> >
> > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> >
> > Thanks !
>
> Are you sure this test is passing on arches with 6K pages (as some
> arm64 and ppc64 platforms) ?

This was meant to read : 64K pages.

> We might need to add a check to only run it on 4K platforms.
