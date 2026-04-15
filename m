Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C284F2D949C
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 05:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776229305; cv=pass; b=CWSlPyFffRSMADu7BqA5YylTrSCz6Z7f4yioVLO4+21nIauq6frulba+drgYpogkBJwhrS6CnSMwX54svPZJAaDF+pHarO4Vk+CrTpson1R2Np6f6rLvQw/tuIVASEYMFq/bU/1jBRs/iM1jP0a6TG8HhqrhlL1VngGXxluou7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776229305; c=relaxed/simple;
	bh=pJUSotdmTzr909dQmu6Z/4Wm9WvdYY/zfwb72+1evp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loot6ED4n6Xn+ViYPLIRFH+9FdwynueBanNtWZcaqTWwYxoX8fWnhwO5dMOyGEfOAgTeemvDAvr/a3Ih/i07YRZxkVK3izRPP8/7tXd2X2tKMVTT4mdfFxKgXX8zm/mxmvZSGupuBvgjf6OtH7QupgzwJf99SQ2JYNIsE4Lxqlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MuFHBfzM; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MuFHBfzM"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128b9b7e3edso3833147c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 22:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776229304; cv=none;
        d=google.com; s=arc-20240605;
        b=VSGJ0npHR0zyCdo7ExuloxYV/EwPOHa1YLtWsHcdJ7zwpmrFmLb2FLvaX6i/0d3q2A
         KQbBqiVKxl2yetH+FGLRm0fnpyLKpvUP8hPnJIJNYA35nv5fCOMxO1aK0nOlvIf7VEiz
         QOwVDsoa6x6nDgeqKe6k42Cw6rSsrYw7aZIZWnbkx8LXXVHPtV00v2s5cWE19kFqNFin
         zh2jxSNsCad15LE+rojCi0lc1Q2/U+b9Tz1UWtrAfNhvUs5hy5xkEOEfl9V8/3BpDmYV
         iv9FyYhan/9ediBaCDLbhvrtDp5MiADaYx7lJmkEsIbTY70USqmW7qkNEmKduJxkn4Qz
         3NCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pJUSotdmTzr909dQmu6Z/4Wm9WvdYY/zfwb72+1evp8=;
        fh=oNG3xWs0R1KWJQoz19a3xilWqORgfQeNXjvqbRb6wEk=;
        b=GxWIfIjtPnfjn/Jwtc6Vvs/Qt2XwAu08M8n4bmuwCEQYLdea/Kgn/tfv88EXIRMpXR
         ul49fMRQhWJA11JlbdYfkEWyRG/uF5CMYntD4d/tKxfLbtPlfV20o6BCuT7mtfHhRcQJ
         eyDScp+/JhkBM/4aZKxvsnFaI41F85cd4G3shZVxv6GKsb0AECjHSAPLTiAhFQX02sxC
         Vs53J8gds6W4InS8AqR0B+TFM4nxfAi7ZlRqT12AXFqqj9aLdXIL9AWPkdk2JI0bjxCl
         k8PWtugyV9mWJsNMPsG/bsCN24GwZl+2Jqm4D+3zBmji3I8CQfyV0wwW/QIocMacvt5Y
         bE2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776229304; x=1776834104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJUSotdmTzr909dQmu6Z/4Wm9WvdYY/zfwb72+1evp8=;
        b=MuFHBfzMtF6ES9S2JbmLmV9lxwnzw4thqZh1QNxMylBJ2vKW5dQKVHXsBYKRa5SQiX
         H0ePjRksjMRzPopYZTL2em7AQcOFh78cUw24WaQH3PI5xHiytKL6HPplWNouEDyAFwiX
         96kkrfKC5babTuD4IFpjIwOywrCDeTGFtltv5nFJSVTL48CGeP6k6wrtdXrkVdBg/j22
         IjqVktvQz+YH7dMPT6FBNN8xIKMW7KOKSMEO3C4JLAC5X68knqEDMy10WiYRrRJb9RnG
         /jIvgTOzc8slnQnCzKS7qVIMVcGFuwpIpuQ4Cr6TJj/Mm+553rrv6xRl9ZHcT8Z9LUEz
         vvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776229304; x=1776834104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pJUSotdmTzr909dQmu6Z/4Wm9WvdYY/zfwb72+1evp8=;
        b=UMHxtr18MaqZQrdhdc3LiZKCtM3279NoFd9SBA0r3AjlSRvVEunTyvKsawR8G22vQq
         IE2Ok0ZRmBD+azb+0Pkp22IliU3nyc1y7y94749ufTwoluFqhoCBoXJtHfwRjJoLBmKN
         2M/m5vgFdsiLhUi1kQkU6hAL/Np3YSf+0XAAHxOee5+zB2bSsQaI/CG0MgjHxKabh+nA
         iuLMozA3333kTSpxk0rX5MMKMMah2iDAAoXriJKc4i7FpTYzwgX/boxBTiLcSgYICLIi
         khCc9CtNITE52dkgOHmjQz8dSppRVKrya8yCzulXl8zuOE5Mr/JsBeVKDz7i5Z/QVSaP
         1UUA==
X-Forwarded-Encrypted: i=1; AFNElJ9FVEzz0K4X2bIUZ1Tst6ooc9/RBfk6wQEsO/R8PmTcittU0eTTlSY+lJys0cuzU73wcSKzvg/ebJeAvhDzvis=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsaADzrBIL43JkI+cXrpj2FwUmgiaxzwKTCOXS+h0LzPUUM2JK
	P1aFFVmDmi+o95zb2ICUqHCfnC6uWs8KfLN/AR6CgKURYIaz8iacnSvJRYpZnOlCIWhwKVfGmgL
	Jd1THec4gWZkA89rA8Y8rKOAgM8Wq6rD/21K5mhZe
X-Gm-Gg: AeBDiesaPBL8uQoC8l8wQunp4Pgnv5s/7yuUOnh9IvOyfqjdw6OEGs3JiNTGsgdrnIi
	5N7RKAh0TA/N25wu9iAX7g/QGY6iJoV3IuWdB0CkqcRxfjTHLHje0ZO6vmy9e/RZTqH4Y1TcSFJ
	jZFp13jaD1Cwft0dLy+V4iC//DS08yiiDYWcAYuQ4zXT8ZVBHTtCxw+7JcJRB4BUiAQar3bIOE7
	LhfkvLlzHyc7clgXGxEo4pZ6SHlPEPY3+YkNe02jhIZlFzFE7SoAyvyjVZrb5SpXhFhW44O0FsA
	mAcEc0Zv9hKUHr4uf4JIFONN1AU4oFtN7YWYeV7nQvoxPElrbpErbCvhb30OE16P+haBrvuJcfx
	QKPSDyS0m6TMrhTXSeUmH4Oalh3zm3AuKiLjnk5i0PDEjZPdZU57Hlb+d35KpUiDpMx3mLSKeAw
	==
X-Received: by 2002:a05:7022:389:b0:128:d24a:a5c1 with SMTP id
 a92af1059eb24-12c34eeac88mr11841217c88.28.1776229303335; Tue, 14 Apr 2026
 22:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-unix-proto-update-null-ptr-deref-v4-0-2af6fe97918e@rbox.co>
 <20260414-unix-proto-update-null-ptr-deref-v4-3-2af6fe97918e@rbox.co>
In-Reply-To: <20260414-unix-proto-update-null-ptr-deref-v4-3-2af6fe97918e@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 14 Apr 2026 22:01:31 -0700
X-Gm-Features: AQROBzAtbLi74sgP-HJJxeDMhYc_8XgwX0AD5wIVbleVSSv1wtKRsUz6FlLLeDo
Message-ID: <CAAVpQUAe2dhWaMnKPH=uvmGxVA_dd2gVyCL=Y55+eUJ3G6QOFg@mail.gmail.com>
Subject: Re: [PATCH bpf v4 3/5] selftests/bpf: Extend bpf_iter_unix to attempt deadlocking
To: Michal Luczaj <mhal@rbox.co>
Cc: John Fastabend <john.fastabend@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Cong Wang <cong.wang@bytedance.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jiayuan Chen <jiayuan.chen@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 7:13=E2=80=AFAM Michal Luczaj <mhal@rbox.co> wrote:
>
> Updating a sockmap from a unix iterator prog may lead to a deadlock.
> Piggyback on the original selftest.
>
> Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
