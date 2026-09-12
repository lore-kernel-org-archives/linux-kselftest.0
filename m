Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478743B19AB
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 18:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789239103; cv=none; b=jWHXtoyzZmlYm9qmKPVoFro1gV6viKMdT+/jACIWXE48XNTIx06DJaFFAJUaMw6zNtMlC7BieP94LRdBTBX/2DaijK9hQgx98DwmlKVcqced7rC6hlO/1335YhqjZgneGZ4ywQ3VwtbkQkdDtXP0V/ckY5RH4u344B2XkIXlbd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789239103; c=relaxed/simple;
	bh=cz+Iw+9oadOcnbZ190k9VcVhvOaR25l5A7IKRmwRNOw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=a6SoNkGSoFhsIfwZzFdUkrllo6lx04SvHGPvNl2aouYyee6Cy8oxBk0w8ifAZYi/8lfeEB+GxYcYnydg7LoE+F6L1vA+IIZeP9XIUyV0j5m8EewcQkQY6l/cC7w/Ib2pGKWKNcaPDctCn8HlE3nW6qrsJalpi890gq7+wzNqWF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkUccQP1; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkUccQP1"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7fccba9c675so2296715a34.0
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789239101; x=1789843901; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RH8hnLpRglatc+7F+7cXVcygz7RNap9bF3alqePjg/U=;
        b=HkUccQP1YQqv2cH4wjSzxuAD1hBIGOqXixHVBqmHxPtm05FAJjrTvHVI5wgCKWb3b9
         k6I2WU8n61HRRq2jESERPNl5ejz49JVyQYSv1peU1emuVETPL/Z0X1qxqb/EEgd4XggF
         1yjo9Uu2p611eKe0mFPDiU8rrIt4AkjAXUhj4m6lvJtRzrW4xBTKY06zZyUCJPhGomDz
         BRviLvdEyLjigEFXGviyETlcItOz8ZbxVtTLhw8IamSIeo+yNOttmZkM/k3H1jSwiwC6
         6EzNEyxcq1f2FTOEkr4Eq8l+tn5SmnHWGxQ6IfRvLUIEzd0NG273j+7hIszoW3tAML+W
         DBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789239101; x=1789843901;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RH8hnLpRglatc+7F+7cXVcygz7RNap9bF3alqePjg/U=;
        b=nFhn74OGARKnANQ40vuqEmUhOdgMiLNz1QXowipsteXkyigeeZh/IPk0PxakiSmdQE
         mNRpmuQZr/TUZ35QJ1acF7HH69LmDx7hEY0HASt/eLFDdGX5EW9YfrbBt+zlfzhWaufC
         5fPE+BFU2hVsTeDYpDqu8kqHUAomNkk4Q7dWa+zfqZNrtZ5/LNFoneFM6D33Jtf8XF8O
         ASzzt5vVRinkgnqICyLGSmxHoBzWhExwCtnTd4ZC2UKY7YEqy1w77K1VtjMbA/2eXq+4
         CuiFZevriVc3519CPeNISk5LrxwuUWDw1+m6fkFCLsilnFw07caQY4MRliyI32KnNhY3
         w8HQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5mjUrwwWjTpKubU+vV6MSXr3HXAsttHNeEy8jiywdoJVVQuA7nzGbd+1ockvgVW6gwZtH4zyxKMMy6rp1+/o=@vger.kernel.org
X-Gm-Message-State: AFuF++k2YGqeehs9nxeO7VLMZUqqcZWWCo1HAvnYIyUBz0whHbh7dL4x
	O661+DDG/4MFsxTN9t28pAfLEekg4r9l/8j5DMc/2+TYVic08gbLXzew
X-Gm-Gg: AYBFou0J/Ryic4VTv0uKktSTRS7JjtpXpEM4ci/cgYpIxhM7xJf3NTw2sfpfYjkKqpp
	1qu/Qhm69jyPSx03JiZtaHocDfexq0n1hPyvWlhDDBp0s0U5WrMZWCUQU8YmlINbZtI9b8ByRVF
	0hcmIE45r08OQyqwI2/haUQI7J4NZT+UKOGI6kTlIrK00DBEgdrgBf9TMVGEThFV/f6aWQMprhT
	P2p3sGMeVX1Q+LkWmnvKI2g01IurnJm+OJ5yEC6kNJVYsKMP25lH3PatJk/uJfUHry/P6rDpoXJ
	+CpInwgARlneWJHTA6qdJnDpwNOyETnwL/LCNZLtOQNRbf7bgfbw/2beLgWGxfqlCFt4VtplVkn
	m/eBeTanXBh4o5R6r7sLN1mmb9Oyst2BNJTB5TG5Hep3LiqdDura2j023aQ1daeB5Xb3/1B2Xhw
	qc3D5+6xtXqIT0UD6cKkgzheYjtgdMdJUfn+lo8Zac55FaM8jd8O35ht+McVTqh+cV6V5s5o+DW
	0PcPf+u2/BViEruX3WEQZWs0DZh9qDsUUBvBgtdbkma0SQxoAEkl7+cwVwXTmNicOZdUuh/9z6e
X-Received: by 2002:a05:6830:6e16:b0:7fc:8596:7448 with SMTP id 46e09a7af769-8027aa42d64mr7794583a34.10.1789239101122;
        Sat, 12 Sep 2026 11:51:41 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:59::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8051005d845sm4196181a34.24.2026.09.12.11.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 11:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 11:51:39 -0700
Message-Id: <DLDKBR3Q9Z7A.23CDO8IOAPZYX@gmail.com>
Cc: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <john.fastabend@gmail.com>, <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 02/13] bpf: compare linked-scalar kinds in
 regs_exact()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>
X-Mailer: aerc
References: <20260910164635.459558-1-vineet.gupta@linux.dev>
 <20260910164635.459558-3-vineet.gupta@linux.dev>
In-Reply-To: <20260910164635.459558-3-vineet.gupta@linux.dev>

On Thu Sep 10, 2026 at 9:46 AM PDT, Vineet Gupta wrote:
> regs_exact() memcmp()s up to offsetof(id), so it does not see ->add_const=
,
> which sits past ->frameno. Compare it explicitly.
>
> Two cases go from accepted to rejected:
>
>   old {r1.id=3DA, r2.id=3DA+delta}  vs cur {r1.id=3DB, r2.id=3DB}
>   old {r2.id=3DA+delta32}         vs cur {r2.id=3DB+delta64}
>
> The first was rejected before this series -- the kind lived in ->id, so
> A+delta was a distinct idmap key -- and the previous patch lost that. The
> second was accepted before the series too, which is wrong: alu32 and alu6=
4
> deltas differ in sync_linked_regs(), so the states are not
> interchangeable.
>
> ->delta is inside the memcmp() window and is cleared together with the
> kind, so either case needs a kind with delta 0, e.g. "r6 =3D r5; r6 +=3D =
0".
>
> Only states_equal(..., EXACT) and env->explore_alu_limits reach
> regs_exact() for a scalar; regsafe() compares kinds itself on the ordinar=
y
> path. Neither is easy to drive from a test program, so no selftest.
>
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> ---
> v2: new. Splits out the comparison RFC 3/6 lost when the kind left
> ->id, which was raised on that patch.
>
>  kernel/bpf/states.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/bpf/states.c b/kernel/bpf/states.c
> index d974baad37ee..5505d7aaeed0 100644
> --- a/kernel/bpf/states.c
> +++ b/kernel/bpf/states.c
> @@ -475,6 +475,7 @@ static bool regs_exact(const struct bpf_reg_state *ro=
ld,
>  		       struct bpf_idmap *idmap)
>  {
>  	return memcmp(rold, rcur, offsetof(struct bpf_reg_state, id)) =3D=3D 0 =
&&
> +	       rold->add_const =3D=3D rcur->add_const &&

This change should be in the patch 1 otherwise patch 1 is not correct?

