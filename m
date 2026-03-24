Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB763491D6
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774383695; cv=none; b=CxhE7pZuNtH6neuAT5nRw5Aco3PV+ADl2/Mz6wv+2+yOcJAZzGbaoaG2ByzmiLlSqQg6YMFeXpfXOtjLkIljdhRbfGh5Giv3s6DTP0t/Fjbx6aapoNMG62HZcdrmQTbzhA3J9KU0SWndNblPQ///2S3LU/85RQcOuYzjAIYy0SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774383695; c=relaxed/simple;
	bh=YekaUXXUymXZs/3g2Vp+S0NZBc707UWzjqqiXrrBWgU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y1toIE52QjJJqxzkgMrMTkYgSyizi6Z3gziuy5Umbdg/1lXOyI5ziwmMfCTi5jKOxyQhJRHEua1n5FZO9Z/eB6m7AUHRLunQSb7MzHQhCVif5P1PNNt4bxG4wGRa2bXXvCfSPfF34L8iQyGs0Pgyu8XJwK0TiO/ACKHMYg+l+so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ruc37CfH; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ruc37CfH"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0bb213b16so10279326eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774383694; x=1774988494; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YekaUXXUymXZs/3g2Vp+S0NZBc707UWzjqqiXrrBWgU=;
        b=Ruc37CfHS+B/+pv/hj0IEwYVhZcTJF25K97i2ijyp8k8T9wgtOHEJWnhGA6LPFioKB
         5ApXWklgKgV3osabwatO7QT/FkFdJw5JXH9gzmfPHPv+7992PyU4seEQsuxiqmm6O3Ny
         ozGbPB3w/MTOHQ7qKzOtVkayWp3vWo5xg+SWH7kLpPJxXZjJGXmgc9J+kzgEg0m9pNu+
         uhOCmBEAGSsXwAh+EQSXcYeoPOLCipDYV2ljD6A/z7iBgmqzpf2dAWVmIRx0KRd3fJ+j
         rcFsBooHKMuL7kaVk1z0tZLBuQLMHJ839PuTmWLa11xePpcRHP6Wjff642o7z3nhp6wp
         mbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774383694; x=1774988494;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YekaUXXUymXZs/3g2Vp+S0NZBc707UWzjqqiXrrBWgU=;
        b=cF1ki0Fr9jrQzeJcCwXmnsiAfXGiQD/qCgWIv6BoBDyV70NiY59HCqJbwu9A16T638
         JJi0L7bCY2QK/wn2mZO1UZuHl3Ky5Dox/7CVUmTK6cbLb05tTO+3Rc9WmC2LEgkpER/I
         VvyzVMFYuidEAHxXRhybg9IkQ+nkqLhdEdoz9Sw+04thKd3xsfmtlfKtg+1TYORV4vDb
         i8tQkPiSpTuXkAUxTekymljRZA2ZinI+OYY6AkmL9AjuPyoUfW3macpEnEUsHq/qCjH+
         NTcLM1dsTKT6fxZbYFTuv5JtM0tkFwC3w2D5D/J9NRIF787is6F6W0f9A/sDnOwnR0hF
         JR3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXO4UoxMoDnnNUHNqrU2KVTZYGja0zKtNKKH5pPHijjYUdlIUFbYZIkHYOjWcOWbQSUhXEoG2DnVU2Js220kow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdRRX/W9tQumUsaE4UM5ndE9LOFJEVl/htbA+UV21ajmhFTFYm
	tQdyLlWJLWAsttkRC6QaX190kg0lXg3ms5r/85MlXaAh238JGf3u4Bmw
X-Gm-Gg: ATEYQzzH39sK1pTajybLS0iKJwhSnV6pOIn7MlEFV19KPTrfPvsMTd95MrZKVvctGQz
	g62N7g8bAirs0x9JuZrwV6ypQjfFiUVJihYwCYqBgLHOhLZe/G6f+Y+g7mlMqF0vRosFoBLlw8U
	IKCC0ys9QRdjkkNuBA3hZc/g2trhx5fS29ZIkhBXJHzviI5osaNAVoSjEjhX2Ffp3IWv0n6pFsR
	02V2lGJcd465k+0nM93i32d4nt2m4xt02QXq2Lx2QQgjtgdgeo8QX/wlmvNOSB6tXhJ24x4LOuh
	+P0zLfuWn0oGvHZfk899JQfXTHw8Sqij1Py/CAvzy7wsxeaCMpVo3ov6geZ/ZSs2BjZBwkruFow
	lBFYqQTEQjOc0aAQomg37UMQPQKv+fZ1tGTfcI4f/i+ZI1GkzYVruZJvCrsEj7X50Ppqh8hHOMY
	XEeRBhRc++nxs8HKNmA9Z2gjAPT90T4F8E6iaTNG0uB/lLm4Z0gYJQbELdv9U1HMtoLZq02oiVz
	whXEQ==
X-Received: by 2002:a05:7301:4e0b:b0:2c1:4b1d:a472 with SMTP id 5a478bee46e88-2c15d3fb1e1mr395106eec.29.1774383693468;
        Tue, 24 Mar 2026 13:21:33 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:41fb:8dcd:b77b:d6ce? ([2620:10d:c090:500::bed7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2ce04asm16295986eec.21.2026.03.24.13.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:21:32 -0700 (PDT)
Message-ID: <1de9261a98d6e4041ad2e99c745fd6be0831a492.camel@gmail.com>
Subject: Re: [PATCH bpf-next v6 1/2] bpf: Support pointer param types via
 SCALAR_VALUE for trampolines
From: Eduard Zingerman <eddyz87@gmail.com>
To: Slava Imameev <slava.imameev@crowdstrike.com>, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, 	jolsa@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, 	pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, 	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, 	linux-kselftest@vger.kernel.org,
 linux-open-source@crowdstrike.com
Date: Tue, 24 Mar 2026 13:21:29 -0700
In-Reply-To: <20260314082127.7939-2-slava.imameev@crowdstrike.com>
References: <20260314082127.7939-1-slava.imameev@crowdstrike.com>
	 <20260314082127.7939-2-slava.imameev@crowdstrike.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-03-14 at 19:21 +1100, Slava Imameev wrote:
> Add BPF verifier support for single- and multi-level pointer
> parameters and return values in BPF trampolines by treating these
> parameters as SCALAR_VALUE.
>=20
> This extends the existing support for int and void pointers that are
> already treated as SCALAR_VALUE.
>=20
> This provides consistent logic for single and multi-level pointers:
> if a type is treated as SCALAR for a single-level pointer, the same
> applies to multi-level pointers. The exception is pointer-to-struct,
> which is currently PTR_TO_BTF_ID for single-level but treated as
> scalar for multi-level pointers since the verifier lacks context
> to infer the size of target memory regions.
>=20
> Safety is ensured by existing BTF verification, which rejects invalid
> pointer types at the BTF verification stage.
>=20
> Signed-off-by: Slava Imameev <slava.imameev@crowdstrike.com>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]
