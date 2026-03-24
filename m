Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C74736C0CB
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363527; cv=none; b=Pu4aQkqy1wZIfw/zPCnNz8kf2ZZctIzaXeKVt+Cjzq6wEABWYjJkdlkU92QQWypMOXTdbIcNlI900vF3AgcbXhFGknjMZNBPBZh57c3H2eSB4q9N+ugOjveh5Lbu7WuCUIt2+kZavam3cRrvpB3yC0eKIgdPg+LcDbALtO5wcdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363527; c=relaxed/simple;
	bh=vZTTPEIYuiOXV35Y1qrnUhKegm4CjyqZBzMLEa3WqGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvuMVcvjM0W8AxEOczoIeg3vEQIlQNoGTmM+pxR4i3diPSSscMp2EyrWjJgtcF8sJEzRGjzH/iZSu2ChE0MVR/M0CGA4Q0rEa96QWJ995L7SQmGcSSC4b/LSX5FB6vvGupYSVs+NSCN1KwMeJEqqJBnl3mjHtWLUubejhZsHJAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L8YV7tde; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L8YV7tde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774363524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7zExN/z3Izup7m2aGhIzPxY/KEcJ3LRPb1fPMVoA6wg=;
	b=L8YV7tde7mLerhvNwYrosIvrVWfS6J0zaU44I/lz7xX2tN55+/P1aqusVXj4Mc5p/gMoR/
	Lvcyw200omJXWfE+fgcRQd/adAUB7D3FKSmfC8ZN0txcLhWqtvP/bgwwkjOzbtaOuxggT0
	ubkbbaRGfLSkVNQv4A62ORI1l3OWjjE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-122-i-ME23UrMY-z1CO1Rqd8gw-1; Tue,
 24 Mar 2026 10:45:21 -0400
X-MC-Unique: i-ME23UrMY-z1CO1Rqd8gw-1
X-Mimecast-MFC-AGG-ID: i-ME23UrMY-z1CO1Rqd8gw_1774363519
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C48C1944EB8;
	Tue, 24 Mar 2026 14:45:19 +0000 (UTC)
Received: from redhat.com (unknown [10.22.64.124])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACF5E1800107;
	Tue, 24 Mar 2026 14:45:17 +0000 (UTC)
Date: Tue, 24 Mar 2026 10:45:15 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Pablo Hugen <phugen@redhat.com>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	jpoimboe@kernel.org, jikos@kernel.org, pmladek@suse.com,
	shuah@kernel.org
Subject: Re: [PATCH] selftests/livepatch: add test for module function
 patching
Message-ID: <acKje1XMQMQQYBIL@redhat.com>
References: <20260320201135.1203992-1-phugen@redhat.com>
 <177436214729.62466.7977538958560300344.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177436214729.62466.7977538958560300344.b4-review@b4>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Tue, Mar 24, 2026 at 03:22:27PM +0100, Miroslav Benes wrote:
> On Fri, 20 Mar 2026 17:11:17 -0300, Pablo Hugen <phugen@redhat.com> wrote:
> > Add a target module and livepatch pair that verify module function
> > patching via a proc entry. Two test cases cover both the
> > klp_enable_patch path (target loaded before livepatch) and the
> > klp_module_coming path (livepatch loaded before target).
> 
> We sort of test the same in test-callbacks.sh. Just using different
> means. I think I would not mind having this as well.
> 
> Petr, Joe, what do you think?
> 

I was *just* in the middle of replying to the patch when yours came in,
so I'll just move over here.  I had noticed the same thing re:
test-callbacks.sh despite originally suggested writing this test to
Pablo (and forgot about the callbacks test module).  With that, I agree
that it's a nice basic sanity check that's obvious about what it's
testing.

> >
> >
> > diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_mod_target.c b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_target.c
> > new file mode 100644
> > index 000000000000..9643984d2402
> > --- /dev/null
> > +++ b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_target.c
> > @@ -0,0 +1,39 @@
> > [ ... skip 11 lines ... ]
> > +
> > +static noinline int test_klp_mod_target_show(struct seq_file *m, void *v)
> > +{
> > +	seq_printf(m, "%s: %s\n", THIS_MODULE->name, "original output");
> > +	return 0;
> > +}
> 
> A nit but is 'noinline' keyword needed here? proc_create_single() below
> takes a function pointer so hopefully test_klp_mod_target_show() stays
> even without it?
> 

No strong preference either way.  I won't fault a livepatch developer
for being paranoid w/respect to the compiler :D

Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
--
Joe

