Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639885;
	b=ZBbDQRsKumse6fqyKmVNMdRDBpCH8iBZzesfEMyHt8z6m1fUS6RDc2OQRCdLlniMmDwt
	 Qg0tWm4mcR6gw01VbQRCMqmxv8w9XYF5el6oxs+89B760EUhqsAaxesE4yevtnGL1KHCG
	 48bMToQSghBlw/KZ7w1qfMETQFMr14ftnvlYz9EvK/kg1lYrWFz5x1UAnu7G4ekzNyybW
	 4sDCtw2JP/8jPjCO9YkKLw3DOGI7uMfIkmYk0VnXbGWdgyzfxcFJZ+PFhDzLhWY8WwRLd
	 8ezkofkDoUmGQ3s5NKYbstCqbu85JiQ/O09qjAamy7FGt1KYeUebcLGUi5zXpz+u73w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639885;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=kmEP+WfiLhXmhj1OIJoyKb9iLVghM0qKkCaWxIdVsIY=;
	b=ch3WIeG8TdntqEgJmXTjV1agwb0HATSsd1YZht2+HU4L473X4iO79vkwfCs1/fy91o1g
	 YeE9MyLDlxvzWN4l5E9ZtWJSoWQT8EB+6/icBIZrcnvVIbJkl7MxLpXwAtxqWw8HwfwyF
	 hrFAW4JcWf8Y8MKhjSQr0CGHU3l4Ur3JhaM3K97sOk05Vct5O/Q5LpKNucRfwFxawsAwU
	 Th4kQjZJVKEV2Q6x2t+XmYSuxd1QgSeC8tTwmyY+REaFl2JoIXcnVmE25dRTMYE9IU2KA
	 +X2ck/KwZs0BqbmnIWOAWCyJxyM7ecn+j5ft/z58dzpuZ5k2SRfQxmZzKL7WXa4B1ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P8tyHnbl;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09338606A319
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 03:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09338606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P8tyHnbl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792639884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kmEP+WfiLhXmhj1OIJoyKb9iLVghM0qKkCaWxIdVsIY=;
	b=P8tyHnbl0JTQ5lbWH7a23EoqxMNZ1EA7rIL2PW4TAuXEMn7FpAAnACn1q4EqxviME/0i3a
	My9bA0i4KhdJ6XLOvCZUeaiMy6LrcGcNBFG8KjwRV/jAvK9FEpyOXPjKROKkIOsUbO9vYO
	TxUs5E+AnPy8FFmG5gOKLy+8nG7rodY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194--0bQNj-PNCGK3J52npoJqQ-1; Wed,
 21 Oct 2026 23:31:18 -0400
X-MC-Unique: -0bQNj-PNCGK3J52npoJqQ-1
X-Mimecast-MFC-AGG-ID: -0bQNj-PNCGK3J52npoJqQ_1792639877
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0E651800BD0;
	Thu, 22 Oct 2026 03:31:16 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CE3EF433;
	Thu, 22 Oct 2026 03:31:14 +0000 (UTC)
Message-ID: <71bc8d63-456c-4dcb-9d03-c2881f41af78@redhat.com>
Date: Wed, 21 Oct 2026 23:31:14 -0400
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
Subject: Re: [PATCH] cgroup/cpuset: Fix partition recovery with unavailable
 CPUs
To: Guopeng Zhang <guopeng.zhang@linux.dev>, tj@kernel.org
Cc: ridong.chen@linux.dev, hannes@cmpxchg.org, mkoutny@suse.com,
 shuah@kernel.org, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20261020133315.123890-1-guopeng.zhang@linux.dev>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261020133315.123890-1-guopeng.zhang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 10/20/26 9:33 AM, Guopeng Zhang wrote:
> From: Guopeng Zhang <zhangguopeng@kylinos.cn>
>
> An invalid local partition can become valid again even when its
> exclusive CPUs are no longer available from its parent.
>
> This can be reproduced on a cgroup v2 system with CPUs 0-7 online:
>
>      cd /sys/fs/cgroup
>      echo +cpuset > cgroup.subtree_control
>      mkdir A
>      echo 1-4 > A/cpuset.cpus
>      echo 1-4 > A/cpuset.cpus.exclusive
>      echo root > A/cpuset.cpus.partition
>      echo +cpuset > A/cgroup.subtree_control
>      mkdir A/B
>      echo 3-4 > A/B/cpuset.cpus
>      echo 3-4 > A/B/cpuset.cpus.exclusive
>      echo root > A/B/cpuset.cpus.partition
>      echo 1-2 > A/cpuset.cpus.exclusive
>      cat A/B/cpuset.cpus.partition
>      root
>      cat A/B/cpuset.cpus.exclusive.effective
>      cat A/cpuset.cpus.effective
>      1-2
>      cat A/B/cpuset.cpus.effective
>      1-2
>
> B is changed back to a valid root even though its exclusive CPUs are
> no longer available and cpuset.cpus.exclusive.effective is empty. B
> should remain invalid until A can provide its exclusive CPUs again.
>
> Shrinking A's exclusive CPUs invalidates B in
> compute_partition_effective_cpumask(). The subsequent walk in
> update_cpumasks_hier() tries to recover B, but
> update_parent_effective_cpumask() skips the recovery checks when xcpus
> is not a subset of parent->effective_xcpus. Since part_error is still
> zero, B is changed back to a valid partition.
>
> Set PERR_INVCPUS when the subset check fails so that the partition stays
> invalid. New test cases are added to test_cpuset_prs.sh for removing and
> restoring the parent's exclusive CPUs.
>
> Fixes: 0c7f293efc87 ("cgroup/cpuset: Add cpuset.cpus.exclusive.effective for v2")
> Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
> ---
>   kernel/cgroup/cpuset.c                            | 8 ++++++--
>   tools/testing/selftests/cgroup/test_cpuset_prs.sh | 4 ++++
>   2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 585a982249ad..be80763953ed 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1986,12 +1986,16 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>   				cpumask_copy(tmp->addmask, cs->effective_xcpus);
>   				adding = true;
>   			}
> -		} else if (is_partition_invalid(cs) && !cpumask_empty(xcpus) &&
> -			   cpumask_subset(xcpus, parent->effective_xcpus)) {
> +		} else if (is_partition_invalid(cs) && !cpumask_empty(xcpus)) {
>   			struct cgroup_subsys_state *css;
>   			struct cpuset *child;
>   			bool exclusive = true;
>   
> +			if (!cpumask_subset(xcpus, parent->effective_xcpus)) {
> +				part_error = PERR_INVCPUS;
> +				goto write_error;
> +			}
> +
>   			/*
>   			 * Convert invalid partition to valid has to pass the
>   			 * cpu exclusivity test as well as the housekeeping
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> index d04aad697b96..f1d517647ade 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -427,6 +427,10 @@ TEST_MATRIX=(
>   	# cpuset.cpus is allowed, but those extra CPUs are ignored.
>   	"  C2-3:P1   C3:P1  .      .      .     C2-4    .      .     0 A1:|A2:2-3 A1:P1|A2:P1"
>   
> +	# A child cannot recover until its exclusive CPUs are available again.
> +	" CX1-4:P1 CX3-4:P1 .     .     X1-2    .      .      .     0 A1:1-2|A2:1-2|XA2: A1:P1|A2:P-1"
> +	" CX1-4:P1 CX3-4:P1 .     .  X1-2:X1-4 .      .      .     0 A1:1-2|A2:3-4|XA2:3-4 A1:P1|A2:P1"
> +
>   	# Taking away all CPUs from parent or itself if there are tasks
>   	# will make the partition invalid.
>   	"  C2-3:P1   C3:P1  .      .      T     C2-3    .      .     0 A1:2-3|A2:2-3 A1:P1|A2:P-1"

Patch 2 of my series should fix this problem too. I do borrow your test 
cases in my patch. I hope you don't mind about it.

Cheers,
Longman

