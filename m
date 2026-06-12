Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5527D35836B
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259673; cv=none; b=ITKmGwF3hA0Hg6+Lv2f/VWNaM52g4+b0xuQUIed7K6lh2QQ2qRRu8Wdg/LNF4GLgWf9h4bk6QnMAY5Cyg061aL4ykA2Q6xm48zfsrWru7iAibEYeC0rhObeyP6ZNOcOxfejOVZnyb10UaIXQev5Owk2gOxYqPDvM25Nrt/N72/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259673; c=relaxed/simple;
	bh=hT8rV0E/5ol7/5ixBfhysF/ptFlVrDQM4pEkoEL+mOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BV3Fz9510bQVKaW8F2xseBtYVDpUeLWJHosLaRGejp6Tx+OabwKUyy2Xm6JukcGiwqKDmiAvMcHZuPb7Ida0fYZuCg/enzOXgFz0f9iNTEH1UsHUFxnOjTtWCXonyAoOWw7mmGxHzRhHjaXf0NLMJU1lsKoDAbqUth0z33s376o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M+ca4Es3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vb3msbvm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+ca4Es3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vb3msbvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781259671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JGyKIDivNLUz5KIM2/WPEeXj86ogPPDaiz1Q78T2QNk=;
	b=M+ca4Es3PjMHdBDLqxVPaKR1FJkLoGSR0bwgiRUaF3zq+s7QPGc2dSqhEEKySf2KyUjYlB
	5AKKMxmlUFuUCgh+4zXsZq2NCCCnijhSJIoT6iwtShbGGzSenpxmKAUT3+RNgvvpbpFAUg
	I7QPwj1Q5yGZqbDOXh7Mbtv/jGlOP0c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-dycjeAJLPtyEUSnFpwwxZg-1; Fri, 12 Jun 2026 06:21:08 -0400
X-MC-Unique: dycjeAJLPtyEUSnFpwwxZg-1
X-Mimecast-MFC-AGG-ID: dycjeAJLPtyEUSnFpwwxZg_1781259667
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767b782so5804745e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781259667; x=1781864467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGyKIDivNLUz5KIM2/WPEeXj86ogPPDaiz1Q78T2QNk=;
        b=Vb3msbvmOJ837N4zmFQB/qxTV57/ATlpUqyrkv0pxAw6zEENLHgHm68c/x0LkknphD
         JdahEZCWIJeJzpOfkn1TKKb0I4nT9PhsXLIIyAhwHbf2K0bjG4jUAKpNgdDvHXNUYe1J
         TTCUW8qDcaQLnwPr3w7R0GooXAw5ZAo0bywPKm7AvesMQEVdBnFZ2RPlyNuv5lvgrdOX
         uXe5q/bWdwIOUeemLt1yiMZIGREII34PlMj6HH+/p5Us1hk/h3z7NyMHqnx0VllgcXoE
         2EiX+VefxlRs3L20ubm9p9vUmIDrGZdEO/yebIQrfzvlzM6rTKqOBqNQg7ytKB2O5uDw
         ToJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781259667; x=1781864467;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGyKIDivNLUz5KIM2/WPEeXj86ogPPDaiz1Q78T2QNk=;
        b=ZeyLpNkgzcwS1Ri/m1uwUxedxSkSX1D5duKIAxydH+HqgA16KTDjNqTX4gkvBz55xs
         fI3VOyVM4VZxkwS4UBPkhDxNX/eej9lwZtaAxTCnrGHbLaU6KTAcHBiyrawzF8tigajs
         imVtFc2Z0UYE0gFzCldxT8Dxr0XE+/zQMt77T6gWoVMdWNCUr7uNcqLpHW4A98RNJ7vl
         yDj69iotxGQBQ818dWk6fXrP/EMu3qhgrDA/JpZFVgI7qVL56H06YraUO5uHPoxu3UOg
         ZWxDHvAuDvJhs7aMsX0XYmEV2sQlOF7ABun5A2UNFqe5c1/dUxJ6EE6EVgY+BroDIlaJ
         e/HQ==
X-Forwarded-Encrypted: i=1; AFNElJ91i0Bl/YBh52bb00ulQQRabnI0ENxUei5shOUAiQUwl6BoSkDOtimd8eeaXKfNCoHi8LQJtgyyxy5cJj9Mo58=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1OOmSprApikiPvSbA+PxpFrtbax5JoGVXT3LFkFI8Ypbefw5
	XpGq0DwXwWgWSGzK1h5LmSHVX61oAROEihaqA7UpSWnVIshRsQjM3X+kIOLd8wxE6Vn/bwx1xfC
	HvrHR9XKRyOEx1DQc278V2tDB8n8DGaAh4psTw6QLn6V2K/AiG3Z/xqEal3NN8PydkNpLLg==
X-Gm-Gg: Acq92OEGRTXRXq+BWXlU9XXE3a1zBXKYnhHSi2rti+llm8TBUoZMSS2fwoV9/072DjY
	33BXNk4w52AmbysGeFXRormAdkK9rsG9ACfy7RPVK4RVVPwyEpkZlYh5NCmZUQPc3Q9ARoFVi7v
	3lkLg5svwpNI3OKJsyDMuUJmj9HtFkPlHBfp/ydt2EmvYvR3H+UDrwU1/moA/Og6tTpWhCLl3mI
	URmwjXZUd4plF4LwxzAOkIAmTKw+xotgi0A4GxpjB/aW7rgUqBzsRCry6Vyx3SbT/vlhifuZy2A
	rHVimDorMZRhv5SPxUb+KPa/h+xvQ0UiL2A0i99nJPzRDO3Ribsgu3ooOTNOjCV0bnvpJ6tw0DB
	QB/cBazjpCkNJCDlHC00+7UDcVQVGUZA55/CJaibq3RHIKBJbkAsKr9yv5ghs414e
X-Received: by 2002:a05:600c:314a:b0:490:bcc1:4edb with SMTP id 5b1f17b1804b1-490ec504eb5mr24369445e9.27.1781259666829;
        Fri, 12 Jun 2026 03:21:06 -0700 (PDT)
X-Received: by 2002:a05:600c:314a:b0:490:bcc1:4edb with SMTP id 5b1f17b1804b1-490ec504eb5mr24368835e9.27.1781259666305;
        Fri, 12 Jun 2026 03:21:06 -0700 (PDT)
Received: from [172.31.99.182] (91.red-83-48-118.staticip.rima-tde.net. [83.48.118.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea7c871dsm61873325e9.5.2026.06.12.03.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 03:21:05 -0700 (PDT)
Message-ID: <443feb66-94ab-458e-8cd8-0ad440d0d067@redhat.com>
Date: Fri, 12 Jun 2026 04:22:20 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/11] mm: khugepaged: add shmem mTHP collapse
 support
To: Lance Yang <lance.yang@linux.dev>, baolin.wang@linux.alibaba.com
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <3895c09794739bbfae99d9e021ffacf8a51fb8e2.1781083630.git.baolin.wang@linux.alibaba.com>
 <20260610124416.46522-1-lance.yang@linux.dev>
From: Nico Pache <npache@redhat.com>
Content-Language: en-US
In-Reply-To: <20260610124416.46522-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/26 6:44 AM, Lance Yang wrote:
> 
> On Wed, Jun 10, 2026 at 06:29:12PM +0800, Baolin Wang wrote:
> [...]
>> @@ -1512,8 +1517,12 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
>> 			enum scan_result ret;
>>
>> 			collapse_address = address + offset * PAGE_SIZE;
>> -			ret = collapse_huge_page(mm, collapse_address, referenced,
>> -						 unmapped, cc, order);
>> +			if (file)
>> +				ret = collapse_file(mm, collapse_address, file,
>> +						start + offset, cc, order);
>> +			else
>> +				ret = collapse_huge_page(mm, collapse_address,
>> +						referenced, unmapped, cc, order);
>>
>> 			switch (ret) {
>> 			/* Cases where we continue to next collapse candidate */
>> @@ -1521,6 +1530,7 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
>> 				collapsed += nr_ptes;
>> 				fallthrough;
>> 			case SCAN_PTE_MAPPED_HUGEPAGE:
> 
> Looks like SCAN_PTE_MAPPED_HUGEPAGE from collapse_file() get lost for
> the PMD-order case.

This is kinda my fault... I reused the enum PTE_MAPPED_HUGEPAGE (which was only
really used in file collapse) when reporting that a collapse attempts is smaller
or equal to the current order of the folio.

if (!is_pmd_order(order) && folio_order(folio) >= order) {

I will change that in my follow up to use its own (or a different enum).

> 
> Previously, collapse_file() returned it straight back to
> collapse_single_pmd(), so we would run try_collapse_pte_mapped_thp().
> 
> Now it hits mthp_collapse() fitst, and that case just goes to
> next_offset ...
> 
>> +			case SCAN_PAGE_COMPOUND:
>> 				goto next_offset;
>> 			/* Cases where lower orders might still succeed */
>> 			case SCAN_ALLOC_HUGE_PAGE_FAIL:
> [...]
> 
> Cheers, Lance
> 

