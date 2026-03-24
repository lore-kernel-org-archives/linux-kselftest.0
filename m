Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F3224B04
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311531; cv=none; b=Qy26xrARChtIUJCXTPwvWQieIocXuwQe1tQXTG18OJMajRH6PafXW3gA446b9Vh08w/FWya45POA9uee92jYTXmuCq7rPUVSYKAnImUjEtT5tP3yZFZFblGPvT5I9cLgerT16oOnDB1MqOFMMhQTr9NAhUES22ZSfK0ccwrE1p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311531; c=relaxed/simple;
	bh=yGy7Z8uzxyxPErpPsYIHwK2yeSQehWyyHFDQvdpmNi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrWzxlfx7VAqxpZrM+083g1b5SRpi1oFWbrsQM+bfZq7Kr8b2u2/gjCzPCmHi9PY2UVnBZqT1RKMSdgWrqef++j5DY7AqYRP1O6wwJrx3i1bvYIm2cbe4JfpvZ9dWX/EptwyCNut3b6oKyJmoJygaxhnPESH8SXsXEgRkexWxFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dWnHBod7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dWnHBod7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774311528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXzLmy9yBL+MosyDIkq8eObiDBonWwPvsZwMJQOiiLk=;
	b=dWnHBod7kcsix+tqXG3QQpceFBJ+m8IOb8fLo9J7n1SnrG1B9Bhdk6da4F6ilCE9F/p7IJ
	ON+Tocgd38zR8QTnLE8+ivvjxH2Fk4GaJCw+Ja1CKBKeoYR0R0/7irZXI+tOsd4ZwVuYpV
	AyL0n++0c/yVePxKxWEazjNT3K3jOS4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-482-wdIQRatmOOyip77YOmUoFg-1; Mon,
 23 Mar 2026 20:18:43 -0400
X-MC-Unique: wdIQRatmOOyip77YOmUoFg-1
X-Mimecast-MFC-AGG-ID: wdIQRatmOOyip77YOmUoFg_1774311520
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DEF5F19560AA;
	Tue, 24 Mar 2026 00:18:39 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.53])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6DF5419560AB;
	Tue, 24 Mar 2026 00:18:30 +0000 (UTC)
Date: Tue, 24 Mar 2026 08:18:24 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH v5 4/6] selftests/mm/vm_util: robust write_file()
Message-ID: <acHYUE1rn5TYyxgR@gmail.com>
References: <20260323151753.2576137-1-chuhu@redhat.com>
 <20260323151753.2576137-5-chuhu@redhat.com>
 <20260323153941.289938dd9ced4dbb76ca7804@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323153941.289938dd9ced4dbb76ca7804@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Mon, Mar 23, 2026 at 03:39:41PM -0700, Andrew Morton wrote:
> On Mon, 23 Mar 2026 23:17:51 +0800 Chunyu Hu <chuhu@redhat.com> wrote:
> 
> > Add two more checks for buflen and numwritten. The buflen should be at
> > least one, otherwise the 'buflen - 1' could underflow and cause trouble.
> > The numwritten should be equal to 'buflen - 1'. The test will exit if
> > any of these conditions aren't met.
> > 
> > Additionally, add more print information when a write failure occurs or
> > a truncated write happens, providing clearer diagnostics.
> > 
> > ...
> >
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -769,6 +769,8 @@ void write_file(const char *path, const char *buf, size_t buflen)
> >  {
> >  	int fd;
> >  	ssize_t numwritten;
> > +	if (buflen < 1)
> > +		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
> >  
> >  	fd = open(path, O_WRONLY);
> >  	if (fd == -1)
> > @@ -777,5 +779,9 @@ void write_file(const char *path, const char *buf, size_t buflen)
> >  	numwritten = write(fd, buf, buflen - 1);
> >  	close(fd);
> >  	if (numwritten < 1)
> > -		ksft_exit_fail_msg("Write failed\n");
> > +		ksft_exit_fail_msg("%s write(%s) failed: %s\n", path, buf,
> > +				strerror(errno));
> 
> AI review
> (https://sashiko.dev/#/patchset/20260323151753.2576137-1-chuhu@redhat.com)
> points out that `errno' was overwritten by the close().  Maybe.  Or
> maybe a successful close() leaves errno alone, dunno.

I'll address this errno part by adding a save and restore before/after
the close().

> 
> Apart from that the comments appear fairly minor.  Please lmk if you
> think we should proceed as-is.

For the other two minor questions about buflen == 1 and non-null
buffer, user should know a string buffer need to be '\0' ended. 
Those are really minor, we can leave as it is. 


AI's comment on patch 5 should be other topic, and minor. Let's 
leave as it it.

> 
> (I'm really trying to slow things down now - we have a *lot* of
> material and a few weeks of consolidation is needed.  But selftests/
> tend to get a pass, for obvious reasons)
> 

