Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800097;
	b=sj+AnflJuvGdpSq6ApOomskRZbGeZe9XKzG/MpFOeaBy8g+22rMnct2JAuYlBMXsXiNk
	 RjQV6BykHHAw8y9SkSO4X9htC30DxcgorQ54DwTE7Q6j1xXFwe+yz1iKHt9rokrVE0FcY
	 D4XQv1xBc+lFwHBarT3wfZYOqW9lYvENb/piJ8SlPNzAA/WyW5x8NoaYmWyDHtvBgc+yt
	 x9javYp6eiaL9S9V69HILpvpGDP9j1KPYxxyb8En32kT9/0Z5HBxutUor3hU7UEQ+KTtn
	 hnAwAX1K5P8AjoErqVjrh7Fj7DUWc9OVoiRPrbFsJC2gzXS0f7XZTN2bkhA6YKWm0ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800097;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=2Rg+vtDqosIKpsMtrfm0Ml7BNUuvarMYXqbb0/OYQdY=;
	b=cJXKMYflcH5SRHp4CK6rE8+tD/CA3cQ4W8+HGmzIBIQF2VB5Lzpf0KLGE67Xy9zJICnB
	 mKgGV3MwOe5x7aEQG0J3tKCS+ZosbBBzYI2/OFY3/P3oEIT5tCqUe45oUkfsuA/6Uxw0o
	 roJa+ZQpphJ8WplisShUKzTEzSFRVNep00Yu+Dt67dvHVIBWm93JwUD/idzJACNbqqjUp
	 qCLteV/t67KKyH9ke/XhaNpweU2l0rsGqJHLWqcKf1vPlWA8whmxuaDpr3lqRccDgSfrL
	 RKKV9DI3iDQ9uKsmB8/nXb+2nCRFSAD6ZkPJxGvcVORpVjDX5HR+HkPD/8hC7RO3T5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R3OViV2I;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C25D606A33A
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C25D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R3OViV2I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794800096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Rg+vtDqosIKpsMtrfm0Ml7BNUuvarMYXqbb0/OYQdY=;
	b=R3OViV2INZ+ZVeYl909tB3C3n1U63+mg3aNTr24ck2l9F3HACXI6SjJrvmljKUdR20TyBM
	DBKjW6fmVjLK8Kv6QtXOq/JXCHw+Nc5FfqcUi/n3ceO+MtDKZzv4SGG39aGsswiFx04S2U
	YoiNCJNO+yXTWZt42D6RbqjrrtiCqac=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-319-j0GydBKSNkyYYXTgLrnMfQ-1; Sun,
 15 Nov 2026 22:34:47 -0500
X-MC-Unique: j0GydBKSNkyYYXTgLrnMfQ-1
X-Mimecast-MFC-AGG-ID: j0GydBKSNkyYYXTgLrnMfQ_1794800086
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BDD4119560B1;
	Mon, 16 Nov 2026 03:34:45 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 90E05421;
	Mon, 16 Nov 2026 03:34:43 +0000 (UTC)
Message-ID: <eb3fd5e1-aafe-4bbd-a9ca-afcdb1554fdb@redhat.com>
Date: Sun, 15 Nov 2026 22:34:42 -0500
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
Subject: Re: [PATCH-next v4 2/6] cgroup/cpuset: excpus parameter of
 remote_cpus_update() must have at least 1 active CPU
To: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261116012330.2271010-1-longman@redhat.com>
 <20261116012330.2271010-3-longman@redhat.com>
 <e437ac79-7999-43da-9fe8-6cfd475a5196@linux.dev>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <e437ac79-7999-43da-9fe8-6cfd475a5196@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/15/26 10:07 PM, Ridong Chen wrote:
>
>
> On 11/16/2026 9:23 AM, Waiman Long wrote:
>> It is reported that remote_cpus_update() fails to invalidate a
>> populated remote partition when an ancestor cgroup update reduces its
>> effective_xcpus mask to only offline CPUs.
>>
>> When update_cpumasks_hier() updates a descendant remote partition, it
>> passes the new effective_xcpus mask (excpus) to remote_cpus_update().
>> Because excpus still contains offline CPUs, cpumask_empty(excpus) is 
>> false
>> and remote_cpus_update() only checks tasks_nocpu_error() when adding 
>> CPUs.
>>
>> With the partition left valid, update_cpumasks_hier() computes an empty
>> effective_cpus mask and jumps to get_css. The populated partition stays
>> valid with no effective CPUs instead of inheriting its parent's CPUs,
>> and its tasks remain affine to the online CPUs returned to top_cpuset.
>>
>> Fix it by invalidating the remote partition if there is no active CPU
>> available in the given excpus parameter.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Link: 
>> https://sashiko.dev/#/bug/linux-936b7155-f652-4146-a4ab-ec48fd392a1d
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/cgroup/cpuset.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 631fb449cef8..195d4e3a283c 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -1810,7 +1810,8 @@ static void remote_cpus_update(struct cpuset 
>> *cs, struct cpumask *xcpus,
>>         WARN_ON_ONCE(!cpumask_subset(cs->effective_xcpus, 
>> subpartitions_cpus));
>>   -    if (cpumask_empty(excpus)) {
>> +    /* New effective_xcpus must have at least one active CPU */
>> +    if (!cpumask_intersects(excpus, cpu_active_mask)) {
>>           WRITE_ONCE(cs->prs_err, PERR_CPUSEMPTY);
>>           goto invalidate;
>>       }
>
> This also invalidates a remote partition with no task whose excpus
> only has offline CPUs. According to cgroup-v2.rst, such a partition
> is valid: cpuset.cpus.exclusive.effective may contain offline CPUs,
> and cpuset.cpus.effective can be empty if there is no task in the
> partition. The hotplug path and tasks_nocpu_error() follow the same
> rule. How about only invalidating it when it is populated?
>
>       if (cpumask_empty(excpus) ||
>           (!cpumask_intersects(excpus, cpu_active_mask) &&
>            partition_is_populated(cs, NULL))) {

A partition can only be created if there are active CPUs in the 
effective_xcpus. However, such a partition root can distribute its 
exclusive CPUs down to child local partitions with the results that 
effective_cpus can be empty if there is no task there. IOW, 
effective_xcpus must have active CPUs while effective_cpus does not need 
to have active CPUs if there are child partitions underneath. I am going 
to clarify that in the doc. I will check the hotplug path and 
task_nocpu_error() to make sure that it follows this rule. Does that 
rule make sense to you?


>
> Also, it probably needs a Fixes tag, maybe:
>
> Fixes: f62a5d39368e ("cgroup/cpuset: Remove remote_partition_check() & 
> make update_cpumasks_hier() handle remote partition")

Yes, I miss the fix tag. Will update that in the next version.

Cheers,
Longman

