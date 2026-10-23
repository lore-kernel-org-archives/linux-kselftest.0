Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792774140;
	b=OlxeU5IZsBip6jV64bNopKZGw3JlXZrim2jS7dBezJdcaaOssSZZDh8N9hpi2L7yvnyj
	 /X2t6jsUtZi2lKWj0vkE24tZUfEsczyc9yjrgcjB2U2MJwGNwWUTgYKoUKvRefyTAFGvm
	 0PzKgxEJryjB9EIMW2T/rnGRPKtN0HMmuEO+AJsSYfUc7gvkUI4QKE6l5oW5H3aY21k3m
	 VIuUKhLuR7eavslD1p1xznKo6Q+nh4XQq58Mexlu5oSGfuI0Xe/xuycUcy4Bid6HsXW3O
	 UWvtP8OtV6jo7Z0paGADBkfqfuI8MAnzm82Wz5EMQrTtCfHA65pyrGC8dRcAuHdNc8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792774140;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=ZePAjtHw+dvx8jOgEASja8qT5j8yO0Rlzo4LILUR3nU=;
	b=FYBuej4GPiPyfD0dDyOUlZp3I/u8UKjtDME4OcYn8cHd9pSeecmWMWJESj6dmB7qLxGH
	 hFiW5/lz9k+azlOe5LabmnKvFpA1XeLWPZ5ZYNU9jQRBOsxE5brAd2QRYk0j2tymvS+/P
	 p6WrYUPyyMPggH7SPDdP1qP3gf+TVwYrWk5MreF+SEb6ddfRCLCe9Egx27PVHz3GGnFAf
	 08Sz703KJrn5mKmv7U/9EI1eqmAzLMXRTA2MHW7kiHkbrXz0dnLj9yPmaePcjEVlO4syz
	 6pkWWbWxG4NCW5kDk8zH+aQQjPL1S6SiKHb6N0QudfOmwO+rj7erKz9UVjT5OlGOxPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Sz73/IIl";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82845606A32C
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 16:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82845606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sz73/IIl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792774138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZePAjtHw+dvx8jOgEASja8qT5j8yO0Rlzo4LILUR3nU=;
	b=Sz73/IIlps36N9nfxjE/GMgA1UkhSdP62S5THvHUkCsR5MR56Tgn3UH8fKgiI5B9qd7RiL
	mXimPpImdHes3uLgUgQd1VpZko0Z4MOXiJNYq0IDQG5QS+rkjAhLxafJpwLfj9IfLT/1fR
	MIUc13LYcs1pT6vWp8+tr9k5FeuhsCQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-445-6bx0LM6CMqWXYCh5RBGlGg-1; Fri,
 23 Oct 2026 12:48:55 -0400
X-MC-Unique: 6bx0LM6CMqWXYCh5RBGlGg-1
X-Mimecast-MFC-AGG-ID: 6bx0LM6CMqWXYCh5RBGlGg_1792774133
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B3871954194;
	Fri, 23 Oct 2026 16:48:53 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8095E3000738;
	Fri, 23 Oct 2026 16:48:51 +0000 (UTC)
Message-ID: <54803571-5822-4f20-a9a3-883e1c19e08f@redhat.com>
Date: Fri, 23 Oct 2026 12:48:50 -0400
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
Subject: Re: [PATCH-next 1/6] cgroup/cpuset: Find furthest isolated ancestor
 for invalidated isolated partition
To: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20261022031643.1351877-1-longman@redhat.com>
 <20261022031643.1351877-2-longman@redhat.com>
 <c0a4470f-ef81-47a2-9d4b-a28a7fe1a529@linux.dev>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <c0a4470f-ef81-47a2-9d4b-a28a7fe1a529@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 10/23/26 2:24 AM, Ridong Chen wrote:
>
>
> On 10/22/2026 11:16 AM, Waiman Long wrote:
>> Commit 46b885416c27 ("cgroup/cpuset: Fix a missing isolated_cpus
>> update in update_cpumasks_hier()") searches for the closet partition
>> root ancestor to determine if the isolated CPUs in a to be invalidated
>> isolation partition should be removed from isolated_cpus or not.
>>
>> As reported by sashiko, this method may not work when there is a deeply
>> nested isolated partition hierarchy. For instance, Consider a nested
>> hierarchy A0 -> A1 -> A2 -> A3 where all four are PRS_ISOLATED:
>>
>>    A0: effective_xcpus = 0-4
>>    A1: effective_xcpus = 1-4
>>    A2: effective_xcpus = 2-4
>>    A3: effective_xcpus = 3-4
>>
>> When A1 shrinks its exclusive_cpus from 1-4 to 1-2, A2 will update it
>> effective_xcpus to 2. A3 will find its closet partition root ancestor
>> A2 and decides that its effective_xcpus 3-4 should be removed from
>> isolated_cpus which is incorrect.
>>
>> Address this corner case by searching for the furthest isolated 
>> partition
>> root ancestor instead to decide if its isolated CPUs should be returned
>> to isolated_cpus.
>>
>> Fixes: 46b885416c27 ("cgroup/cpuset: Fix a missing isolated_cpus 
>> update in update_cpumasks_hier()")
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/cgroup/cpuset.c | 36 +++++++++++++++++-------------------
>>   1 file changed, 17 insertions(+), 19 deletions(-)
>>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 585a982249ad..7ead8c3b7974 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -2156,22 +2156,20 @@ static void 
>> compute_partition_effective_cpumask(struct cpuset *cs,
>>   }
>>     /*
>> - * ancestor_partition - Find and return the closest valid partition 
>> root ancestor
>> + * iancestor_partition - Return furthest isolated partition root 
>> ancestor available
>>    * @cs: the current cpuset
>> - *
>> - * Return: The closet partition root ancestor cpuset
>> + * Return: The furthest isolated partition root ancestor available 
>> or NULL if
>> + *       not found.
>>    */
>> -static struct cpuset *ancestor_partition(struct cpuset *cs)
>> +static struct cpuset *iancestor_partition(struct cpuset *cs)
>
> Nit.
>
> iancestor is confusing.
> Can we renmae it furthest_isolated_ancestor?

Yes, I can make the name change. Thanks for the suggestion.

Cheers,
Longman

