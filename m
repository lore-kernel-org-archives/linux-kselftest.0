Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A7F3B9922
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 04:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791434708; cv=none; b=KY+6mcXUenpY5SjeZGHaI4IBBqRszc4JW7EdOVu5WwsoEGBDls5jKa+m6eTbOVOE4+Kvo66xSXbRNerbZ4sqYdngVxRyPEAqc3r3snZxA1eyFvHRdVlKp2UjID7vDpR6QXZfMwCm6uX57/wM6q2TYg/zHSrb6UONAUjt8RmAWGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791434708; c=relaxed/simple;
	bh=nqDNid7gBJRP5+HDE5p9dxSP+D6qDttD13fNf76hUXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwiMwkbB0mhixkLDxUn4pK6Tu092+p0UVjnwistmbzYrRM7VpkZBUO2eo3m/gWKGlO/4SLfma1sWuEXG310SOkNoTNE8RLN+SSIlB4rVZAgTnlLleCQ28ES3fgAYdeknh6g/MbY7KS6D6JQzbd+92HaPXTlQusxKs9UyzqrhqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5l7CTRK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5l7CTRK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2df8c28a0b1so16229305ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 21:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791434706; x=1792039506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0cxER3rHLk3o/oMs350o2w57zZt9DQRg6GlGNVoga+8=;
        b=Y5l7CTRKD15ruR+yNHv9DJpTBHXntWY9tBfZb8WeNYNEwbbFx8z2VZSl0wMl1MZ3ep
         CN4EEdZXxj8kQCzTCHx3Eej1lnOBcu2wjgtNXMaeN5/oKya6sC48m6uLAqsJvyMTKbsL
         zAbvoNCfNkM3ElJHXA8WAD6AQQqTyKeFB9869DCmCGj0N23RlGilrIE+UfbJTiu21MNl
         4xUKv4ny2ErRhVa4hEClDd6hWM1WSZrjmmS8Ve+elKOfAH7VZ5gtr3e44ncLjdoy+GLg
         dEmmH6cf2iRlyKHiVszgy6UPwno3PhDmUo+6pbW0jFPVAI5ouD2c7qTw0f97qJ7vBZrC
         hfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791434706; x=1792039506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cxER3rHLk3o/oMs350o2w57zZt9DQRg6GlGNVoga+8=;
        b=oVZ8Y8ddFWm0hFM86R1IOvvOepdF/+U46C8KVuA72CAxS/8u5OqZleqIIDm15aVBPb
         uWLqtcWeHH7rgwQfE2GTAuRblq9zlDAW2/0VvHU+QoVnCBJ5k0RKBVoaqBop95kmqiIh
         4ebgmrx+3+mrH6r8NUGRRZLVEKpUT7hTdVAh8qr6pC+hON1g99LAoG8bqs5LkOBkEvdj
         Pd3SUlaiHaZoVSzy8wIgSWQDR4nHQLOvw7RQ1aaA7PMioCkzqkce8DBmfIG3rdVltEqF
         +C3CkfxlJz05DNH8JfGyBzqM1GV3PFD1OFnTWe3QDtM9nerVVjKRllbbDk/HVUufbQQU
         qefA==
X-Forwarded-Encrypted: i=1; AKwUvBzqYaAaoqzdq6fyc++S7bvB0WY1kxK+rj7TjUIwx7HB4UFPEAV3Mkf2TXbL4WaXiIuJpmJiU00DacddCwMII4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhi75n2AAv/anmo24qMFsTrDUsReKqfk2qwRgZcGQvv1F+QpoO
	JD2QhYSWiz8yJkjjDBrQOXXq2LEQo+jJk/Hs+KGYxCG8i+2L3fRdbl6A
X-Gm-Gg: AYBFou25gufRgOQLpGXvZKDG06as8RQEsr6yjBKhSlwdnxAvwtHjJGb9R820bEjsjoG
	0EcgpqPDlGwbn85RIK3M6IpBASuMVcwdWf6nS3PUOSZNFsN6fGgJMLSfqsK6rxK3OtnFTca3lFf
	6B7cfFy1oznOxDcIzNBNeHzb5sbFhUP9Y1MVOA7VBZEMtmLlSQ8CITjJ+vr97Br9JGItya3hbc1
	U2E+nTRx5RvCkIDnJ9CsAPWB+Mekg2E8kuJ7NvOlizVRIlIDfGBDnlnrqhO7gQekYh4SVzF9v2V
	VzpMU571lnaWsU5gERlaf3/Qfcfb+bqNEtFf4e0g1aq804haZuFQBtCyGmpJK809UuCgCyFWuPp
	s3SAS5ain9szI5Sead/YHJH5zFAKfeRuzCt9lbjUg0/awjU4NElqwdGA69kvOp9rly4Mmp7nLKI
	rLHS4+OI5Jk0tLn5JOWSzzlrPh95zGejmBIDCuRotS4AhIOkCnTJjYwFSZfQ10F+7t2704xaM=
X-Received: by 2002:a17:902:cec3:b0:2dd:c100:7cc5 with SMTP id d9443c01a7336-2e60056e823mr42072925ad.65.1791434706179;
        Wed, 07 Oct 2026 21:45:06 -0700 (PDT)
Received: from gmail.com ([2a03:2880:7ff:53::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604833ea7sm19930815ad.55.2026.10.07.21.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:45:05 -0700 (PDT)
Date: Wed, 7 Oct 2026 21:43:37 -0700
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, Alice Mikityanska <alice.kernel@fastmail.im>,
	Matthieu Baerts <matttbe@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests: net: big_tcp_tunnels: Fix the IPv6 route
 change
Message-ID: <ascfeQ+F7fBsU2cY@gmail.com>
References: <20261007014731.1277055-1-yanhaishuang@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007014731.1277055-1-yanhaishuang@cmss.chinamobile.com>

On Wed, Oct 07, 2026 at 09:47:31AM +0800, Haishuang Yan wrote:
> On slow machines, do_test() raises initcwnd on the route into the tunnel
> with "ip route change". For IPv6 traffic this fails with:
> 
>   RTNETLINK answers: No such file or directory
> 
> The IPv6 prefix route of the tunnel address has metric 256, while
> "ip -6 route change" without a metric looks for a route with the default
> metric 1024, so nothing is changed. The test still passes, but without
> the larger initcwnd it is meant to use.
> 
> Pass the metric of the prefix route.
> 
> Fixes: 1d62b83fb751 ("selftests: net: Fix slow configurations in big_tcp_tunnels.sh")
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  tools/testing/selftests/net/big_tcp_tunnels.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Narcisa Vasile <narcisav.kernel@gmail.com>
