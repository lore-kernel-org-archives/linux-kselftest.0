Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F98643B487
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784019493; cv=none; b=gkCsaSiW2IgU5/YZTVEjJG3SmSOiPqz8lhykotjjYm/5sA4fV2JPKMYMjizAj9xXXMkt6aefgqJPbDGknZNFwLz0spU5cDTy/3kk7Ow00Ro1a/q8o+93OGATlOfFCgE47yw/6tEN3KRbR8BrBa9lGPL8Y9fLH4ahjK0utmyKW7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784019493; c=relaxed/simple;
	bh=qwRP4V+B9iDlbvfwesX2cvK8FhtV6iIKfYBrR6kvmBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RI38AIUYdyeP6FJP+J6V1VkpH2xC1RzmEKexUoYMKwk5abhjCKSs8fpc6Vq3IuixFZqkVX3zf/hKqy66eEETNFFjNKplFGlkS+IGuh8o4U+Q1NEgPzmGdDMuxZAEPqma8rqbmX9A+nWgi55KTfWHm3BV6yDVtXgJdy6fTis0aUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cvL8JFVI; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cvL8JFVI"
Message-ID: <007856c9-3506-4888-9818-8e4630b37fdc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784019480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zdNrMq8bCxTLGPFwSKxLND/cn4ZHbHVtNZy8gkOzFEo=;
	b=cvL8JFVI8hI1XSYBlYnTgG96ED8LBxldfSLuxN6z+Sksjj+kcaYQFUC71DKj/S2ZoO9LR5
	uctNSsErdebcnnCIwrv66TbBoismLninA/PKyb0Qq2iMO2BwSOPAMhFpjTKO+kyiWC1NbD
	1zWI4Nuz19MM1tJSfX2uIoCvpxgAM60=
Date: Tue, 14 Jul 2026 16:57:45 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH-next v3 0/3] cgroup/cpuset: Support multiple destination
 cpusets for cpuset_*attach()
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260712235510.373125-1-longman@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260712235510.373125-1-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 7/13/2026 7:55 AM, Waiman Long wrote:
>   v3:
>    - Swap the first 2 patches as the original patch 1 can introduce serious bug
>      without patch 2. Doing patch 2 first will be less problematic.
> 

Would it make sense to squash these two patches into one?

>   v2: https://lore.kernel.org/lkml/20260712150127.236790-1-longman@redhat.com
>    - Make sure that attach_ctx.old_cs won't be set to a source cpuset that is
>      also the destination cpuset.
> 
>   v1: https://lore.kernel.org/lkml/20260711020540.176740-1-longman@redhat.com
> 
> This is a follow-up patch series to [1] to properly handle a special case
> for cpuset task migration operation where the source and destination
> cpusets are the same.
> 
> Patch 1 enables cpuset_*attach() to handle the case where there are many
> destination cpusets from enabling cpuset controller. Patch 2 handles
> those tasks that have the same source and destination cpuset by skipping
> them as they are not migrating with respect to cpuset. Patch 3 adds a
> new test case into test_cpuset to test proper handling of cpu affinity
> when cpuset controller is disabled.
> 
> [1] https://lore.kernel.org/lkml/20260702214757.579012-1-longman@redhat.com
> 
> Michal Koutný (1):
>    selftests/cgroup: Add test for cpuset affinity on controller disable
> 
> Waiman Long (2):
>    cgroup/cpuset: Support multiple destination cpusets for
>      cpuset_*attach()
>    cgroup/cpuset: Handle the special case of non-moving tasks in
>      cpuset_can_attach()
> 
>   kernel/cgroup/cpuset.c                       | 131 ++++++----
>   tools/testing/selftests/cgroup/test_cpuset.c | 243 +++++++++++++++++++
>   2 files changed, 321 insertions(+), 53 deletions(-)
> 

-- 
Best regards
Ridong

