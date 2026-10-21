Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792541784;
	b=dm6VGvBt2lWUX2810C6iooAF5IccRfmkmB9ChXOjxA5YASB174FLK81HkjE0ILbxavMH
	 7xp2ifaYkSfLi1S0NujFeu+QcXT/AqmUavUfkJXoDg3DNfr6wzmtxDzV5WyCz33hk4L7q
	 PHNL7+8wnUopIZm+cySzA6FtDv1AsTBWbxpz4kMMcEOPoSvYswpbut8fh9XzD0kbbtGHp
	 CLQY+9voBGAr7zdE3lYJxOyxaeF68Qg9eGq4O6qn7FPGsfjFJkUWsyTPGaOVtMNlSmBG8
	 hrI9WeA3c3+UrtMrqOF+TWbeKlNFjPFBBj3Gfk33OaYsPO2s9R+xt8VGfnwNLzhV0Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JUSir2q5BLuFZXQHqg/6Fwc618wXrCwtXkLVpmVntcg=;
	b=GUzTtHEzLbwHi3yoKltbi2EkZBVmxjbod7vodeFekQ0mdZXlvy2+C/QjAnH7+DJ8yaQ7
	 jnUau1Fb2g9SHBp/M7PWFtKQwzP5TiPhOYah0Ksek6cVDb+VFFhXwuojo+wKmEgXO2ZFJ
	 4chyPfZDjHbU0rQJyEsejNMRrDlIHWisaQJ9ExtVQRPQKGJYusmUbYnREy+bUMvsjCSoe
	 nUKyW1GonlOYcAlWO3pFBwPk13K8VpZJNBKdZs1uvgOwcdVww0lhOZoWll5P2RxztyabR
	 RvMWNxlnHU+LWPZ+qzO/c+80xNaUR/mJekoOt6QkJUkDZNy1UmQuhnO0aeLanyvzswA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j1laCVTL;
	arc=fail smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6953D606A31B
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 00:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6953D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j1laCVTL
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0db268bd8so1238787b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 17:16:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792541783; cv=none;
        d=google.com; s=arc-20260327;
        b=obAGzUL/gRitJMFaitWMtqIPtl2mwAQokLlhwxu08lMgNh/TV0Cpjx5mg9qFbWGoaY
         Evbv12GqiMGPfH7/wEtAr9iB6PiSE0g7HAzrkRVFe7Hrm8LPoa0AKisl9ABNr6Ioziwt
         suRh3J7tuforKOv+sQVc1puilNcaGQhLT3BndDoWcIFYO5rhB07qXInTt9WU5RS/Mhnk
         juCCj8Jeq0DJleXCl114ib5il08TFba32/ky48CZiy7PPgMrKQ9hLy9qTiaAJzJzrPmF
         OXBMvX054QNzF1TGoo5dFiuaciD5cJbDencWDupOmSMI7e6asUSawrub2rZ/1wZ0hdSh
         juOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JUSir2q5BLuFZXQHqg/6Fwc618wXrCwtXkLVpmVntcg=;
        fh=4Hr1eWeZlxko2JYSZuXsq63lr5GxoQOEeTmpFQHkwDw=;
        b=V9K3XfY4uzf1e2kGvpXVUvq3gzX8RHQZMR0KvqzLrXvv5yz1qU8hFvNLbBN49+k4lC
         cZ2ovJsi4QkSAwfvKX7FwsZeM9D3gBixqeeAIlVgtqPuqfkhHiw1H4dr0Uy+42NCnvtG
         XL49g0YQM20FnqYKG+4iTi4r9EB8KdPyMXdY796H8Y+wLdSQTsiIkSDWw7TYGD4c/AFj
         jcCwfJnP9bNI5eV74DZL1Mpc1yWFxXGBAzYka4h/CTUk4FIPV2aGbOR3d/8X0ktFVUBK
         yxOo5nRYZmS5Z5rc3kfoOC0VyCEfilqdu9HjSNPSAlMzDEqURk8OFTxJxId4vzRUs5nz
         9/3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792541783; x=1793146583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JUSir2q5BLuFZXQHqg/6Fwc618wXrCwtXkLVpmVntcg=;
        b=j1laCVTL3txBPYjWWVpjMIQ2W6tC6XgY1+TRm+wL33VlkQbBtqK8U7eyHWJBWr0ZTC
         PkqKCrkqaA/NjCIYOCiDEoru2HXRs6UQv6hZ/RazF3rEYzZuTyOpoHT1dyeizutAMBNf
         t/J4PRb+Tb03cJsc/ZIn2j7ZcYVn+g0v0QErf9Cb0V1ioCd54BwWkxiKI5cSu+fY56tp
         ZXtD8eqwlrmtIigiiFGvEwHk2mAp3USp44VwQisPJ/AGz4np8T1iyCUuuVmyvdvUmBog
         fS9JwiS7jsfQGtpenWyZOyzzGB7g2PnyQoi1qj1lrC2WRatcz2F3vbgY4iVvMMWPEpsE
         2/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541783; x=1793146583;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUSir2q5BLuFZXQHqg/6Fwc618wXrCwtXkLVpmVntcg=;
        b=agPRTAIjakezCNZUtxunjFHPrMKE9omoQE8Y3YP3tZ/24JTTwpp9qegz/pZfLuGIDU
         +pdwQO31+GSAXEK7ijCBxJtv3In7ft0Tewl08RJA4glcePsn4wZ0CARbo0IxgOfm8xlO
         btRcR9XnQ4yfn2Y2BqLjW8h2mlHjRD5TRNUswwUlcRuyDuUndcPgZq24p8+7YAvzVDBK
         IB+BcggmonQWNwQA7CJq+DRyOeuh39Uv+eQWIKlISbIiAyBnlI4bXKho4HBUx2k0tW4V
         CJeNxRoFDfH8lVWFhq38l7mcApvNllqDTDgfGN450Ami93CYnZejPqfo4eqgFFVFZb9a
         tIYw==
X-Forwarded-Encrypted: i=1; AKwUvBy0dEYp8IIDq1p3o83qiLcJTCwWtu1n9gZ8tpEzrIdF4iw30VT92RarSIhXwYp7PTqVwFhLCWcH4CymZnEqsEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq/kt16zAi81XKBi7ov01c1ECoFfF83ttadT0mFWtTFvWNaGah
	Y2qFHm1iLbWE5irJokgjtVaXK5rYV3a4uOxOQ0SL6gO5xVvPqX0rkvVTE2tmOdtO8uuIngx6J06
	po2ydYkbgRspvnvzi8tXqXevHaXDpHkY=
X-Gm-Gg: AYBFou0jkSMzq/pf6iqx828ioNc3zDNZ5qhzNDuaDFVyezdfoPvkxTkIlwFiMRrgvBz
	2x0OTsXM4EEYskCbcwDVimf8pZj9TrjgE0MVSC/BaKiSu2gOdJPjfIjKKYoKXgxPPeb17QJGB0O
	eeoAvVdeeVjFK/tFUPDQMZNMpHnKwlVaRIT02P2kHT1EAlbHQXg0DAr8FPYkeYVSU408HbsmVOo
	+gRnOHalQnVr/5zNcjDoA96OnaJPumUAeKzE+2OrZnb+vukrZtgPUI4SLOiMSdPwgn7bsjv04w5
	B/YwvQeWQtzIsXLhBR2r/p9hJLq4CFYmp3rdkMtW5eUCqQ3ZG1jnpp5c60huY++PkzAIN2WIYYW
	pBE5u/9irCbl3APfDsL7yHo3jRlillLA7CXJVUcLl5nriGe4/waa7Fm35cwf0FBp0o4XOgg==
X-Received: by 2002:a05:690c:660c:b0:8b1:ce5:be42 with SMTP id
 00721157ae682-8b133fe3435mr2771807b3.28.1792541783308; Tue, 20 Oct 2026
 17:16:23 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013181932.1739238-1-listout@listout.xyz>
In-Reply-To: <20261013181932.1739238-1-listout@listout.xyz>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 20 Oct 2026 17:16:10 -0700
X-Gm-Features: AclHuK_gZWAJUCU0Ubmw8jXYAFhpzdlBus0Vb1Ad3mAeDSuigAmuyURzHqelNUE
Message-ID: <CAADnVQJ5s1MaFhFQ7Djz0a_ABumiEs9NKCCmGAbkeE8TfuZNZA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/2] selftests/bpf: Add tests for memcg kfuncs
To: Brahmajit Das <listout@listout.xyz>
Cc: bpf <bpf@vger.kernel.org>, bdas@suse.de, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	JP Kobryn <jp.kobryn@linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:19=E2=80=AFAM <listout@listout.xyz> wrote:
>
> From: Brahmajit Das <bdas@suse.de>
>
> bpf_get_root_mem_cgroup(), bpf_mem_cgroup_usage(),
> bpf_mem_cgroup_memory_events() and bpf_proactive_reclaim() have no
> selftest coverage. Patch 2 adds a memcg_kfuncs test for them, plus
> verifier tests for their acquire/release, NULL and program type rules.

I don't think we need to test them.

pw-bot: cr
