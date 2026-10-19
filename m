Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443442;
	b=cO+IkA3Wi3zMyug5LeDbBga8Gs8RM1HWinS4EObLZKi8j1AWIcRrxE+XSjDK6bKafWDM
	 FyBtbYK64Ai2SQsksbbPon5xlI34PwsnvH4NQfzOJGkPhiJnZWk4V28dMgB1yvHyUH/kH
	 jwxkm6CPbAokghZ8UP10dw1whf5nLsXoPBLIbZXo796wWgRU0U6fGezXdEXJqgskMQ5M+
	 kiGyb9naSvScp+uAVAnTiz1z0AgjHRXqatVqCQm62kudCydcgJRPXdgAhjyQFwixHOvxV
	 Y4L4rus20e82IsyNLpWyrskynM6EwAfrVqRna+Zs8ZEmyAI1HaRkXo5eT9v7h3vCkYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443442;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=iUxDgCC6thNE6bahIcLevwQy6B6nWx+XvwiMIDf3yFM=;
	b=vPA1t7/kMEY2GIG4dgg/nHeiADGhBP2JwGDSdelv4eei7HLty+V29hTZ3wThzdd2eL/r
	 TA+4812C3Lab0LrUiFmTVtfq41kkSX9pjAWIm6SME/eXknjLP0O97uMbdqQMwlwtTx2N/
	 O/S6r+wqgFqiNpDW3N6CTfruMp3W1KrLn8KJ7B4Vahc9czuOZvCL5pCgNVyEqV63nuU28
	 IpgB4Jk3RnhO4v37yFvvgFPdl4OWPxA8S7WnY6uYWiiHv34LLyIcAn26FwNv354Ahh2qG
	 QJ9VyrRbM56lAMuOVYjm9shYhfhsqgK+AH5JoIYSWgofCi2oPgWBibfIJhBGQUiMy3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IY4Fa06a;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AA9606A31B
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 20:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78AA9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IY4Fa06a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792443440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iUxDgCC6thNE6bahIcLevwQy6B6nWx+XvwiMIDf3yFM=;
	b=IY4Fa06aWXgkXGzHm0MZpBV/s90qUQVCqEidnEnZnmh2zdCZDbixMAmTqpvbVjr9WEkcGT
	L5Eh0BcBeKyIIXubk1qJI/yBxmuJVx//BGkPcbKPKzgNyWJhUeZ8+SVIC0YfEQJiZ3taP8
	iCkOoJ8D3Teow95TAev31kgzKzF44vA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-VXEkOMxNPdyM2fxjJV-9zg-1; Mon,
 19 Oct 2026 20:57:14 +0000
X-MC-Unique: VXEkOMxNPdyM2fxjJV-9zg-1
X-Mimecast-MFC-AGG-ID: VXEkOMxNPdyM2fxjJV-9zg_1792443432
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B67881800654;
	Mon, 19 Oct 2026 20:57:11 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 43CBE410;
	Mon, 19 Oct 2026 20:57:08 +0000 (UTC)
Message-ID: <3531bfe0-d5a3-4a38-af5b-68ce5406c591@redhat.com>
Date: Mon, 19 Oct 2026 16:57:07 -0400
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v4 0/9] cgroup/cpuset: Fix various housekeeping check
 problems
To: Tejun Heo <tj@kernel.org>
Cc: Ridong Chen <ridong.chen@linux.dev>, Johannes Weiner
 <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Hui Peng <benquike@gmail.com>,
 Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20261019181020.1069325-1-longman@redhat.com>
 <ataCxJxYwg_uhS-j@slm.duckdns.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ataCxJxYwg_uhS-j@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95


On 10/19/26 4:51 PM, Tejun Heo wrote:
> On Mon, Oct 19, 2026 at 02:10:11PM -0400, Waiman Long wrote:
>>   v4:
>>    - Adjust a number of patches to fix issues reported by Sashiko and
>>      Guopeng Zhang.
>>    - Add more test cases to test_cpuset_prs.sh to improve test coverage.
>>
>>   v3:
>>    - https://lore.kernel.org/lkml/20261014140548.575122-1-longman@redhat.com
>>    - Further revise the code based on feedback from sashiko and
>>      reviewers.
>>    - Add a new fix patch which fixes a bug found during the testing process.
>>    - Add a patch to impose a new restriction that creating a child root
>>      partition under an isolated parent partition is not allowed.
>>
>>   v2:
>>    - Update patches 2 and 3 to address bugs reported by sashiko.
>>    - Add a new test_cpuset_prs.sh patch to skip the test if some of the
>>      required CPUs are offline.
> Can you ping me after -rc1 drops?

Yes, I will.

Cheers,
Longman

>
> Thanks.
>

