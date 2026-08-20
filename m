Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B148035E1A9
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236360; cv=pass; b=uZi5Wv12+2geczH+r4dogdpiO+lLdJK7m1CfKXaQ8juaYE4LrfACV+psGFYn3v1tO0M4yAMYVbWDTsnUsCznTN6ZFglttGqhVthI7cAn+TvEaPOnMchb/+zTYX6lw8YltRgpusBciU50j14eLzK3u4mk5eeD/ze1ZTJ535r4VAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236360; c=relaxed/simple;
	bh=iVFMjvn9SUD7pKojotlCKMZegYxIIGk7ZsgmUorjlPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLBTt8SloysvNpcQPg2yD6OZtUp0yv8fyRcVgGYsCMsy8whSSIeVlw/GFK0vQhDEWMMe2zVEwQYUBtnPc+F/LxaSYrCNyXW/aB6TfqlHJ15Q/7Uikyk+shv4SgOM5X/uSHk7Ug2OgT6Rz/uj0rKoozjh0xqtGCexi5oOde/UGVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWm1ykYL; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWm1ykYL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cace91f112so22716675ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 07:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787236358; cv=none;
        d=google.com; s=arc-20260327;
        b=fEnmJnrZQDJEAJWuv9xfqImvyaOOzGRstdki37xmJYTfEo8tMTloSF58n5hckh73El
         k1E06r4K0i9HiWC8r9G1CaIgziUXERVmqP/ZUZfGrmwcKzV9C1ommEhhv17kr/hoS+fi
         tema/HTqiqRuVEu38IXL9DcXc7Iw7qeEpLY88VFeIq/DdqyYd5vd7nnQdmdFP9dy/aN9
         5dAvSoM3YESMzB3urRtGd3WgoD08x5zBBwncjL2bpQBvgUll0WRlE1lC19Npbzajt8wE
         BvCtiykx/KZ+VAdgNoS/gbbrvPqj6t9b7GQJfVmA+sVqqGYGRD2IJ9qeXMSLIgpS1/Ez
         ub6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVFMjvn9SUD7pKojotlCKMZegYxIIGk7ZsgmUorjlPs=;
        fh=0WRufthN306OxfwzL8OCU+/TUsyYnnh856HxVTNJLe0=;
        b=H3CSbb6lLt0Kvl9tRK4zfHAd9+rlUJgzJM4AQ5VWkBC3UU+GvAFjd+5dnGAFg/IZcO
         y5pX7x2aK6Llmo9VO/tRuam8n1C+oLip8ZvyoLlI7z68lvR45/kHWsvPzuRC5px/ybut
         KSeFn8cfn0TszHdwK6laH0FicSeQVMGn+A9i3iEIcO5nzUuEd9EnZMzPlBfrg4ahjVei
         rE/8ZjiUGPJP6nIjKKXQiB0MnGmJibXNx/l6c9o5anCkFPBUa3n+0YLZae2Fcafp/2xL
         AWVJKOpT8I/NU2PEvwLs1gpKehi90QURL71cbKZxl6AalYhBY43iciyu2toJf0kjowvL
         FXhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787236358; x=1787841158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iVFMjvn9SUD7pKojotlCKMZegYxIIGk7ZsgmUorjlPs=;
        b=bWm1ykYLYIK6pQyWGLVe8Prr2V4qSEMDi6uBVECBDlFbakc/OQocGGwO3SZkW0zwxY
         h++ifEi2JpUqSIgpuZEAHr52eLfTpmvS68cUUadwtC9tgMRRPWaqi78JpeoF/wJriKVt
         bhTNsuHEmbXF80bOitqSa4InQMt1nxdtZ1v5VpcYCYVuAdrr7eKeDRlDAUXbEwD1Augz
         J+ZRakkYo1OHdurvnrwcQI8DTSfKPTwEiGk1FwbtlpobDGa/aGJLtijOXOwzmpo5EX+B
         Ta67BiwTj9FYTYzYanHXrDCucfcq7Nd5XatvhUUKAAvVKPYC/w6gUGvBOJTlSRfwBILO
         y9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236358; x=1787841158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVFMjvn9SUD7pKojotlCKMZegYxIIGk7ZsgmUorjlPs=;
        b=Fxz3pIr+X0xX2wg/Gfj6mghDMQfCkm3YZh0sz+AFFyHZSVSNbjsm5GONstdF2Acmi7
         yXtqezZ9o/3aVizIvxJdxCvHINvWcYOcZVsjtSSIkAtTXQUSxEZhZETvjmPyi7cVZ8mb
         ysFViYg3P/OC1nFzFDGHQbnNe589mgv892rla961Ld4dG8XiwRu2sjewHTijLUNx763L
         dVwKWJTrQQEfl02bUTbDDu1Jda0P5JbNKMQqSczopkkFsi87HtELqb2CKGsEaky+awMN
         jkVxvZDxq86uO2MDjEVu9M6pbvSuA/l0yL20kZdg0D81w6P/rN9N09JFdbiKTiiFh248
         cKFA==
X-Forwarded-Encrypted: i=1; AHgh+RrPic004TdzsXQOPt7W74QB516Ds35svEXFoadu5suxZ20ryY1PT5qGfS8XRaYzLN9SzWS45MViwBHDf8KixPw=@vger.kernel.org
X-Gm-Message-State: AFuF++k+hVcyq24gKhbK0Sev1RNXDrLiYX+RV07o3678EsokG4RwTbic
	WsrQt5E4aBcbHOcpELUMDuzkmnYMZxghS+FxHXWLTRY/3j6HBrD3LYpgA89dUiOjYwkQbPr99Ew
	NRctrUSjCJjMb5/KMqQhC3o9YhT/0+ss=
X-Gm-Gg: AR+sD13WFwdHadHkSLYtz0v4F6UgvDK7PKCaoTJiMuTEF43/AeU1qubeVV4aaMrSW7U
	Lfmjenjt4/Uc41AFRebAWxeG7z40qDuSqKrMdIjINGGXyVYkAOrd3CzhlPSSSwYe7iM1mXkYKDv
	MGQxxPeLIkCQQiNcojs/DDrD4wcF6C9LgmoY++bQ1c2ZLFkSpjf6xRmChTz8RJx9ISqu7BSiExL
	Xa80mySDdACbAjBfaRY9O0lrf9eOVX0A1d4ZaA4Si4vqR0ZpX2Fp62BhcytB4+LStiDPrhNBr3k
	mubw/CEEBEgahHANNow8gezJIUXPIb6UnaG+UHFRTMxp8WFm5rZCaWSbpn/sOEiqiib+L8GfHpu
	RVw==
X-Received: by 2002:a17:902:e94c:b0:2d5:d9c2:bbe0 with SMTP id
 d9443c01a7336-2d5fd621427mr253857535ad.4.1787236357878; Thu, 20 Aug 2026
 07:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819121426.49500-1-anshumantewari123@gmail.com> <20260820001356.87221-1-sj@kernel.org>
In-Reply-To: <20260820001356.87221-1-sj@kernel.org>
From: Anshuman Tewari <anshumantewari123@gmail.com>
Date: Thu, 20 Aug 2026 20:02:25 +0530
X-Gm-Features: AcwNN1WuTIi0xtCCzqJlCIf1670T4KxEdT7yFZVw2e0Bj_JWwCiZ_JWo-NdU9zY
Message-ID: <CAJqi8kJ8w1HUwU4tR=KZUC+9GMXJjO1-YLqcD9+s_a6tSA9BYQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: check stat() return value in khugepaged get_finfo()
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review, SJ =E2=80=94 and for the extra maintainer list from
--nogit-fallback, good to know for next time.

Anshuman


On Thu, 20 Aug 2026 at 05:44, SJ Park <sj@kernel.org> wrote:
>
> 'get_maintainer.pl --nogit --nogit-fallback' suggests adding below recipi=
ents.
> I added them.
>
> - Zi Yan <ziy@nvidia.com>
> - Baolin Wang <baolin.wang@linux.alibaba.com>
> - "Liam R. Howlett" <liam@infradead.org>
> - Nico Pache <nico.pache@linux.dev>
> - Ryan Roberts <ryan.roberts@arm.com>
> - Dev Jain <dev.jain@arm.com>
> - Barry Song <baohua@kernel.org>
> - Lance Yang <lance.yang@linux.dev>
> - Usama Arif <usama.arif@linux.dev>
> - Vlastimil Babka <vbabka@kernel.org>
> - Mike Rapoport <rppt@kernel.org>
> - Suren Baghdasaryan <surenb@google.com>
> - Michal Hocko <mhocko@suse.com>
>
> On Wed, 19 Aug 2026 17:44:26 +0530 Anshuman <anshumantewari123@gmail.com>=
 wrote:
>
> > get_finfo() calls stat() to get metadata about the target directory,
> > but never checks the return value. On failure, stat() returns -1 and
> > leaves path_stat unmodified, so path_stat.st_mode may contain
> > uninitialized stack data.
> >
> > The code then checks S_ISDIR(path_stat.st_mode) against this
> > potentially garbage value. This can produce a misleading "Not a
> > directory" error when the real problem is a nonexistent or
> > inaccessible path, or, in the worst case, the check could pass by
> > chance on garbage data and let the function continue using an
> > invalid path_stat for the rest of its logic.
> >
> > Check the return value and fail with a clear error message if
> > stat() fails, matching the error-handling style already used for
> > statfs() and read_file() later in the same function.
>
> Makes sense to me.
>
> >
> > Signed-off-by: Anshuman <anshumantewari123@gmail.com>
>
> Reviewed-by: SJ Park <sj@kernel.org>
>
>
> Thanks,
> SJ
>
> [...]
