Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5803033E7
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 08:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009258; cv=none; b=GGa8uEHxuOn1MvJhemR+r/b+17pQDi+04MC8gD22JAwg8tNAGbRSZCR0efXT9mbUCLpz34w0q7M6oTk7u6IfpIC3xIDJB5qbmvmIyyLk21Tv6+cox2OzWO5TJi0uI2a1UGxif3y/tmBwf2c8g8ZmffUTkF4JoN05VLBzpktUoxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009258; c=relaxed/simple;
	bh=xt8ohtKb1M9f1I8jGhd11DN2horJLMay+iP4kCP07Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STr9AVgXZ98aIybY8+YIgjRpJ1+jqIb2MRExKKq1AwItEjPERi/8uggV82bu8Npnllhm5cIIBoc2GieqFgj0v2EFZf1yrnQSRlf6WF/FRwnTN8xsLdhOZ2inLlscokPc7eUskErZ4KV+8bd3gX2kXW1ysqa+gbt2G/yZMsA54S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c9gv31vo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c9gv31vo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772009256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d04OwuAx5S3mZfnINvJ//qURUEObB9dXr+1t12EiSts=;
	b=c9gv31vofQPEV5F5meEuHcuH+tKkPAmnw+xI9+h3ruK6wmUzUCzOWjEamaUekWGI4RKCcf
	pD1Eo0U8ncJNl+l99iNi/9l4JA0lRXPqehrqToyE4qK7Ri0uFzsa5+QBQ2Hz/W1ParjKs9
	4tcUsh9oaGj5eMiOUoPYrncdl6w0u4g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-4-4FFrYcPSmYzIZuxXg9Uw-1; Wed,
 25 Feb 2026 03:47:31 -0500
X-MC-Unique: 4-4FFrYcPSmYzIZuxXg9Uw-1
X-Mimecast-MFC-AGG-ID: 4-4FFrYcPSmYzIZuxXg9Uw_1772009249
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB49C195608F;
	Wed, 25 Feb 2026 08:47:28 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id BE0E0180066B;
	Wed, 25 Feb 2026 08:47:21 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 25 Feb 2026 09:47:28 +0100 (CET)
Date: Wed, 25 Feb 2026 09:47:19 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Jan Kara <jack@suse.cz>, Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 2/4] pid: check init is created first after idr alloc
Message-ID: <aZ63F7vHRKw9qZw9@redhat.com>
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
 <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/24, Pavel Tikhomirov wrote:
>
> This moves the condition (tid != 1 && !tmp->child_reaper) to after idr
> alloc, so it not only covers that first process in pid namespace has pid
> 1 in case of clone3(set_tid) requesting wrong pid, but also if idr
> itself gives wrong pid for some reason.
>
> This could've been the case before this patch, when creating first
> process the alloc_pid()->pidfs_add_pid() code path fails, so that the
> idr->idr_next is non zero anymore and next process calling to
> alloc_pid(), will get 2 as a pid from idr_alloc_cyclic(). Effectively
> leading to init-less pid namespace, which is a bug.

Yes.

alloc_pid() does:

	/* On failure to allocate the first pid, reset the state */
	if (ns->pid_allocated == PIDNS_ADDING)
		idr_set_cursor(&ns->idr, 0);

but this logic is broken.

Suppose that a task P does sys_unshare(CLONE_NEWPID). Then it does
fork(), and fork() fails for any reason after alloc_pid() succeeds.
If P does another fork() to retry, we have a bug.

So with this patch we can either remove the code above, or (better)
improve this logic.

> Note: This is also a preparation for the next patch in the series, which
> will introduce an ability of creating init from the task different to
> the task which had created the pid namespace. Needed to make sure that
> init is always first, even in this new case.
>
> Suggested-by: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Signed-off-by: Oleg Nesterov <oleg@redhat.com>


> @@ -296,9 +290,18 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
>
>  		pid->numbers[i].nr = nr;
>  		pid->numbers[i].ns = tmp;
> -		tmp = tmp->parent;
>  		i--;
>  		retried_preload = false;
> +
> +		/*
> +		 * PID 1 (init) must be created first.
> +		 */
> +		if (!READ_ONCE(tmp->child_reaper) && nr != 1) {
> +			retval = -EINVAL;
> +			goto out_free;
> +		}
> +
> +		tmp = tmp->parent;
>  	}

Cosmetic, but why did you move "tmp = tmp->parent;" down? This is fine
but not strictly necessary. OTOH, if you do this, perhaps it makes sense
to move "retried_preload = false;" as well?

Oleg.

