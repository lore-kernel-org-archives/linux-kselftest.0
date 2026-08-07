Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA04837266E
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112658; cv=none; b=UOm9jAt2e1Co2qW1+oqbocgD7EkGw8cVDmsKLn2uRCEwkmsYphbpqkKSWnhVvNJYPnUL6Cd8cwPZ1y34NWSqx4EnS8JbfnIFXhQVxnNKOfX1/Mzsvx2qm4rAymUKHFyZRIIR7mD2Yu8cE+mrJ6KGJXlV0vqjPAJriimspzQLxNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112658; c=relaxed/simple;
	bh=G4JigUvci/jEjPBhVDLUYj0Nij9+zOu5w/lLNwfurek=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=qK4bNoLT2BITDntGPurxPA3CaKh+hb3hvGt53aG3Rcvf4+LLf9R1cUUFXp+InaBJ90rv5IcX+BO+bm94GdRRTWh33MRT5eT6oe64zNcu9nqBv+txluuIB2cO/Bp6bY0fGL0PAhOGKnWO9cT8z85fdbDH4jAB6VGLxV7oKG7sAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=r8Us8PZr; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="r8Us8PZr"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6acb63301acso1639352eaf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 07:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112656; x=1786717456;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G4JigUvci/jEjPBhVDLUYj0Nij9+zOu5w/lLNwfurek=;
        b=FJMc6VHnx9lTlg+XO5TVX390NyHql0swrrlFIWykZ9mLxWmwemgYBvBGsJDYc3inie
         IDwzgQfEquu3js80//n8JxTR450/iZoFhlkxDVlA2QYrIg5sAI7c2KLcMX9b5/YjPnIA
         AdsKxIF03oxQL8STEVjbMrJL3gld0kVtfptNfl/sgJmR3khZknm+l9nhF7Y/Hg7kBF44
         wD7bw5CRQcxdi65IdDluRlpa1gaEbghHtw3aLphK6EfzC9oYNHXbhy6Xk2LlVEWECWQn
         FBKizxbJW1x/g0ZDbfk5CT/a5OY5EDL54j3WG97bVYFfp/FUhw0k5LtC7kn570uMwEWW
         nDlw==
X-Forwarded-Encrypted: i=1; AHgh+RoQRQ7Ukrad9sHG0ji51Re/c2A1884FDmSem/o2Y+9DwTybRwBS7z06cRJ0MIC0UNYHrPncEStuxcB7XPIaEx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4RlIcLO3UikfAnfHFmuooXmNkXNCD3aWTeIklr+fSjYz19P1
	TYHk2Jr/Bs1OZeFESB2xhRjWgJ8f8NIIVGznfIyOwAwvShB7ESmLVvYU
X-Gm-Gg: AR+sD12S2LUtWlnqJ92yUW+vLqW1A4dvLw/erQiJsWhHW7I2aQgFXooDQF81YdI37iw
	250R1WHq4X0bCPHFK8SXzzk/0hJXpRHXEM5/o7aILy2Tq9InDOKqF/Xjr16XT/2CC61OhjMS/au
	4aL+WtNiDn2D+30IaS3KCrZZmc2hXONJV1+VjMR3vEe+ktcVUZD57bwttJ19DkHLzv0JKxmLYTF
	ZOLykIaLd8OxtUZC+CSZISIKuInaNpYduaDUtaz/2HFtIU/rfchySmH4zus68rHdNkc55IlF4U7
	VVAFX+DvWp0WVsFubGZcJ7Qdw4tN9gJ8up8b8QkvmF0RtC4uUjWKutD7HOXaqXLTP57N66cRPYq
	7FLKf0yBN+3yKVKgHVRKYGp2ipIWY6CdN1HnvZrK5YEZwCgAfYyQduZIgQubEx+REBEjgbJR/jX
	k9V9MQEulIsdf9aSd7ErWag8v5qR7k309mVSvaPF17ISDCkW5KNGIK+zX0uNa77Sr0XRowfSq3B
	9/1ZFs7VigZrNoEqQT5ZjDA6Sg+iP+0eZeLiGR7p6MhfrBOPHqholPWUFTlmhXE3ZCb8uASI/jS
	uWk=
X-Received: by 2002:a05:6820:f007:b0:6a1:451c:9cd8 with SMTP id 006d021491bc7-6b042da34c3mr63442eaf.4.1786112655683;
        Fri, 07 Aug 2026 07:24:15 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02be475b6sm2408541eaf.11.2026.08.07.07.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:24:15 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 829D6609E3;
	Fri,  7 Aug 2026 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1786112653;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G4JigUvci/jEjPBhVDLUYj0Nij9+zOu5w/lLNwfurek=;
	b=r8Us8PZrMwruUGV62MD2igliPvDNuaD/ikBeMxWX6pa2xnEZds2E+peKfy97Qrh4E14dtW
	qiwedx0VHfVUM7V/ZO9sZ4oh0s3uyhHvnrQBVgDEDa/080pIR473B+gPhtjCmAvIgmV6Hs
	KFbUExcXyZM5ZmlIF45ZKFiE4V5peU5CSxNaj010+z52rmhOgbcnGy0VI1PmcbZ+Y3OXzf
	uHNF1eyEQQl7Qp7O4XjIfScLSlHJx6b8vEs6PVkWxqie8QbZlBJ2ddv+nZTPk5jp84dv06
	ORtLPshfw2pU7mRJHNPuJ9mzbxTWw8CpiVZKT/iBEGJo/ufZMqMCddResgZLzA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 11:24:08 -0300
Message-Id: <DKIS3B7UYPHB.2DJBGSQH050R7@marliere.net>
To: "Greg KH" <gregkh@linuxfoundation.org>,
 =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
Subject: Re: [PATCH] selftests/bpf: Fail unbound UDP on sockmap update
Cc: "Shuah Khan" <shuah@kernel.org>, <sashal@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Michal Luczaj" <mhal@rbox.co>, "Kuniyuki
 Iwashima" <kuniyu@google.com>, "Jakub Sitnicki" <jakub@cloudflare.com>
X-Mailer: aerc 0.21.0-146-g87073a0460e3-dirty
References: <20260807-selftests-bpf-sockmap-v1-1-8c4936fa03cd@marliere.net>
 <2026080745-difficult-batch-6866@gregkh>
In-Reply-To: <2026080745-difficult-batch-6866@gregkh>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Aug 7, 2026 at 10:58 AM -03, Greg KH wrote:
> On Fri, Aug 07, 2026 at 10:45:27AM -0300, Ricardo B. Marli=C3=A8re (SUSE)=
 wrote:
>> From: Michal Luczaj <mhal@rbox.co>
>>=20
>> [ Upstream commit 203b06932777b9ad5085319389dea566f5c2ca63 ]
>>=20
>> sockmap now rejects unbound UDP sockets. Adjust test_maps. While at it,
>> check socket()'s return value.
>>=20
>> This effectively reverts commit c39aa2159974 ("bpf, selftests: Fix
>> test_maps now that sockmap supports UDP").
>>=20
>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
>> Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
>> Link: https://lore.kernel.org/bpf/20260707-sockmap-lookup-udp-leak-v4-4-=
f878346f27ab@rbox.co
>> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>> ---
>> Signed-off-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>
>
> This goes above the --- line, right?
>

Yeah I'm currently fighting with `b4` in the stable workflow :/

> Please slow down, there's no rush here.

This is actually a different commit, I sent before seeing your reply on the
other one. I'll double check before sending, thx

>
> thanks,
>
> greg k-h


