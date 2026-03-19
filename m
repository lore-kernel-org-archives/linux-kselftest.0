Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1858023EA85
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 03:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773890427; cv=pass; b=mLNmKg+/IiAlNhF3l/n8TXabBxShCcVvklnWvBk5VnoL1ImrIn03Q/+QHFVqAbBgRZ2RQCvJTxsc5z0qnZRU4vhReYzNs/Mb2Ps8iGeu5Rd5DC3Wa11GP48rmXhM/Yss5lRkqaBco1Lm90gj5a0fo8iHLaa744C4NY0KpQ3IwhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773890427; c=relaxed/simple;
	bh=eVJLvT+5ephmWR1V78qznZwja6HuJ8EckS1O1Y5N/4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILYGIdko1XrEJZ6aNYHy62+7dmldbi/DCyhGC2rRnF2OguMI3cYnLedk/EIYxHdMplv8LLxxygtCD+YqLqtBM4o2luWY6yqIAY+7hRaYBb+940JLdrh77HFPQfrcK6mUwU6GqSnPsjyykkMsFE1Qn5d9dye4ajnKG6IPHZgvfa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnInCLV5; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnInCLV5"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b45bb7548so301724f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 20:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773890424; cv=none;
        d=google.com; s=arc-20240605;
        b=My0UveB0hQy29ey/RWsggZXjcPhjyCJCFNbUe6+nqaApyb5vnDid8s2eFsagyJz0MG
         eQ1VcwohEkyltzkUF7z0SUpFoSMRdbvAMaR//hPAPRtS8My4uNri9mb6nHH7FDHdivpX
         iMkZ1NSuwLNbodbyAHECgVjchjGZ7mYNefOP+E76du6vNP7qLT5BrGX4oNwldEuYH9T4
         mbEpFm4pmU6lqK//zPkc7Qm3oUafHck8WJ7xCfoPo1PiUCNHnXcIo5rXo5VGalIdVR1e
         XHoLshvcxjsPBf6laBZa0aPp+dee6OjxvAhGvOTPfL4UfYe7otTOBbk0iUZHDXRZVh8N
         Ewyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVJLvT+5ephmWR1V78qznZwja6HuJ8EckS1O1Y5N/4s=;
        fh=odJ+5OxB1U042Pp4a6iW4C1HbzIopEizz1sEFRp7cgk=;
        b=XMKmaKDI5b5Ijzij4fo660A6B94uoc5avdXk11dTRjopLj3dxStd6Yrjxpp8QFCdw6
         vlw/Ijnl8i+CG3o7kvW4pYbpWYgf3I6VJeEGuoyHCpXykcom9+DdHrdhyDdhI70yc8rt
         KOFTzm13nF3j3SM9KLxKHv3VG/khJAJYHih/qZvUR/UDcThq/2urZ1Ger9ygfulCUcv0
         2x97KLrhm7bWMXRfaHRQ7qgMWnq63+OgJ6Np2Bf2W70vsRGQHzQB7FPO8vEKjlmOiz0P
         LIDncuTJnLypVvluWBOFokX3UQhlgTZXcWeKAg/nKrgTZTdl3XcRzEoJcmsvf1VQ/Kv3
         XXEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773890424; x=1774495224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVJLvT+5ephmWR1V78qznZwja6HuJ8EckS1O1Y5N/4s=;
        b=HnInCLV5rwiH+iXHD2kgwRwftlvj1JhN4FzX471a9FeOTMiEqPun4v7i2Z1nu5Thmq
         0V+6ABFjEcOOn02ALTrEcSwPUKa5y+LiIeAC6x1epaHY6VhnmP1YbfTwt3PHbXqOoWAo
         zHUdoprM02TxlkCavKk3nqj93c7uKgowd2n7krtcfHrTI3mgpVcCuCjBkbKnK2AdQw+O
         Sd/Jsqcdnfvt3HnldR5MSBeJ17dcKKw2qV7k/qiw9OQY+71UnUB5wv8CPDnS5tJsJli+
         D7S5s43GT6qC13dVa4LAaj7267ZmqQ5HH9ehsdx9CUQxjVvJ8QQ1LxHBurtRS/ac4kwX
         X50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773890424; x=1774495224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVJLvT+5ephmWR1V78qznZwja6HuJ8EckS1O1Y5N/4s=;
        b=p1h4tdHXs9Wwqi+DClK/KbbRDspkgahnlEEHEGVHvhJmaogS2dADjmsaMoF1gpU+/u
         4UpOenB1H0lrTjf1YiatTOvdSALwDJqBrH61IG0l4M8U4HItyFTNOHcSuZho7WZIKerX
         sHdhQb9n0uJgROVmY8FhNPOAmXcOAs1Jul1660zhxosmKR+KPep9XAa8STdR2EBdEJLx
         Z8JZvzHnXxaly4GlM2fNxcmpUHxtgvMP8L8pl/E304kTXP0I7l3C1hH8Ob9DkNcTfNBC
         yRaTPHRkwCCjCDvts8hBWrC189njWKdGDKSqBKuz6RWaEVvx0yf7cCyXXa4dq43pMzwE
         UnLA==
X-Forwarded-Encrypted: i=1; AJvYcCW3KnsP8olWZ4zUTVfvkmVrC9vc3zzS/AgmKmFSZ2sKqwA/7L7X2o0vL4/lqHtHP0pKhvS1iqlstfgWGmjm0zA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwwSdQR3Wdt5/FBhvD2aV0FoU9i6wu8fMOj3V/4s4GQn4Ol5Uk
	FiIxD/4abvnWzw1s1EvZOrw9FBAbjmjXGDH9ZYBIlENKVq4gcIi4ZDmEKO+eTS9JE94lKyYAvAw
	NueLbu+spAZt93xwOJ6wmC5mwnhl79481xPPV
X-Gm-Gg: ATEYQzzYngq6uDBzFJ5UUANKb62OgqQYXlwr2gWoi6hIWxtVqzbfIwgl7tSd+J/KNcy
	FL4Ia4BcLW02Q5Os13O1Z+Unl1i9rnvjrm7bMKcMuApmKANIRDnaciSMKIv8ybiQ6TB4m6K+G69
	grVBhHdN4egcsinGSASqzjfjtts8H5T9kyecHijQ5DQGvaCo/dD8rP2erEuMwe00bu3xojcXM5w
	4VRLyIZ5n1yzYKfA7vxaM/ty7jBBYG9SSOGrEcgfswMycyVz/SUba0k9MSM27gdMyOAbx0ACsrG
	dbX3IWw0lg5f2hs5MCCfJ64p28l+6sOBljYjWYb1NyNSloNhx/TtTRrQrThifV2Js2L1AtrCBkT
	aAgB4pwaBeuFNSRv5P6As3nkpgA==
X-Received: by 2002:adf:ee0a:0:b0:43b:54c9:7d21 with SMTP id
 ffacd0b85a97d-43b54c98692mr5708727f8f.37.1773890424196; Wed, 18 Mar 2026
 20:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319031227.330505-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20260319031227.330505-1-sun.jian.kdev@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 18 Mar 2026 20:20:13 -0700
X-Gm-Features: AaiRm504ZciZxfGF11hAaZLepYZDZjU66z9V1QF3ra7zGtXmLjPnWzMrrxY0dzY
Message-ID: <CAADnVQJ9HZTHKCzwmqUwhePbCQ5qPQrSd=yejUS17eHbMm0fuQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: trampoline_count: use dedicated
 bpf_testmod target
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Paul Chaignon <paul.chaignon@gmail.com>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 8:12=E2=80=AFPM Sun Jian <sun.jian.kdev@gmail.com> =
wrote:
>
> trampoline_count fills all trampoline attachment slots for a single
> target function and verifies that one extra attach fails with -E2BIG.

selftests/bpf: trampoline_count:

don't invent new subjects.
Use
selftests/bpf: ...

and explain what it does.
'trampoline_count:' is not a generic prefix.

pw-bot: cr
