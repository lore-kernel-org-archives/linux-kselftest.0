Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EE4331A66
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 19:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231287; cv=none; b=mTZcgbHpPQw0mlqWVR1axlFrpnVK+HqD9VSLjAat7ziLzo1WjjDZe54P0ly/l78INg6sT9R3Mb8Cdisnp6BMbRcXeJBn7BhN8YhjcAY9apgAx1VXjZXgReFPLXBg2biFmPOk8wjVf2JZPBEs3Z3HYv9toP6HxHsFXdaMlRtHjro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231287; c=relaxed/simple;
	bh=rxj6QotQzZqtr4Pb+vl/CgSEN9bUmJMUtYwaLHwuaB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwcANqQWSf4l1xRpaEI/T4W/PH9SJPYj3TgvnovT9DZTj50bycAsDnXaZiV4kLWpdv5+NMH0iF2pqLsWS4Lmm+xf46K9Faz/JNIlgP+yWpEcp7IQ/cqsEB4Dv+sIEC3AMM2aCSs8QfIBkecIQ2wB5GbBPbevsUWMOX4HsB0s0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=adea5dVc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="adea5dVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784231285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DllBAjRArbUiNnUNPdmZktTM45X1cRi2VTavvfewwps=;
	b=adea5dVcXDePSmyiWdQoJKZagzQz/i+PeDOg+XuL1RJQz4FaVKP0zxiQXP90OvaVOFiIDb
	zQJ58EEM/faSHE19eDYtj+8mzNekbKij05N18d3MWthvPo45umBfQzeV/P6dHkH5n+sq4w
	OFzFGcTIKFax2sMnB/eUaQuDM5k+WIA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-504-D_PFsbh6NuCRB0JKcBg7GA-1; Thu,
 16 Jul 2026 15:48:01 -0400
X-MC-Unique: D_PFsbh6NuCRB0JKcBg7GA-1
X-Mimecast-MFC-AGG-ID: D_PFsbh6NuCRB0JKcBg7GA_1784231279
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67D4F1954B37;
	Thu, 16 Jul 2026 19:47:59 +0000 (UTC)
Received: from [10.22.65.113] (unknown [10.22.65.113])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 15B5518002A0;
	Thu, 16 Jul 2026 19:47:57 +0000 (UTC)
Message-ID: <67d11071-a1f3-4ed5-80fe-3b1d9a330c75@redhat.com>
Date: Thu, 16 Jul 2026 15:47:57 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v3 0/3] cgroup/cpuset: Support multiple destination
 cpusets for cpuset_*attach()
To: Tejun Heo <tj@kernel.org>
Cc: Ridong Chen <ridong.chen@linux.dev>, Johannes Weiner
 <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260712235510.373125-1-longman@redhat.com>
 <597fd8e0d3c2de61aeecd3645a7b8198@kernel.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <597fd8e0d3c2de61aeecd3645a7b8198@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111


On 7/16/26 3:42 PM, Tejun Heo wrote:
> Hello,
>
> On Sun, Jul 12, 2026 at 07:55:07PM -0400, Waiman Long wrote:
>> Michal KoutnÃ½ (1):
>>    selftests/cgroup: Add test for cpuset affinity on controller disable
>>
>> Waiman Long (2):
>>    cgroup/cpuset: Support multiple destination cpusets for
>>      cpuset_*attach()
>>    cgroup/cpuset: Handle the special case of non-moving tasks in
>>      cpuset_can_attach()
> Applied 1-3 to cgroup/for-7.3.
>
> While applying, fixed a comment typo in patch 1:
>
> -			else if (cs->dl_bw_cpu >= 0) /* && cacnel */
> +			else if (cs->dl_bw_cpu >= 0) /* && cancel */
>
> The following selftest issues remain. Let's address them with follow-up
> patches:
>
> - cpu_set_equal() iterates sizeof(mask) bytes rather than bits, so only
>    CPUs 0-7 are compared, and the assert compares a byte count against
>    CPU_SETSIZE bits so it always holds.
>
> - thread_b doesn't wait for thread_a before advancing test_phase to
>    AFFINITY_THREADS_READY, so the main thread can read affinity_a_before
>    before thread_a has written it.
>
> - On a machine which doesn't have both CPUs 0 and 1 online, the test
>    fails instead of skipping.

Will fix the selftest in a follow-up patch.

Cheers,
Longman

