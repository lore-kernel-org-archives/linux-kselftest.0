Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A9920DD52
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114557; cv=none; b=KMxGLChmu2dTU1iaBFauJR0RmrKZUqFv41up6Xy9XwRpOwwk+zgYJLRMJzpm983Ngxx+4OnPyHSXije0WaIl6F5g3XUw+GRN1tP80WqERJYw/ovhEiDu3Vw67a33qmwkhcHyjRQt0ZEPMyk1BiUoKlj7JTWVberhjmZcXEKDSEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114557; c=relaxed/simple;
	bh=DekqoN8crtwvAvBjpK07PIoH6I403LM9p0yetWYFDw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLhf5/+AmUNvP/2gV3Q17G9A1xIi3uFSg1OFCQ2Eo+Tz3js5Z3JNKn+Qhp0i87lhJP36eBSBpDcy+kieFYWAKYGVWMpf5Wi8xROMQyZ7XMwN416YFXeiHc3zjzMl52c4xQNNwpuGvf13+xGyolv8B1fj6bgIPBA1W/o614VqgiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGwc4xmt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGwc4xmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772114555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EQ41jwqaTpbsu9nZCnt6Zy1FX5m9icmjt6wuVuOZFyg=;
	b=SGwc4xmt7bLzHPcO3/rL2lO+da8Du34AcRApJzWdKIfDn43z5YgEyppRArfJpzXIE+p+pH
	sZThzoSlrgHy3Y7kxOv5SJNcqygqbGYQaT2URK3H4lhMTQfdnOfuSYNmA81yIfs1ulcH87
	fmcidZZJPEwryhf6+Ext4mDMPRswrao=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-IjRME0-pMcq9mV5s2vUwDA-1; Thu,
 26 Feb 2026 09:02:30 -0500
X-MC-Unique: IjRME0-pMcq9mV5s2vUwDA-1
X-Mimecast-MFC-AGG-ID: IjRME0-pMcq9mV5s2vUwDA_1772114547
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C687818003F6;
	Thu, 26 Feb 2026 14:02:25 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 33EEA1956053;
	Thu, 26 Feb 2026 14:02:17 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu, 26 Feb 2026 15:02:25 +0100 (CET)
Date: Thu, 26 Feb 2026 15:02:16 +0100
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
Message-ID: <aaBSaIqErOamW0n-@redhat.com>
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
 <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
 <CANaxB-znXjfh5s9ro127TGONsu6PieuaJ1vB3PMVFeV4Eo8pkQ@mail.gmail.com>
 <aZ67mwBEbRtdaWp2@redhat.com>
 <aaBAn-r7A65f2ubP@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaBAn-r7A65f2ubP@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 02/26, Oleg Nesterov wrote:
>
> Now that I look at this code again... Why do we bother to check
> "pid_allocated & PIDNS_ADDING" at all? copy_process() does
>
> 	/* Don't start children in a dying pid namespace */
> 	if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
> 		retval = -ENOMEM;
> 		goto bad_fork_core_free;
> 	}
>
> I am going to send the patch which removes this check from alloc_pid...
> Need to recheck.

No, we can't remove either of these 2 checks...

This probably deserves another comment in alloc_pid().
Oleg.

