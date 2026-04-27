Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08943C061D
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 16:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777308954; cv=none; b=oYj3UT7ZM6p1VsgeET8M1dzD0Gskd/E6H+5jw43PoIntuIKQ3TtjOMB4IBd7h7OT/L0tQ/JRK7Kfq+XRVGTm09bn3XdPyVr1U/vdBvtnEaT5T9TnEcesVguJzZfImbFWibCbsYfsGhVboiEVeTI3zYElhj7RkSGnSEY8gnjhumw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777308954; c=relaxed/simple;
	bh=G0h3jq1rfnZpLl0BeMsGwmDawoRbgxSeMa5ajthCX/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jB+5iEmDqdLv6tyyw1yhuPSW5H/bOxtnQKptbIYFPNIImk2/GCI+KKY1VFelhxyjvBYqsaKGkWFjF1OiycWGVWh/HZkWAUPdshG91ksFl+VS+Wf++QdXSFBlg7pymKSEiki+Qqy9C+gjoanconK2+n6FpTUe0UXayCIgTttUEPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GTqse7kd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GTqse7kd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777308948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeIymKMmn5VMvSmJ/53HZ9lwroqGaVAwlhaCdG4C+3A=;
	b=GTqse7kdhBNbY59iyBm4LkrDz6CtQSiX2TMtcjQvQLvs04M1FZtzTQbDGbrtIMQwh7+UMW
	Y4//Usah2Ru59miUhhipbBmtMGszORw//wF3YajKu5m0JXU3RkhXWwaA7SRPQrNXJzKqfG
	6gldvs69Px3euqURCsID8X+6ZRPgXKE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-VsELcE1XNqCQo2pJaPI2qw-1; Mon, 27 Apr 2026 12:55:47 -0400
X-MC-Unique: VsELcE1XNqCQo2pJaPI2qw-1
X-Mimecast-MFC-AGG-ID: VsELcE1XNqCQo2pJaPI2qw_1777308947
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ebe2c596c6so1517167385a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 09:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777308947; x=1777913747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeIymKMmn5VMvSmJ/53HZ9lwroqGaVAwlhaCdG4C+3A=;
        b=lR70i3o+vK5znHMmPTdTb/e3mEsGJyQBPmdT4WL7pTXU5641++ZgT01d9G59wXfg+B
         wCf9hRdUSl7YbpVw6VviPxG/NQIqAFoDbkXg6hjSVGDU9vbhXxPw1syoSSf+FpRIP9gT
         q5A6+PJt2sNhH+IZeMBY7/o/s79wmLjfUT6I9npR1TfH7SlP/wRzdT3vQXUfYAhyUBks
         5bWV9R/F5zcqo/Yy9BnBUJFEIUKHMTKzn3SzbXYFACiTg8uxEccrKew02o6MXPoEtMPe
         gsVgdVAz246JLX66Y0n8zwO+E2Ib9uu2urT0ksLKR5dAHURcZevA4c3ubigVfDhdaaMN
         f9yQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pdj8MIAW1dKWQrF+fEeWjt7XFoKvMSxpo9wRMnNhJRVx12G4nE0URtZyqQheK8+9cvmWKSES5TK6yNavlIaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf1IqnqhOm3LspwlS9LeMBOZOyu+WBSUIAdZ4M//nqh+qRu2GM
	dXj1FNlipkaqaEAIeRviHY+LU5TxJmOiEdNkbo5Jm34mg9tPm1shB7aSkNbCt5F+ZDxlSsztmQV
	WzLSRNdOqq6C8BalNDF9eUsKN7qUfJ/L1SV/oNHCSRHebPt2Uv9s68zZqXz/NzvfcJjgZKg==
X-Gm-Gg: AeBDiet2tpz3nf8tF1oHFN6n/irxRCuhVJhxO2n4e2ON1eUy22TQe1c8xaWrEQApX7D
	TdqjN6/oQlz/2fvz0pUuYeQehLvRIam2wMgwWA8P897GOAZ5/YrtQ+qiijxB+ZtyZQbkuOKPfOS
	ssIRpRdxAptdRsTZOdYFKDsV5To2gnX+0SsCTPvFFp1AerQoNERR4LK7RorhebeFF78ALktipWc
	zV//LwLEmk+oBq8WiSz4csmEaBPaCZ3Rwm1sj4RFi0dPpf7fnbhRZPQ4culX5ljDWEGfcvXQK/t
	SxAe7NWoQQSphd+IcfaXbppPRvALwpHr7iuSZ/W8Mv/L0IJK1ytfQ6ey8mowUPVpg0fiP+tzxyZ
	HWZR/IA6gnF3cIjkvJPuW4G/298bkx5eDgNRl
X-Received: by 2002:a05:620a:4115:b0:8ee:630e:350a with SMTP id af79cd13be357-8ee630e46c3mr3942341685a.58.1777308946709;
        Mon, 27 Apr 2026 09:55:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4115:b0:8ee:630e:350a with SMTP id af79cd13be357-8ee630e46c3mr3942337985a.58.1777308946266;
        Mon, 27 Apr 2026 09:55:46 -0700 (PDT)
Received: from [192.168.2.110] ([69.159.169.238])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm266093656d6.2.2026.04.27.09.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 09:55:45 -0700 (PDT)
Message-ID: <6e105a9f-e335-469d-92a0-9bd0aa806706@redhat.com>
Date: Mon, 27 Apr 2026 12:55:34 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: run_vmtests.sh: fix destructive tests
 invocation
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Muhammad Usama Anjum <usama.anjum@arm.com>
References: <214fd9e4-5398-4c26-859e-c982c2e277c3@redhat.com>
 <20260427091250.61316471db20dfb0852141c1@linux-foundation.org>
 <ae-TlsIq_YkQcCUY@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <ae-TlsIq_YkQcCUY@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-27 12:49, Mike Rapoport wrote:
> On Mon, Apr 27, 2026 at 09:12:50AM -0700, Andrew Morton wrote:
>> On Mon, 27 Apr 2026 12:03:51 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:
>>
>>> Destructive tests should be invocated with -d command-line option, but
>>> this won't work today since 'd' is missing in getopts command-line. This
>>> commit fixes it.
>>>
>>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> 
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
>>> ---
>>> Mike,
>>>
>>> Maybe it's a good idea to add this patch to your series since the
>>> hugetlb-read-hwpoison selftest won't work without your fix.
>>
>> Or I can scoot it into mainline as a hotfix and Mike will pick it up
>> via Linus, soon?
> 
> I'm fine with this.

Then it works for me too.

>   
>> It'd be good to have a Fixes:.  It looks like a3c5cc5129ef5 or
>> 2bc4813622459?
> 
> It's rather f16ff3b692ad ;-)
> It added RUN_DESTRUCTIVE and a case for 'd' option, but missed it in
> getops.

Exactly, I just found out the same thing and came here to report it but
you beat me to it :)

Andrew, do you need a v2 or can you edit the patch description for me?

> 
>>>    tools/testing/selftests/mm/run_vmtests.sh | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
>>> index d8468451b3a3..c17b133a81d2 100755
>>> --- a/tools/testing/selftests/mm/run_vmtests.sh
>>> +++ b/tools/testing/selftests/mm/run_vmtests.sh
>>> @@ -103,7 +103,7 @@ RUN_ALL=false
>>>    RUN_DESTRUCTIVE=false
>>>    TAP_PREFIX="# "
>>>    
>>> -while getopts "aht:n" OPT; do
>>> +while getopts "aht:nd" OPT; do
>>>    	case ${OPT} in
>>>    		"a") RUN_ALL=true ;;
>>>    		"h") usage ;;
>>> -- 
>>> 2.53.0
> 

