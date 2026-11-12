Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501440;
	b=qAxlyAcEhyOI8aLLsZ5iMPX4Mjr5fL3AFVowJPVdiSMGD1FUoLiECW9LwL3Sb54514WT
	 eG3WOxksdQ2FIEjbq1zcDnCR/NoRUbHziqa7gDtuqLCzUVAiK+CCNgu3EwKNm5c3Qyatn
	 LopdjSpg1j3ejPFVrHtWGUAeePziTngh8jvGoY+Nfb4KyNHwLEBUeIy266D/iEP3ZoLwj
	 y/KDeTUZVCZGuvPAwN/BGNwr+e00UMvi0Qq7Ry5+Ko5wSZ9hqKu1dF5f2AjLJ0ObBn0QA
	 1nvCsDtMSIXHBfl4nDwy0cD3Se2HY4VF+9Wz9S3TdmZD4xr4E8ZgQO/T1qPx4yOSQlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501440;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mzpP0vNSGlOAIKMb5RTnXN+svoTiLHllJoO+OViBoJ8=;
	b=goF5hqntkiEtHWVbw65DVn8ODE1duWrGKLuEl7+cdemf3rKUIvZNLM0Y8HgzAKfmPxrV
	 j71lbqxN6maeX5pjnfU7XCZ6zEsrj8QXHND8t8d7vQswEWGbYInUpQQM5vgTeLns5px75
	 xcxTrOn0YjCh+AW6TmYp0izakGwE3uGNE4g6Xh3c9L0kufiTIHiGSj5GxqVY4rk878Wkq
	 aAUWdi8OaZWpEFDbm/Jjp99IAn8gFmj8gzZXYLdhz685YM9oQx4C6jWFKxv2n4UwrEOVv
	 95muHhvE2l0ntrM4qSxVXXgsrXCTRdcIM7M+tH4eLsQcZh1/qEMYgPLCkGRUCczgsmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JtbcxyRu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7C8606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JtbcxyRu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98711F000CB
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 16:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501439;
	bh=mzpP0vNSGlOAIKMb5RTnXN+svoTiLHllJoO+OViBoJ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JtbcxyRuYUdmpqP5H5BD9F2GgZhQ3X4BFDS9tojC7bnKf0d9LGYXO1gcFPdTGRD0J
	 7c1kBMoBBmA4NJowAK0IDCiDaQTFScXcuVMbLsJoKpB96x6GYiVlvMvwh9ebamLqyI
	 ut4BixsdRbpqSvI9cobILMYxqYd+Cyr2NARHym1+5aOrpEU0dSHwrSj7gT+v6FhUcg
	 R9YgfyBRilIHo8gjhloe8FtnSJhLjJWBJo8lrmT+PBfG0ncHMzu8Q0udOadlwjVk4b
	 5I0oc45+V0hkmrH3Su6AZPTcRcTcOHthAzkzZLY+O96BmlgV3TTMVr3I0GbExcp94C
	 mPO82T8tXdB0w==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso743614166b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 08:37:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFqSz4XnbI6wfE4zFCkQpsvCxUCJ6ZSfFy4J4XySk6Fb6KRiWqY3pn3tQp/qG9E2WInEFbKKstDu91fHaSZqNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OoYBWtaW2CDSoK61cv583KE/y3Iay1zVKXeG77SED/xntg0ND
	A9QxgW7Ln9WOI8hNWddsE34B93ZZIi6FY7oHQQ/LfeV93323eBDEsP6DUYyhimqdIlB1sCglsn3
	WyQbg9059ur6qHo2gnr2fUxWBdFJZSuo=
X-Received: by 2002:a17:907:6d18:b0:c41:61b9:6ef6 with SMTP id
 a640c23a62f3a-c5066b44161mr527120066b.27.1794501438515; Thu, 12 Nov 2026
 08:37:18 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-zswap-zero-limit-v1-1-19f33081b09e@perfloop.ai>
 <CAO9r8zP1o+L-akRDJx80bgGj8bf9rdN09t5upPfkduSmNKwpKQ@mail.gmail.com>
 <CAEEBa3VA2vycMaRCe4K-qnO3SGCuvAqhECmjmk6PQC3xxERiLw@mail.gmail.com> <CAKEwX=NVox_NYML-5Gg6W_gDt-j6gquk3sba9hmbvz-U+t=ehA@mail.gmail.com>
In-Reply-To: <CAKEwX=NVox_NYML-5Gg6W_gDt-j6gquk3sba9hmbvz-U+t=ehA@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 12 Nov 2026 08:37:06 -0800
X-Gmail-Original-Message-ID: <CAO9r8zOeR-t6PC2DutwuciVn5S4DYppEEo4Vquqt8gR4SaJ=xg@mail.gmail.com>
X-Gm-Features: AclHuK-7ezWbMPMvWXar6_n0m9b0WYGTxJBkL5D4Vd_p_gB_7rwyr-GwyhfBg60
Message-ID: <CAO9r8zOeR-t6PC2DutwuciVn5S4DYppEEo4Vquqt8gR4SaJ=xg@mail.gmail.com>
Subject: Re: [PATCH] mm: zswap: honor zero cgroup limits after successful reclaim
To: Nhat Pham <nphamcs@gmail.com>
Cc: =?UTF-8?Q?Tom=C3=A1s_Senart?= <ts@perfloop.ai>, akpm@linux-foundation.org, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, tj@kernel.org, 
	chengming.zhou@linux.dev, mkoutny@suse.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, mhocko@kernel.org, shakeel.butt@linux.dev, 
	muchun.song@linux.dev, cerasuolodomenico@gmail.com, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:45=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Wed, Nov 11, 2026 at 5:55=E2=80=AFPM Tom=C3=A1s Senart <ts@perfloop.ai=
> wrote:
> >
> > On Thu, Nov 12, 2026 at 12:28 AM Yosry Ahmed <yosry@kernel.org> wrote:
> > > Why is that a problem? Setting memory.zswap.max to 0 while the cgroup
> > > has active swapping processes is naturally racy. The limit can be set
> > > to 0 right after we check it again anyway?
> >
> > Agreed on the race, this doesn't try to fix it.
> >
> > The case here is different: with the limit already at 0, every store
> > writes back an old entry and then stores the new page anyway, until
> > the pool drains. It's bounded, so if it's not worth a special case,
> > happy to drop it.
>
> Yeah I don't think zswap.max =3D 0 is special here. We can violate the
> limit by changing zswap.max to a value lower than zswap.current. In
> future zswap_store() attempt, we will let it proceed if it shrinks at
> least one page.

Yeah if we will handle this, we should check the limits again instead
of special casing zswap.max =3D 0, but I am not sure if it's worth
fixing. The simple way would be calling obj_cgroup_may_zswap() again,
but more efficiently we can have obj_cgroup_may_zswap() output the
difference between the limit and current usage, or have a "try charge"
API that handles this internally.
