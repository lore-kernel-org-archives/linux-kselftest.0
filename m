Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790631;
	b=FJg/040m9fRXwp2BKYjqwnvOm2rwX6THLU/fwGd6yTjvI+dwkb0kStb7Emwz68SHAr32
	 tl1HRuf9ITwtuj5XcxtkG37NQg5X5ky3joQttfVDI3/SRZLTsAR937anhwngmyKPSchXD
	 Zh8wXam1ZPG469wTlCNz4GQGjnNOTdCj20LPdOBLaNJN3VFtQw/M5CbvOPNGT1+etKy0e
	 6pivbKvbDFSiEWvKPe8YNzrnae1pOZFztoRK/RxkhkPMsVOB/7QO7Q3BA15HQghz5x4IZ
	 nUpZz6Rqg0w/8Xnp2pWGjDK1QVsBnJAds4hWAp2rNSj2stO+r+sqevKLZ5SFLw9MC0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790631;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qDjAiGN9DxClUsHbKhzC+df0z9DdE+tvvWVL7zTbqjQ=;
	b=BCgcat4+zIyNgcjhQO9jpfZm5vh5n/n/MY0+3/1aTJ9H8sqL2Afq9aXAe6vqkaOKaqJl
	 TRYTCl2Vr3Z/nVZs95ywc4lksJEKXLAb5H/zNms7cl/rV6v7/bykG7ueFlqe32s4FPeWl
	 lqBViJFNsQugCW19UoERWn6IWyGfDnVCYlkUjfDqm1CtTf0IXESVlmgEhJxCfYk7tl8nE
	 a41IYsRnQYiXlFE8ydsE5RQAVP5LdOQyIsQciHa+wcfLCg9BKQCA8xQj7UB0whCm/pjOj
	 xtnXnFGM5ygvSAtsrOne6t/IfEG7GlDUi6S1AKTMirgeDN3yVrUMMufiEDB4AwKoetA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ve3qM6cb;
	arc=none smtp.remote-ip=95.215.58.243
Received: from mta1.migadu.com (out-243.mta1.migadu.com [95.215.58.243])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041D9606A323
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041D9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ve3qM6cb
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WWXsi2sKIGoGgyhIoSZ+4BEAUs75uz9JX/TPU+B3b4w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794790628; v=1; x=1795395428;
 b=Ve3qM6cbkvgW8CvXaKOowoLephw1dkp9Kp4IuBmN3ctKxIg+iVnVnjOX/4zSgB0bBFl22FFP
 c0CjHQkGAGqWPQg11JmTOkhAL0GIsC1v7g+VUK1tP2RXBPmcxcwKJghSRSbiFOgQW54CedtIWCl
 1QBsJ/ZE0wQ9qoHVZkmc4p8M=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 77561f772e9bc9b0;
	Mon, 16 Nov 2026 00:57:07 +0000
X-Mizu-Trace-ID: 77561f772e9bc9b0
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 08:56:56 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>, kuba@kernel.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
	sdf@fomichev.me, skhan@linuxfoundation.org
Subject: Re: [PATCH net v2] selftests: net: veth: propagate channel-check
 failures to exit status
Message-ID: <avpU2DbRUp0KaSYD@fedora>
References: <20261115214702.50817-1-emmaonana18@gmail.com>
 <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>

On Mon, Nov 16, 2026 at 12:45:48AM +0000, Tianyi Gao wrote:
> On Sun, 15 Nov 2026 22:47:02 +0100 Omokefe Emmanuel Onanaroghene wrote:
> > chk_channels() reports mismatches with a "fail" line but never sets
> > ret, so the script exits 0 even when channel counts are wrong.
> 
> I found three more checks in the same file with the same problem:
> 
>   bad setting: XDP with RX nr less than TX
>   bad setting: reducing RX nr below peer TX with XDP set
>   bad setting: increasing peer TX nr above RX with XDP set
> 
> Maybe it is worth fixing them all at once?

+1

> 
> Tested-by: Tianyi Gao <tianyi@cloudflare.com>
> 

Hangbin
