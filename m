Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389983CA4B5
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990110; cv=none; b=JRsOwFGBEUtRQTWoGiiroi4fxg6Rk4K3AMa/O7cmuHgyQnsXN798owYhahJTWpsvyG9/OJIBpYbqhle/3RzcXd60qHLAiHmDjKz9+xjkNgY+UiDWGUoK/JeyPvVHqK1CpPjy+6F2tdYq6Sqbkx1DLcZsZy4oGRmyNUgkExesFW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990110; c=relaxed/simple;
	bh=LwEPgX1FY6tnbKgNNa9uz7DXSwqHQTt/mWky3yxefIA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tsZtXEe/CSjn75q2BNOujmoCiECCdcdoMeia5eFcp6+Kw+OrWRdlz/wlZUmEWiVgQGbjghZXfPD+T77ejXuHNi5Apo4KVZLknyu0/MvVp3jvk2NGm/tMqV2XKUF6KnQtvE+w0ieQ5cbSvGbhvmdSH03MSxYmUJx3mQu4tdjXp5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=dsKrAud1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="dsKrAud1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1268f71572so64194866b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 04:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1782990105; x=1783594905; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LwEPgX1FY6tnbKgNNa9uz7DXSwqHQTt/mWky3yxefIA=;
        b=dsKrAud1JIb9c4yWvHtVsMPm3dVUF8ZpguWPMx6ePTrx/iaXTI80WLLbHZzUce0yR5
         Vgzbzh9FRB2/FkaPXoHNspLFbdw3kuG5mMJVRG4H+T6oyq2qgNd/FOFNCJQbjaEFGgpa
         LOfkPpese5ABd9E7Hd4Rn4wQxthQZaFGZQhs5pgsovBBol+5knfxn2fwFOWyVmiQP714
         kk6RKP9Nq+gUY9b8HyKnmNbMXUIQAijpLnVJqO6+8szCMOBjFp+nAD+H1GzD9QBIvdW0
         cOX3NjJfZphGB+H6wxfzpMr9F96JkrpW2D49ewAabZdW0wcozQQrgR/xniHwb/FZSDDc
         /uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782990105; x=1783594905;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LwEPgX1FY6tnbKgNNa9uz7DXSwqHQTt/mWky3yxefIA=;
        b=s8eZPPKPNGzvVuSzIphgjBbKKjSnzwz47gNUNj6gWWCLClqoZoGD3RPmlP5aYONRZ8
         fqp7cPXEU6W3ls5wy4lXIX0qLgtrzRiBN2jkVYQKK9EucZN3UAFIhW1fQgAxXj6cY3t8
         Xx1VyF5t+8tVWPpCqHbW/7jd0aF+oN67PWoII3rx99rehffd8OgTFctgQ2pt0hr/Z+rM
         jz/rQr4GC2C5R2lcDJDjTtollpKgMNO+uSBkynARNcpinYehQEPU43cDuDIhP5p9clxM
         tPxkSpAW6Q6XgSb4IfjHUqcD0z2uQlsGAFfZGmif31RTjqqUOzqh4PvP9H5BnAYRu9JC
         oeaA==
X-Forwarded-Encrypted: i=1; AHgh+Rp12eJFh3RfzCj1jmktL0TTWwIO4RTzOMtp/Sz8Nkrs6hw4sDiDjiIEuilkfifDgR7HWLKluxveBWyObMu78kg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq1bb1o33tUbu8GOweKIfuKqegRXTbs9m5x6bcvdLnBQ09VsCg
	U/r3AzELZPgV1KPXtwqv1xIlRf0zAnKPuc2ahCE/AlHuZM2h5MSeDcwqisI9cZ/qn4c=
X-Gm-Gg: AfdE7clNQdyIuK7rBj3rDfvWZaUG38jSmUMvj4tkLg2Q6bjbKw8MZy6clBqXWOU3a8y
	lQ/RpEXeMoaBOwvwQCZnja/IXsOFNdQKyc3UfqhBpliJMrF3EjZ/o8vvCGJUes0Bmk+a9fzlVJA
	AS6AS//2DhkQnm9unrO6Pq1P4mXN3IAAouUQQcY20f/qTY5FeOBif7gX+AZHsxyqrD8GuMZ6BwG
	7Uvs7TWYpvW7DHj3e1IHKMrEFWQxjAYIUgRpu0OnFFDCckPikzQRPj/+bKEFeUxXRzYZblgA9vj
	n+fhOqixTNfd/GPJHmmDE7aBGRp/ZtMrgWp/dMHPOagxmUhfVzA56vk68/fyKdfT7Wa+U6qLlrV
	DfSnD2Sp7gBmx134qK0Y4B49NJDuucQPXfD2diOGireHE6rEjeRlQGUtWMbKAEjPOnz4cl5Jfld
	qm1UsJ8E4gpafvcHU=
X-Received: by 2002:a17:907:3f1e:b0:c12:7b4f:cd5c with SMTP id a640c23a62f3a-c12a7b4b3f9mr274460366b.19.1782990105568;
        Thu, 02 Jul 2026 04:01:45 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60f5e1asm108533566b.27.2026.07.02.04.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 04:01:45 -0700 (PDT)
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
Subject: Re: [PATCH bpf v3 4/4] selftests/bpf: Fail unbound UDP on sockmap
 update
In-Reply-To: <20260702-sockmap-lookup-udp-leak-v3-4-ff8de8782468@rbox.co>
	(Michal Luczaj's message of "Thu, 02 Jul 2026 01:28:22 +0200")
References: <20260702-sockmap-lookup-udp-leak-v3-0-ff8de8782468@rbox.co>
	<20260702-sockmap-lookup-udp-leak-v3-4-ff8de8782468@rbox.co>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Thu, 02 Jul 2026 13:01:44 +0200
Message-ID: <87wlvd1wpz.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jul 02, 2026 at 01:28 AM +02, Michal Luczaj wrote:
> sockmap now rejects unbound UDP sockets. Adjust test_maps. While at it,
> check socket()'s return value.
>
> This effectively reverts commit c39aa2159974 ("bpf, selftests: Fix
> test_maps now that sockmap supports UDP").
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
