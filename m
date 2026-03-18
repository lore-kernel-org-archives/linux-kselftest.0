Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C1AC2FF
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 00:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773792503; cv=none; b=nzIChSVSCYo2233pD8Vz7n0rzCpvdu8TvZETnqZmLtZxpkx+jbdaD9NtPAfrLIq61jrzr4CQqWbD9ZS/GCIxQ2zcXIH8R3Z+zn8Gcc+8WHbkW/YyJDkAIMWsHqZv8nlzQYEP6VGtUSf8OMVPf0lPZRRvMkgPA+b5zkyJw0mKPx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773792503; c=relaxed/simple;
	bh=cb8vE5HSSq56kcm56PlKyEh4gwh0lYtwbgbWt/bAoqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avN85+EB1XoC0tcsQVNSVIMFsFZKKXPMQMQsw91UY8s2wPqYP4FtxdKGjYpjO2kuRfdFAUFieRF/gb032l3sJz9JGv4wPp2N/WjNl7wM/P8HR5u8RtSAGDmBkLJQAaSvY4Y3U2cX1Ga53eJPI75NLIvQPEAwTO81uHPF9NXSVsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoikiAEb; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoikiAEb"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1273349c56bso9794049c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 17:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773792501; x=1774397301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=66d1uFpzzYCPdrNc8SA1GRs22SJbjq+tbh3FLYNMt+0=;
        b=VoikiAEbYz7YDzEx9ZurrTlvtBsB5G3PggbpGOo2tVhI1Zls437fOikSRxq5+nJRW0
         rkB/xgnpOo2N7uBVffghrmR7bBLZPXsi0pk1eXUUyrkGA58zmwk8R4Be1r8KN0t7gWjP
         eDBhDJWfGzFcx7ck4XTK8pvryRpsGracfmKPxDUfA15WPu3N1ol1I132/BqI73QrTcvd
         ZTmLQAjCF0pGpsA7HM4tuQ0NMQGSmg/+Ti2IRbOM66rodehJYfhlindkb0jExiPhuEBH
         LxerTl0R5d8fpitcjfyDnZWuaN1xBe/V5u0TUk8DH4podPB5zMk4qYE4df9Rd7lGyvGP
         O3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773792501; x=1774397301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66d1uFpzzYCPdrNc8SA1GRs22SJbjq+tbh3FLYNMt+0=;
        b=jfhTEk5E9lY9pgrVS6mu1JeDwZ7qq3JgBYUV0zTt3AHprQUf1H8PDKLZznhT1ORb/R
         iXFRd/EL/tGFv4auU2qWSkAwpGQeHy5z5tdeRTnF8YFcRBGYa3ft5wUPyU9EWmCUOwx/
         yoNk7cT3ODJaBWJH6P8dlBwiKMvzA4K4ogzANgdQzUaRpG5lmCCp5ZzUhJbzjw2lgE9E
         SLb2xeEGBAfE1s3E3gpu3FB2fRjEJ7rf+F0gbZn4mijOJ3DnVQaxzV13GSFDl4vPv4JN
         T3ZVUxwhUqCbMJrKLNJgAmvz3xRfvMV9dJT3Azrsr9y2c+rbobDUEw1+qjTwy/c8hVdW
         ud0A==
X-Forwarded-Encrypted: i=1; AJvYcCVkvV1Rb5naLjXtWkNzM9bNi6YPudE89hn2r6fm8UTLsuX1kh+1eWyKWz4n8W4DxDBjoktF3R0ABOlsNGo8h4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHFkj1a7UbwPkbKgE/ev7PXufwcar9ciK33F2KqjH5bBzlYLtj
	FfKqAIfJ5lfvlbvJfD/19hiBAHUOevwuwZptCXjT7dLMsP7owNQnBzM=
X-Gm-Gg: ATEYQzxaFd+Sev/Aw6djGDJyl9L59Q4iXY9wzR5etrPQmN5qwTJ5tsLl6OAr4uEo+if
	KcMJL7AyXCqPqPIgSdLIyE5751kn4zMIb9LjvEn0Q7XkyAJSVn5UndOsuN/04L0AROkue+3IjmX
	pXeBKVsckKpeUPfXqlZlmNEk/Haa1SD+Ot9u1mh2LlMG6cdvjABRjVSD4wgoRA8xKfZrIK0bbKu
	+ut9Av5hOyWXoScCTcgLAu0Lfc3AYhWaw1ZgtdYJW3Q79dXAfXuV7gzFqQxbixOQ/YcLZp50huS
	kTA6mb7ZiSAY/eJoSp7U2z/C40SPnl2FzxzAnedWlAGCbHFBKeseJIFhwd65+XE3GBjU0tQF5Jh
	MyBTYStUKSfm6reiKxCcQkVRDLCGVvlosFDAbg4iHcVPI8HoaG9zuGpgrTYnPIyqh7NfBHOGvwF
	Ed2IIzFT+6eFQvNplT8O3dXXNXG9Bunqb8kmAg68gY71R6pC8x+2fhGRf7nBQ6q4Vk86woYnvpF
	afG+zBLTl1eJSn4Vg==
X-Received: by 2002:a05:7022:6a5:b0:128:d471:8c1 with SMTP id a92af1059eb24-1299ba3e555mr676234c88.17.1773792501230;
        Tue, 17 Mar 2026 17:08:21 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b4127b7esm2264454c88.9.2026.03.17.17.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 17:08:20 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:08:20 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>, Wei Wang <weibunny@fb.com>,
	David Wei <dw@davidwei.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 5/6] selftests: drv-net: add netkit devmem RX
 test
Message-ID: <abns9COj7WagFtZ8@mini-arch>
References: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
 <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-5-b53c8cd72b23@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-5-b53c8cd72b23@meta.com>

On 03/16, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add tests for devmem RX over a netkit device with a leased queue. This
> is the same as the other devmem RX test except for ncdevmem executes in
> a namespace, binds to a netkit, and skips the ethtool NIC configuration
> steps (relying on the test runner for that setup).
> 
> The RX path is setup as the following:
> 
>  RX Path
>  -------
> 
>  Remote            Physical NIC          Netkit Host        Netkit Guest (netns)
>    |                    |                     |                    |
>    |--- TCP send ------>|                     |                    |
>                         |-------------------->|                    |
>                       dmabuf                  |--- BPF redirect -->|
> 

Is it too messy to parametrize the existing test to run both with and
without the namespaces? Feels like should be somewhat doable in python?
