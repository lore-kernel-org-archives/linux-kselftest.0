Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6F3793D4
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 02:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781316796; cv=none; b=MY+246JeOA2vCr/lFtD1ILaFH1t80x07KJUxZqjDh7cjvc7zX31a9RAJO48zDXwqjeffpy5IFDLxuVJ+Yh2H0cpWn0PJnhzGyCpq7kFUHpHUHnmyenGGjbUy875C6WDg72CjYc6v8b2+mEOT+UzLAlXupmVS5YCj/PZUh+Qe/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781316796; c=relaxed/simple;
	bh=6cmijRI5V7P9USb4+x1RRVJ2PCaIYvLxOmNSxNpMftY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=JSuFKvoUKG3dSzzdI2+fqeJCmqto0tsoM1e+6+mI8j+/hyKVRwW17boGDq9SJ4LAFa5vU6VgOw5dwEQRagwaUvtxv5QtTej1glXsELT6YNmUvl5SR/dj3XvYO+QPrXWcRqCyxwt18JuE8TJgMYGijCAxlkjvYdCEtjZJQxSQVfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZmBJ8tb; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZmBJ8tb"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6605c3453f2so1966774d50.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781316794; x=1781921594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjnB0IRIF5mo49HLDOpqQWrW5AN9ELBnpM+0ifgLB8s=;
        b=pZmBJ8tbii3ukivutkXcOPmVPPQbA5L92wDAN/AByE7tlquxk90AmskL7MvKvFIRs9
         2E5qQXRtAvuBbQs5lwajUqEZdGdGyr3lCZYrOksiaNy16mG8d5RH8S5G4zLm/TswSLqc
         kgLjcPU1xiBjjUenJXQZItnPXq8uD3dyBYBiz7Vh51hgatxK5flOQ5vuIxqwt10sGSvn
         Wz+CLC6nNLXfgJR2CWZOkNt/cvgn1TZjP/+wqF8CVY8LNlduI6DspWCrYlMYQbI8+sn/
         B2U6ietQXoYEATJlj/x6Toa2dLmvDkJqVNi9lMdsv7LXmJqh1TAvPD5L76QitxR0hMx4
         5hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781316794; x=1781921594;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rjnB0IRIF5mo49HLDOpqQWrW5AN9ELBnpM+0ifgLB8s=;
        b=dNSN7v5EEZbjQrSK0xvfa8pstQp7aSuKKdA0jqNIb43W5hBQiJ0EdChCwtuG9TSrfv
         I5dxT8EZX9eJBiaU8LhHE6020GdZigXDPu67bEhlybLGNE/ZicIBcFbkX9VaVT5bEzCA
         4k/PZd00ePvW4wQBxMoj3gzT+yqVuTya+glXlAWX6BdvOqok0FPPthWO2nxXtgPfhh0g
         HCFc8kfNB6TzjbMKC2zdKE7VIZAgaPbx6UrHxfJF2F6UPobL8+34gJ11BafBUBSJ+gg6
         C5XuVYR7/9sho6dUKYaPYibtSoSvjXRepqGF3NekHVyujYlPKhX82+W2QflmePwu9nXz
         FuFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KpCFfEx0U6Pb527G2MAM3acLHjjEi2RST1V41URfmWBu63OLcBkeC7poMckFzjOllk3CJHN+KFTKpLIYPBMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpDj1DKMLWUrgqWFtPm48C3cIiD0wTek4pJad1KAGKRw+rBpUB
	v83fTPVHPPKeDEEXa29EvQadxS31adKDLTjZ0FkNNCdnKt7WJDgttIUr
X-Gm-Gg: Acq92OGWLDFxH/PlNMgFiZ2TkqLPAXhOvxFdcZb3p3eaMqO9HIG3mQ4V4CQORddD0eA
	Aue0Uhl2C7YUgWNBi3pxozpP5/qspb0U6ikGW802v5IlPtdnePZGWqDhXIfZqbiQ2bhhax9csDU
	3b7f/0Pana2DW1jGCn9V19ZLySuBeeMZcLB9NTA0T4orsdlFYoRKEbCjGW7LVpfcMQ/1/y04NIx
	2ossI99Y1I4jioirm5itcwmE8zTYtHE3meiWgRZ7U9jWlFn92kPXsZjAhvguR2ckll8sMNa3jze
	M64qiQXFdmfuWeGQXd2v0QgEsV251y0OOM2smfKTE2X6/AaL8O1rcGeTwmQs1AGkklYJGLhKyfj
	hfNOypYt7WeON29Pqg4nlNaLHCzFM5dpnxnVpgL3KBc8YnwoTdV3G0t/KiYBsmo5MlorDqktkhA
	g2uxmncGJ1hxa4nw7LXLooTRb4m+L1vC8++TKKVklsfVmCZS2WApGEV0bgV/h1SIn+vhibWh+Vn
	4XHT4g=
X-Received: by 2002:a05:690e:441c:b0:660:56ee:ebf1 with SMTP id 956f58d0204a3-66284e68df9mr1616587d50.22.1781316794269;
        Fri, 12 Jun 2026 19:13:14 -0700 (PDT)
Received: from gmail.com (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66274c675f6sm1955578d50.5.2026.06.12.19.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:13:13 -0700 (PDT)
Date: Fri, 12 Jun 2026 22:13:13 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 sdf.kernel@gmail.com, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 kernel-team@meta.com
Message-ID: <willemdebruijn.kernel.11beaafde34f6@gmail.com>
In-Reply-To: <aiwyvEbSHLHKNXBk@gmail.com>
References: <20260612-getsockopt_phase2-v1-0-7b01f1f5d106@debian.org>
 <20260612-getsockopt_phase2-v1-2-7b01f1f5d106@debian.org>
 <willemdebruijn.kernel.26a37316bb5e2@gmail.com>
 <aiwyvEbSHLHKNXBk@gmail.com>
Subject: Re: [PATCH net-next 2/2] udp: convert udp_lib_getsockopt to sockopt_t
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Breno Leitao wrote:
> Hello Willem,
> 
> On Fri, Jun 12, 2026 at 10:58:19AM -0400, Willem de Bruijn wrote:
> > Breno Leitao wrote:
> > > In preparation for converting the proto-layer getsockopt callbacks to the
> > > sockopt_t interface, switch udp_lib_getsockopt() to take a sockopt_t.
> >
> > What is the benefit of this conversion?
> 
> This enables kernel callers (io_uring, bpf, etc.) to invoke getsockopt
> directly. The setsockopt() conversion previously used sockptr, but
> Linus objected to that approach and suggested iov_iter instead.
> 
> For full context, see:
> https://lore.kernel.org/all/20260408-getsockopt-v3-0-061bb9cb355d@debian.org/
> 
> > It does add a lot more complexity and makes the code less obvious.
> 
> I agree this adds complexity. Unfortunately, I don't see a simpler way
> to enable getsockopt to work with non-__user addresses.

Oh right, this is already applied for other protocols such as l2tp_ppp
rds and smc.

