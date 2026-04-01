Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B934B2C029F
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050375; cv=none; b=D7sWagpgPOq4xz11F3ix41FGCzOxQWKHLfTSK6wt5AU5OA9OhTOJN62q6Ne9azNwusqISxqyGfqGznD+WMfwdzwR36hXD3Jy8iLX2gxaVDiLzFd9mixpPlDt4JQs5XBzU43IgXJBfye8apiGjADWi7wJEqIpR9HEBm0yI124NkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050375; c=relaxed/simple;
	bh=45Tx1NH/P/n/wtF1DkpQdhkGyPSeD0g4+GvPS8EoYHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSb5YkxvdrjRJOoWXWTFoT73YtvC/kGOmAvJeTbZadFKJGbh/jKb34G71B9Jwur4WUptbkirbtV84juohj/fQdlWfnNmDZVQTE6qabxare3QrKytfVm8V5yYSeKsFJx4t2u/4S3ZH8YlsYcMXt4ptjAod0UxFq6ml/DMFC4cX/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cljfb6cZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cljfb6cZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775050373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eod5Dm6xkRNC6hJL1r+h+vVL6U6P37BniZZLgne8chs=;
	b=Cljfb6cZpG5zooVCcvof0lZZx2NWsG/Qy9mGWFquGmcWnVcFCVKvpmmPNtvS34ePYZoijt
	HQqG7k+Z1xB9vu48KPLwcpvipuMuJVSB4ctfkDW47SUC0T9b376b8hXIixvvLc9cH5i7aJ
	ewW17EHPzeDLuuIS7ynHat/UhgQZGR4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-D9Cs-343OMeKmLLb3mjglA-1; Wed,
 01 Apr 2026 09:32:52 -0400
X-MC-Unique: D9Cs-343OMeKmLLb3mjglA-1
X-Mimecast-MFC-AGG-ID: D9Cs-343OMeKmLLb3mjglA_1775050366
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FBB118002CD;
	Wed,  1 Apr 2026 13:32:45 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.80])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6511C19560AB;
	Wed,  1 Apr 2026 13:32:34 +0000 (UTC)
Date: Wed, 1 Apr 2026 21:32:30 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH v7 4/7] selftests: ksft_exit_fail_perror: support printf
 style arguments
Message-ID: <ac0ebqaDxWWAYitu@gmail.com>
References: <20260330151503.670415-1-chuhu@redhat.com>
 <20260330151503.670415-5-chuhu@redhat.com>
 <acuijiUs81Z7qYSL@gmail.com>
 <20260331120902.4612d93efb89f71a0d79bb5b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331120902.4612d93efb89f71a0d79bb5b@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Tue, Mar 31, 2026 at 12:09:02PM -0700, Andrew Morton wrote:
> On Tue, 31 Mar 2026 18:31:42 +0800 Chunyu Hu <chuhu@redhat.com> wrote:
> 
> > > -	ksft_exit_fail_msg("%s: %s (%d)\n", msg, strerror(errno), errno);
> > > +	va_list args;
> > > +	char *buf = NULL;
> > > +	int saved_errno = errno;
> > > +
> > > +	va_start(args, msg);
> > > +	if (vasprintf(&buf, msg, args) == -1) {
> > 
> > kernel test robot reported compile error on this, as the vasprintf
> > required _GNU_SOURCE. Looks like it's not appropriate to be used
> > in the common header. Looks like it can be replaced with a buf and
> > vsnprintf instead.
> 
> I like vasprintf()!
> 
> "#define _GNU_SOURCE" occurs 402 times in selftests/, so perhaps we can
> find a way to keep it?
> 
> (err, *why* 402 times?  Can't it be just once?)
> 

_GNU_SOURCE is a feature macro, may silently cause troubles if defined
globally and it's recommended to be used explicitly and maybe that's why
we have so many definitions in c files.  It's usually requireed to be
defined on the top of the include file list of c file. So although we
can see kselftest_harness.h defined _GNU_SOURCE, but still can see some
many (80+) c files define _GNU_SOURCE on the top and include
"kselftest_harness.h" at same file in the bottom of the include files list.

So the side efffect of using the vasprintf in kselftest.h is user need
to take care of _GNU_SOURCE definition because a header requries that...
and the header may change something silently because of the _GNU_SOURCE.

And a weird thing is _GNU_SOURCE is not defined, but the compile of
the selftests calling the ksft_exit_fail_perror(vasprintf) succeed by
accident, maybe man page need update or something I missed.

As Mark and Thomas mentioned, the root cause is not this macro's lack
of definition, it's when '-nostdlib' is specified in the compile flag,
the nolibc lib don't have the fallback implement.

So it may be not appropriate to use it in the kselftest.h. And
considering if we use a buf[], the size is limited and the message
could be truncated, still not ideal.

