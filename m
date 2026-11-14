Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641393;
	b=zWaGAuNFob4Hk3wJQbX8E5kTS/hhAafgknaReWyJ11SRcQiOBFF/RnxL7fT5ZUxmRivC
	 crm6xpNgA62O6hX+QQr1jQ9HF8LAIqZu721asmgXj5rdcxpWsZCQO0p9rBtW05OgLCnlL
	 eB9KnjnMCARav0PfjYEJFS3LWOCxArWhi/DF7GKyL8Z6TTw3+3rqIgYEBuZBAjjl765YG
	 1rksn0Ny2oCl1K+nFS75zEC1o60EwN7Xz3omZd2ZcGhYnqLejOLR6tN6MrnJO9UOi1uf+
	 PMbceVgVDnAYRtsd3TLhzbaGCZbQFUO53uhn9EW4uEUzidBcUY19XKiHRBWo2YtfOLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YscHU8cxmYbOE+D0m/M4PBQW0cNNFEC4g/fELP/11Pw=;
	b=ri5F6CEzFp+ysmPPcI0V7AFmGMLwb8NQVU9/gEDwb3OVP2DJdy4b0qIe+JXFYNvS0Yd6
	 qpYlpa3GB37eirCBb8T8k+8pk6MnmNUcgoFAx5OY+PtnkRrTtR2Qle6O8IL8I8E8DNYHQ
	 OXcDygrehMP/WRQfIulscoLNITHgB4pZ4V8xnntXTVFYhhcTRR7RoROkkA8uvbsWu3E6v
	 hClJ7fuss4so/UMk/xeLY+d59sb7O4fLrCfp2Ujhfq16FdbNciSF+CDGyFqg81LcVT1F/
	 pwo/L9AsN/auEPgQ1MO4TbxPRl8G71hf3y3bnL+5IzQXAFfKUuUnBlO5XHbOLpnet3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aL2wuFjo;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED5A606A329
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 07:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED5A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aL2wuFjo
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed2c307e62so28626315ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 23:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794641392; x=1795246192; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YscHU8cxmYbOE+D0m/M4PBQW0cNNFEC4g/fELP/11Pw=;
        b=aL2wuFjomcsvsfQmrCeIzXmKyM/FDwAhfsv09F0lNDUgz9JuANGlYt/QreGkeMnYny
         IjWDDx07aAvuofmQ+rPn8ayCCQjiFZ6Bdr/MTVAQ8bzKhjk4bnvVo/r4h5P0UziJU1EN
         Ox9z+Lvxf57ofAOz4ukf3LyIWjuXWYozEEw4ZrAfEcYHjT2xY2eP5R9DEE9zH86bryoS
         jVJX1cW6OFoO/7PZE5PHn4fHyK+sc7UdnBCxgnSzUA6eVzj4DIA1CZze5LRqf2rADghB
         2onp8c+5TDdHjrQuNaEt48thf6zhZFVw2FkEHAyImbXRkp+VkfXGvoaK9nMxNcJy6Yjh
         vMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641392; x=1795246192;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YscHU8cxmYbOE+D0m/M4PBQW0cNNFEC4g/fELP/11Pw=;
        b=BIbH9i7O05p6ekhu1/UZ50N+wR3wBQi+w7XdZ5/UwmankwuYSzwIuv4piGTxLthbHC
         j41Vhz8VZmE8VrBkjrGILD0rzFKG2W2NzT7I/M3iGK8uDfoXAYYgK63yHKl2L8Pq/V2f
         uZ3UmJD4GiNbkldbRhSDCKY+/fr6KCHotHYlCGx9Cwjvm42rf59Zivuhu1KVEuKFq01K
         CHxHLFTjeE9HJjMDfo10vYfXiGkW8gh54qwruWI555/cPCtzheNll0gDHMsJZ5RJIniY
         W00/SpBEWnZE37z5VW/JtSlL7dNzwIZaqzXEeXJbUZhYZFufeah1wND0EECKDxVxpE+n
         fOmw==
X-Forwarded-Encrypted: i=1; AL+hErGnY/X3v+2YBTH0cjlKFMPEg6nAR8Twm459wyQcDsofJVWtqJ00gIAKCUkjS/334tmTYW9lvykm5Z6xkd5LG8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x1GFurMzSyYaUQGkH5LxrGYv2NfsJFhGKt0gq+zpcKfq/qDEj
	klY84Nh+/IO6PeV7/qSeNxYpyqPaVKC38Lw8v7DUWblCCuoqmZ3iFA1bD2av0vMDxqBsxQkw564
	B+CAPAw==
X-Received: from pjbdt22.prod.google.com ([2002:a17:90a:fa56:b0:3ae:825a:57e3])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c106:b0:3ab:d45c:59da
 with SMTP id 98e67ed59e1d1-3b1b0a3288fmr4973155a91.40.1794641391863; Fri, 13
 Nov 2026 23:29:51 -0800 (PST)
Date: Sat, 14 Nov 2026 07:29:51 +0000
In-Reply-To: <20261111174704.24312-3-juanagusnicco@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111174704.24312-1-juanagusnicco@gmail.com> <20261111174704.24312-3-juanagusnicco@gmail.com>
Message-ID: <avgNulWmQTaUHD3N@google.com>
Subject: Re: [PATCH net v2 2/2] selftests: net: Add SO_REUSEPORT bind cache
 test to bind_wildcard.c
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, 
	josef@toxicpanda.com, jbacik@fb.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 12:47:04 -0500, Juan Agustin Niccolini wrote:
> Add a test for the bug fixed by "tcp: Fix the SO_REUSEPORT bind cache
> admitting a conflicting socket". With a 0.0.0.0 listener on the port, a
> v6only [::] SO_REUSEPORT socket fills the bind cache, and a dual-stack
> [::] SO_REUSEPORT socket must then fail to bind with EADDRINUSE.
> 
> Without the fix:
> 
>   #  RUN           global.reuseport_v6only_cache ...
>   # bind_wildcard.c:860:reuseport_v6only_cache:Expected ret (0) == -1 (-1)
>   # reuseport_v6only_cache: Test terminated by assertion
>   #          FAIL  global.reuseport_v6only_cache
>   not ok 1 global.reuseport_v6only_cache
> 
> With it:
> 
>   #  RUN           global.reuseport_v6only_cache ...
>   #            OK  global.reuseport_v6only_cache
>   ok 1 global.reuseport_v6only_cache
> 
> Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
