Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB8E36C9EE
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355028; cv=none; b=Muwk84PheFzbzrvhMmtvHA5G2qdAjMCQWNVin/8D0ksGn/EkLpdz+PkommQ1l3hbGSQSPwXqA/+yxFsR4fvrYmHml/Zm5PmNwkJcwM5OcbuAildAZdQHJ4632KWsU353xdY4UqzRX9eivTIBK/KZ6uRWKjn1MPM1nacd80YRBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355028; c=relaxed/simple;
	bh=e4E9ApxuKnHL6gEt0l9i18QERzbyiDlwx9esv+XQqcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QcKt8QokvMXupkAIgvIb8W9WxYZ/a2IKyxDVQi5Z54ywMW3/aEvhcgJp1zSbaikz2R5vUfKuOTG/en5Yt6WAF4fq9sB3r3tUwjJBzShktQOb04VpVzWgoHaxrzaLyGvKDvoofBtMiMvCcOvwue5J4jvPhozbv6nx4/wsWTLGmp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MQ+2l+Iy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MQ+2l+Iy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779355025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZC77d7mSmvyQZQpaB0KYORR6eKaPrKgUruY5Qci0Z8=;
	b=MQ+2l+IyNG0z8jSrDo9ThxjlphZ543ZGriwKVXFE9p8e42JuodRU6iZvoJbZeCe5yL8JVD
	Vg5synv5lEslbgu4Sfp7yylPVYOfdfGwjIwa0r9+sM9BhOhJM71J2haONABru/PmZZ63hZ
	g2robIn9QQUkQjtD9ZxnrXFojKiE6Lc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-Rzjuf-hSPqeW_WHY5-Q7hg-1; Thu,
 21 May 2026 05:17:01 -0400
X-MC-Unique: Rzjuf-hSPqeW_WHY5-Q7hg-1
X-Mimecast-MFC-AGG-ID: Rzjuf-hSPqeW_WHY5-Q7hg_1779355018
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC2FD1956096;
	Thu, 21 May 2026 09:16:57 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.233])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 840DD1800347;
	Thu, 21 May 2026 09:16:48 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: akiyano@amazon.com
Cc: davem@davemloft.net,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	richardcochran@gmail.com,
	edumazet@google.com,
	pabeni@redhat.com,
	dwmw2@infradead.org,
	tglx@linutronix.de,
	mlichvar@redhat.com,
	andrew+netdev@lunn.ch,
	guwen@linux.alibaba.com,
	xuanzhuo@linux.alibaba.com,
	dwmw@amazon.com,
	ysarna@amazon.com,
	zorik@amazon.com,
	matua@amazon.com,
	saeedb@amazon.com,
	msw@amazon.com,
	aliguori@amazon.com,
	nafea@amazon.com,
	evgenys@amazon.com,
	netanel@amazon.com,
	alisaidi@amazon.com,
	benh@amazon.com,
	ndagan@amazon.com,
	darinzon@amazon.com,
	evostrov@amazon.com,
	ofirt@amazon.com,
	amitbern@amazon.com,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH v3 net-next 6/7] net: ena: Add error bound to PHC communication layer
Date: Thu, 21 May 2026 11:16:32 +0200
Message-ID: <20260521091644.84928-1-pabeni@redhat.com>
In-Reply-To: <20260515164033.6403-7-akiyano@amazon.com>
References: <20260515164033.6403-7-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: AI Reviewer <ai@example.com>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://netdev-ai.bots.linux.dev/sashiko/
---
net: ena: Add error bound to PHC communication layer

This commit extends the ENA PHC communication layer to retrieve an
error_bound value from the device alongside the timestamp, and adds a
phc_err_eb statistic to count error_bound retrieval failures.

> diff --git a/drivers/net/ethernet/amazon/ena/ena_com.c b/drivers/net/ethernet/amazon/ena/ena_com.c
> index 257910460bd8..832c4c1d0e5e 100644
> --- a/drivers/net/ethernet/amazon/ena/ena_com.c
> +++ b/drivers/net/ethernet/amazon/ena/ena_com.c

[ ... ]

> @@ -1882,14 +1888,15 @@ int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp)
>  		}
>  
>  		/* req_id was updated by the device which indicates that
> -		 * PHC timestamp and error_flags are updated too,
> -		 * checking errors before retrieving timestamp
> +		 * PHC timestamp, error_bound and error_flags are updated too,
> +		 * checking error flags before retrieving timestamp and
> +		 * error_bound values
>  		 */
>  		if (unlikely(resp->error_flags & ENA_PHC_ERROR_FLAGS)) {

[High]

Once req_id is observed equal to phc->req_id, the function reads
resp->error_flags, resp->timestamp and (now) resp->error_bound from the
device-shared DMA buffer. The updated comment explicitly states that once
req_id is observed updated, "PHC timestamp, error_bound and error_flags
are updated too" — which is the producer/consumer pattern that normally
requires a read barrier between the index check and the dependent data
loads.

The buffer is declared volatile and the req_id check uses READ_ONCE(),
but on weakly-ordered architectures such as arm64 (which includes AWS
Graviton, a primary ENA deployment target) neither volatile nor
READ_ONCE() orders dependent loads against DMA writes from the device.
Without a dma_rmb() the CPU may observe the new req_id while still
returning stale or torn values for the 64-bit timestamp, the error_bound,
or the error_flags.

Could a dma_rmb() be added between the req_id check and the subsequent
reads of resp->error_flags / resp->timestamp / resp->error_bound, similar
to the pattern already used elsewhere in the same driver?

For example, ena_com_handle_admin_completion() in the same file does:

	/* Do not read the rest of the completion entry before the
	 * phase bit was validated
	 */
	dma_rmb();

and ena_com_aenq_intr_handler() has:

	/* Make sure the phase bit (ownership) is as expected before
	 * reading the rest of the descriptor.
	 */
	dma_rmb();

The same shape applies here: device writes data fields, then writes
req_id last; driver checks req_id, then reads data fields.

This ordering issue is not introduced by this patch — the timestamp and
error_flags reads after the req_id check existed before — but the patch
extends the same unsynchronized read pattern to a third field
(error_bound) and the new comment now documents the assumed ordering
that is not actually enforced. Would it make sense to address the missing
dma_rmb() while touching this code?

>  			/* Retrieved invalid PHC timestamp, PHC enters into

[ ... ]

> @@ -1897,12 +1904,15 @@ int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp)
>  
>  		/* PHC timestamp value is returned to the caller */
>  		*timestamp = resp->timestamp;
> +		if (error_bound)
> +			*error_bound = resp->error_bound;
>  
>  		/* Update statistic on valid PHC timestamp retrieval */
>  		phc->stats.phc_cnt++;

[ ... ]
-- 
This is an AI-generated review.

