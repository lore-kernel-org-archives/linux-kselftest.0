Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919233B1EC6
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 06:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676592; cv=none; b=qi0oI9DjBomiR1cfzXc1wiaFOr1tTUwRQg25dYqtUZKtENhzyXPDHh14zLA3fAyKULBzlYDE6JbYcNGyhmpVgwjNyX90vK9j6WjRIUcSAEn01J3WbDY8Yz7Q3NvM37RmNixIxjbjlNYW8o+7VGz6ROZi7boDPF2edkfO+3JMeGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676592; c=relaxed/simple;
	bh=qNq2Np2owAOATAEvweRdUBgEUHLpklaQw2z58nEY6JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5YpfZi2qw6NxC3OJHvE2hgjVAuHH+B9Z4wDr+ahpkytHSPDzuFLkH1d/KCrwjMYVraKPIe1U2zeiuFcu+89V/rf2jrFOvWbFXbx/mhuXNL3QvfZJjhwR2wev2Rfgx77/b8fRzlw8EIwytQEMYvpj99tckFn1QMvBLZKhSDnnE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ykmj+LP5; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ykmj+LP5"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EECD63F60F
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 06:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1781676587;
	bh=qNq2Np2owAOATAEvweRdUBgEUHLpklaQw2z58nEY6JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=Ykmj+LP5FdcVz5e00/BDxa1RCIJBOVkaECMng0PQQssl1UeQ5iRjvmdPSJLELX8Um
	 pEMpS04S0TF4M9Md5dkJRMM46uv07xiLlGbyJGC2OhFbQaKAiLvKbykX0WcR5bHMcw
	 6fwkuMOy1NdNvINENLntAU92irmCg5H6zLJL7UhQ3qImY0pPjsAAPwUw6EoPq7JUS3
	 /uFCdEbec9prSc/eUHL0Ezfne6TApcPjTkgYwG2Ze0oZkvb8umZJ1EDPQVSoFi/2pV
	 akLwbIShOFcFGji7bGttM10L3iZCPWeIyzQjCqqYsHFcmlX/nhPz3CbTB2bhWCIX/P
	 KNip2k5kl14pQMAOj2i0VmCU4m5eg6vurrlYKoGE+uQyCe5RJ/9ITLZt0wMkpclxWr
	 vCWvZhKPJqCpx/AKa3WYAaMRGgLgQOtE95guyTEzM+pizIFZIJkzB7uKhA2i9zb4Uy
	 7/g6M1O+asIDeZWpBbSjJxytPHksMgnM7gKdkrr9X+LYFn315m3K3EDLHS12Rfneap
	 0eaEXvptcqmPSb1jkjNwOZSGGJpE3Dx9IyPey45pvJMb6V9JM5CQQDj5Cd7uic68gk
	 LbqXR+pVnEEk74iU3ZKuOo5hQ1Bhp7SmipD9IRgNftiBbvJ1i4fAEoYdUG9TuJfGrC
	 /65T78Wz0Kc3PBTfucB0zGtk=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490bde3d239so35225595e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 23:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781676587; x=1782281387;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNq2Np2owAOATAEvweRdUBgEUHLpklaQw2z58nEY6JQ=;
        b=M25zeBVaiDov0Iuea+hYREqkL2B3StbgZvH0ZOHkL6uE6nAujZ+8SlfD3Dj8i4hxoP
         WSPeFUwZU17lodCD2hKcEIXxpvfQQs2TRNZUenK9hAFfqZGxgluvpxeuWjupoAdImNWm
         07SbEeBRu9W/pgL7QNnKpqM5zf6FbqFjW22a69RIgyRKEmfEI2lGlQwLZJONoVmTohXn
         JrWYXQQ3QEyIXMsWZtiCR5+fnVnuua2htLZZb9gqKuKuCf6LxprB0pWf2YA9FDJlwcbk
         XQ/c0jMpmkMAEXQlBNvgmC1ykSUVTQcj6dGqQTF17zpjSCmGroO7Z3BE0ELPCf3R+sP3
         IU+Q==
X-Gm-Message-State: AOJu0YzEjp4A5fAP3Ym4qdG35QP1dNAf1YyCvv77iOmBxPsHpggVBhK0
	9Ypf55VjU7fvBjIPIl4utL0D3SpbW5jj+OaMK/S9IZa+70FBDZ56NS0227dEQvoFnjZMOkVvkFP
	vGvjJktl+c4ahMhvdx3r/tBc7CL9fxAisjDbTfLnM0gQ3VjW64E62DKUmNCaSvEtwXyD4GFjkxh
	FPQ12yoQyRww==
X-Gm-Gg: Acq92OEwlah9GZJDsn3EiCvzCf5t86TMeco6G3cmCG6zadZKA7ZEr26J91NuKEvgDiJ
	7kXIGu8kReDQqG6ChwIgACj5B0KJzwa9abjahmijMgr3RmaLTDQa+Hg4oVKFGXC2hbkNgNa7HCt
	z+vSWh7rb4Syhikyoy0AVCotR5PNCXWUFvHr7C0q3iypF16svonTiFLYWZfvROegWfZG8kqjb7T
	jKnFGzMOFNyVKr4CVcPmWTnVzMb3YZ7tEuhv/4zF0RqbbuTYLxng3pqzFZycSl60Bs00PMss/72
	ZEnNlQuk0Q25tm/yIw1eK9ONyk0LxE/frI00vnDk4zCCAbXxzBZ1Iw76cOth/bsLHKAejPf3YVh
	OPg7bfdvi+x9Nku7F11wEzyu3z+oFZ5MzF/nAf76u
X-Received: by 2002:a05:600c:1553:b0:490:d354:d15b with SMTP id 5b1f17b1804b1-492334282b7mr37259845e9.29.1781676587600;
        Tue, 16 Jun 2026 23:09:47 -0700 (PDT)
X-Received: by 2002:a05:600c:1553:b0:490:d354:d15b with SMTP id 5b1f17b1804b1-492334282b7mr37259505e9.29.1781676587312;
        Tue, 16 Jun 2026 23:09:47 -0700 (PDT)
Received: from ?IPV6:2001:67c:1562:8007::aac:41a0? ([2001:67c:1562:8007::aac:41a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c5266sm57092036f8f.29.2026.06.16.23.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 23:09:46 -0700 (PDT)
Message-ID: <0265091e-3722-4b93-a644-e9b3dbd57a3e@canonical.com>
Date: Wed, 17 Jun 2026 18:09:38 +1200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] selftests: net: fix file owner for
 broadcast_ether_dst test
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 stable@vger.kernel.org, edoardo.canepa@canonical.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 oscmaes92@gmail.com, bacs@librecast.net, linux-kernel@vger.kernel.org
References: <20260610062230.71573-2-ross.porter@canonical.com>
 <20260613213254.174421-1-kuba@kernel.org>
From: Ross Porter <ross.porter@canonical.com>
Content-Language: en-US
In-Reply-To: <20260613213254.174421-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/06/2026 09:32, Jakub Kicinski wrote:
> Could the -Z root argument be moved before the icmp filter expression?
That's a good catch, I'll resubmit a v2.

Thanks,
Ross
