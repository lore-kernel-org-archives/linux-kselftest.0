Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57A3F926F
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.230
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790529051; cv=pass; b=hESD2aNd/98ez9baUOPuNa3fqEDmwWvjiyWhOoWE0zlepKig5KUqCHGoIldN3UDLNa+zKyu74fY8/VvPzM9gqb5q/33e3pjRhi5hqBhl46asdxmob5I21DWAal8UIDobAwbILM5lefD15B/DnYRvxNirJVhGP9cdMiOECXr2Af0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790529051; c=relaxed/simple;
	bh=ikTxL5JuCzeBWeGH3nGI6q2+sz2cBQtCh19A8s6v9IU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeDprkUkXNxdAt0kJERdakcJINXL1iA//UMS9l8+vjkbcX0BTFaFOlK3NN1b5vSvm2ViumjRaMe/M8xwuVAHDiSiaSzRB+ruUjnHm3otzokyRu5iilGR2QJxotaRlEuLEvKqJevcB7LcPA5HmeHWIRqMaSKj+YVsMa6DsvFPBNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mjYrV562; arc=pass smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mjYrV562"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-53336049862so5932041cf.3
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 10:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790529049; cv=none;
        d=google.com; s=arc-20260327;
        b=k2PQeRJUaWceabS1NSWPQevxTKzziPIzKD7p6OVv/XM4KSKFrXlF1G3JV21mBel/qU
         4g5BHqwM9x9GTAwgkLbUQY+BCRFMm+NV6qFLvTbeMND2vEeGSkSkQxZLTLEfBlYOqCWt
         db7RoFBya/7fu0Z8m/+fEEYm1cC+aeOUClN9zMi4QyUVnd5mmoJairkGV7ByKVGG+CDX
         ZeGrSJ6kcDrezvgT1KDgISk0V2szHqbkIFaUSkHnaYFQm/nbvpRmjPhidj3sA92CaH6q
         ShKCbVnHNumJnQ/VSWjjj0n5yww+ZIt/b88j/QMfLAQ/vxorO4zj2uUiUUJvznYpnWNN
         fpjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ikTxL5JuCzeBWeGH3nGI6q2+sz2cBQtCh19A8s6v9IU=;
        fh=Yoh1j3CXpThQuq88Y+MHJdpFRsGRiKwZPaegIS9/U9s=;
        b=KTo8oRYZK69Phza1PCb4Pf4rR6J9UTtp8DFjqh5Dg194W5OgyT7bk/F4IENOuRfIry
         bxEwS+JrWewIttbChi56Bsm7Xqm/4jLIJJx2Jl7B4jkPxVCcg5qAqTwwPCcKjnJAeI6K
         ZXkLPAcUuTtsFSACy27ZkSvSBJHZJNQ218Le6Q5pgK6twoK3+39I3Od41Ig0NQ/dHewW
         2JM8RKapI2//tCY+JIkwMLjNXC23+uz8gPkOUELbuBIks7VSsbcZ/82uY548DinwdzqZ
         Pa918JBDnnIALjfLtyzaI/sfOyYosRDwKA8YJkR6q1BcbaC0A4MuCGDNXcicW/bJMCBR
         If+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790529049; x=1791133849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ikTxL5JuCzeBWeGH3nGI6q2+sz2cBQtCh19A8s6v9IU=;
        b=mjYrV562TasJbRzRBYNqKC29SivwNhKDbxhj8AoHA2aSdNv6ISMmbfirO2kXhJKL7W
         aGEwcRZjVs2DINpoalIM15LpsqiJUzRmZpd6ulR4TYWF0/i1Q/ORxuHe9aSGrmGq2y6j
         +eznTl45kUfeKbiDC77TCXGz4rMAPmPj7a1aiFdteZQusu7fDZzskU1UBTr9CX2446P5
         emkugc5TJRPHYB7VDj7sKxybbe5+pivYaeWaH8VRPXd5VGI1+E2OxFaQs9ocsEwGVee9
         sw63SsjTbrp2VvrKiHftS7AofETr1d+kE9yWGCQhF73wbvnc9g14Q3T8D6KLATNqIovy
         DbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790529049; x=1791133849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikTxL5JuCzeBWeGH3nGI6q2+sz2cBQtCh19A8s6v9IU=;
        b=zb6xx9t0A6RyGZ54lAAHgIdP6COSA7gg/ybN8Btep7xed1OX08ISJglnAfImvyse/O
         kQkymskeecZLkpfu9uDMZeIYlDcyPxx3qqj8hJbWQK+9+ocfnBWGG0vpMq5ZPUej6NdV
         5iEuL4rmiCYWNGvXk+4sa1Af0GoGvByGp6cHFd0SREQlA9vLE8xhgOFLY8ujSjDzYfYS
         NhzicSe88gCYwtcniFAtUtjSBNfpo01dS5104NfwuArtNkjknMTZHtMytJDImtwK7g11
         eKNHXSyuXq0ZHi2oIYNmC9jbxWJSrearyLwDCUs3zxzUU1frcL7ROy0EQHeY8Q26n5Wu
         emTQ==
X-Forwarded-Encrypted: i=1; AKwUvByh2KsRY9Snq94uNYf2V2Hs0i4bJpL4hO2fXO4MoCCvzsanFhs7cBV3tLXrMi8jWGO+G3l7T1WKiuiOPBGaAmE=@vger.kernel.org
X-Gm-Message-State: AFuF++k7QcpxFgAxRab/Xz99RHu5Ta9dZ/hL17UsHvanmPoAUUvmNi6o
	gt1q0cHuQ0rdbLCO143zywSB3l5isJ6YbJICJ9JoRVIz8aDR+NMUgqk93TObW3tAWTqaSTj1pBP
	C0rLCrdkTtjQx7/TqwUvSV9ZBqeHTqMMnvms6dHHn
X-Gm-Gg: AYBFou1SnmpeL7aja7FO/xI8l9WOAQAZbqXzTWuMsymNjmfFTpGFnwheigQXdLoAjTt
	x4VtSzchpUAxLMayrzAVfizQu5mcswqDlrqpefJaWjQg5A4qgKRbsb7FJzuPHHwV0cogIDzxa66
	vY6y7as3SrSd2p08RUgfSJ2ZNMTOC8itjdE9n6sv8gY5ODYMLG+x/hciN/ASFBIGgMHvq51ERUB
	3MIJJns0jpZ25PLixT4rb9xlVuVvxmi61QHL2ff25jM1OB9O7kLlNvh6fPP1MWb5RbMucHaUi5T
	4AtRbjt1qI8xg1oyJ2aFbww03pRmp3ZASRKnD4FQA4dsBNbSQoaPsUgYn94mgejrP1S4cmgtn8i
	j8K32Gogmnng/IVzzi5PjoeAc3N0chAwPza9Gmrhnp47a9ny58zRmmB32G23QpJwx+Tjc
X-Received: by 2002:a05:622a:6f16:20b0:533:3868:1f6d with SMTP id
 d75a77b69052e-53338682227mr27382171cf.59.1790529048151; Sun, 27 Sep 2026
 10:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927163117.746432-2-bestswngs@gmail.com>
In-Reply-To: <20260927163117.746432-2-bestswngs@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 27 Sep 2026 19:10:36 +0200
X-Gm-Features: AclHuK-wtOUaURDTxb0s4NuF5eW9fAjvgRkV0CtGV9tL1ejWVBuFWcDjyUMkjB4
Message-ID: <CANn89i+monpTo=bjqnHRhuGaCkfHe9BJNhJncjK+vUq0YKAAag@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: gso: validate TCP headers before segment length checks
To: Weiming Shi <bestswngs@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiang Mei <xmei5@asu.edu>, co+1fe9b56e2c61be5e@bugs.sh, 
	stable@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 6:31=E2=80=AFPM Weiming Shi <bestswngs@gmail.com> w=
rote:
>
> skb_gso_transport_seglen() derives the TCP header length with
> tcp_hdrlen() or inner_tcp_hdrlen(). Both helpers dereference transport
> header metadata without validating it first.
>
> A TUN user can supply a TCP GSO packet without NEEDS_CSUM and with an
> invalid IP header. The skb remains GSO while transport_header keeps the
> unset sentinel. TBF and police can then reach the length validator and
> read tcp->doff outside the skb head.

Do you realize this leaves non-TCP GSO broken with unset transport_header ?

Please fix tun instead of adding numerous workarounds in our fast paths.

__virtio_net_hdr_to_skb() needs hardening instead.

virtio_net/tun/af_packet MUST not feed 'gso' packets without transport
header being set,
among other things.

pw-bot: rejected
