Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BC03A782C
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949413; cv=none; b=lyKgTsoemXUKH2ba1/s8MS+YANNOGHPyEHRPB3mEUu6/srI3RfPeVllpk60WTKTR9o7ZsI9WAz7EIUiM0mnFb6rKkcfDi9XNlj5UpQGYm3n8qgkMF4Wo/PWx7OEN2Ma6FimIsONXLJauxurk0IbvQGwo2b8iWyfHUOyanZdCSlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949413; c=relaxed/simple;
	bh=oA1X4OjKB0GfvTlrIm3AnrrrJwuKWQdjYIEZey6owkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVpqTyQrithzty0W2a3st0hJM2rr+W0KIbxqmOMIb+FwXpOc0qVkMoXDdHTwgV0tl0MqTPwBu++AP1OqDILUCDkqrHaIzehVEsTOcctc1IbhK42IutomsAkPv7LzXZLKoTNOzDLMschILhe/1xoQnAXHNSSCKYIflD7tOdw9f/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ei3nJ6mm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ei3nJ6mm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771949411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oA1X4OjKB0GfvTlrIm3AnrrrJwuKWQdjYIEZey6owkk=;
	b=Ei3nJ6mm9ikokeJpo4Ab2k3jjmD4nE4HR+YzOoQEgsg/XniDi02tI5gcPjbF2dnfmabfyn
	+8aiZQyRORyCDcWyDEl2M5tyWWAsPpHrKYAWw/bFbQ04cv7u+F02GWFq9lXxphkVoIS6Q+
	lNW5L5rlolwon7KJKyY+4NJmPBG+m6g=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-NxIo-czBMU2UDEDhw7H02g-1; Tue,
 24 Feb 2026 11:10:08 -0500
X-MC-Unique: NxIo-czBMU2UDEDhw7H02g-1
X-Mimecast-MFC-AGG-ID: NxIo-czBMU2UDEDhw7H02g_1771949405
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB74C1800464;
	Tue, 24 Feb 2026 16:10:04 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E12E21800361;
	Tue, 24 Feb 2026 16:09:57 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 24 Feb 2026 17:10:04 +0100 (CET)
Date: Tue, 24 Feb 2026 17:09:56 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrei Vagin <avagin@google.com>
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
	Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pid_namespace: allow opening pid_for_children
 before init was created
Message-ID: <aZ3NVMEpeWKOxFkC@redhat.com>
References: <20260223200254.4104651-1-ptikhomirov@virtuozzo.com>
 <20260223200254.4104651-2-ptikhomirov@virtuozzo.com>
 <CAEWA0a63QxMRqCwpCUqb5iKih31LY-2zX+--SkMGcP-Y19PqpQ@mail.gmail.com>
 <4de06792-d8ea-4f2e-848d-0dfccdb64253@virtuozzo.com>
 <CAEWA0a61jLQxULDMXLcpZn2M-cJXxzSMyCS8C4y=YkFfHAEYng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEWA0a61jLQxULDMXLcpZn2M-cJXxzSMyCS8C4y=YkFfHAEYng@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 02/24, Andrei Vagin wrote:
>
> On Tue, Feb 24, 2026 at 5:38 AM Pavel Tikhomirov
> >
> > This check here is more for the concurrent alloc_pid() case. When one process
> > in alloc_pid() successfully allocated the pid and than, for instance, hit the
> > pidfs_add_pid() error and is going to free_pid(), but the pid 1 is remains yet
> > allocated from idr and the cursor is on 2 at the moment. At the same time the
> > concurrent process may get to alloc_pid(), and will see cursor on 2, it should
> > not be able to create a process as this process will get pid 2 and will be
> > created before init.
> >
> > And in general (non concurrent case) it makes sense to only allow allocating 1,
> > for the first process.
>
> In this case, there is likely a race condition. Two alloc_pid() calls
> can run concurrently,
> where idr_get_cursor() returns 0 in both instances.

This code runs with pidmap_lock held.

But,

> I think this
> check needs to
> be moved after idr_alloc_cyclic() to verify the actual value that was allocated.

Agreed, see other emails in this thread.

Oleg.

