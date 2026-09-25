Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98E3408028
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324118; cv=pass; b=upuFi23Xq0imZIuJ11/nbV/Ec6FXRY/LbAZsuIz3X/RJQH+nY5OrFOwWBalAIr1zy5IaDDZTwLx5NFehLgt1vgf1s+vxbEBN+w9q5enKRcCJmALBD6rNo/0VWWmsNH2D+SPCqLMlgUjvEZFAO4K3sofMEkRx5DjnsRLdKJyVnGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324118; c=relaxed/simple;
	bh=e9bwDVgToGQxRvIMHPqC+Mb7m3W1s8vvgzUSnuek99M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osgevoySYXpdb3Yan28ttL8WhAdKGysECao3Ya8NWdJCzbxy9FeQOkFa+1uhy1vPrQ00hT6b/T19EJqwDV8oGcTA7YZR96frKWl6YZw8yDI1yMC6sltWk9nfzU64oUmL/t1iR92m5RX3J/C1/xwx9GPGlMX9i2QRCqP9EUPk5Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=WwrvloEK; arc=pass smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="WwrvloEK"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1438f55921fso221214c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 01:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790324116; cv=none;
        d=google.com; s=arc-20260327;
        b=j4ZovXzMbst7OFaJ0Vqznf9VBGiR12wy0LBSqVT2edn9KxgJ0lsR4DVqLyVbWtwxfX
         LMzYkwW4HdrvV3X9LpMwa7rt2aR+6lKRjPFwrjEYY5dmu7v0/qVbFwA7XGRQtyuvM8K6
         6AZiz7dTjd5HJBKA3bk+AAIj3qnKjqTwIYTv4eoy0w3MRNbbio25HNEP5nBc1u/rrJaG
         QYGtDDJaBHccuhx8AY4lrkkPCsZjZWn6chpDg8rjgkttt3mlmQD9wWnbzfN3Rtr0P27D
         2oA/qXu1z0LOJkdi+dWnzvjR4YtoTaPieIrrq1W61sxfBQiQcwp4Ahhvj8wAh9LUeGvL
         P8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e9bwDVgToGQxRvIMHPqC+Mb7m3W1s8vvgzUSnuek99M=;
        fh=5Q5+kP2RAbvtRf9DhFvpzjDHc6VGm1v+XQbbGTYHnZI=;
        b=CWF7QX/D4nbrstph/8ok/WWDJ+ONp+oG3WzunbylbKHmj/J0oD73QttKKf8WwjuOvd
         ctXA1I5J0DD1U/64t6pEtNAKbyzGyxiLZSUTxkgwEpx1JgomF1bTApeYl57pEcrGJfrp
         82FMoTvHZT2BiKnak3GuY7N6XXGHM9qQ4pNljeGp1x2qOAEHTCgn7GesF8KaWhbflT2R
         gCNZbVWrN6M9J2qEnpBv1jCc7i8jVD0VYM2TdrKutDHu1AU0TREWz/BWs3noiQ++ls74
         oB2qYuCZNGrzKopn/GdOZAPIQTT5DFXgl2jQqf8rKj5t/PYp7KA/kJGdsO+De5sUD5ux
         KW/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1790324116; x=1790928916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e9bwDVgToGQxRvIMHPqC+Mb7m3W1s8vvgzUSnuek99M=;
        b=WwrvloEKQRmJxz96JeAxaDBTI9uyFacekm86owd0bajAuSQK8Ft0XdImVuwmlS/o4d
         ojg0wEXkvJEg4Y42VkD1b2YGlSyHH7Ihi/OKczxbRkEs6zvnTxG34E2MeS4AbHgeKV3I
         lQkB6XHEDgzW8d8ktvU8Z02gAyyGAvPtGwqrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324116; x=1790928916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9bwDVgToGQxRvIMHPqC+Mb7m3W1s8vvgzUSnuek99M=;
        b=yJMhcj9dmefusfmTMOinOwT2+J/PlBGLwPJ15khSL4iHooXW2ruOPwQg6F/Gi7AU1r
         5kjEL9wtyZ+ust9YBzLknnJph6gegMG5NSp/totPSpHFR3rwcZ+/Sd6FqZPWk0RWWKNw
         jfHblr80lweWOnQfzQpUA5vyg5p80hkxvBuUrr+jnmKFLdYawwEakjimRITsasgGPi9A
         8pIDP/N0Xl5zcIACAQC4KQZUXj81NlcE5TlG9eL1nUf1dOHC5AgicxZd1wsj6RQezFx4
         FdxOQjH04K/KyL5gFLUdGaNPPn5asEzU/5JlICBUNQnoYqdrYNpoyaeeXfX/XU5Hh/0o
         9tLA==
X-Forwarded-Encrypted: i=1; AKwUvBwNlBX1XK0S9KZaT8GODMlngE6Z35fr5StB1miTdfbXs4i2MamUJfKgsbEllfXjCpgb4usj+YbZ6olS0ea0qDw=@vger.kernel.org
X-Gm-Message-State: AFuF++naeWNkpzYPUyWw+YQVFh53y30ReaoK1VAmvY7ODKwQMEj3J6AG
	YMFb7aMNgPRVBCQ1pRLc4V3KCR8gUbg6izuNIDpYGSOC5bFqmP/oOxVGGgrKJ40d8vvlGRsMXiF
	R1yuuO4fgjyhXglo4RYRpS9ycUAwjDDXNjF+XMSbs
X-Gm-Gg: AYBFou0lSLQG0vEQBd9Y4mOgG3lRU3naO5Pi1LW6W8/3YJBYTmAww8RxTHQzVH2zjNo
	d9sauKQdCNoMF6661mvWd9SnJ67EzBRX1JroJUPnpDc4EawJtzRAJrHYftfCjgC5e38L0OW52Is
	5bkNLHJ2xDad4JjW/Vox33JgFaZ+IeUQaIpvT0KiZKYLtOZ0xz4ZbyfszSmfE64MnZ5/W+1Y4q/
	lwCAAKXOJUfO9xqdbCCP66bQgU5OHePe19IVA6o3GyBwhrJf4rDjg6YqGgYnSwdiyhAlurXa98+
	oLyUWgSP2FmrXRy7Aept0gTHB6RJsrRZF/9l8oC2E6sF2MVPN7rZRvlP6X+ixXtlhX1Q3C+NzjK
	0iNW7MbmebnATl1jevxT6y5MM80eI/GkczO82xTggyPZh4sEiOfSfxYl0xtc8bBtJwvZ4kvdU8B
	BtjJXnVHn9Y3p4CcCrvMxjtjYV
X-Received: by 2002:a05:701b:4507:10b0:144:ff51:2d5f with SMTP id
 a92af1059eb24-14503fd76e3mr3874323c88.33.1790324113884; Fri, 25 Sep 2026
 01:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <QDISC-K1TH.v1.20260922072206@mojatatu.com.2> <20260924103222.239e3d45@kernel.org>
 <CAAFAkD8goF-B2qP41roK8OipD7TRzZfVEdFDPxHddB5Tm6VhCQ@mail.gmail.com> <20260924134244.1824ed80@kernel.org>
In-Reply-To: <20260924134244.1824ed80@kernel.org>
From: Jamal Hadi Salim <hadi@mojatatu.com>
Date: Fri, 25 Sep 2026 04:15:00 -0400
X-Gm-Features: AclHuK_bO1J2wnqkg_eMZj4WzMEH7NJ1PnuSwFWouftz7ozod-Eh96ddHNl7pus
Message-ID: <CAAFAkD_S3EwTjGXX7YZRLSQZgwX5un0Td9ru8r9chnAMk3ni+g@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: tc-testing: add duplicate action
 delete batch test
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, Victor Nogueira <victor@mojatatu.com>, 
	hybris <hybris@mojatatu.ai>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 4:42=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 24 Sep 2026 16:09:16 -0400 Jamal Hadi Salim wrote:
> > On Thu, Sep 24, 2026 at 1:32=E2=80=AFPM 'Jakub Kicinski' via Hyper-Yiel=
ding
> > Back-end Review & Insight System <hybris@mojatatu.com> wrote:
> > >
> > > On Tue, 22 Sep 2026 12:33:59 -0400 Jamal Hadi Salim wrote:
> > > > Subject: [PATCH net 2/2] selftests: tc-testing: add duplicate actio=
n delete batch test
> > >
> > > ah, here's the 2/2 patch. Patchwork did not figure it out either :(
> >
> > repost? (2/2 was stuck on some ether).
>
> Yes, please, repost

pw-bot: cr
