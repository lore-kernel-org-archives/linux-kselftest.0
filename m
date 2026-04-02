Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28633D561
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 01:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775092643; cv=none; b=EWNycqZ/+keXXKH/OydA8yCjCPMtaNY8hS9KY2lt+SyL0sBscXGj3qePbbgL4Un0gqpAedFsPStc5eikHJaFjhKEZrxSShQ4OgTEkZnhIIoCrKEvfg8ZRnxuWDgO2a+aJsvWKJ82TR0LAvqnsf1r/wD5KKcihDyd5MWJobfNrdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775092643; c=relaxed/simple;
	bh=W5fGaDowPr9MuuDzZhxn9FoNrI278i+RBWaxHJhdEaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhYe0fBAKmtg6WDHfmcqU6bc3HGfTgNo0pDS50GJtojUyXbp6kxlDvZuJaw/14loGXYFZEmMu0W148Lu77pjMO+2sR1wTWDOmFPOwYgPpes5w85PhO0kAdBvWaadYD9KyaQnRJXoGGDTxvWejbe6IijSkQkfI0gC/x2KPCCR4xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gnGGbpm0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gnGGbpm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775092641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ESlYIolGBSFH6AWVL5HUwn+hc6w8VfR5MT+DXBPeS+0=;
	b=gnGGbpm08+n2f5V7gjZeSFWL+EhzMjSqNOwCBesR/2K4yzKLLm56S9Mfx1i7GQG8oq4Bxd
	Dp6qIjKlrCwgbkPqNbd5zUM5Y2epDh1o4EJgnCTS89UuY6hzfVYkDN+uRHw1XHa23j5MRn
	hykKYowRtM++xxER0hlN8GwmFSc/HYc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-1QYFvXvBMOGBxgNU06fP0A-1; Wed,
 01 Apr 2026 21:17:16 -0400
X-MC-Unique: 1QYFvXvBMOGBxgNU06fP0A-1
X-Mimecast-MFC-AGG-ID: 1QYFvXvBMOGBxgNU06fP0A_1775092633
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BE9E1800281;
	Thu,  2 Apr 2026 01:17:12 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.80])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43EC430001A2;
	Thu,  2 Apr 2026 01:17:00 +0000 (UTC)
Date: Thu, 2 Apr 2026 09:16:54 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Mark Brown <broonie@kernel.org>, akpm@linux-foundation.org,
	david@kernel.org, shuah@kernel.org, linux-mm@kvack.org,
	ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev, Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH v7 4/7] selftests: ksft_exit_fail_perror: support printf
 style arguments
Message-ID: <ac3DhrTIcxvAki3X@gmail.com>
References: <20260330151503.670415-1-chuhu@redhat.com>
 <20260330151503.670415-5-chuhu@redhat.com>
 <efbad6c5-8d5e-4774-8d0a-d455e6e2c182@sirena.org.uk>
 <c6976e34-54b7-42a8-968e-9ae967c52968@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6976e34-54b7-42a8-968e-9ae967c52968@t-8ch.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Wed, Apr 01, 2026 at 02:08:53PM +0200, Thomas Weißschuh wrote:
> On 2026-04-01 12:03:09+0100, Mark Brown wrote:
> > On Mon, Mar 30, 2026 at 11:15:00PM +0800, Chunyu Hu wrote:
> > 
> > > The ksft_exit_fail_perror function previously only accepted a single string
> > > argument, which limited its flexibility for providing specific context to
> > > failure messages.
> > 
> > > This change updates ksft_exit_fail_perror to support variable arguments,
> > > similar to ksft_exit_fail_msg.  Adding the __printf(1, 2) attribute enables
> > > compile-time checking for format string correctness.
> > 
> > This is causing build regressions on the arm64 selftests:
> > 
> > /arm64/fp/za-fork-asm.o -o /build/stage/build-work/kselftest/arm64/fp/za-fork
> > In file included from za-fork.c:12:
> > ../../kselftest.h: In function ‘ksft_exit_fail_perror’:
> > ../../kselftest.h:427:13: error: implicit declaration of function ‘vasprintf’; d
> > id you mean ‘vsprintf’? [-Wimplicit-function-declaration]
> >   427 |         if (vasprintf(&buf, msg, args) == -1) {
> >       |             ^~~~~~~~~
> >       |             vsprintf
> > 
> > This is because za-fork uses nolibc which does not implement
> > vasprintf().
> 
> We can add vasprintf() to nolibc, I'll send a patch later today.
> But it will be fairly inefficient, as our malloc() implementation
> is *very* simple. Not that it would matter here.
Thanks! 
> 
> That said, I am not a fan of the new ksft_exit_fail_perror().
> What about this:
> 
> #define ksft_exit_fail_perror(msg, ...)	\
> 	ksft_exit_fail_msg(msg ": %s (%d)\n" __VA_OPT__(,) __VA_ARGS__, strerror(errno), errno);
> 
> A similar treatment might be done to ksft_exit_fail_msg().

Thanks for the suggestion! I would use ksft_exit_fail_msg directly for
now, and we don't bother to make it that complex just for saving two
parameters.

> 
> > I need to look at why this managed to pass the build testing I do in
> > -next...
> 
> 
> Thomas
> 

