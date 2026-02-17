Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355924C6C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771331626; cv=none; b=eXg1ltf007hGk3deNzUVMoxInFTQZbz//1WxNphHKspoqTTNRtdPhl4Xvv9LD78k14NDM7ZocpVtuObsA/dpyBCiYB0Wt03iX7fQnUeVeFe7QvW7pPQqmLiS97XS3/s4uO0CGr2nwcHWf1fIhykO8aotr+Gz1KMRzjxSraHMfW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771331626; c=relaxed/simple;
	bh=3F/PtxbvnZWTruaWOX8pt9TFrvnOL7MN4m3IXy/gB00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYvMLvbBmVyCw8v8kqwxQePbxIWOgedcDpPkPXs8PuOveuOQRLJV0dlL5MAtpToZCqN18bK3mqrTnlOOwUvUeYpJ0j42VZTP18L7raGxsrxO/ph4fu4ux/J3ouLKNKyMBwm5A+KGYC9HdNxFR6lBrp3AWO30UqPwSABashX8Dnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AJyn9eFN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=odrm1pQn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AJyn9eFN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="odrm1pQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771331624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDRWvoSrz3e9BgTnryMnQECVYhAGIwjQq5XKzoi1yT4=;
	b=AJyn9eFN6TO91G6/5Mb3kUFrcxmm3tQZe4+OTD5mtcSgNrmf513Vd2cc5QP2pf1laJji7I
	vPs+7LUptJC1o1Hsy+V7P6j9IJi6+DkqUybfXJpzl1/KBCK6/MIBmEUqRv0/AZRP5hCD4g
	0HR2a0DrnIv87xPn3nv1e9OoANEwrm4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-kpHZ7zLYPGS7XsHEF8vxNQ-1; Tue, 17 Feb 2026 07:33:43 -0500
X-MC-Unique: kpHZ7zLYPGS7XsHEF8vxNQ-1
X-Mimecast-MFC-AGG-ID: kpHZ7zLYPGS7XsHEF8vxNQ_1771331622
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4376e25bb4dso4410924f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 04:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771331622; x=1771936422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDRWvoSrz3e9BgTnryMnQECVYhAGIwjQq5XKzoi1yT4=;
        b=odrm1pQnhSHcpzDdJCscpUySTdaXZLPiFpmr4InC9sWcK6tSvnCQgUWctil3SM3dae
         ku5BFRTYWOVfzMIR+kVyvJZGIULlnpCmkJwh1u3zJYg4mDMRgYfo9/kXFNHJAJupPFCK
         E+5p9qxtMDoVlMGp7di356y1+KAoCaTxY0lHjDJbAeC2xHcUw3X2kCNfG6JoG2nsBEjK
         0spCDezuf0Yi5SVfXCv/+iJwbME1o7rKzJvtpliwM1rbPMQzHBxah9BKJB+pyo6dr1Zr
         2aybALlwd3LNSLrKZZtxLp8AOEhXEmOIsYCIli2oo8+I713aY/HNy3v45L8AZiJMCPov
         9YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771331622; x=1771936422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDRWvoSrz3e9BgTnryMnQECVYhAGIwjQq5XKzoi1yT4=;
        b=SROtp1XpCvM2HGMCLoxNbipXckqjakqP2Y68DjCxRszy79EBJMrgb6GYTxXm8oYoyi
         XaLmXYQtlljhd1BnCs1jYhueUqwuEprBIi2DZqodr8mPshHhA8UwEfzyIRD/GF9c7kR5
         IhKZTPPrHjX3KBPKHwEfNL+/DRidJpwb0zoW83H2R1IR7gRa36b6OOKkzOKtecTmGOIx
         +xOX06RJksVkpQ3D7MPIy/YQ2AahW60rBBLZL9HwpiePB1JKOQcvOe5f35L9HdcU0zWG
         5EJqprKfB6Y0DedRCOwcl09kfXuw9vSz8ImpxAIkG5hx9S4XR2Va2slwDn4QFgXJSAF+
         qceA==
X-Forwarded-Encrypted: i=1; AJvYcCURC5NSfUfjsNaIUd6tD/3cBcqra1O34NvmIWFkmKGMtKB94RVYlsKhu/xNfnSTjl5DLVITuFhEdXz4wHOp3wA=@vger.kernel.org
X-Gm-Message-State: AOJu0YySFhRsgxt0iFEy4rb29VcBItAERGx88g5qKYFrfUc3KAFDHfQX
	2S5vu+X0eJwFZhe39F5PQMpVgwd330BNvbMA+U7kbWNuuOIEB6qAqZtHtoCKqe+BLZZTT+qdSiX
	HJF6p0fvDzBIuwy1Iz4YjNC7O0pGfgIwEGu8JnpusKkENnmXMJTfSmi/3OTXOGFsqrJX0Vg==
X-Gm-Gg: AZuq6aIAGJqH3GUfGIMqoMglb4XWoXcxLoVa6dafjyUck9Wso2Du5K8aq/HRV47LNnL
	y87yULayRaUif8D3TXiWNrL2EF1oyjVAf77pBTgP2daZkhANgcYqifkY9/AAU+eSc/CZll286UT
	2XDjHjsq2a3+aU/YeIaspfb+ao0Ii65Y5H9kktM+zEAZCAcD8SaYn7+eTfip5H7nFUO9As/r9Bu
	8E6LeXEbyuT8hRe5OhVI/PmipgzvCUoVLxFidDBUJgisa2O+c4OM/yQYFHQE5BIbQM2v7HayDIo
	JXyUXxORSCMZp3Hrhmz8kWwkqNa+DDNH1acLNQ7odQXhkoFPVXRGPJkwtZdkCddcdI5txaSwMd4
	LW+UDTIgcPOEKF+OKAK4r1/nI9Q==
X-Received: by 2002:a05:600c:8117:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-483710588e9mr183712815e9.14.1771331621799;
        Tue, 17 Feb 2026 04:33:41 -0800 (PST)
X-Received: by 2002:a05:600c:8117:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-483710588e9mr183712465e9.14.1771331621423;
        Tue, 17 Feb 2026 04:33:41 -0800 (PST)
Received: from [192.168.88.32] ([169.155.232.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48378b5196esm127469705e9.8.2026.02.17.04.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:33:40 -0800 (PST)
Message-ID: <354ecaee-7b66-4c8f-8293-30e68f1a3a1c@redhat.com>
Date: Tue, 17 Feb 2026 13:33:39 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 3/3] selftests: forwarding: fix pedit tests failure
 with br_netfilter enabled
To: Ido Schimmel <idosch@nvidia.com>,
 Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Petr Machata <petrm@nvidia.com>, Amit Cohen <amcohen@nvidia.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260213131907.43351-1-aleksey.oladko@virtuozzo.com>
 <20260213131907.43351-4-aleksey.oladko@virtuozzo.com>
 <20260215094520.GC114305@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260215094520.GC114305@shredder>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/15/26 10:45 AM, Ido Schimmel wrote:
> On Fri, Feb 13, 2026 at 01:19:07PM +0000, Aleksei Oladko wrote:
>> The tests use the tc pedit action to modify the IPv4 source address
>> ("pedit ex munge ip src set"), but the IP header checksum is not
>> recalculated after the modification. As a result, the modified packet
>> fails sanity checks in br_netfilter after bridging and is dropped,
>> which causes the test to fail.
>>
>> Fix this by ensuring net.bridge.bridge-nf-call-iptables is set to 0
>> during the test execution. This prevents the bridge from passing
>> L2 traffic to netfilter, bypasing the checksum validation that
> 
> s/bypasing/bypassing/

No need to resubmit, I'll fix it while applying.

/P

