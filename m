Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65343806B7
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 16:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949039; cv=none; b=C8sSSjzudkk/YQSy83BGkFk7S0MfwyC0MuOi3wcPyXI1qMx+wA8Z7rBR26iop9PIo/6n//YRa1qlOQQlp9FfonRWmoTnr4YkDHJOKX2Aopsfq7HH85XFsoDfUuhSo4L9YHnySXhaBrFQpI7j0wyxickNX2RLNVmrNf7zm4+aXgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949039; c=relaxed/simple;
	bh=MllAX/uC1cUFlTXyRj7i2qo3BKoHFClirIAI0wCreL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIb6aOkdOhsWTYegnConfDJsB5LxoWJxEIWszUsScIoOOkyHWw9W4HMvC9CMDGX4FG/kNbnx3r0P3G01kYI65Z3gh2DX+ECmumztCYqwqhiiRUMb7LOEpcJwH9ikyNx4/SXH5H3Sf2hNnsp12gC0iWY+Ib+Qu9HEuG65XMWj+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYMm8kzX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYMm8kzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771949036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MllAX/uC1cUFlTXyRj7i2qo3BKoHFClirIAI0wCreL4=;
	b=CYMm8kzXsNBjuOV4BFFPrD4YYpGzATqZt7vLumGtfw61oGdYQp0bNZjpC0xZlpJeEbrmAZ
	7Df3/I4XUZqXfk4D9wFudkXc+WqPg6XO5c5fmQ37NzdmnRWI+1TFS5L3nt2/ubV71Imnds
	r2IyU8tj1D26mT+cUHM7EGs7B3u5/Yc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209-Qn2jdw52M4qKQ7iYyUymJw-1; Tue,
 24 Feb 2026 11:03:53 -0500
X-MC-Unique: Qn2jdw52M4qKQ7iYyUymJw-1
X-Mimecast-MFC-AGG-ID: Qn2jdw52M4qKQ7iYyUymJw_1771949031
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4B891800367;
	Tue, 24 Feb 2026 16:03:49 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id AF11319560A2;
	Tue, 24 Feb 2026 16:03:42 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 24 Feb 2026 17:03:49 +0100 (CET)
Date: Tue, 24 Feb 2026 17:03:41 +0100
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
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH v2 1/2] pid_namespace: allow opening pid_for_children
 before init was created
Message-ID: <aZ3L3cRL8AEmfQpP@redhat.com>
References: <20260223200254.4104651-1-ptikhomirov@virtuozzo.com>
 <20260223200254.4104651-2-ptikhomirov@virtuozzo.com>
 <aZ2U6TwK7rQtkTvT@redhat.com>
 <3f095a91-f052-4f38-a8e4-2e6dbc9a0c6a@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f095a91-f052-4f38-a8e4-2e6dbc9a0c6a@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 02/24, Pavel Tikhomirov wrote:
>
> On 2/24/26 13:09, Oleg Nesterov wrote:
> > On 02/23, Pavel Tikhomirov wrote:
> >>
> >> To avoid possible problems related to cpu/compiler optimizations around
> >> ->child_reaper, let's use WRITE_ONCE (additional to task_list lock)
> >> everywhere we write it and use READ_ONCE everywhere we read it without
> >> explicit lock.
> >
> > Yes, this is what I meant... but I can never recall if READ_ONCE() alone
> > is enough to make KCSAN happy...
>
> AFAICS this should be fine for memory safety of accesses to ->child_reaper.
> I would love if someone more experienced in this area would confirm.

__READ_ONCE() uses volatile cast, DEFINE_TSAN_VOLATILE_READ_WRITE()
will pass KCSAN_ACCESS_ATOMIC to check_access(), so it seems that
READ_ONCE() should be enough...

But I am not sure, I don't really understand this code.

> > I won't insist, but I think it would be better to do this in a separate
> > change for documenation purposes and for discussion.
>
> Ok, will do. It will be a bit ugly as I will first add READ_ONCE to the
> pidns_for_children_get() and then remove the hunk with it in the next patch.

Agreed, this is ugly. I almost regret I mentioned _ONCE() in the previous
discussions, I only tried to "nack" another read_lock(tasklist).

So lets avoid a separate change and WRITE_ONCE()'s in copy_process/find_child_reaper,
we can add them later if KCSAN complains, they are not needed for correctness.

But up to you, I am fine either way.

> > Perhaps something like the preparational patch below makes sense ? Not
> > sure this is actually better...
>
> This looks more universal at least, as instead of two checks we have one in one
> place. My only concern of putting the check where I put it was to avoid extra
> idr_alloc_cyclic() + idr_remove(), if we already know we don't need it. But it's
> only in last pid_namespace we can have ->child_reaper unset so we do alloc/remove
> for all other namespaces anyway in error case, should not be a big deal.

Yes...

> I will add the preparation patches: for below patch and related to _ONCE.

Again, up to you. But either way it would be nice to have a comment or at
least a note in the changelog to explain that this is also needed to avoid
the race between alloc_pid() + fail and another alloc_pid(). This is subtle.

Oleg.

