Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7FB331A53
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009857; cv=none; b=DHMJ429Zb5WKmSMiivqEEfG0eRXyEDIMnnWaVRSyd9HZL27hAZha/IGAeXDP2VzQg8NmvjywPloWF6IMeuN3GJqSi5rvkKOW8Hc6nw4AXN8SiqE0zwMyEijpSHv2sX3OWDOSpKftFhgA+kplWOLTLKGObDZ4TxcGS9rSNsjkBO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009857; c=relaxed/simple;
	bh=lJznQwKHi9TUIjCqBdSemHLTP951JhUzonE9RmxwN3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzBEDGspNx5ujphajS+TnY8zMLEQ4o6eH4Sjj28jXObxHuFBy+JMXC+27PAmR0i3xkDWCEfoefflEohRULJW82XAhTiHgpb1g6SBBJdUktkcvhH5AgZQ3w9v0QqJqns6dnQUhZ7gh6000jtZS6dITiQcWadiAF278oT64Mtyz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GdfDFo1/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GdfDFo1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772009852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GanXkJjST8p9TrvQUdc8dnJl6GmI5zogzlDRKcNNJtg=;
	b=GdfDFo1/dkNUxy03j9Ci8s59GXQ92EhAXajrIxtAZHvmCkC7DZVPGMcOD1O3kfgeV9VFcF
	E7JkoNsXHUpWa2J0IlnYZeM550NZlKpm7ZC+bgtNJagn7jGrvDxDj+hRuub/Tzgu1lZh9U
	Whw+OuxTzkY9zwEAEEaQmiU40BiO/bI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-507-FGNCDzsOM22o-VbrbTemxw-1; Wed,
 25 Feb 2026 03:57:27 -0500
X-MC-Unique: FGNCDzsOM22o-VbrbTemxw-1
X-Mimecast-MFC-AGG-ID: FGNCDzsOM22o-VbrbTemxw_1772009845
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6078F180025C;
	Wed, 25 Feb 2026 08:57:25 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E428D1955F43;
	Wed, 25 Feb 2026 08:57:18 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 25 Feb 2026 09:57:24 +0100 (CET)
Date: Wed, 25 Feb 2026 09:57:17 +0100
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
Message-ID: <aZ65bWeZWanmJblL@redhat.com>
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
 <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
 <aZ63F7vHRKw9qZw9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ63F7vHRKw9qZw9@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 02/25, Oleg Nesterov wrote:
>
> On 02/24, Pavel Tikhomirov wrote:
> >
> > This moves the condition (tid != 1 && !tmp->child_reaper) to after idr
> > alloc, so it not only covers that first process in pid namespace has pid
> > 1 in case of clone3(set_tid) requesting wrong pid, but also if idr
> > itself gives wrong pid for some reason.
> >
> > This could've been the case before this patch, when creating first
> > process the alloc_pid()->pidfs_add_pid() code path fails, so that the
> > idr->idr_next is non zero anymore and next process calling to
> > alloc_pid(), will get 2 as a pid from idr_alloc_cyclic(). Effectively
> > leading to init-less pid namespace, which is a bug.
>
> Yes.
>
> alloc_pid() does:
>
> 	/* On failure to allocate the first pid, reset the state */
> 	if (ns->pid_allocated == PIDNS_ADDING)
> 		idr_set_cursor(&ns->idr, 0);
>
> but this logic is broken.
>
> Suppose that a task P does sys_unshare(CLONE_NEWPID). Then it does
> fork(), and fork() fails for any reason after alloc_pid() succeeds.
> If P does another fork() to retry, we have a bug.
>
> So with this patch we can either remove the code above, or (better)
> improve this logic.

Damn, no, I was wrong ;) As Andrei pointed out, free_pid() will clear
PIDNS_ADDING in this case.

Still I think the patch is fine.

Oleg.

