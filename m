Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715FF27E07E
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 00:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790297938; cv=pass; b=L+Ckn30yz8Pe8NK8cU22Wjjsa8nYymIxs7u04T5cTKPZ6Icoo1UjeZ7i7Ecp3NdF8bSSQ0ir3+TwRbuWBO7J4s/Kh6gRysIVLaFYz0UictX9p5DKAV29BPQKiM+MeF5VHJfi10I9ny9vqf2vjQcXOUMWxu16obd49TfUz3Vrie8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790297938; c=relaxed/simple;
	bh=urAmayGrk2/YKnpNUBvPoUR9FlB5GJJ9+v5VQMZfNXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsPTD+xsS9s9CmVEE7or6b3R44tLp2ACwYCRZuPI6NTSDGFLDCySmOY6EtUJ00rgpmI8RibhM3Gt0JoNn8BTMxxoaittmXAYYzzT3pc7TeQkhZnqXVD4J+qjp9vvSemcUJRCnNW6hMGkGh1pF9CbrlWCAlpHj82iH38SFElL+3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MezY1qMb; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MezY1qMb"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb767d286so3791311cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 17:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790297936; cv=none;
        d=google.com; s=arc-20260327;
        b=SornerzsnjehU9khML0edPNbkm39uFNpcLtqSTAjmWSVscTxgJutKD42E7sYWIJdhe
         xHeMjtProGDNbMBzQCd5cqUsKb342Z3cvGR4FLT8IgMA19EEx8ar72ZfBNQGEw+EXhlJ
         SMF64DuKFiWHUeqwQAcp7TCe1Lx7x6oq+KqJQaDCrBiZY/8FITOxs6vREYj7mNPOZQJa
         jbEuSFDfsHav7fbLWNNib51EgXqztqVePXbzDDeNXGUWXpfBCYrmYhlmGou3B+IGe8Sd
         0WAbSTfWlTl2VlniZOvHeW9Nd9M2L4CNJ5ia7dhLNZE8twkwFHgnXFF23hyyvcIb9zHM
         azyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=urAmayGrk2/YKnpNUBvPoUR9FlB5GJJ9+v5VQMZfNXg=;
        fh=G0T6gnGsW90Vq2aZNNYpgGDNCc64MWEZ609LgRPa7Is=;
        b=fKnFToG7RuXJWlF3+vLbLvbR3dou7k1OG9Q2SB7sfG++QsRLjB7Tw6N476ynhPgTNJ
         vWzQIig8TRPP2vimOuCw9o0WeqWu+bvvJF3LwSrbMpgCrhgAZ66a/+4JnBZvyCzJMzsB
         EFJ9raP+pDsm1UvidP8s4BTrhkW+VN/l2tIJEplkn1zO64XR7muFIjLyP18kMKzOqbZJ
         1UsJ47zJo0y1MATsQWaRxJUOQobQKMUo3Jy8335maJ37S5PjkxPjGVf09hGKnaC0p7lz
         AmrCBjYkzW1Xq8gr7jWr1SBprzoOPkgyRRun0zJZ4befTRYu3S2OL0Ix6ktjN0dN4ROd
         GHSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790297936; x=1790902736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=urAmayGrk2/YKnpNUBvPoUR9FlB5GJJ9+v5VQMZfNXg=;
        b=MezY1qMbvEI7v31/hFS2NYGgdGoMKE9LPO27An0Mmy+vH0VGgaBGfUGCccceGuQ8cJ
         s3KZUEU4lqO3U5pgLTa1EprjzJFEg07sKnGep1+TaMbOgDC5dwnnFS7t4nrAK63/lU3n
         Tb5rgQ+hbKfJQH6plZaAEUFjn7yajHRvArYipEkTkX3GuWMx1rehJr6L33TzNiKPcAj6
         2kqhFaMCYMBBe/ZPW0d5kdOmikTJTdzveBfq0Z+Lki5qnb5bJt/y4kHwykbMQ3Trkihf
         mSRAecWWbWTc7EVa9EgtsFJSCMhZSuFlAQlMt7veidDsW7Lib/Tm3v+wkFYHHZNp09HQ
         gdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790297936; x=1790902736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urAmayGrk2/YKnpNUBvPoUR9FlB5GJJ9+v5VQMZfNXg=;
        b=1ufvLB90Z1OlDZR4d9K16WsqmT+DrHcf/cNNKjtmAwKrrxUSDAkgJpZCBzZXCoJIIB
         wMNcpPFQbn/+HznInYjUmSfd4MoD39Uarewubr20G8V/oU1n2xhsUM9MZJ1bKlf+yqJF
         BRgYXUTg8ytUP9+5007lFmxN8rK1O0zwFCHLzwrU6OeVxbIlWc103zahFZ4WFBHzRi7l
         46M7XjKfx1hspjD+1ueSc7scDas0iAaHBK2CEGNwpBrKM17kZqkRRU5ICZitTPHiIzLt
         K3gdCzAXuDoWf3ndGUQ8yDPCD+cCF2f0zDRQXJTsa+Y0VQu4RHx8/1+ACBu+zjjRm/aC
         DY1w==
X-Forwarded-Encrypted: i=1; AKwUvBydw+d6Vvlc0J/pfs2z5dNQX4PUtZzjp4Rbit8RhiyMCbmCbHlh3c001aTYyf6GyT2/W1DICtx06SLGltwDQ4w=@vger.kernel.org
X-Gm-Message-State: AFuF++mkVCOc+PjFuU2wiWqDplEVbNJxAXFGxX2Imsw5m0JSJ9NUH9NR
	IMA0QRgcWu/IJgBuC7i41z//gMnIY/OyNnsndPgixgFi/2ItumpmQBY5EC3B+QGemkjNc4FrR0n
	PQ1FG99SAKBpvLNjENG0atIKFI/+4MsJz7sKQBDcJ
X-Gm-Gg: AYBFou3lIIZe9xiPmMvQaiQkaScb/sJdAwrbMWqmq/eJu+iTaG8qeaS1eq0K22G4Lle
	5rNMy9AtyReHbeO3xwAJuOScFUjYc6pdtWbR4UMp2zhOBMuRwxWawcsSANMmxf3hKBOuMTiqUgO
	VruErl6Sf/DnlPhMKd7BtOT3wbLRYGZ230+Wls+HeGGDWnRedw6ENXPOBQOqIgTjDDHbcGwxlmN
	YCieUYKwMm/5q6rTqzxVRhDIbeItKYDatvxjSH7w0yzU5UluC5oJmMkjQp1S4X5Y5mr6U8B3ktY
	RxzYgn853bJ4Mei/mKC5wB2h/ph+nsfHbacbeisvwiR/GFcCCCBNTY5fXJLNwHIAo7iobcc+yG7
	/bgUsg9k+YQpT//1+nNnbcqm+g6QxDw5zL3XwHyXbgl++pFbSi5W30mIspo9ec2DsYsKG
X-Received: by 2002:a05:622a:1908:b0:530:f3f7:ca19 with SMTP id
 d75a77b69052e-5330b5dfbd0mr19703701cf.25.1790297935585; Thu, 24 Sep 2026
 17:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924224456.55690-4-jeffjo@openai.com> <20260924224456.55690-6-jeffjo@openai.com>
In-Reply-To: <20260924224456.55690-6-jeffjo@openai.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 25 Sep 2026 02:58:44 +0200
X-Gm-Features: AclHuK9sfmq7kaDYlZhIb51eTI_YTaqPKeo-GWlhfKE_S3RVg2Vy8HH2SQdgf3E
Message-ID: <CANn89iJiOQNrxAOU_OuOZafaH00K6bHM9nS9NCWEpg8yKq8fgg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests: net: check timestamp echo after an
 old ACK
To: Jeff Jo <jeffjo@openai.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:45=E2=80=AFAM Jeff Jo <jeffjo@openai.com> wrote:
>
> Add a regression test for a gap-filling packet whose acknowledgment has
> become old. Linux first sends data to the peer. Deliver two peer data
> packets out of order: the later packet acknowledges Linux's data, while
> the delayed packet still carries the earlier acknowledgment.
>
> Require the ACK that closes the receive gap to echo the delayed packet's
> timestamp, 301000. Without the fix, Linux accepts the data but still echo=
es
> the previously saved timestamp, 1000. Also check that the application can
> read all 34 bytes.
>
> Use a large jump in peer timestamps to represent the idle interval, with
> no real wait, loss or retransmission. The test directly checks the outgoi=
ng
> timestamp echo. It requires packetdrill's merged TSecr verification fix
> (linked below); older tools incorrectly pass on an unfixed kernel.
>
> Use the existing packetdrill selftest runner for IPv4, IPv6 and
> IPv4-mapped IPv6.
>
> Link: https://github.com/google/packetdrill/commit/83f72d3f9085d0e26eb4d2=
06fe4d7cfab5b6d872
> Assisted-by: LLM
> Signed-off-by: Jeff Jo <jeffjo@openai.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks!
