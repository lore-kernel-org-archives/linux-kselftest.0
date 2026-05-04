Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462F13DFC6F
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906465; cv=none; b=QX5B0pAmfX104t8kwyLYgmekvQcHDXbVlxeMYKCWl5TYemZeqk9zRtbj0nRxrIa1nIUgRQfjUvHIaeOnJMtmcN2pvpoV4YKn/zat+H/lYESrvUhaVQ0JLGRDhZH8MugimqSk4RpTCjKVMBI36MBbKgPlOKeZpfFM49xS02m+qAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906465; c=relaxed/simple;
	bh=KHqYr0ItdAFMXMIPUhb8rlWKl8ynxj6igZ73aDx5RRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgGTBo/AjDIOC8/dS9BPonhHvhDKLES0SM2TQL/pU3/KgziLgJFyZbwFybA+KYkGeXdr4OEiryZJtYaBWhuL5+L4MM6TE9cUucptd8nB/bdlgan7A2IhuHjt37E3h/kdPwqdMr8hH87z81eXkcWBDCK+b0sdtq+DfBpPVZdkOmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmp0XHie; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmp0XHie"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-358ed696623so1904504a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777906463; x=1778511263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6kqUUkAQzlw4Bmuk+4uOMY5eXHd7Lb2epHcnpLdT4Iw=;
        b=mmp0XHiekBoxQmGL2lAhOK7VYw/4KOJ09ws7OqAZ4ex4xzXTSjyNFCrK696ZSGCGCn
         EbMILymXPgrGicTTtfpCPjif/TCRsKwzfW3kIoOjFhKAoCueM67gWkpB3leCGll/ln0+
         94seTP61Zabhd6WFok6AAv1zmORFEwQ4iqWGut2uTDj2E8Y5JIWvCuoDD+oh1D6tjAl1
         EYl4cAdNeoz9wY7JCu3CZssKdnbekX4JLQ3kw4IN22uUsfw3DqPQsxTEyO9HpS4I6y09
         ZzAbZlAFm2b6dwji+DdPRtN6mSnYgu/WIGKfsYbllDE+RY/r2S+YhvO86bDpQTAbEsKB
         TRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906463; x=1778511263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kqUUkAQzlw4Bmuk+4uOMY5eXHd7Lb2epHcnpLdT4Iw=;
        b=SQ5u0RV67WNlIQhGMCX2kEC6ansY3zdbkzb59WwCky/X7QH9FPw9Y2/BuFT/njM3Kc
         QN/EZ/W9gMyvKzf6TqVeRZ63LibyAJ/qgaHHlcKcQ5Ea49DXP2r5cOPYcoIBWCLhJ/k+
         Vfb1WuW2EnHsb5Dn/RQL2P+CssHqRl3Th4HPl7IXKDUkSmPl2jcLWPwizT4uIXHOW5mq
         ICOMToyKpafZxT7rjqaUK212VIyWeain4FDLvwJGAU58jibIl8Fa/BTWUyqBtmLBb3GU
         6AVsWDti1K2Pgk3JpwhLFPDUweT7SmK7iVUfMmqVnUyYzYeiGrTIcfasG/rKY0vE1Dk+
         ey1A==
X-Forwarded-Encrypted: i=1; AFNElJ/IQ1GFTBUrVQGFz6t1w9pAQCrkN/otiT5EHAf9Mp+s5ebsXv3xIqz6m37zGdbx8v6Kwakf5VprmvgYxxIlPhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSzKRHrnBEnDgSD0DsS29ra6Az3pfbPRERaU90hrei7fi/aep5
	kD07ygcPtMIMrvXbH25nkKB6SeupXK5rebtT+wBLWcetqNIaGVVNHUEV
X-Gm-Gg: AeBDiesXU7W9lnO1qMu6rQfFQ4zdkQ02iLs23HL0euvk+hBKQaYhWqTLl72AHAT4cGm
	f1IwmstCj/kZIbMLeOys4lsfn6QFTabfyofDiLTQjUjzMmSXGy0JpQVQo3aTG9GYZ7vrYRS6Rzk
	AyY+TLypeQhs0MksbmgdOsf0cmkGehJvC72UucUsTnhJeaIU2/BhMZOivff+3jHdh44wUUdxQKR
	SpoqVC/xRnLC2dPRh6K3YOsEnlgze9EgCvZXtQYYfj44MheRP4OAg+/9P+DyBhqK+raLIKo4Jc+
	19PPusOXSI5Hy5lfU5xWMDmEmDCJePyZmwEp0SppeHUn8+IYPKk1rq6OR5SNNB92UL6HAAxJ4V7
	EoQAqI8kwFJnfAe2f/gMoNQWx0CepxEM7k+6OzbmFAnEvyy8jygN3n/fBNqtsLch4mA9VJ/OI8z
	si4y9L6xupJJMlHHojIuJK5OhRjw==
X-Received: by 2002:a17:90b:2888:b0:35e:5ae3:2993 with SMTP id 98e67ed59e1d1-3650cecebbdmr9653365a91.15.1777906463552;
        Mon, 04 May 2026 07:54:23 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:d::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be028cd6sm14794209a91.14.2026.05.04.07.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:54:23 -0700 (PDT)
Date: Mon, 4 May 2026 07:54:22 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH net-next 2/3] vsock: convert to getsockopt_iter
Message-ID: <afizGJmDPwi92IHx@devvm7509.cco0.facebook.com>
References: <20260501-getsock_one-v1-0-810ce23ea70e@debian.org>
 <20260501-getsock_one-v1-2-810ce23ea70e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-getsock_one-v1-2-810ce23ea70e@debian.org>

On 05/01, Breno Leitao wrote:
> Convert AF_VSOCK's getsockopt implementation to use the new
> getsockopt_iter callback with sockopt_t. The single
> vsock_connectible_getsockopt() callback is shared by both
> vsock_stream_ops and vsock_seqpacket_ops, so both proto_ops are
> updated to use .getsockopt_iter.
> 
> Key changes:
> - Replace (char __user *optval, int __user *optlen) with sockopt_t *opt
> - Use opt->optlen for buffer length (input) and returned size (output)
> - Use copy_to_iter() instead of put_user()/copy_to_user()
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
