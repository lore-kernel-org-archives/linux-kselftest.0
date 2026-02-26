Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAE14279F7
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772122059; cv=none; b=FoS1MXkjqZHpcZNQsoIbn4Po2ALZAErjJFHLPY5VvEbJZxTlNggE7yvQsNV4/r1PKUUWsEtwC536c6v5rjwdeJEutwhBZ4jZFu8cge98dYSimYZUpNMVqymzcEb4Q0YZwroe/q6mtd+pNWSYOwNYik8FuxkKl5/vIjUAWKEb2Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772122059; c=relaxed/simple;
	bh=Lzpa4DO8/pbpp2nSdrsnv3cgUMqlq+vpezYTUI6OTFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKBPCoiWeJIMbVGCnvn25NIcP9UsOIKT5iIA/UTPl2O0AKjlB05KAk++kFR7aO5H7vmGLPyycxC5DjdZctDePl7ud9Wsz9BeEIn9Us8aZiQBT9oBXder9GwAhpL+kUmtfDJizVv4JeekWxKxf0aSPwq7h37lxD29tto8myWmVN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L+kH0Vhn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L+kH0Vhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772122055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wTxTJ8cM0yh2HdAk2Wp3EOLk+A6tHQBQ8oXmToz4bsg=;
	b=L+kH0VhnVNCRB8+lPDzDRAmv87SI7Zd+hmEwizi5R0Uiz56UdUFqPA9kjU6EbMFW1KnvLC
	b0MgaXKkvqMcjJUU1mNGtQilUDAzWfBB71ROC3lcT1QdqwfUqldjtCnKxwvNvaQa+zM3iF
	S9UjbQNyBrNi7iDBTivBOl7KcHGIFfA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-R2Ypp91zP6S3qLZxgWU9VQ-1; Thu,
 26 Feb 2026 11:07:30 -0500
X-MC-Unique: R2Ypp91zP6S3qLZxgWU9VQ-1
X-Mimecast-MFC-AGG-ID: R2Ypp91zP6S3qLZxgWU9VQ_1772122046
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E26A01956089;
	Thu, 26 Feb 2026 16:07:25 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E5E5B1800465;
	Thu, 26 Feb 2026 16:07:18 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu, 26 Feb 2026 17:07:25 +0100 (CET)
Date: Thu, 26 Feb 2026 17:07:17 +0100
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
Message-ID: <aaBvtX7px-htZcYW@redhat.com>
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
 <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
 <CANaxB-znXjfh5s9ro127TGONsu6PieuaJ1vB3PMVFeV4Eo8pkQ@mail.gmail.com>
 <aZ67mwBEbRtdaWp2@redhat.com>
 <aaBAn-r7A65f2ubP@redhat.com>
 <aaBSaIqErOamW0n-@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaBSaIqErOamW0n-@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 02/26, Oleg Nesterov wrote:
>
> On 02/26, Oleg Nesterov wrote:
> >
> > Now that I look at this code again... Why do we bother to check
> > "pid_allocated & PIDNS_ADDING" at all? copy_process() does
> >
> > 	/* Don't start children in a dying pid namespace */
> > 	if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
> > 		retval = -ENOMEM;
> > 		goto bad_fork_core_free;
> > 	}
> >
> > I am going to send the patch which removes this check from alloc_pid...
> > Need to recheck.
>
> No, we can't remove either of these 2 checks...
>
> This probably deserves another comment in alloc_pid().

something like

	We need this even if copy_process() does the same check. If two
	or more tasks from parent namespace try to inject a child into a
	dead namespace, one of free_pid() calls from the copy_process()
	error path may try to wakeup the possibly freed ns->child_reaper.

perhaps? does it look clear enough?

Oleg.

