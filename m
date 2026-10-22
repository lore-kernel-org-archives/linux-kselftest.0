Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670387;
	b=D9jsiy0D5Tn7+gmWEwte3CI8HlkG+cPNs1SYd1X28Sara03+1sWGn0pE8opM3Fo1TyGB
	 AOKFIaj7QROSDbtU/bIk3UtTvs8uJONDRM16of5ytm3aW3lYQLJiVderHDR4Fhxgivlrd
	 4KDfreKEn4albJDy/Tcvn7Xg1JI39V30pKEvdPFuyZawJaZyukUbUhuQM4eMa2d7iHUiA
	 GWa01GRRvDPt+e+HIwkp/kEy/1TnOQPEPVmpzGS/UTYsaFYaLTjytRa20Jg58g2tLt6Au
	 FmKiSDha7my0GqCrjKUpLKxjTZ3Y0kOhSkvSrVjF0cs7azBgwQNZSMPclPT1tmUUnVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670387;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UKjpkzKRbSMgDVnYVD4K12MfTDj9Feon+mme8ohFRXg=;
	b=FCcahLSDZBUteNe6HZ2/BqIpkPmzW0yuRSS/dc/HWoFutJLL0YnNM7wzDQuQkrztMV7p
	 tXXfMbtKqATxhuRClG4JitkHawNmf/0E64iQUP/NrFyueEgqRxmnqUmXNJdVwnRjxUorN
	 fQZq8S+3JvwbVd8fZKf5Xu2ls7O+KCWwZbXveU3BMYNF84eoPqNn8tcijSsX1vF7WoPsa
	 8y2TM8Lb9d/mH+LmX0EJK8qvp4tVmhMItFFAoMW3KK6Z47YC7x7x8q27DSkzocslHndbu
	 FjK1a6z7dMwMEynufBsJsbSrUO0eRVyxLg4Lj6NJznVisCFpM6YbhnltqoktsJ9JlzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRZ9888u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBF5606A319;
	Thu, 22 Oct 2026 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRZ9888u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507491F000C2;
	Thu, 22 Oct 2026 11:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792670386;
	bh=UKjpkzKRbSMgDVnYVD4K12MfTDj9Feon+mme8ohFRXg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WRZ9888uYV/NGTRjAgcGE/B0b3QbJVcmrcRqBTj0F2bq/KIpihx976fDxmZ9Fesv4
	 1OcrjKfdx0yGO82bwyp7JE66ZCezlp5pMhPPgO0duKPUadymPLgbFXJ9jcdH+2EhvU
	 edj0FN+TGSEndiqVUSjoCFvVbYBG46oMq77Ltov94WQ5lpeftUoJpLcbJHlunMUOKQ
	 cKgah8ngeOUAfgv0EMHhZnyTj8f8hkPp+jBz3bCjBz39Dmq5k9S2hYp+5ryYNhZ+Og
	 s1PRaQChA2e7J+Gch1PEZaTTRDl3ZQgt8FJXz5RGltlQodR4bdiJwu8PDJTr0zxhPX
	 jkMv+pBxT5Cnw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Todd Bert Freed <toddfreed@meta.com>, Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Willem de
 Bruijn <willemdebruijn.kernel@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, Rahul Rameshbabu
 <rrameshbabu@nvidia.com>, Raed Salem <raeds@nvidia.com>, Cosmin Ratiu
 <cratiu@nvidia.com>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/2] psp: drop packets with extension headers in
 transport mode
In-Reply-To: <CADh2yMypAdV07rRufDqj1aOdEzAqEaH2bDkJ2jYV_z1_9iXRkg@mail.gmail.com>
References: <20261021210200.788191-1-toddfreed@meta.com>
 <DMAUWQVPIVKP.1QAK1YSA76EHJ@gmail.com>
 <CADh2yMypAdV07rRufDqj1aOdEzAqEaH2bDkJ2jYV_z1_9iXRkg@mail.gmail.com>
Date: Thu, 22 Oct 2026 13:59:44 +0200
Message-ID: <87y0bq54jz.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Todd Bert Freed <toddfreed@meta.com> writes:

> On Wed, Oct 21, 2026 at 3:07=E2=80=AFPM Daniel Zahka <daniel.zahka@gmail.=
com> wrote:
>> >
>> > The first patch drops the packets, the second patch adds selftests for
>> > that case.
>> >
>>
>> Why not just fix psp_dev_encapsulate() to put the psp headers in the
>> right position? With the self test we are going to make PSP + ipv6 ext
>> header =3D=3D drop part of the uapi?
>
> If the original ipv6 packet has extension headers, then the nexthdr on the
> fixed ipv6 header identifies the first extension header, and the L4 proto=
 is
> in the nexthdr on the last one in the chain.
>
> psp_dev_encapsulate() places the udp+psp headers after all the extension
> headers in this case.
>
> The issue is that it rewrites the fixed ipv6 header nexthdr to be UDP,
>
>   ipv6_hdr(skb)->nexthdr =3D IPPROTO_UDP;
>
> It would need to walk the chain, and set the nexthdr on the final extensi=
on
> header to UDP, instead, if the correct policy were for udp+psp to come
> after the extension headers in all cases.
>
> I'm not sure that's the correct policy though ; for some headers (e.g. the
> fragment header) it might make sense to leave them on the inner packet.
> Note that the psp spec does not describe this. Perhaps the user should
> express the desired policy?

Fragment extension header would be weird to keep in transport mode...
I'd say drop is the right call.


Bj=C3=B6rn

