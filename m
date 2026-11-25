Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593063;
	b=M8lhKWA2CJVzMKhQo9HxLjaWzDwfjsRMmxG/mzWdgDkSF/FU87F4WxeWjkkiEv+n7aFI
	 yCIpRI3chAdd/LE8dNf9ChCsyCzNBGExeUjSyo46PMCMYl5dtTp2v5I44+g5F3a0qgjN1
	 Jj82PRBO32Vw1s3L+/FhmdG2NvhyJXacPTTzpzD6dynq9tDPbhkULqAV5yuGBbEcr5z4g
	 PB9D6nuV0mD56SgiYtFrR5ijIMGOgEUzzQfeahANv78YP/rJxIPdN3Gr61S5WwtGs6qF0
	 mb3DcD2b14u+u765w6hB4dddtwLgKh4Iy72cOMoA7CVrvFItQmWnYsTP+e0AuZM+rjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pEEYZ7BNdFT6u63pzp4l8eyfD1wpGdfJreoALMPUOrk=;
	b=wxHFfvfhNONLpnT9ujfhKX01vZsclmQlllm5otUd5LVPMIn9LFvUVhRs/rxM7nurxodu
	 835IEMKaL9+bkh0ODbEDvTeSt3wV7qAeBFrEFSkP0JShqDxQa1iqDwuYo/4+Wb1JhAqrt
	 IILehKjh/VyswI/+fGocWqav2PYXhobIc/VpGxF9dShgmNc6lMXSPu8e0P46Yw6BlCIsf
	 FGnSdCV69lfU4NcWpPNdkZ/aCPEptoH1aTO9oSOtuMOZAV391MIGjhcWH6iVYzQd32ctN
	 5dmf2GpbYKXXucbnriifuGdMMKE2QcIIa8VIQ1dF36kNyQfv0tQmU7xVHL//0VfwzqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1J3Nw4n;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8A606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 07:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C8A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1J3Nw4n
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3866a784546so7272227eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 23:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593062; x=1796197862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pEEYZ7BNdFT6u63pzp4l8eyfD1wpGdfJreoALMPUOrk=;
        b=x1J3Nw4nYGGn9AeXsBXw8ZbjZc0HjHkEVYnoRNbIFaJLgrnzKn+THGCmCIlsLOMZXv
         62tNvNPVengjfSRqky2zLMwXGXV3PE3GmiNROzqzHQi8cUd88pdLCs6q3dj6unTEv4U6
         H5vtzIryiI//hdRexwXPCyp8ePfOC6rSGTZSyhEL1pErERm3W0hHT00o+P8kbWZprJDP
         dAKXLp0OZGviY1XRkkglXyI7GqiB0mt1BYPvkAZ2LPNWjOVS4acizvtw+EjS9sXdo6Wi
         DnxtaGk4cNpjxc9vnWs5HCglTdo6ntmkce+riw18wFYb5KSBNinlm4Nz2TQ6bAPKAIrs
         niTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593063; x=1796197863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEEYZ7BNdFT6u63pzp4l8eyfD1wpGdfJreoALMPUOrk=;
        b=npbYo8pPdFTG5UERkX+K9DVMUjV5gDy/m9j8Ch26bF7DE2HpCU3fFVCxFGrN6RE//y
         n7+AQ15OiNRXO1kFk2rGb3F9uy4BK9NcSyL3RCg6pKR9JLLa0Uf9dhi3DRNq8Xn/+XNP
         7VeVtrRBg7XaJUHUzVZYTSx+40gyA3gFhK6+7Obd95i1b2tYKbogsixp581jWzrLx4rK
         326fWs9rjHbVWfOsHReHvtjapRFN5rfTaERgFi5qq9Mu2MMIRQsJYWmVH7wWMD/ZscvX
         +3YkmW9Y8qBx+FkAfjWWg7MQhES2lyJXcdMv1pz1nIMaJwnemE9c+ZvuzJJbhhcCzvRU
         HhaQ==
X-Forwarded-Encrypted: i=1; AL+hErFcaVWHZClKtd8vR9QRFjQr2fTRSU9ay+Nrbyga2KzK5AJIbhucggg+30tQ2Q4szqL8Jjn23y987wYzdreXC2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FM1xK4PTvUU0tXdwQL7GasOCkNVywWqZg4qxT23zBgXcL/UZ8
	I+3hjDH0XbGS+TEHKxDbZvDAxOi7e7dSEptA9ocDdgtH+6VYtI1X2skM
X-Gm-Gg: AZFdTZe0giNZUkFdhemSexaMAPfU5oNx7d8prfJCX/6zbqmJSABgMX8pHMFTcnFdqoq
	Lgso2r2yV5j13piaSBYmJqa02QEWmsHqkzPBNTVFTA9+0jpFqLDU13fPCSDhw/isvPBQH3qQ2i3
	CSLeo6trGFtjvzwoZQ/wVnDJnz4wZozwLdrxSDKd8DLPoWEdI9K2YI04iOS/BIG7gi3768XZf67
	RwSweqr5sy3ElKKVOUNNO6g8pPDc1S7AKJaAvkikmgfc8iWfhyOFaC1/t9hChhv9kKMvnXnpCjk
	oif+WpAYnyPIPCyVfP27Jo6yzxG3+yeF456GBKgFq2tucS/sUkDjv6dOGqZEkp7Ea+z5E8CmYnD
	l9C1kx3XFxMvNGbCSqe9/99IzwihG/K89sORSrMpah08U+UnMqhq8pEKkLqwW3096o++SqVc0YN
	vPvvdagaHFDF/Kz5DUOIPRPTSfKyknyu9+6bC2eiooXU+oAN+HTRYP0jS15y4ylio0E7LTfbHyS
	sH20zZLJNxagXfkalHWiS39EaPAwzogkaqJr3vg2r/yK8BplSLuhsi2LU9E19oviSNqtaWEpho9
	zVzCGbynI+VRXZJY9uY4JOBZH202sw==
X-Received: by 2002:a05:693c:8959:10b0:386:a603:506f with SMTP id 5a478bee46e88-386a60351eamr10899194eec.26.1795593062490;
        Tue, 24 Nov 2026 23:51:02 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:6b::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm9521227eec.17.2026.11.24.23.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:51:02 -0800 (PST)
Date: Tue, 24 Nov 2026 23:51:00 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, edumazet@google.com,
	horms@kernel.org, narcisav.kernel@gmail.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] selftests: drv-net: uso: add small MSS
 variants
Message-ID: <awaTZJf+8V1lQSho@gmail.com>
References: <20261125013838.3823834-1-joe@dama.to>
 <20261125013838.3823834-3-joe@dama.to>
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
In-Reply-To: <20261125013838.3823834-3-joe@dama.to>

On Tue, Nov 24, 2026 at 05:38:36PM -0800, Joe Damato wrote:
> Add small MSS variations to test paths in drivers where small frames are
> sent through different TX paths.
> 
> Signed-off-by: Joe Damato <joe@dama.to>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  tools/testing/selftests/drivers/net/hw/uso.py | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Narcisa Vasile <narcisav.kernel@gmail.com>
