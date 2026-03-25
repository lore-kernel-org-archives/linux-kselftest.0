Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E3C3BADA3
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 16:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455835; cv=none; b=DpnE28UVqA+shRBEHzkK1KhAGiVZeekn8DpemxTHrmuUOWEKB8JOfLchDlmUo2syRBmB3K5HZ+9N6na+k1ZB2JKUCQg008kLIx7pYrLKS90nqn/cZ5WOUgpz17/H0acoAT9vFedAJlnL003vHxC7dnNcqVrtkG1Zovzi0Cl8iwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455835; c=relaxed/simple;
	bh=nbXezRXYLqx1BUyXtaEyqHSTcxbH5k5T6PAsOQkPaGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLlc6Mm+N2GJ6U9D//qDDQtD8+0CZ/XyrNsW10Ifzh4ba1PmmWcpjwbCSzIQrAeiKR0b2ds7lbwSL5/eTVHicqme9j2tYBLZb4fWVhgxic0A8PmDFpaUxKMU+XuoxEGAhZXz5SIH9aat7pzp0i57yp70uovxb3vgR/99myDMKKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A07nyL4y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A07nyL4y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774455832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3wC6baJp6zL608VaSymAAbIsY7ajVAj3x88sWAoRz70=;
	b=A07nyL4yuZBGJYnUckpMOfm2wQui8wWKEkywDKXBCC+f+d1laYecI7WbWS/++Www8MZwzf
	fiRPh6v3eeEm34O/DgkRUa9UMqNF1v7Qw0x07WFN/mnhS09St0FMuUofqvUz/MrjRjAnzX
	qmXZe8J0jpfXIGNALIrr4DKS613xiRw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-g4v1uGoEP_eWbXKoQ_7gpQ-1; Wed,
 25 Mar 2026 12:23:50 -0400
X-MC-Unique: g4v1uGoEP_eWbXKoQ_7gpQ-1
X-Mimecast-MFC-AGG-ID: g4v1uGoEP_eWbXKoQ_7gpQ_1774455828
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 39DAF195608E;
	Wed, 25 Mar 2026 16:23:48 +0000 (UTC)
Received: from fedora (unknown [10.22.81.79])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87790300019F;
	Wed, 25 Mar 2026 16:23:44 +0000 (UTC)
Date: Wed, 25 Mar 2026 12:23:41 -0400
From: Audra Mitchell <audra@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, shuah@kernel.org,
	usama.anjum@collabora.com, colin.i.king@gmail.com,
	avagin@google.com, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Message-ID: <acQMDW9qM2MtYpkT@fedora>
References: <f7fef55d-4334-4d1d-b6c6-b409fea7e2a1@kernel.org>
 <20260320184010.759461-1-audra@redhat.com>
 <20260320184010.759461-2-audra@redhat.com>
 <a4fb1d56-8c10-46de-acf5-9a00ce0db4ad@kernel.org>
 <20260324162324.6efa49422d145afd4dd37dda@linux-foundation.org>
 <20260324162445.fb353f4d2c85d89bc25be03a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324162445.fb353f4d2c85d89bc25be03a@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Tue, Mar 24, 2026 at 04:24:45PM -0700, Andrew Morton wrote:
> On Tue, 24 Mar 2026 16:23:24 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > On Mon, 23 Mar 2026 12:56:33 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> > 
> > > > +		supported = __pagemap_scan_get_categories(fd, test_area, &r) >= 0;
> > > 
> > > You have to cast it to a (long) first before comparing, like we do in
> > > pagemap_scan_get_categories().
> > > 
> > > 
> > > Maybe best written as
> > > 
> > > 	long ret = __pagemap_scan_get_categories(fd, test_area, &r);
> > > 
> > > 	if (ret >= 0)
> > > 		supported = 1;
> > > 
> > > > +		ksft_print_msg("errno: %d\n", errno);
> > > 
> > > I guess we should drop that, was mostly for testing.

Wouldn't it be prudent to also update __pagemap_scan_get_categories
return type to a long? Right now its uint64_t, but we expect a long
to be returned from the ioctl:

	static long do_pagemap_cmd(struct file *file, unsigned int cmd,
                           unsigned long arg)

I've made the other changes, but I'll wait to push the next version after
this feedback. Thanks!

