Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7823EBF35
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 05:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770010355; cv=none; b=vEyR0fuhcAobJ3sO86EddwtTXgKJl1R9BClHGChG34gkuvWR3WpytUU/8kjW+9YqjAMH13MsulsIBgiaulHtJ625rd/FcLjU+ZS7AxZoE+ge+yGvvCNEiGi5OZVY9hsOgjHexecJWNAbu7J6PdcVoy47afH31yEtaTveHWWsVuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770010355; c=relaxed/simple;
	bh=r0GSGGBNdhpuIvPlfYtifyvAHqq+z9JtS8Y6KMSAlpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9BLXismAcysmpbC3G0R0RsLrlg2yDUva2jwWaNXl0KoiIdQ5V4DR8i5vNZnvawNH5oIzULuTgC9hU17PFuw8Wcfm+i7h9UyWewemT4AoWqEWFx9YgWmm2HXC3GVlBaAHq/zO+VrAFxBW9cqqEC+DusLpJdUfusaV2rsQ4iXtgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PGu1ZjEp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PGu1ZjEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770010352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VvUWM/ooQP0zQtiZTiWhNOHe2YGH/ehGj725ryZURko=;
	b=PGu1ZjEpjxdoWHz6x4txB1z6pVNEF5s8peHbQE5Vq5LUorImnovQiF/1x233Bqx0ng0lq2
	PX0DZBHtv47iRldcaCqy+O5yAfVFa9irmF2pDnKIz1mZqh2YosmoP5dM6EayEC+AaLToI+
	iRLfCXQ6Rz4Z7kh+Q9uTFVsbem+IHl8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-a97vVvPfPVieqmkyxMcq4w-1; Mon,
 02 Feb 2026 00:32:31 -0500
X-MC-Unique: a97vVvPfPVieqmkyxMcq4w-1
X-Mimecast-MFC-AGG-ID: a97vVvPfPVieqmkyxMcq4w_1770010350
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C544E19560B5;
	Mon,  2 Feb 2026 05:32:29 +0000 (UTC)
Received: from napanee.usersys.redhat.com (unknown [10.22.66.39])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 458631956053;
	Mon,  2 Feb 2026 05:32:29 +0000 (UTC)
Received: by napanee.usersys.redhat.com (Postfix, from userid 1000)
	id ED125C37AF; Mon,  2 Feb 2026 00:32:27 -0500 (EST)
Date: Mon, 2 Feb 2026 00:32:27 -0500
From: Aristeu Rozanski <aris@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	liuye <liuye@kylinos.cn>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH] selftests/memfd: use IPC semaphore instead of
 SIGSTOP/SIGCONT
Message-ID: <7ad5f70f-b9de-41b0-ad66-628e7e6f3bbc@work>
References: <7888ed77-da89-41b2-a73e-09038b7c9285@work>
 <20260131132315.62b0b029dc1dd03febe97481@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131132315.62b0b029dc1dd03febe97481@linux-foundation.org>
User-Agent: NeoMutt/20241114-35-62db1e
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Sat, Jan 31, 2026 at 01:23:15PM -0800, Andrew Morton wrote:
> On Thu, 29 Jan 2026 17:17:48 -0500 Aristeu Rozanski <aris@redhat.com> wrote:
> 
> > In order to synchronize new processes to test inheritance of
> > memfd_noexec sysctl, memfd_test sets up the sysctl with a value before
> > creating the new process. The new process then sends itself a SIGSTOP
> > in order to wait for the parent to flip the sysctl value and send a
> > SIGCONT signal.
> > 
> > This would work as intended if it wasn't the fact that the new process
> > is being created with CLONE_NEWPID, which creates a new PID namespace and
> > the new process has PID 1 in this namespace. There're restrictions on
> > sending signals to PID 1 and, although it's relaxed for other than root
> > PID namespace, it's biting us here. In this specific case the SIGSTOP sent
> > by the new process is ignored (no error to kill() is returned) and it never
> > stops its execution. This is usually not noticiable as the parent usually
> > manages to set the new sysctl value before the child has a chance to run
> > and the test succeeds. But if you run the test in a loop, it eventually
> > reproduces:
> > 
> > 	while [ 1 ]; do ./memfd_test >log 2>&1 || break; done; cat log
> > 
> > So this patch replaces the SIGSTOP/SIGCONT synchronization with IPC
> > semaphore.
> > 
> > Fixes: 6469b66e3f5a3 (selftests: improve vm.memfd_noexec sysctl tests, 2023-08-14)
> 
> Thanks.  Could you please resend this sometime, with a
> cc:linux-mm@kvack.org and also cc'ing the 6469b66e3f5a3 author Aleksa
> Sarai <cyphar@cyphar.com>?
> 
> > +union semun {
> > +	int val;
> > +	struct semid_ds *buf;
> > +	unsigned short int *array;
> > +	struct seminfo *__buf;
> > +};
> > +
> > +/*
> > + * we use semaphores on nested wait tasks due the use of CLONE_NEWPID: the
> > + * children will be PID 1 and can't send SIGSTOP to itself due special
> 
> s/children/child/, or s/itself/themselves/

Will fix and resend. Thanks!

-- 
Aristeu

