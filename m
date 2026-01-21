Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BDD494A08
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006471; cv=none; b=uFWyE2AQ4aQzsQocE6fDEwJSZ3Hgmmlci2Lxs5KdrF/xVBRrlEmCJ3+9f+IWzx5r8k2D/PZOiuPZeSyP2iCntJK+Q4X9rdNnJkwHg/gntxeS1pkI5lTGrcISMNez3SyakUZrwZa5L0vI8hUlGDlrAOCttxRkZWWgWazowDNweXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006471; c=relaxed/simple;
	bh=rwTBfOmv3TsyqCAMfxc10gpQoi3l0ILMzmyE1jv8NcA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=l58Nq+C3TU++5wc/c8JRoz9G8QLE13FfSFsFpYd81717GDPI+F1Il5rs7uJalTqHkNyHiHqecKsE+KyKpB+r46QmK+Mcx0GbaWL+0ZpDyDf+wDFV4IWKgNKwyz8vafvSYPh2wipCFhy5zXIyZS9cl9PWW3yVC6PkUxL7iAzmHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liYHgqFu; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liYHgqFu"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6467b7c3853so4848589d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769006467; x=1769611267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QhEJeO6VAAT1PZbRU+MPc9wELPLdoIH0o3vvoREGUw=;
        b=liYHgqFu6zaVrOed8Wo4gzeVMyqhgh2ou/lXkm442srFwPTMqj/JIoQ+Gc73z4Y4lI
         nt93NC/z8CPozL65UpGcP0vxJmMr4u9L5PuDQLM6QzIzCO91ELwjLqYHCa3/IgzEUTUe
         mR0uT8YxscFe1cgugWbfny2DAMDbucLPFPrnlC0qXpKS/J9X3vC+n+bFT6t412RVNVfp
         dTa9cqGKUnmTSfJ6sPCKb/fO3If+i5W8ZTsUxs/j1p7hnRpEZoRPoNoLkcmjEpmvm1GF
         T/o/zBD4KkZG38AXMboeXbk3m5YwuzWNd4Y1kpJxtAVHj3vTw0jjzFr4XQPUwq7bltt7
         YnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769006467; x=1769611267;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1QhEJeO6VAAT1PZbRU+MPc9wELPLdoIH0o3vvoREGUw=;
        b=FcC5R4l3JVBMRs0QPBpxm13Qm4pVqzeFkwooCV7heXF18sCWNxPyX9PAZ6ZajxYHoU
         rJmA1kgNkrwjAgEIjtWx2uOeDM4hI11HeVZL3JIq1/3DJHEEFGY7OMHSVJ45W5IciyaR
         UuSQiqlr0zQWFxnaNmiljzRmq6zb+KiV1gS1YE47aDXg4ozKhBF7e+ViaR/EB+3kHmn3
         LtyWTBVWWBqblRCkNP8CBGrs9fQhxERGFH7hkSBZ7wfdZ3LFXp03/ytCdtaVCjntS/xr
         e3yjtHavXetkGS7f/XvpCLaQM5klf+LTNyWkX0l77ldXOvYm6KFwyWZ8tQqKWgzQrv/+
         cs1A==
X-Gm-Message-State: AOJu0Yyv8+3Z3IZgSuc31rqO+D5BIJTvpeggb4jalPry1iKgooHdtmTf
	6ewCGcselOBFr8uNQA61ZP3D/hmPvfG9Mst4Vifd4iXjaNM65CdTNLlG
X-Gm-Gg: AZuq6aIRto051eqNpMwOZcyjOZ/F6eP8PLN9f57xfdHm1yrzH4odQxqlbV6spqjDyu7
	9dm2rFPuRl+TxKHarQE5tzJBJVCv+74htnUW+NAQ6cesh48NSnb3XujOUB7bc6Ln3zoKP/8h+2w
	dpgaXVzTwNFoovkST5jH10YEXdEPA+YwZ6a1tAxVOSz+F5xLagA9ZKTmQmnkB0+BLwfRYZeZ0M4
	LDRT1R3BX6p2Ybjek1Zm7LxDm08ZG4sUvy7bYFmnYtxyQSS34q76tCDimVnVS/8fONnfs2FhJhO
	DgnR+b9G92EXAEv9ALcqNfRP9CcUwnAan3ggtofrVuT8dbUq8JIsL8x4Cu7sM6s6VExfeW+P9fe
	bqlPSO6VV+fOU4NhRJIy6LcKDAIfzTiYZui9LEKmRDyQQs6ztiKuV1kpuZvcEqOlFXMgc/kTi48
	aioXdTJiTrzNEdK/nT9Ccuh/KMNKS24LektTvW36mojeplqiihB7qTj6XFMYNu07soIS9hVw==
X-Received: by 2002:a05:690e:4104:b0:649:393c:86cc with SMTP id 956f58d0204a3-649393c8e91mr5799523d50.4.1769006467401;
        Wed, 21 Jan 2026 06:41:07 -0800 (PST)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-64916ffc035sm8029614d50.3.2026.01.21.06.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:41:06 -0800 (PST)
Date: Wed, 21 Jan 2026 09:41:06 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Danielle Ratson <danieller@nvidia.com>, 
 netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemdebruijn.kernel@gmail.com, 
 idosch@nvidia.com, 
 mlxsw@nvidia.com, 
 Danielle Ratson <danieller@nvidia.com>
Message-ID: <willemdebruijn.kernel.be3e9734c8a5@gmail.com>
In-Reply-To: <20260121114644.2863640-1-danieller@nvidia.com>
References: <20260121114644.2863640-1-danieller@nvidia.com>
Subject: Re: [PATCH net-next v2] selftests: net: Add kernel selftest for RFC
 4884
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Danielle Ratson wrote:
> RFC 4884 extended certain ICMP messages with a length attribute that
> encodes the length of the "original datagram" field. This is needed so
> that new information could be appended to these messages without
> applications thinking that it is part of the "original datagram" field.
> 
> In version 5.9, the kernel was extended with two new socket options
> (SOL_IP/IP_RECVERR_4884 and SOL_IPV6/IPV6_RECVERR_RFC4884) that allow
> user space to retrieve this length which is basically the offset to the
> ICMP Extension Structure at the end of the ICMP message. This is
> required by user space applications that need to parse the information
> contained in the ICMP Extension Structure. For example, the RFC 5837
> extension for tracepath.
> 
> Add a selftest that verifies correct handling of the RFC 4884 length
> field for both IPv4 and IPv6, with and without extension structures,
> and validates that malformed extensions are correctly reported as invalid.
> 
> For each address family, the test creates:
>   - a raw socket used to send locally crafted ICMP error packets to the
>     loopback address, and
>   - a datagram socket used to receive the encapsulated original datagram
>     and associated error metadata from the kernel error queue.
> 
> ICMP packets are constructed entirely in user space rather than relying
> on kernel-generated errors. This allows the test to exercise invalid
> scenarios (such as corrupted checksums and incorrect length fields) and
> verify that the SO_EE_RFC4884_FLAG_INVALID flag is set as expected.
> 
> Output Example:
> 
> $ ./icmp_rfc4884
> Starting 18 tests from 18 test cases.
>   RUN           rfc4884.ipv4_ext_small_payload.rfc4884 ...
>             OK  rfc4884.ipv4_ext_small_payload.rfc4884
> ok 1 rfc4884.ipv4_ext_small_payload.rfc4884
>   RUN           rfc4884.ipv4_ext.rfc4884 ...
>             OK  rfc4884.ipv4_ext.rfc4884
> ok 2 rfc4884.ipv4_ext.rfc4884
>   RUN           rfc4884.ipv4_ext_large_payload.rfc4884 ...
>             OK  rfc4884.ipv4_ext_large_payload.rfc4884
> ok 3 rfc4884.ipv4_ext_large_payload.rfc4884
>   RUN           rfc4884.ipv4_no_ext_small_payload.rfc4884 ...
>             OK  rfc4884.ipv4_no_ext_small_payload.rfc4884
> ok 4 rfc4884.ipv4_no_ext_small_payload.rfc4884
>   RUN           rfc4884.ipv4_no_ext_min_payload.rfc4884 ...
>             OK  rfc4884.ipv4_no_ext_min_payload.rfc4884
> ok 5 rfc4884.ipv4_no_ext_min_payload.rfc4884
>   RUN           rfc4884.ipv4_no_ext_large_payload.rfc4884 ...
>             OK  rfc4884.ipv4_no_ext_large_payload.rfc4884
> ok 6 rfc4884.ipv4_no_ext_large_payload.rfc4884
>   RUN           rfc4884.ipv4_invalid_ext_checksum.rfc4884 ...
>             OK  rfc4884.ipv4_invalid_ext_checksum.rfc4884
> ok 7 rfc4884.ipv4_invalid_ext_checksum.rfc4884
>   RUN           rfc4884.ipv4_invalid_ext_length_small.rfc4884 ...
>             OK  rfc4884.ipv4_invalid_ext_length_small.rfc4884
> ok 8 rfc4884.ipv4_invalid_ext_length_small.rfc4884
>   RUN           rfc4884.ipv4_invalid_ext_length_large.rfc4884 ...
>             OK  rfc4884.ipv4_invalid_ext_length_large.rfc4884
> ok 9 rfc4884.ipv4_invalid_ext_length_large.rfc4884
>   RUN           rfc4884.ipv6_ext_small_payload.rfc4884 ...
>             OK  rfc4884.ipv6_ext_small_payload.rfc4884
> ok 10 rfc4884.ipv6_ext_small_payload.rfc4884
>   RUN           rfc4884.ipv6_ext.rfc4884 ...
>             OK  rfc4884.ipv6_ext.rfc4884
> ok 11 rfc4884.ipv6_ext.rfc4884
>   RUN           rfc4884.ipv6_ext_large_payload.rfc4884 ...
>             OK  rfc4884.ipv6_ext_large_payload.rfc4884
> ok 12 rfc4884.ipv6_ext_large_payload.rfc4884
>   RUN           rfc4884.ipv6_no_ext_small_payload.rfc4884 ...
>             OK  rfc4884.ipv6_no_ext_small_payload.rfc4884
> ok 13 rfc4884.ipv6_no_ext_small_payload.rfc4884
>   RUN           rfc4884.ipv6_no_ext_min_payload.rfc4884 ...
>             OK  rfc4884.ipv6_no_ext_min_payload.rfc4884
> ok 14 rfc4884.ipv6_no_ext_min_payload.rfc4884
>   RUN           rfc4884.ipv6_no_ext_large_payload.rfc4884 ...
>             OK  rfc4884.ipv6_no_ext_large_payload.rfc4884
> ok 15 rfc4884.ipv6_no_ext_large_payload.rfc4884
>   RUN           rfc4884.ipv6_invalid_ext_checksum.rfc4884 ...
>             OK  rfc4884.ipv6_invalid_ext_checksum.rfc4884
> ok 16 rfc4884.ipv6_invalid_ext_checksum.rfc4884
>   RUN           rfc4884.ipv6_invalid_ext_length_small.rfc4884 ...
>             OK  rfc4884.ipv6_invalid_ext_length_small.rfc4884
> ok 17 rfc4884.ipv6_invalid_ext_length_small.rfc4884
>   RUN           rfc4884.ipv6_invalid_ext_length_large.rfc4884 ...
>             OK  rfc4884.ipv6_invalid_ext_length_large.rfc4884
> ok 18 rfc4884.ipv6_invalid_ext_length_large.rfc4884
>  PASSED: 18 / 18 tests passed.
>  Totals: pass:18 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

Thanks!
