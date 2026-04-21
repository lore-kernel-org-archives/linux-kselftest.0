Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD447365A02
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 05:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751159; cv=none; b=HxpaqYuyrMKgB9ldO+JgZGSyvTkig6TdI2yRAEtblxk9QKKNGEnvNKc4QYVxZeB7r8KUN3NZxeKlshJZDtk7HC93plLvgihfFZ0YMxWIHYH3IgUqkUu1Hz5QyTA7T5acPwsQiQri8WLTFHOsKDdd3Dyp28KcSOr8A7psRBR/+Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751159; c=relaxed/simple;
	bh=L/GSkA0qp1yoMrPDQGqRCPZENkQK4jf0rUUdQZvqlnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olpZBKbRn01zVyJ3i7pq9en0DPDCcklvMxloXjSahaw2wBGnvNrgDqB2W4/bcqhurpunpCsYcAnrywouEEJek36atEb4Q2Er9/Meou6ApeEfOibEzqXARzqcHT+7sbo2kq+J6k3pNbAU19JZD+qufCE1Pa855/wQIiYLMNYH5nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bL4iRB9M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJqmjuVF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bL4iRB9M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJqmjuVF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776751154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hdFkkNEEQNJRuD44zjV6gQfNzOTNDlLLmN0HXIC8Vs0=;
	b=bL4iRB9MQa1hHwDjAYXgB/MjWHFgTM2pJ/7BkWdJRdzCVB5IcbiwTJEEVziv0zSBRcPdMc
	mhHMQ01UBMyECLxv2J1awkMd1vwQ4Txkc4mX69JpDSJ9SUPEhsfk5wH6TRaKfGOseLRIOF
	lsL9kLJfIIg7tpCzBLKb4qe1gb1kv60=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-J3N8w-ycPAOfYhG_LG95pw-1; Tue, 21 Apr 2026 01:59:12 -0400
X-MC-Unique: J3N8w-ycPAOfYhG_LG95pw-1
X-Mimecast-MFC-AGG-ID: J3N8w-ycPAOfYhG_LG95pw_1776751152
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488ba2f4094so19137605e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 22:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776751151; x=1777355951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hdFkkNEEQNJRuD44zjV6gQfNzOTNDlLLmN0HXIC8Vs0=;
        b=ZJqmjuVFWc2i5EvTxMwCALFBjF63P4hOZzWvfh2TY1dBUKcOKWvjNEzo0Z1JlR9E8x
         qwHe4r+mIUTFIBHRW6LAQKsBzuS1Gsxq4MWdn5zxGukZGdMMg0hQ8r0KA3jYVwDs+kdy
         Uc1u5msiHTAsihh1MlRlvjIKLdF5eevjNbdImkPt63j9G/x5n7QOqrJ9YrPKCtyaKMV+
         zjPAyqUwSIJRy0hFa5pr0EFHbJOdjDbGDCyQl4D1TUp5vcDE5N9p9AdseotfVQ2QGhwh
         Clazx1HDWDRPNCGVXZAG9Wosl7CHY/u8nSuaNqgrapgHagV0pJzV79Bvq+vhcdvuTVxK
         G4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751151; x=1777355951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdFkkNEEQNJRuD44zjV6gQfNzOTNDlLLmN0HXIC8Vs0=;
        b=NYWgwNNNEncXQo03t6YMPAw2mOB8BHKRi9e4+BOQy7VyZNRcdMv2aU2RBV2rVEl4fr
         SWVF3Ge+OikgPzg3g2PaSAJMHZDjPb493IdBIz8U8WKrv6dxOXzmmlj/O/3cT2PxHcCk
         nO3G+lDHPip0qoqSGGUVlKrV5/PipgpSvtWBwbFlPDzfowZqoVBOLeZMYOohdOJ8RwG3
         fKI3vCBBG3rFolvWEo86DnTtulLGt3kpIyLYOqLJxMCCgWQYTnvGIEhDfV3nsTmjF9u6
         XGkaKc+z9nLx1/BAs/JzG/QS18aUGDJvuY7o163Ozr+HOvsQI75sX3GrSV768QithpUR
         riwA==
X-Forwarded-Encrypted: i=1; AFNElJ/grh26EcoQbTbnJWs/8SAU/PqGtOAUqB0c1nrIIqIpf+Tajnw9QcuVaCaCloVkJzGdVIpD50ROC/1XP5gLL8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVD0eLNOQoOK7tZiUyFSyq8k1GNIF2tbzzgEzhqNJPlCBXneP2
	3RgUy3K5envgcpFXuk989kO9Q+GHmJiXMP1s+JjR3WxG9tdUrJr9j9EC7iLfCi0opA8QBJWWE9M
	3F1PkTpJeZAe62OT8zcXfffgXRB68w8+SYfqK3pj2N6/sx9R/0U60/u1d4cQznLlq4W2zpg==
X-Gm-Gg: AeBDiet/fL1oyukCuYXZ56QPczXusgA6yWUj4qTXIH0oiF91F3rXHgW8Ri4fPCxAYb8
	2sPG9l2y6FGtY106+bO/ApTJd0q9TjPy0FRj9EM1S+CkngdN+8I9HW33tQq1clrKO7b+wj7Xqp/
	Dyoj3XevuWLppaJaJriDhXi5Hez4GmvBjaaVQRHKQLZJCuC37tlTqdDm8CFtAsybc9936R23c1w
	1uJkqlKAcp+3yfNybEF0vpzJJ7meYc8zCO+2ssPKgOEw/CkIigH07GB8nA6NHIPtNb66o1ti9HY
	sc2M86/P3MKwHP49u38g7vdolVhT/rIqSkRnZ6rZdy3xtQjtfe1LpzakhwYI60j88Yjz4nfwBp9
	ru4LvwNpFbsuVASbsWfr5J2eyF+c/eDe9o7NWEyo9U34sr73NRmsfwb9IJpC/SMQyPLhy5rnQ
X-Received: by 2002:a05:600c:4a15:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-4891aed16d8mr64652005e9.23.1776751151512;
        Mon, 20 Apr 2026 22:59:11 -0700 (PDT)
X-Received: by 2002:a05:600c:4a15:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-4891aed16d8mr64651825e9.23.1776751151049;
        Mon, 20 Apr 2026 22:59:11 -0700 (PDT)
Received: from [192.168.0.223] (ip-89-103-124-216.bb.vodafone.cz. [89.103.124.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm565012525e9.3.2026.04.20.22.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 22:59:10 -0700 (PDT)
Message-ID: <836b0ce8-f427-434f-984b-4fc60b02c810@redhat.com>
Date: Tue, 21 Apr 2026 07:59:08 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/bpf: Page out as late a possible in file_reader
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman
 <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Mykyta Yatsenko <yatsenko@meta.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420134637.2513867-1-jmarchan@redhat.com>
 <f02fd939-85f7-414a-8b03-a9ebe56c7660@gmail.com>
Content-Language: en-US
From: Jerome Marchand <jmarchan@redhat.com>
Autocrypt: addr=jmarchan@redhat.com; keydata=
 xsBNBFO1HMkBCAC7ldQoS6JT5Fk9gRCJQrZjexkWsUhK8LVmKJXpbybAnojJOHrD7H02FwDh
 F6kAZVZMBAFf5aUZQHtjF+UvBNiPptIohb7ODLS/hiTZHpUI1/JkBOZ8wZbWakkTEwsj5Ccw
 czVB0PCDm+coE5BcQezEEn3ENNO45X2YQ6DeDzdpYRiCEOQufDPAwvSHoP/lXfRayNDuNRxd
 20RS73qTYupcbMDEEYd24vvh62gVVusuljUPWaDB7w+z6i7zwzTzkoTGW/OURSnOy731VGsK
 BniaFdLAipta1rhg43no0qJuAqxLEzgxUYiDN3cZf7Nf6eSnG71ugUUtYgc1d5I1Fe1RABEB
 AAHNJUplcm9tZSBNYXJjaGFuZCA8am1hcmNoYW5AcmVkaGF0LmNvbT7CwJgEEwEIAEICGyMG
 CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAhkBFiEEKhfvHc6w3BYc12CSdPMckK2y6gIFAmgH
 aZgFCRgUChcACgkQdPMckK2y6gKeUQf6AvMundBabBuvOQIhz/OP4VrUV/ilEAxXqPPEqv8p
 O+GKSnWBdYpIR/nBh62u/GN88l1LjgTWh1PbhvUtB1TviXtapp/MN9IcPVJkJVFh0KdyObMt
 4muJpUrEmnyn9WOZKhfEZGaXBq5zraqBrg4u1r0H0aoXDhSd/EF9JS2Qnm8rWaktzGotgGkJ
 ntjh5BuZCHd9YSTIYkux5tUO0LFitgiHgE/AIDk+2lKTCEei15SjWNCo3DluagDpfOjgtGSY
 6UNRH1XBKH86EKKJelsBCNRalvYQRzmzS/GAYLaHBqyACmKsGmERcLpvmJsQqWF7sMJXy412
 mr+b7iufKihOtc7ATQRTtRzJAQgAxpKIAn2SVSfk3CsskkE3FzLfu3suaueUVtS/ZaY/K8hf
 M3oB1AA/jQFwIwXIeT8rz2kRjDkNkli3DMAMovCuABLCun+Ts8cSqJN22iPVD5AuwkiZPcvm
 v1VpkFxJE4OwyrpJOIcyPHRXyTYO6V/nTuD64+BUkLPf0dfGKetz9k89qGeacx346JPZndfb
 7/rUI9Z7FW9mTTyI3IP6x0eLOFKmzULsV8yrGJqU1xUuLD3bh/fbvljqlqWjvervZKsVNPGM
 yOjRQeu7T/E0SMNTV2dXUP7jyJhmdKQ0uDrjE7kwVjZtrmb94915Gne2+ou2Vh+NwhOpbCIo
 eWgSBfxrYQARAQABwsB8BBgBCAAmAhsMFiEEKhfvHc6w3BYc12CSdPMckK2y6gIFAmgHaZgF
 CRgUChcACgkQdPMckK2y6gJLZQf+O5J+4qMLK3+RpCNP6jrUp9v/67t1CaVyHhbl4XOzR0jR
 iXHauB7MtIu9AYd8b+KcCZoXjtX34uBhB8XwXZjVTp6aD6ILKZYtcm+KJ7bioXgJSwaarS8W
 kpDUOKnphOpfCL9c1qLRVGKCwvpAgG+RK/FMT/gq05idrTqaH95CS2WMyDar7IwWU6qzYykA
 GdumHbxQYMSgSBhmsGfYXa+QAYOI/w6TivVjVyTD8feL9yN0zxACMVKRNy3xeDvPQQm7jP+Y
 hbgyBmp4HfLY/BS7/FKS5Tv1ke4kBDohXRJEGxjzrTWLUNZBIusgT6lPVX4OjlvwX8cjsxnR
 nZg+C3oGDA==
In-Reply-To: <f02fd939-85f7-414a-8b03-a9ebe56c7660@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/20/26 6:52 PM, Mykyta Yatsenko wrote:
> On 4/20/26 2:46 PM, Jerome Marchand wrote:
>> The file_reader/on_open_expect_fault fails consistently on my system.
>> It expects a page fault on first dynptr read of some range the exe
>> file of the current process because it has paged out that page range
>> earlier. However a lot can happen to that range (which depending on
>> the actual memory layout could contain text section, data section,
>> sections )related to dynamic linking...) between the moment it was
>> paged out and the moment the bpf program expected to hit a pagefault
>> actually run.
>>
>> A bit of instrumentation with mincore() shows that pages from that
>> range were accessed several times before the program is run. In
>> particular the call of file_reader__load() seems to fault all the
>> range in.
>>
>> Move the call to madvise(MADV_PAGEOUT) to just before attaching the
>> program to minimize the risk of having those page pulled back in from
>> under our feet.
>>
>> Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
>> ---
> 
> Thank you for the patch, the change looks good. Does it fail 
> consistently on 4K page size?

It did when I ran the test manually. On our automated testing system, it 
failed intermittently.

Regards,
Jerome

> 
> Acked-by: Mykyta Yatsenko <yatsenko@meta.com>
> 
>>   .../selftests/bpf/prog_tests/file_reader.c    | 22 +++++++++----------
>>   1 file changed, 10 insertions(+), 12 deletions(-)
>>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/file_reader.c b/ 
>> tools/testing/selftests/bpf/prog_tests/file_reader.c
>> index 5cde32b35da44..48aae7ea0e4bb 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/file_reader.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/file_reader.c
>> @@ -10,6 +10,7 @@
>>   const char *user_ptr = "hello world";
>>   char file_contents[256000];
>> +void *addr;
>>   void *get_executable_base_addr(void)
>>   {
>> @@ -26,8 +27,7 @@ void *get_executable_base_addr(void)
>>   static int initialize_file_contents(void)
>>   {
>>       int fd, page_sz = sysconf(_SC_PAGESIZE);
>> -    ssize_t n = 0, cur, off;
>> -    void *addr;
>> +    ssize_t n = 0, cur;
>>       fd = open("/proc/self/exe", O_RDONLY);
>>       if (!ASSERT_OK_FD(fd, "Open /proc/self/exe\n"))
>> @@ -52,16 +52,6 @@ static int initialize_file_contents(void)
>>       /* page-align base file address */
>>       addr = (void *)((unsigned long)addr & ~(page_sz - 1));
>> -    /*
>> -     * Page out range 0..512K, use 0..256K for positive tests and
>> -     * 256K..512K for negative tests expecting page faults
>> -     */
>> -    for (off = 0; off < sizeof(file_contents) * 2; off += page_sz) {
>> -        if (!ASSERT_OK(madvise(addr + off, page_sz, MADV_PAGEOUT),
>> -                   "madvise pageout"))
>> -            return errno;
>> -    }
>> -
>>       return 0;
>>   }
>> @@ -90,6 +80,14 @@ static void run_test(const char *prog_name)
>>       if (!ASSERT_OK(err, "file_reader__load"))
>>           goto cleanup;
>> +    /*
>> +     * Page out range 0..512K, use 0..256K for positive tests and
>> +     * 256K..512K for negative tests expecting page faults
>> +     */
>> +    if (!ASSERT_OK(madvise(addr, sizeof(file_contents) * 2, 
>> MADV_PAGEOUT),
>> +               "madvise pageout"))
>> +        goto cleanup;
>> +
>>       err = file_reader__attach(skel);
>>       if (!ASSERT_OK(err, "file_reader__attach"))
>>           goto cleanup;
> 

