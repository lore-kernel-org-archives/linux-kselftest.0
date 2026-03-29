Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BBF78F59
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776638; cv=none; b=kBDI2UN4c2s/IbA1j6alqYTKd0/w04gJ3glD1XfvnxkeCRNyIfbnjSzzvLptvLvZYLct/Ryo21YGH1PJ9Zs3EYbaVM61XTuJfaKTCmGkez1FRBjPTlaRpgUeSeE7IAzoVEYmFwxvLb1rrWqTpVIVfJf430K3eGUwb9twCF/wjcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776638; c=relaxed/simple;
	bh=A8ls0nlvwNkOwLnYlY4ZPgriDcFrqLNMs2Gc2PkWTMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwkzkworxgEindASVNjcR+71FGvToGTEv8TDuqUmO8p+uL+Jc53iCQp3sJqRNloAFZp+PnZUz6aZXFLG7bc2NMrrlqXD1s1kXPclmbXBt47QaIn+Nfn/UmKMg3Ms69zew/FieqGqnlmTY0KA1idYin+6plyEwXPq5gtJeqM/85c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EJXxRo5b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EJXxRo5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774776635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSEV5DVnX6Qaz2dMrSepuJsnEsG/Qes4vX8oCOHtAp4=;
	b=EJXxRo5bwthMzbd8z+ki1GMBwzgzTLGbsCPo8MJnWlH75rm3qYuBMz4PcWnaTjhLyQigam
	7nj55yNU8mQVTsMkJK3h1jwL0o0hUN/KPUtGWVxeevd1iyLj5S5h+Evd8ZhemiwunNb0ss
	GUh9mKw3p0ypx/zpg9H082wRUkn7Zk0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-347-lfKqZ1nTNFCGNRSlxwjkAQ-1; Sun,
 29 Mar 2026 05:30:33 -0400
X-MC-Unique: lfKqZ1nTNFCGNRSlxwjkAQ-1
X-Mimecast-MFC-AGG-ID: lfKqZ1nTNFCGNRSlxwjkAQ_1774776631
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7A1D19560A6;
	Sun, 29 Mar 2026 09:30:30 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 90D8430001A1;
	Sun, 29 Mar 2026 09:30:21 +0000 (UTC)
Date: Sun, 29 Mar 2026 17:30:17 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH v6 4/6] selftests/mm/vm_util: robust write_file()
Message-ID: <acjxKfDnPt3YhsQN@gmail.com>
References: <20260324013316.2590422-1-chuhu@redhat.com>
 <20260324013316.2590422-5-chuhu@redhat.com>
 <c87111e3-5cbe-487c-90b9-78d22a3f7a24@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c87111e3-5cbe-487c-90b9-78d22a3f7a24@lucifer.local>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Fri, Mar 27, 2026 at 07:46:03AM +0000, Lorenzo Stoakes (Oracle) wrote:
> On Tue, Mar 24, 2026 at 09:33:14AM +0800, Chunyu Hu wrote:
> > Add two more checks for buflen and numwritten. The buflen should be at
> > least one, otherwise the 'buflen - 1' could underflow and cause trouble.
> > The numwritten should be equal to 'buflen - 1'. The test will exit if
> > any of these conditions aren't met.
> >
> > Additionally, add more print information when a write failure occurs or
> > a truncated write happens, providing clearer diagnostics.
> >
> > Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> > ---
> > Changes in v6:
> >   - save/restore errno before and after the close(), so the log could show
> >     the correct error info on failure. Suggested by AI.
> > Chagnes in v5:
> >   - new patch for making improve on write_file. Add more safety checks and
> >     diagnostics info in log
> > ---
> >  tools/testing/selftests/mm/vm_util.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > index ad96d19d1b85..572ccb99de8e 100644
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -767,15 +767,23 @@ int unpoison_memory(unsigned long pfn)
> >
> >  void write_file(const char *path, const char *buf, size_t buflen)
> >  {
> > -	int fd;
> > +	int fd, saved_errno;
> >  	ssize_t numwritten;
> > +	if (buflen < 1)
> 
> As per Sashiko (presumably didn't look :P), let's make this < 2 since we
> write buflen - 1 bytes below which we don't ever want to be 0.

That makes sense. Let me change to 2 in next version. Thanks!

> 
> > +		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
> >
> >  	fd = open(path, O_WRONLY);
> >  	if (fd == -1)
> >  		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
> >
> >  	numwritten = write(fd, buf, buflen - 1);
> > +	saved_errno = errno;
> >  	close(fd);
> > +	errno = saved_errno;
> >  	if (numwritten < 1)
> > -		ksft_exit_fail_msg("Write failed\n");
> > +		ksft_exit_fail_msg("%s write(%s) failed: %s\n", path, buf,
> > +				strerror(errno));
> > +	if (numwritten != buflen - 1)
> > +		ksft_exit_fail_msg("%s write(%s) is truncated, expected %zu bytes, got %zd bytes\n",
> > +				path, buf, buflen - 1, numwritten);
> >  }
> > --
> > 2.53.0
> >
> 

