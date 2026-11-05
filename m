Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876944;
	b=4D9GUoPDZf13pc7dGMVUp1adZ+Yn13SHtIiEUNxvUQ0GEpQatesuPOHNZF0ITHDGLLIs
	 I/9IpUS6uDLs1dtWCH7eIYv4la0ilsK6QosWL0MDmRRKDm8ecrLl7lQvcegBKQcXLQ/r6
	 YtwymXIaJuS+TM9uKllTK0L+DWNxtq1dcSMgRDxvYtu2fxI60yW9khIyLBkEVMGfHoiM7
	 DLd4Y2lipfKBnVdKTFOSz/9aDAbQAp7/X0SvFIhNPxZTNRw0gZertoENtpadS5zAoygfz
	 4bUl0nyhNhfUv+DLcqvUi7ddxzMG1zaOs7zY8E9qP1fbFiZFmHR9yK7bCOD5HNR9Mgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5zh47PhyGNcCuyOqp3+KQ7znXgLobnEyNmBv/7LObTI=;
	b=0gdcUek/sgKLurlutd+FNXOyv14thn3nFaqDrUh61ySQXXp8d7WcTj91dJMtPnFZ7Oxm
	 lcJGujaJtu+mjufHrFgJNW7379Hru65a09GuduwdTbZLTFPDOQblOCTwiWtCK/nCxT5Nz
	 5rai2wHYTgYSyTEeOCv5l8HW6LYq+yj4NxOMPxoLVHzvNFTtJw5K/Fvv/rcGSdttTwZAo
	 uWZuJ31gIShcRiiU0/J8kzzvoTh0UuhyAjd7KjqNe68AcsEwvMh8vqDOjOeNyxwdXqjeg
	 s7YS+DEF5cwKxEtIcznhBNa88a3gZdezygKJeY/5rANyzxvyD3QiAHfguTnnW7I7eZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anxDHPe4;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D75606A330
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 11:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D75606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anxDHPe4
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11562395e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 03:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876942; x=1794481742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5zh47PhyGNcCuyOqp3+KQ7znXgLobnEyNmBv/7LObTI=;
        b=anxDHPe4qYMe5qqmqd0MSMf65qP4moQA3GuGNN2kFJ+wr8FIpecXPAEKrLywhHBhE3
         2ONRWPNI7u8WJN0gJZ/c8AnHRMkPlOVO01cuLkSSFLEcSPryxLODI6bauIVLTlF0TY5F
         2pDiuFpM6e4TTNg+vPvEsmsCJ5oW3j4HCqBqRQlbW2/D4vQX89c5/XEoZicysquf5IUa
         WgDJajZBM0cyTAhZhGK3Ww0V0Oi9XuirTLBUYTvsUvxPUrrUkTz421u5eC+XwAjtcvMz
         WCyHa2EuZa6qtyWvylKJ/cNaLw3CYU+136vYGmfWlVLKwSBFF/eXkbxjG4jhnr3hRnRI
         faUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876942; x=1794481742;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zh47PhyGNcCuyOqp3+KQ7znXgLobnEyNmBv/7LObTI=;
        b=mCB+Qo5vbj9zoz7LkTYNjLn55j0JcZ2IE5Y5I8WP92c6LARW9xsWw+r0lbopjheSGJ
         VlKNC5P6ogtup2uG69/3SJlzIRy2tkKdoJEAVMSv9CfOkCF7g7GT+/4N3yR4LOGXw7+W
         uARFhMfTH/d3krS/frxMMTelbBUuV59hc6Cw2naHNOjmGdm00OX00Fd2LFPIU2m/IEYc
         RHtx4xdWQdISVmXGVEiuldEVzpWxbzmB60Afrs4aoWdjSQbWF5IWYDXG8+Ys/Mb6OR51
         nnRmmUL84d4jxIliIt6CL2Twk1njyiVifqquHIOB4edBmB9g8WYG+LJSapid1QF9DLss
         8zjw==
X-Forwarded-Encrypted: i=1; AKwUvBzJnrGoMsHRNjpHLH3DbhqtqPjq74IYFNieiz4p9hnVrq10/VHwVOzOpNw4uOpCQAjzgeiEnBguH6Y4r09/1IQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tyRa7hTxIvyBSQqKL7I+IgXIW5GDEsiIC79OWNzRp7W33J732
	UMn/ZnRBszQSOnehnUnbm61i1CnfcKLqc4a1ZbuO/CkoZMlbRZXCrh55
X-Gm-Gg: AYBFou28bJQxBFJQdMzHY2jQHNBCgv/5FOEHOZpgLWXnyfsffJ/Mx4tRveMo7zwEyZ9
	YAjZTQ3MjXxSEQAtwcS4CI3wrx65cncB13LFeATslgBdT7whWw/hZD63s+NsgYsnQvhHGviql7G
	shTkOg29LgEfT0/n2IPHxjqozhzvH2kjTuLa8NB3BUiGcW3haPGOSDIca78MEfJ6EwLaV2fclND
	H0Ic6q4EjKC35Osf2/1yNTJzNY5aFu+g6gqVqWYay7r5Ng+poYojqeu1VIQQrCz3h9rbDEQy3rR
	94RZsF2m9/vhcg3uaTCmJXHFyQAq6Cz5QsRdS3FnnlkWER+4XNLozqrenblTEdDFgUJ1ORihXmP
	JKVJqfJUDYlDhvsrVdnm/cAGBTN9h35gbjDCxeg6Kv2HYYT76J/VaKiovLhxqqek47PhioHa/Gc
	uf6BJX430h5wipDLr3vbh5smHsUuNlnIZxHjnrblJWyftKdxYq8s8F1gYpsCl+Epa3JCwHQzAPz
	greqz/vy5a930eeomxX2yg8mgOp4g7BAtrV8RnMOpNndOKhoP0iCHwox2DE2R6BEmIsZpR//nM+
	RMHZMnywHJsw1suB0w9zPpBVH4xMynteLmRK7X3JedwIah/zRcQGGezai2nQz3c0
X-Received: by 2002:a05:600c:848c:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4ac175669d8mr457195995e9.14.1793876942030;
        Thu, 05 Nov 2026 03:09:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm110253935e9.3.2026.11.05.03.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:09:00 -0800 (PST)
Date: Thu, 5 Nov 2026 11:08:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Dmitry Safonov <0x7f454c46@gmail.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: tcp_ao: don't shift a size_t by 32
Message-ID: <20261105110856.2dc9f08c@pumpkin>
In-Reply-To: <20261103163921.641347-1-sashal@kernel.org>
References: <20261103163921.641347-1-sashal@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Nov 2026 11:39:21 -0500
Sasha Levin <sashal@kernel.org> wrote:

> gen_tcp_addr() shifts the size_t n right by 32 and masks it with BIT(32)
> - 1. On 32-bit architectures both shifts are as wide as the type, which
> is undefined:
> 
>   aolib.h:230:40: warning: right shift count >= width of type [-Wshift-count-overflow]
> 
> Convert n to uint64_t first and mask with 0xffffffff.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
> -m32, with and without -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without them now, and the x86_64 builds don't change.
> 
>  tools/testing/selftests/net/tcp_ao/lib/aolib.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/tcp_ao/lib/aolib.h b/tools/testing/selftests/net/tcp_ao/lib/aolib.h
> index 53be1744237ee..71ff975533089 100644
> --- a/tools/testing/selftests/net/tcp_ao/lib/aolib.h
> +++ b/tools/testing/selftests/net/tcp_ao/lib/aolib.h
> @@ -226,8 +226,8 @@ static inline union tcp_addr gen_tcp_addr(union tcp_addr net, size_t n)
>  	union tcp_addr ret = net;
>  
>  #ifdef IPV6_TEST
> -	ret.a6.s6_addr32[3] = htonl(n & (BIT(32) - 1));
> -	ret.a6.s6_addr32[2] = htonl((n >> 32) & (BIT(32) - 1));
> +	ret.a6.s6_addr32[3] = htonl((uint64_t)n & 0xffffffff);

You don't need a cast or mask there.

> +	ret.a6.s6_addr32[2] = htonl((uint64_t)n >> 32);

That can also be n >> 16 >> 16

Also see upper_32_bits() and lower_32_bits() in wordpart.h
which might not be available for selftests?

David


>  #else
>  	ret.a4.s_addr = htonl(ntohl(net.a4.s_addr) + n);
>  #endif

