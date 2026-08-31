Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD762390CAB
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199791; cv=none; b=ou9Gj586sbCDNZefRPbVQRDJwZQ3eLgKGXMEBaahJIcrD+a+1H+9QNIZEMj/MIwTQknPJKGRtQpGh617PZKaenRxVWcwq9doXal3DsasT/RzugHcYXIl1q5qIEiQvq3xdznI9pukD1wtDayFkVQuFjplTcHc0esvGsFmG92Y0oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199791; c=relaxed/simple;
	bh=UJIjx7Nd6UnwIEMkfyx4MKf4iq09kir0HcuQtcBrn2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pN41Y4yQ4azaO7/91DVI0YUFIhqiPNB4rOMtMKcX75KXQckxfClBbV+GyvwvlWsG1rm8MBDuTRgtLneT3yXwO8/Yt9VtK7jkNoI1TxF8OdgsU19poiJuoDiQTx4212V1J9g3i8bULIMqqqUP2qHF/mF55hR9wIrckFCwvzWuYfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=iVEvvpsU; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="iVEvvpsU"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso2868575a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1788199789; x=1788804589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nC5kpux0BtJotabIv7/q6ESBCBij/ueWvvNCaE5KD0I=;
        b=iVEvvpsUvxnmcRK29ZjpZSEpPEm2vClhvxxeTzdnVeei7KCow9+0xf8/AZjeIDHqDr
         cLulgo2a4L0lBiTu7C0mdT7nnVVnnGI5Orp3ylhNsKQwwuHtfjEcfKaE1z91ACuS0V6P
         rJnCZwnmiVF4oMzr7w/hoAZ+OmaVWpvyfyRXI1bXINhuLhsySUWx4/s21KjMeqGYbgZ+
         I3OWQG+0HLe801ltuyrQAZr8dyJVrR/N2yU791z3NMzsFg69hfpIFFcs8NyQGxnDE0+Y
         V56ktEZuxcFtxkbqLFzJwWbBWE1bkrBxqpfagWnqQ6ueOKA/6flMppmw8aOBZr19DpGz
         tEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199789; x=1788804589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nC5kpux0BtJotabIv7/q6ESBCBij/ueWvvNCaE5KD0I=;
        b=inVonCnrSc0lg6HdChUaS/wGixbW9n/t49NwUvTsLh91lhbLEGoY4OjyoySmnpg926
         EADhlic36xtf7U/ecx5rq8QIQrHCy4ixhZs+UMj7jAzaAac0b09SfZcz/krTEofAU/tJ
         K5RH26ZMWClM42Y8n7J8xGYBLw2GazNtiH/XNghEP4MmsjD7rJA9zaeHGrodN9Pv+Yz0
         di9eaYg772iegy4kxaupyXMPC7Fz9u5JMqlkGdgmVPvH6Qq/oEEcV9oGPEp+GF0ocip0
         o3vRBcbbo2zHPkXo8a7iqo2v65PCfD9OlHzcJtOoe96I+eQ2QOKfw8+qip81OWjykHai
         3gkg==
X-Forwarded-Encrypted: i=1; AKwUvBwFzM5s5hY2KHsb5tycPh9UWGtpAcieBBz63VQAjwqioMmTK1AcA4yJR/7kq254hkJEGQNEhEuIZjcL/sIAYUY=@vger.kernel.org
X-Gm-Message-State: AFuF++l9m/coGa18FVv0tQ2zd8X6iz0rBOGY7TBD6H8qlZGxpIf6zG0B
	n5qRCaoHa7PPYj0pU27tNrtqJ3HNrDABV8PGSpfK/s5BdSQU1dmoS8HrQXTqSkknF/U=
X-Gm-Gg: AYBFou0zookB9C+mS2d7fDVwuSgyQhQ4YGL4wYfcYTlHWFiNGtJf+cfOotA6d6Dnfwf
	Fv04/gRRED+vsUHvS/qwMy+xohXEG93YIiLxCVnRQBUFESUPleS8d+lQDH3c24Tlv6/wrvPh78j
	V9HlhyEqRY3MkjPApHZ6DzkrkRzPEgLh2EeU0tZdnfYy1jhSyl88cldLzv+NNfEO5Dl1vLAB1tl
	8a59yHv2s5sEWupTVzfAZ6VCEzNVE3/XuMXF3LRoxMAnF0ZxgV0yZF5DMNRSGSUMlW2bCXdWY2G
	qzLLBa2MX/6eE75vbHTgNIMY5pC2wxA5tRzLfCuyg8R0HyJxuS3Bkjp7fBy2h04hiAGbHPc7A64
	nxLdn2kOuyDbdw1XLflxzjZ+7WdQ2+eSaUZ3MZgMNDCnTswzewpJAmIBn/Rb1jeFeh3oB7KdZve
	ApQllNaiuTNCvPUsEtenwpCRmLTWkiU2g+5pX5TKHG1Pnp+wENvc7bGQ8frgFmtGe+Q0EQDStgI
	M8Hhy6mCciXkbYSXzJ6nfOtwAAtVKZIPlP6CFRIvCBmDDI2NovGKGaUXuqteQ==
X-Received: by 2002:a17:90b:2f4b:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39907b77747mr3516597a91.11.1788199789044;
        Mon, 31 Aug 2026 11:09:49 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::7:1753])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm30252869eec.23.2026.08.31.11.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:09:48 -0700 (PDT)
Message-ID: <25f25b5c-fbdc-4bd5-ba97-85248ea8d421@davidwei.uk>
Date: Mon, 31 Aug 2026 11:09:47 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/6] selftests: net: fix
 get_refill_ring_size() to use its local variable
To: Juanlu Herrero <juanlu@fastmail.com>, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com,
 pabeni@redhat.com, shuah@kernel.org
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
 <20260831-iou-zcrx-v6-1-02d1d012f0fd@fastmail.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260831-iou-zcrx-v6-1-02d1d012f0fd@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-31 10:34, Juanlu Herrero wrote:
> In preparation for multi-threaded rss selftests, fix
> get_refill_ring_size() to use its local `size` variable instead of
> assigning to the file-global `ring_size`.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
> ---
>   tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index f6a8fc5fac24..df6b62204343 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> @@ -132,10 +132,10 @@ static inline size_t get_refill_ring_size(unsigned int rq_entries)
>   {
>   	size_t size;
>   
> -	ring_size = rq_entries * sizeof(struct io_uring_zcrx_rqe);
> +	size = rq_entries * sizeof(struct io_uring_zcrx_rqe);
>   	/* add space for the header (head/tail/etc.) */
> -	ring_size += page_size;
> -	return ALIGN_UP(ring_size, page_size);
> +	size += page_size;
> +	return ALIGN_UP(size, page_size);
>   }
>   
>   static void setup_zcrx(struct io_uring *ring)
> 

Reviewed-by: David Wei <dw@davidwei.uk>
