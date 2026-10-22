Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679770;
	b=iVTdMwOmrqoHvdHch37abJb9zlt9ckMhIlUDweoIGXdWyNO4g72grzA21FGpdD/7fXGZ
	 UrOZned9lKmbKWuN9nwtdrCLOQ1QuD9+ufOyVMwnNfL05pBZXQZPoF+VdB7zxY2Nc6mww
	 DorwRu4AcXWp7RtqsunxO3gg6LgeAP3qeFV1mhCFp6U7VFvU1yfO98yXVl/0PnxG6ALNa
	 NR6dYbVBjkF8NqGq9+ve/3ikMX3rviRkqWablZ5edcfQf77IoXBTiUIMtdjhG4IZgvgmd
	 sphC62CanjVJ0wziaD0yUVYGYaUlWNfnETzfgnVleQhfj9rLF3sT3VN9bc0142q+SNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679770;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=3eC6Wy2w/LWOWa4InA7RfxjEoY0lQop/ERKxqXEuHfE=;
	b=uhWLfp1Gdqjk3Z6ZvfvUQK6+gV/wW8eR5Y4NJxPsge6fFVGfIW70rk7t5cKtalJ43IeZ
	 LTTP/k3xT7YFIhtuTfSq5/bBSe2hB512T5HlyMVE6rhcsw3E+CgQF9rMbAu2Qr0RhQ8HR
	 LrcUVtvsorjPgq2MNuKQzX9q6TCwk2rJT8d2L5idVsEgQ8OFVgKC/+sQl7xcktcUxj5c4
	 7I9HwJhWmkGS3Cs0bDDNHxNF7/wqhejWaN8HdxEBwGm2Gl98hmb+RBu0i1GXhjni+M8Gc
	 mH8athjCVvTXOMoIMGKo2hr2AQjqVKQPQHquaweOgH+r51ICHldW0Hko45IyeeNpLLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cb6twnO9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4141606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 14:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4141606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cb6twnO9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792679764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3eC6Wy2w/LWOWa4InA7RfxjEoY0lQop/ERKxqXEuHfE=;
	b=Cb6twnO9AxioQyHFr6rRAR296+FY46m9+XezQTfW5Ob2vV+mkt00Ob3+xysUgG9Ci4Iyfe
	OG7PzOgBVUAoT3CF+DyBYve9Pq0E0sFJhrO5voCx6XE6vHIKxbZHmlLE2l5HJ17AJ+5l+h
	xbTlwSWsTMWEZIDwBVQYgrXoJHyrDCo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-awwz9Y0FOISA3d3ApVbE6A-1; Thu,
 22 Oct 2026 10:36:00 -0400
X-MC-Unique: awwz9Y0FOISA3d3ApVbE6A-1
X-Mimecast-MFC-AGG-ID: awwz9Y0FOISA3d3ApVbE6A_1792679759
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2626A1955E7D;
	Thu, 22 Oct 2026 14:35:58 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 84B0018004D2;
	Thu, 22 Oct 2026 14:35:56 +0000 (UTC)
Message-ID: <2a7f3760-19a4-4053-bcfc-6301c7616fdc@redhat.com>
Date: Thu, 22 Oct 2026 10:35:55 -0400
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
Subject: Re: [PATCH-next 4/6] cgroup/cpuset: Minor fixes to
 prstate_housekeeping_conflict()
To: Guopeng Zhang <guopeng.zhang@linux.dev>,
 Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261022031643.1351877-1-longman@redhat.com>
 <20261022031643.1351877-5-longman@redhat.com>
 <d42eeea9-2172-487d-813b-d90d9ae1c973@linux.dev>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <d42eeea9-2172-487d-813b-d90d9ae1c973@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111


On 10/22/26 10:15 AM, Guopeng Zhang wrote:
>
> 在 2026/10/22 11:16, Waiman Long 写道:
>> Commit 9527ff78a413 ("group/cpuset: Consider all the exclusive CPUs when
>> doing housekeeping check") changes the way prstate_housekeeping_conflict()
>> is being used by considering all the exclusive xcpus to be owned by the
>> partition when doing housekeeping check. However there are two minor
>> issues reported by sashiko with that patch:
>>
>>   1) In partition_cpus_change(), prstate_housekeeping_conflict() can
>>   be called with an invalid partition root. In that case, there are
>>   no isolated CPUs that are going to be returned back to the system to
>>   become housekeeping CPUs, so the calculation of the del_cpus cpumask
>>   is meaningless.
>>
>>   2) The checking of del_cpus in prstate_housekeeping_conflict() to see
>>   if it can contain an active housekeeping CPU that can be returned to the
>>   system ignores the fact that an active CPU not in HK_TYPE_DOMAIN_BOOT HK
>>   cpumask will not become an active housekeeping CPU when it is released
>>   by an isolated partition.
>>
>> Update the existing code to handle these two issues properly to make
>> prstate_housekeeping_conflict() produce more accurate result.
>>
>> Fixes: 9527ff78a413 ("group/cpuset: Consider all the exclusive CPUs when doing housekeeping check")
> One trivial nit: the commit message says "group/cpuset" (missing 'c') in
> two places, including the Fixes: line.

Thanks for spotting the typos. It is caused by a cut & paste mistake. 
Will fix that.

Cheers,
Longman

