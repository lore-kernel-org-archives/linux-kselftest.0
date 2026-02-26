Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB62D73A1
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110001; cv=none; b=lx3lwW71r3mGHTKhIN9qpU3zzn0FpFWi9euoUxGnrxFfBzGE650U3nk4gKDD8N9dqNoo//fi2zBQzu0LTYPwKbrB/EHD2/skK0VtVAOpZ9M9emUOIxSZtNXfXEdP0b2JufEF1U2x+6S8qH6YztJeoA82juQgIyG6pkt/Bz/zfb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110001; c=relaxed/simple;
	bh=seXsmfnMZNDGmNdk2vBCcSLMIeHdG+faWBeJUj9rB/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXFQ6jwoqzNe4PgL9gUUCPUWD/DnDanU8DoEH4REE8VZjMu52/c5/KCAACAYO0DfMGNQNKH4Qrwmz2/Xj8uqQlOsn1KIhwW9pW9eQwnX7GHUaNJFbAX2v9DrkJ8jHdUywPNtkfWhBOYqe8j6Dvqivga5CPZom2yGtxUNCmJYrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h+0GHvO6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h+0GHvO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772109999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=REu4C5gEnD9lCrQ0u+aojk+enYm0J/YBvFh4w0Tt6ow=;
	b=h+0GHvO6zzeVQTeTCyXfTePu2xR8ZxAbLsjHxYBHFg6u3eA7+gBguY8zd0N47wcSRJt5sA
	uUq++jcn3dOXzC76b6OG+3Xv5F9yUlLGlEPaRMToZDbynT7q8AfN4MGui10iGnWJY35pqW
	1nuXGwOSd8tq3G6y3J62AmZBbvNybYs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-575-KHvnGr7SPuCRykxddpXmIg-1; Thu,
 26 Feb 2026 07:46:35 -0500
X-MC-Unique: KHvnGr7SPuCRykxddpXmIg-1
X-Mimecast-MFC-AGG-ID: KHvnGr7SPuCRykxddpXmIg_1772109992
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D73DF19560A3;
	Thu, 26 Feb 2026 12:46:31 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 5E75419560B8;
	Thu, 26 Feb 2026 12:46:25 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu, 26 Feb 2026 13:46:31 +0100 (CET)
Date: Thu, 26 Feb 2026 13:46:23 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrei Vagin <avagin@gmail.com>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
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
Message-ID: <aaBAn-r7A65f2ubP@redhat.com>
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
 <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
 <CANaxB-znXjfh5s9ro127TGONsu6PieuaJ1vB3PMVFeV4Eo8pkQ@mail.gmail.com>
 <aZ67mwBEbRtdaWp2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ67mwBEbRtdaWp2@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 02/25, Oleg Nesterov wrote:
>
> On 02/24, Andrei Vagin wrote:
> >
> > This isn't directly related to this patch, but why do we check
> > "ns->pid_allocated & PIDNS_ADDING" after allocating all pids?  Wouldn't
> > it be more reasonable to do that right after taking the pidmap_lock?
>
> Perhaps, but alloc_pid() can drop pidmap_lock and retry, so we will
> need to re-check PIDNS_ADDING.

Now that I look at this code again... Why do we bother to check
"pid_allocated & PIDNS_ADDING" at all? copy_process() does

	/* Don't start children in a dying pid namespace */
	if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
		retval = -ENOMEM;
		goto bad_fork_core_free;
	}

I am going to send the patch which removes this check from alloc_pid...
Need to recheck.

Oleg.

