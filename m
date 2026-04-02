Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6E32737FC
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 19:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775158391; cv=none; b=YTkr2o82btDVKA1d0wMms4uGjPlCBF3vm+w9gy0f8njOF6UMc2RFR2qNAC20dYzLYB1KFAi9PuWhANMc9gnCdXsc7XjCcRyAVYBMA5TW9WaVZ01WK4f27t7NAEaHMtsByivEuYoHT0DIuKCZrZbGaV/+dnVsHuxW48ZpOn+CLpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775158391; c=relaxed/simple;
	bh=sxuqQOtpTIhnsnruCurB+KsFnny3NxywxLqvf8D1RWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kI5HITVQBhcKOK5Em8A/nZ/kvsAfH2P373it51uZR56mX5keqx9BtAH2ciOlZy8FcwzvLbdhNT6Xn4wWArRUxJwU8mqJAd/MeHfN2XsJ+W8izTNaGYoB4S2I8nRBEvRYhzu9qVY7nSarnj91giZUa2z3iElf6y4zYrwAmlU0TBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=pBQ67VJ4; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="pBQ67VJ4"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632JSZWm3441965
	for <linux-kselftest@vger.kernel.org>; Thu, 2 Apr 2026 15:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=1Wma
	Gc9Te9yz0Zibs0J92PxP2axqg3Ucqwb44WM0s3g=; b=pBQ67VJ46+SO5CMoxNw4
	10vf2BWyi8pCFVjd3/INcGVNa2Rx4KtH2rep92OIs2n1Z89uB2lTfNviu+kbwbPd
	DjAPZzTjPlQJxf6aaLj8+55swS1/gYcctqfhFYgYzhKlR/0crQjLSGCN03sDQss9
	4tZHP4P+wILE7QdbAjcgpe5P/Ff4my0GTEA5qtpp8D85WKZQFROup1Kp2l2MpjiS
	9Yj3nNMZauc2U5s34Um9d9jiL/3yeihYWBvWrqrsZRhGbHQbSjGDG8Q5TIp8ZYZM
	cU3Bx2XRUUejxzakioCYxP6G9EC5W5f3QZfaBWft5Fh55KmbHTKoFuO3cCmIUNz2
	vA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4d96kda1wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 15:33:01 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d3e4c19307so84808885a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 12:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775158381; x=1775763181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WmaGc9Te9yz0Zibs0J92PxP2axqg3Ucqwb44WM0s3g=;
        b=Na7wNc8P/6lPmdyBVzbvpyxeXaUeUI+MohAvAsqaFNRRM8B/R3gFC4zy8Ut5rPkQc0
         iNhW1vUg+VmkPjOpsMJDsSjGQwSAI/8HBX1rqC9Iruoi3ZkmoxavBwPB72EHs9Po7uPe
         6B6gUF4gr6mS1/RSxC7uPasNXSFP503gzrhsT1fcJHVvWOdUrqR+j/9btcZt4WZ2vm4n
         ftMIML/8PO8TFTy7zfRjlbJbhk6r4s0x4+cQyopNTVnwIu77Zsx4svIfVS5xK+hfbCiS
         zbUCPspnCc925q+nuZUPrpVIPYKwsYxxA7/OO3qhUiRy3fqPTk1sn2qKTCOowX7D8rXc
         Cyow==
X-Forwarded-Encrypted: i=1; AJvYcCVVxrD2Al24e9GZxVG+3E0gxpmWOmD1Hy6MF0kxyZw/MBzxHra7zeRHoebLDKoGgFhlDQ5OsrHSTmV0IKu5DP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKr9eQV8aJLk2zuXTLb8iRLcHyc3qGj8NV2E41O+WE1m3ixACn
	hVFDS5Dx/4izhfWCLaJBAS6SlyuwRUoAB9mR+G98zbJO2JKwNoPegcwgrQQTXsLzI5pxGc4TuN6
	oLzTTO4qC4NBupw87XzHJzTXrC2ZCAo0dH9qJA8R2tc6ivbgWPdBwqIseVJk309bWxQ==
X-Gm-Gg: ATEYQzxnMR7yfQvu1w+KZWcmrpXyeUCbt1Hcb1vHwL6bMffpSGQTY6qGMT77mViBOjO
	zquEqMpV2MjtCsIz5n+RKXwIwLyrjJKjBZXdLJm88isZl8Bqa/SC0U2JQtBFLjTVmVOYFQLDc6m
	gpLdF+GZM1Sa0Ln8iFH+sWCoTEvz8pGqp7+lmOplDkUpynAmSwYRRT2Ua8cdCtr06A9F2hZmWOQ
	qS6Qt3AtNAjibiAd8WdpJJSKnBdtFAVzQVWxWdjyYhOmK2V7SjVVDV21aosXxHbeyJMuEl2raah
	vLVoHr8GI7qdMV2ugSjC3iWSX8TWTOGeZjIB35Xdyg1QJoVsYHBH1GUJEEwzQuXeI1SlNVR6vw+
	8x9YcJ4fvVeOw852Rb9XxsksKbst4LLhY+VLb3kA=
X-Received: by 2002:a05:620a:298b:b0:8cd:9599:b7cb with SMTP id af79cd13be357-8d41c6ac558mr84739485a.25.1775158380988;
        Thu, 02 Apr 2026 12:33:00 -0700 (PDT)
X-Received: by 2002:a05:620a:298b:b0:8cd:9599:b7cb with SMTP id af79cd13be357-8d41c6ac558mr84732685a.25.1775158380358;
        Thu, 02 Apr 2026 12:33:00 -0700 (PDT)
Received: from [10.206.121.101] ([129.236.224.148])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a80680dcsm283333085a.26.2026.04.02.12.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 12:32:59 -0700 (PDT)
Message-ID: <6a171abc-ebd2-4ddf-8c36-34c66ca42043@columbia.edu>
Date: Thu, 2 Apr 2026 15:32:58 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] userfaultfd: introduce vm_uffd_ops
To: Mike Rapoport <rppt@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Andrei Vagin <avagin@google.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Harry Yoo
 <harry.yoo@oracle.com>, Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
        Nikita Kalyazin <kalyazin@amazon.com>,
        Oscar Salvador <osalvador@suse.de>,
        Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
        Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>, kvm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260402041156.1377214-1-rppt@kernel.org>
 <20260402041156.1377214-8-rppt@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260402041156.1377214-8-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wxe9YaaDE2KtOkiwhRzJbvi3-hUQDgrk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE3NSBTYWx0ZWRfXzvi5k1dglL0B
 KABvXKHRmymvZTQ059toiYZiSFK1DZGT8ISw4SgqnPdCX86W1TUBlKXAbKo/kdHNeJmh7LX3vcx
 9aVZhD4bvo7ZhA/BVgukPbbiG/Cni/6f7jBi9XPuOZEhWbEnXm4JGZ/ootVcVEhZ7X5NDxhZjqd
 xkxuoOLP7KkyW6VDOmMD08cMtKE6iuzARlJ/Rbii+A7aqCSAY+vuk+GAScbu/8QOKPr3Y1uLvG5
 xmGP3p3gnf59SXz1t2xMDPBGyLMXl+8Uczst02pSa1nJxBVszZx6eo2/V486i1XvQoaJo/6nW7j
 G285RN2evZdezKRRYJFsU6fl7wWIjrahZ8NrVmfVHNRKsa/CZ2tU1JMglVPuKUSd46ntVYBXkwH
 jLVhfsbwRmrXsWLljxSAym6iL1yMZLvNkgB1XNv2IQW/O271PW0nX8MbFVKpiR1rQOqEt4R7A16
 +P8jhD95KrjcbmaUJyg==
X-Authority-Analysis: v=2.4 cv=RozI7SmK c=1 sm=1 tr=0 ts=69cec46d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=k+Kg2sH3hDje3YXt6xVjPQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=x7bEGLp0ZPQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=-OANyN2A5GHSoQQpHzcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wxe9YaaDE2KtOkiwhRzJbvi3-hUQDgrk
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11747
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=10 malwarescore=0 spamscore=0 impostorscore=10
 priorityscore=1501 suspectscore=0 bulkscore=10 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020175

Hi Mike,

On 4/2/26 12:11 AM, Mike Rapoport wrote:
> @@ -2021,34 +2040,33 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
>  bool vma_can_userfault(struct vm_area_struct *vma, vm_flags_t vm_flags,
>  		       bool wp_async)
>  {
> -	vm_flags &= __VM_UFFD_FLAGS;
> +	const struct vm_uffd_ops *ops = vma_uffd_ops(vma);
>  
> -	if (vma->vm_flags & VM_DROPPABLE)
> -		return false;
> -
> -	if ((vm_flags & VM_UFFD_MINOR) &&
> -	    (!is_vm_hugetlb_page(vma) && !vma_is_shmem(vma)))
> -		return false;
> +	vm_flags &= __VM_UFFD_FLAGS;
>  
>  	/*
> -	 * If wp async enabled, and WP is the only mode enabled, allow any
> +	 * If WP is the only mode enabled and context is wp async, allow any
>  	 * memory type.
>  	 */
>  	if (wp_async && (vm_flags == VM_UFFD_WP))
>  		return true;
>  
> +	/* For any other mode reject VMAs that don't implement vm_uffd_ops */
> +	if (!ops)
> +		return false;
> +
> +	if (vma->vm_flags & VM_DROPPABLE)
> +		return false;
> +

Doesn't moving the VM_DROPPABLE check after the wp_async early return make
the issue David raised in [1] possible again (i.e. moving swapbacked pages
into a droppable region using UFFDIO_MOVE)? With this change, VM_DROPPABLE
pages can now be registered with uffd under wp_async, which allows
UFFDIO_MOVE.

I think the VM_DROPPABLE check should go right before the wp_async check.
And it would probably benefit from a comment...

[1] https://lore.kernel.org/linux-mm/5a875a3a-2243-4eab-856f-bc53ccfec3ea@redhat.com/

Thanks,
Tal

  

