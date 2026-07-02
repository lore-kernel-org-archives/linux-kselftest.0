Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56AB3955C0
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988564; cv=none; b=N1LhZrCrDT5V7K6uXASJvfqZp+/815W058D5FGB5ClHWzpQp2JcLRlyibwb2Qa+U5YsPx9Nxosup/jw7LxhNT7bJAj+pp/XEy6L+Ji0XDf8UlX2SuqWgBKteqOn4uvSuCCPWYQGe+E3yEefrWHo5Grr2023fLMwQrbzJ5uGVJ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988564; c=relaxed/simple;
	bh=u78F4QdlrR7C1BYI5zDtdJCtyxUfspZXfPNBzuyN/eM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NDT5PXLVAw4ok31B03QZEXGicqPf+xhpfay0Iay7jVzLm5nKXEbs2eRYrAr5q3svcYHQV0hQsuYMROKj57vIZULoyHtjF0VZZ0/e1OwUmrvzQaKTPNHArZOxNMbeuR7+BptFRRFwpBVSiIjELGx7O4tfE+E9vU8EGOBCMxEJsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=NOKtO6Ls; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="NOKtO6Ls"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1276b8c7e2so179528966b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 03:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1782988559; x=1783593359; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u78F4QdlrR7C1BYI5zDtdJCtyxUfspZXfPNBzuyN/eM=;
        b=NOKtO6LsvoIK3dwQteCncaPJ+g6OcppeqhO2+Xa7XrRrDnbeZvy5DdHH2UutfGIVCr
         S/qkYU3bKmUr2e32gAzY1EhNJD8B1nrnHdcCz6BEJ1cC3R4fjw7FpukTx86ePzDS0BaC
         buJ0EfBWH4I4bGQKG07nN8TzsvEgrmylGq9sqUt0AfEgTX8OAMM0b/F7QMtZeCvjPWb8
         RDXgFFbgwrYUPQnNlgkipCiSMg/+5h3Y1DBUcKl3wG5ILjHi7di+v5NwxvmiCUWE8OCE
         Kr5Nt6+UAcMs3o0pbMx7lWiXQAiJgcyuiWJl64+r/UifjbmQCzoUtnuK+4n4jV6bSlRg
         71Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988559; x=1783593359;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u78F4QdlrR7C1BYI5zDtdJCtyxUfspZXfPNBzuyN/eM=;
        b=RFGvwlbvSGSeJcR1zcVUZ2BQmT/eEKddA1roi+0PYJziZevgokZbs7COSwIdUifQ7O
         XhkNwDhEPeR4V7pFfD4ePQXLbjwcG81WKvuMHRjSGVH2f0uLgHobc1spVh/EHAEJqYsc
         56qk/pmHbiYPMhW5nraYSgyKJq39yN/U/XXFRLATWBtUypTfXO9aD5TgMxl0q5qhqRQO
         0wNS+QcZRlAG9LSFiFWCn5V52wa89dAmc/nZj+Y6yKFn1P8j91zmOwiQyoHUHbtweF/d
         ruVSbKWK1yyAw/K07uk3Vvk1LZWZhgPHtFIPw2/3XD4l90PYYo0XPQA0j59orbbIYRKR
         WiNw==
X-Forwarded-Encrypted: i=1; AHgh+RrKEivmMrKlrgDuF2lGu2LmeYRgKuPGPTeUhRyCBvYC1/G3E/l6mAqNeQYqB5I/SCvzdPVu/ydTkcKJwkaFitE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDoTLXvbFhvOO5Gf/luoJlqNsGFsehAm7NoJ1L5Z6EKMdVfes
	JUJz83+RE3CmmBM1ONR2kFSXQN4szzK+gF5S/QANa0ErQ6pFQeXFlVoArNNlfkddGAM=
X-Gm-Gg: AfdE7cm0GOGBWdCn8/1q/eZdRK3j+s5ykoxB8JIF0z9j5WfVv8EY5v7vpaqR38MNaLm
	SYhY2g4mlStwkgBbGXqjBb+Jov68xThBa+kPtjmdM0sHBYh0gJSnoU4L/wB5sKuy8QMU7ue4YCe
	f+prC5E2RhVJ7Lx6XB18TCccFrj7UQQaU9SpNyjyGInwiaHyXhNfaRZB1kW/IlGu9haRu+gsBDN
	y2zBqsg1IB4hymrMhjf5cVmyrQsXqk6RsKY4v7KufC99ssWVSHFH0U9wOinhu0P2OzXDm/fayZM
	IfGHWWrrIBWvVt5zjy2s6Pu4Zl5TqdMuoNNXTU/twGBgZTiwjNUG8iYKNAneQgJj7blG0Lkxkfx
	sPxBNBwtKhoKkLVj9jvJToU1qp9RNAjkihDNkSKV3wPmJe8gvRxS9KSYYgEdQASyxPlPHVoUzWV
	Fa66Kf6ow2lKgn0b8=
X-Received: by 2002:a17:906:44f:b0:c12:4f19:fad5 with SMTP id a640c23a62f3a-c12ae77c901mr167169566b.59.1782988559046;
        Thu, 02 Jul 2026 03:35:59 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62907ffsm107708366b.40.2026.07.02.03.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:35:58 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Eduard
 Zingerman <eddyz87@gmail.com>,  Kumar Kartikeya Dwivedi
 <memxor@gmail.com>,  Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,  Jiri Olsa
 <jolsa@kernel.org>,  Emil Tsalapatis <emil@etsalapatis.com>,  Shuah Khan
 <shuah@kernel.org>,  John Fastabend <john.fastabend@gmail.com>,  Jiayuan
 Chen <jiayuan.chen@linux.dev>,  Eric Dumazet <edumazet@google.com>,
  Kuniyuki Iwashima <kuniyu@google.com>,  Paolo Abeni <pabeni@redhat.com>,
  Willem de Bruijn <willemb@google.com>,  "David S. Miller"
 <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>,  Simon Horman
 <horms@kernel.org>,  Cong Wang <cong.wang@bytedance.com>,
  bpf@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH bpf v3 1/4] selftests/bpf: Ensure UDP sockets are bound
In-Reply-To: <20260702-sockmap-lookup-udp-leak-v3-1-ff8de8782468@rbox.co>
	(Michal Luczaj's message of "Thu, 02 Jul 2026 01:28:19 +0200")
References: <20260702-sockmap-lookup-udp-leak-v3-0-ff8de8782468@rbox.co>
	<20260702-sockmap-lookup-udp-leak-v3-1-ff8de8782468@rbox.co>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Thu, 02 Jul 2026 12:35:57 +0200
Message-ID: <878q7t3che.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jul 02, 2026 at 01:28 AM +02, Michal Luczaj wrote:
> Update sockmap_basic tests to bind sockets before they are used. This
> accommodates the recent change in sockmap that rejects unbound UDP sockets.
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
