Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C8275801
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 02:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781316242; cv=none; b=bQ/UU1x7YN8Fyam2Z30JNZTH5ZT5vXl6zBcHTjTTqaJEu1ZZFsftdiXVGbxwoPCzZI68qAjSajWlmTIfxUe3sjSdas3bgsZ4dTQlDeY8Z3StcgWB0lgopi9xd3/uVfmR64hoerYeo+UOV1RJ9OG2APHpEhdJNrSBe9RioVZ0cWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781316242; c=relaxed/simple;
	bh=BF63f8tkkJfZ/bY07JtFT74M8MLMPf3ZpoYhZ+oniIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MV6Dg3rD90hcm9qEUsIdKmULkqWqzS9JYyvBKgbdauUFMv/DCvJIbNlUIgQD9H2+FgEo9xLD6qyHU4qFP4tLtH8iqTBdN+Tc849TQYokNhnFw2o7czFsHAjcWEsNsAnXfAPEaJNj1RFzLOxm3oEUhmG6IJaopDWgefgbsPIYDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhqidihH; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhqidihH"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so1007677a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781316241; x=1781921041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvlrbvjYmzCXoLrV2hsJdEbJOUWSCE5NGHj2A3xomvU=;
        b=nhqidihHBRXjKuyI3jLI72GFUIyYnPkVmKDpuWeQ2HmmDsoLX6YgMwVx7gSWGDpv3E
         NppSpLpXY7S2oPkobyW/KW+6RftxJKJriOz6h75wqkk+d3lCwbnfFlQDMbi1/cLcAm0z
         a08kVwWd3Asjc6ZHCzx8Cl3kI2rjahh9QxY/ka+Aljx59VWbluWC0/XIe3FPyGWJr40Z
         v7t917/zN9x+5X1RRE1ECsWmQkP+hlsySBGx1m+PONN4wgo+BMjiaHf7lOXZhh9E4RA4
         w1bMWCTyD6LPmM+nyfG5ybAfcs/DMh2cXx4CwWZhMDCpekNzNpa9GL9VzkQNtPV55dJA
         ngAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781316241; x=1781921041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvlrbvjYmzCXoLrV2hsJdEbJOUWSCE5NGHj2A3xomvU=;
        b=VDFfzcwQ/J0npJi0sM9SC8z1YgTr5ewYv9AYwGyk/L2fVn9zS1VcUICup+KqZHm894
         pPDiYULL0DotJPJQxItf5zLgVQsnQZt0TBrW9iZoH8t9K3MBP4wTlkyIL3uy7Da/FREi
         Go81GunsOoE7BQ70iRWszY/2NsceDWftHy9IfUeiyk5PQh8PPlLIgZt7ZpuUOW22Cps3
         o6zW9Bz/feGCsD06BknU+7ySYssP5+tt1aVeAubvV8JhzWGHZTXwO1/hVpbhV0iRT5gq
         ituAqDwgRvBmQ7XS8BBPUYelyduMauG5DkXS9JIhAvdUYOnGQNqyyT4qPiRVyE4hem/P
         B6bw==
X-Forwarded-Encrypted: i=1; AFNElJ/pC7e8Lz292oCtNpkGteTqRyUUrYMUvfoqvUsdKoqn0phJ+VU3e9Th4mfWlboSRW10IYdVxDh9iBLQt5NPL/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2vFKZWLtXD6pPuI068oHXXpUNxCIe1qZL0r5U4r0KvwwKgFe4
	xeKNEyOnY2rEJnvS/0y9IhFtbwEdCZ93/WpDArQaxWCvQFBlBFzDxdA6
X-Gm-Gg: Acq92OGtuW4kmTANik6egPCHqp9If4MnOHr0ryT+s5U6UB6eesj6qp81hpCkS457NrI
	wCPc5kiHLl8kH3AqZcUM8kKeNtlBX1MeDWLHgSkelGkfuVmDlUn9yYG7j4X7fQX9BgLjQ0SZJdX
	9fDg4kpBpL0ze+7uocWPmpho5jrwIdMHbCsIejuCqSpD9TPUYIUFlDNf0x15JU2aMEnP8jTV5ay
	+tBZuYC71Pssk0OVqJuzBX7ZxpKGzQN4EnDPNz/dopE6z2okN0RoZEmPMle2+x9vs5Fe+ytYA3k
	fcZg2+B6L0RJ9RhNjTzD346CFqzoFA4zUb4FWnJqQR7RgRq0Lp/Wprhh9zs6TfPoa7BkGjOMMf0
	AwzjXa+lGDQ+Zh+BrutsbWLA8RaCTFlE5UbY0dnMDeEF8O4p5Ghyfe8jkpbSGPQD+fEiQc3TgwJ
	rF9/POJsewYVoO+mHz
X-Received: by 2002:a05:6a20:2d14:b0:3b4:6265:3786 with SMTP id adf61e73a8af0-3b784026fc9mr6690558637.43.1781316241406;
        Fri, 12 Jun 2026 19:04:01 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186d98sm3006091a12.16.2026.06.12.19.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:04:00 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:03:50 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, sdf@fomichev.me, 
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org, 
	skhawaja@google.com, dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 4/4] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <aiy6fWaIILSj6dpr@devvm7509.cco0.facebook.com>
References: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
 <20260612-tcpdm-large-niovs-v3-4-a3b693e76fcb@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-tcpdm-large-niovs-v3-4-a3b693e76fcb@meta.com>

On 06/12, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add a new devmem test case for binding the dmabuf with rx-buf-size=16K.
> The test sweeps RX payload sizes straddling the niov boundary to cover
> the sub-niov, exact-niov, and multi-niov RX paths.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
