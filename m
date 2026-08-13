Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A242C3242A4
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786632312; cv=none; b=FcghkyKEuRQtKppMKC/Cfwruj5TAHhUDvvOy5CVoI1Fe53aAfxZbfq9oriUuJ2WpETzPTMlprCS07c0kyJQe21l09BTTPAuItAaayYv9Cw77rlteKTRNhOJhg9fQcJ8BaaBadGIiQRxtip+dq4sZLtvW1HcJKmdlZTARSrRepuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786632312; c=relaxed/simple;
	bh=pJuH/PPOUIdQXEJpPWWlBtN6fYhx4rNNnqawLicVINU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=g8bVU4nVSaFqdFQTwwVppI3B/sAUEM9uBw5mmNoSJjQJQL9qY3n0gbjlcqc4o40p8XUfN/+Kdw9Fo9mqwiMJmlTY1oyEdMLgaRO2i7EvBzb1slLo2kGEvuDFvnrduRWrqqs+xp8Q5P/aQ/48asBAS+d5YT8DM8IWOtBH00KMEWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SnBUc1uU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FhdUBWoT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SnBUc1uU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FhdUBWoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786632308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/yVIT8dlYNAXzYCl/QRa3ADMwgjqvaFn5nvo6B3PUJg=;
	b=SnBUc1uUEZ+ptIUmR2BFLMvMg/+dZj5R8xj2ojpm1M5q7/2HPTrRR2OjvpmLqLuU3H/Oz5
	1aS6Oe2mt8UcDiY79kUAL4g6mBh9HFW9kDg/KTS9Qrscu1kl/7X6UbXJAN94+7XL/a5oTL
	gswI2/T1uFLT4KUA4CL//n1lB43rcqk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-e5lho6XpPtG5utblzIs7VA-1; Thu, 13 Aug 2026 10:45:07 -0400
X-MC-Unique: e5lho6XpPtG5utblzIs7VA-1
X-Mimecast-MFC-AGG-ID: e5lho6XpPtG5utblzIs7VA_1786632306
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4954c2d4081so8467365e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786632306; x=1787237106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/yVIT8dlYNAXzYCl/QRa3ADMwgjqvaFn5nvo6B3PUJg=;
        b=FhdUBWoThUpty+m5FZYUlbqAg3uPFkCDFjWOQuCymbph4on9mK1QHejTOGwqXhNZ0Y
         5L6VytwHQXnYzWSggvfQFiRW0H6DRTv34ZI5EmnI17HArVusqDOYOeTxBCSfsIYIk9P6
         qsBF+Cnjvb00J+67WVDGDQdE54A/Y3goKCqpPJmUeSeYv/4XII4QpjQjLv6OmQd2+rko
         8/AJm8SW4R/cMLGhR/Wwg5gy25AZoNttaJB3dcYpSSZgOi5DkPT2HEXWd21lZmiSqQgR
         d4lh54HBMkateq8vPzRGkVVS3BxfrES41qZQ4D73t5lZKN5ODeEvdsmEQdcW+Fxg7uEw
         4LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786632306; x=1787237106;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/yVIT8dlYNAXzYCl/QRa3ADMwgjqvaFn5nvo6B3PUJg=;
        b=c8qyNxqdFPBnbzmjQHrGKxnE/+r7BahXHWP9BvaoelRUcVYAPZlea0glbXxURVmYVm
         MVdp0Jpsp/Kx7rU5/cF0A0x4MTMKmLaXPcEEp5gJg41tq5rDwQYMuCH9TTFqg2IM+eMp
         rrKR2kUtYduVW1FP9M5kwe2xXUYhFUKIoWjNJOf2foaN94KtQPAR1kuxhgjh8lu+3qdb
         CwJ+fOKmH/9Ur3jD91Yb8cbTy5F/ApuM58NLGjIER3lYSXbcdce3iBokfBKTFx3G1GE2
         rTpt094ITIImbtg11xVorCEGzBjKMReKGWxhWP3+wb27xpSK/YMA53iYJLZQ/6D7hBhS
         eWQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVzh12LWJC5dhu2EtfWPIFaI9IjWJ37I0KxbHZ8zCHyZiTpDo88ax2RTKSQeIXGeWjygMlMiNkujaYPwNXvDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyFieljPWwu+cDlqC7IPlGagISe21OR8E4M6d1R9BlPyjksJTG
	NCpRPcZRKOaOfqsJNHPuEV2RPxxNc9eXhsBk4vMzvTWLdtsHF2M0IPNUZyPlXCbMygrm2TvEg4J
	tU/wV0XIwOiyUHWzM0lTohchCHVGK4DcUvxIB8FfYfhWuBTfRAq9+B55L4LxcPuZdHxhjNg==
X-Gm-Gg: AR+sD10l0kLQHfh7BTRQtBQU3n9lbUA8KKLOsANh2IMwdPPWm2jXZxsqxv9V8krMlH/
	jpe52C/xkX26YFc8u2ZHs2BeArVeULn++MmPa8meqXeBRRkNUiyc5YTWYtM+vdfxc9X/mcb110R
	cL28xLtLu79QnhFltjuRYa2oveb146Mo7e1+xkqzFivpzYp0nieIShpJ6+BC05dp3EPNNoZi8+g
	P+ReqXH5Nm7gFKZL1uCc6VNr6SC8TNQvChOOyCnc8VDHXiNOBPYNy7OBsayPZuCtvvaKDfar6e5
	/4XQ8svB25Ti5vUQ3nBTq3LnipwyTUAK8TJhmPHcjmN5wUHu/8QAt5CnBtqJn/ODAeY+vSI+
X-Received: by 2002:a05:600c:190f:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-4998218e63dmr67777395e9.14.1786632306010;
        Thu, 13 Aug 2026 07:45:06 -0700 (PDT)
X-Received: by 2002:a05:600c:190f:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-4998218e63dmr67776505e9.14.1786632305433;
        Thu, 13 Aug 2026 07:45:05 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.115.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49982131261sm117142535e9.8.2026.08.13.07.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 07:45:04 -0700 (PDT)
Message-ID: <68b1d486-37a9-43d4-a02f-66fa4689d437@redhat.com>
Date: Thu, 13 Aug 2026 16:45:02 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: nci: Fix wrong size of status variables in
 nci_dev test
From: Thomas Huth <thuth@redhat.com>
To: Bongsu Jeon <bongsu.jeon@samsung.com>, David Heidelberg <david@ixit.cz>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, oe-linux-nfc@lists.linux.dev
References: <20260710112300.512433-1-thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260710112300.512433-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2026 13.23, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> pthread_join() stores the thread's return value (a "void *", i.e.
> 8 bytes on 64 bit computers) into the address of "status", but the
> "status" variable is declared as "int" with only 4 bytes. The extra
> four bytes clobber whatever is adjacent on the stack, which could
> silently corrupt other local variables. Use "intptr_t" to declare
> the "status" variables with the correct size.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tools/testing/selftests/nci/nci_dev.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
> index 312f84ee0444f..4e7a5856f7ea3 100644
> --- a/tools/testing/selftests/nci/nci_dev.c
> +++ b/tools/testing/selftests/nci/nci_dev.c
> @@ -6,6 +6,7 @@
>    * Test code for nci
>    */
>   
> +#include <stdint.h>
>   #include <stdlib.h>
>   #include <errno.h>
>   #include <string.h>
> @@ -404,7 +405,7 @@ FIXTURE_SETUP(NCI)
>   	struct msgtemplate msg;
>   	pthread_t thread_t;
>   	__u32 event_group;
> -	int status;
> +	intptr_t status;
>   	int rc;
>   
>   	self->open_state = false;
> @@ -497,7 +498,7 @@ static void *virtual_deinit_v2(void *data)
>   FIXTURE_TEARDOWN(NCI)
>   {
>   	pthread_t thread_t;
> -	int status;
> +	intptr_t status;
>   	int rc;
>   
>   	if (self->open_state) {
> @@ -585,7 +586,7 @@ int start_polling(int dev_idx, int proto, int virtual_fd, int sd, int fid, int p
>   	void *nla_start_poll_data[2] = {&dev_idx, &proto};
>   	int nla_start_poll_len[2] = {4, 4};
>   	pthread_t thread_t;
> -	int status;
> +	intptr_t status;
>   	int rc;
>   
>   	rc = pthread_create(&thread_t, NULL, virtual_poll_start,
> @@ -605,7 +606,7 @@ int start_polling(int dev_idx, int proto, int virtual_fd, int sd, int fid, int p
>   int stop_polling(int dev_idx, int virtual_fd, int sd, int fid, int pid)
>   {
>   	pthread_t thread_t;
> -	int status;
> +	intptr_t status;
>   	int rc;
>   
>   	rc = pthread_create(&thread_t, NULL, virtual_poll_stop,
> @@ -816,7 +817,7 @@ int disconnect_tag(int nfc_sock, int virtual_fd)
>   {
>   	pthread_t thread_t;
>   	char buf[256];
> -	int status;
> +	intptr_t status;
>   	int len;
>   
>   	send(nfc_sock, &nci_t4t_select_cmd3[3], sizeof(nci_t4t_select_cmd3) - 3, 0);
> @@ -860,7 +861,7 @@ TEST_F(NCI, deinit)
>   {
>   	struct msgtemplate msg;
>   	pthread_t thread_t;
> -	int status;
> +	intptr_t status;
>   	int rc;
>   
>   	rc = get_nci_devid(self->sd, self->fid, self->pid, self->dev_idex,

Friendly ping!

  Thomas

