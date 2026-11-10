Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277426;
	b=opRUP/vNT6q0PHxmLZe8//9vv5bBLht7Sn5Tu3nfS1/TgaSunKu4zD655RdrOMHnVdmD
	 4exoMer6z4j+SJVWzBGl/f8Ut1FTHAY05YDeMJL1xpFot0bLXEVfWY1Y36A2RmItfJhRg
	 /0sw7gMRuOFET/aHlK2A2xrrY8X2kP3676UIAnfj++a048dk3zpYVJSdgMuO4/nfnLwuG
	 g3quEZEcvPH7jTNt6VQIIOogMfDGYZwjNWk80jizPoLsEKIKrcn6L8ncr0/B7ZyDWLkQx
	 tn4V37nolO0GImORjyb+MTmf6r+pjhSZgXLbG0fFCxtbAVldBT/nRY0Wvpp2th75eVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277426;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=DEGqL3suX9ldocZQ29zAd0b1mBO1aL2nD99fH9fUKlo=;
	b=5YXfXWqivhNZ1RYZz9/lNw0YYKkpSW3hg0ddhcKIJojH89KVLw3yAIibwpwHG5xbl1HB
	 TPEz7QxRwyuuIIHwkWbZ5IrH1wC/ycpjjRQzArPQUrSf7DewvXXfYZM7RDYViiIJzO4RE
	 DKSVpfpcyIojJiX2Wg+7lPukzBeZvwZBVeynPInyns9hUGh/CKC0NroQinKUqAGpIVXO5
	 P/Iwt9PRKEOCZNM6fYw+61JCK1riw9s5jcSajtN4d38HLtl+B+wh/+9g6XDyWJY118HkN
	 +NyddiDcGAls+IIzRe2tG2hfMkQyXW2WnElCTWqAQLW4NCXKrd/mgqhf5sK3Y/YEhsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BA8e4TuF;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D7606A330
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 02:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D4D7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BA8e4TuF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794277424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEGqL3suX9ldocZQ29zAd0b1mBO1aL2nD99fH9fUKlo=;
	b=BA8e4TuFa/ku5pb0nlDV7HydLwIhtyrn9Y4z2OD0YTkdqm+wlQZ2zQaJ/4uvCoMf5+MmT6
	0P2QeoHvObTZhp61WfVW8xO/ndtEfjxHrNf+m/G1siwz1MKK1bllnvjt3s9yR1amiS5fSK
	yy5BFUyWW7JOHx+sqRKtkUKNB8PtqmA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-N34bE_7FOdCtzLIhwB2lOw-1; Mon,
 09 Nov 2026 21:23:38 -0500
X-MC-Unique: N34bE_7FOdCtzLIhwB2lOw-1
X-Mimecast-MFC-AGG-ID: N34bE_7FOdCtzLIhwB2lOw_1794277417
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 750C7180047B;
	Tue, 10 Nov 2026 02:23:36 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 974E0180029D;
	Tue, 10 Nov 2026 02:23:34 +0000 (UTC)
Message-ID: <06a435e7-6bfd-442e-a541-84813b993600@redhat.com>
Date: Mon, 9 Nov 2026 21:23:33 -0500
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
Subject: Re: [PATCH-next v2 5/5] cgroup/cpuset: Correctly set isolated_cpus
 when switching partition state
To: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20261109190955.1398611-1-longman@redhat.com>
 <20261109190955.1398611-6-longman@redhat.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261109190955.1398611-6-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/9/26 2:09 PM, Waiman Long wrote:
> When update_prstate() is called to switch the partition state from
> root to isolated or vice versa, the whole effective_xcpus is passed to
> isolated_cpus_update(). However, if there are child partitions present,
> some of the effective_xcpus are dedicated to those child partitions
> and their partition states will remain the same or get invalidated in
> the case of child root partition with isolated parent in the latter
> update_cpumasks_heir() call. In the latter case, their exclusive CPUs
> will be returned to their parent.
>
> Therefore isolated_cpus may be set incorrectly with child partitions
> underneath. Fix that by excluding their exclusive CPUs in computing
> the correct cpumask of exclusive CPUs used by that partition alone.
>
> Add new test cases into test_cpuset_prs.sh to test for such cases.
>
> Fixes: 11e5f407b64a ("cgroup/cpuset: Keep track of CPUs in isolated partitions")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/cgroup/cpuset.c                        | 30 +++++++++++++++----
>   .../selftests/cgroup/test_cpuset_prs.sh       |  7 +++++
>   2 files changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 7aa614c6ac4d..41048997a955 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -3054,12 +3054,32 @@ static int update_prstate(struct cpuset *cs, int new_prs)
>   						  cs->effective_xcpus, NULL))
>   			err = PERR_HKEEPING;
>   		else if (parent_prs == PRS_ISOLATED)
> -			err = PERR_ISOPARENT;
> +			err = PERR_ISOPARENT;	/* old_prs should be isolated */
>   
> -		if (!err)
> -			isolcpus_updated = true;
> -		else
> +		if (err) {
>   			disable_partition = true;
> +		} else {
> +			struct cgroup_subsys_state *css;
> +			struct cpuset *child;
> +
> +			/*
> +			 * Need to scan child partitions, if present, and
> +			 * exclude their effective_xcpus from cs. In the case
> +			 * of switching to isolated partition with child root
> +			 * partitions, those child partitions will be
> +			 * invalidated in update_cpumasks_hier().
> +			 */
> +			isolcpus_updated = true;
> +			cpumask_copy(tmpmask.new_cpus, cs->effective_xcpus);
> +			rcu_read_lock();
> +			cpuset_for_each_child(child, css, cs) {
> +				if (!is_partition_valid(child))
> +					continue;
> +				cpumask_andnot(tmpmask.new_cpus, tmpmask.new_cpus,
> +					       child->effective_xcpus);
> +			}
> +			rcu_read_unlock();
> +		}
>   	} else {
>   		/*
>   		 * Switching back to member is always allowed even if it
> @@ -3093,7 +3113,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
>   	if (!is_partition_valid(cs))
>   		reset_partition_data(cs);
>   	else if (isolcpus_updated)
> -		isolated_cpus_update(old_prs, new_prs, cs->effective_xcpus);
> +		isolated_cpus_update(old_prs, new_prs, tmpmask.new_cpus);
>   	spin_unlock_irq(&callback_lock);
>   
>   	/* Force update if partition is disabled & update effective_xcpus */
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> index 2d4744f2d6ac..741a13bbeda7 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -556,6 +556,13 @@ TEST_MATRIX=(
>   	" C2-6:X2-5:P1 CX3-6:P2 \
>   	                    .      .   T:X4-6    .      .      .     0 A1:4-6|A2:4-6 A1:P1|A2:P-2 ."
>   
> +	# Switch PRS state (root <=> isolated) will properly update cpuset.cpus.isolated
> +	# even if child partitions are present.
> +	" C1-6:P1 C3-6:P1 C5-6:P2  .       .    P2      .      .     0 A1:1-2:A2:3-4:A3:5-6
> +								       A1:P1|A2:P2:A3:P2 3-6"
> +	" C1-6:P1 C3-6:P2 C5-6:P2  .       .    P1      .      .     0 A1:1-2:A2:3-4:A3:5-6
> +								       A1:P1|A2:P1:A3:P2 5-6"
> +
>   	#
>   	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
>   	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------

Sorry, I thought I had fixed the test case bug. Apparently I haven't 
completely fixed it. I will send a v2.1 with the correct test cases.

Thanks,
Longman

