Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810F43AEF34
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954853; cv=none; b=hoi8yptiPyv69M/cFFt/m4zXnqhWm9KkTDfWhn+CeDGPLTRLyysZyoBPaZ6Y2vmavy6dibAY/VC0uOQAcD+2cGOZ3BJRgoiBwDQ2qsDJFtXs2EiH4C1zJ7eeN/pm/ju8ShPKuV0210cDO84gsYsmutJMbTKwpxsc02KPc34DRBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954853; c=relaxed/simple;
	bh=NgHXd3rvlfIF/tk7XuHELZ9ZtGhPcuOyPY6qUEwTaf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmrGQk+0vM8hA4Kj1fqDRIoltzabWuIFNCsSdI/Z2RreAHzgrOpPWvYvl8IlrqkvggWSbexQCkswDQXAdgFcnTDMKgBi1b3QmG+4OIjg7DO34gbX2hnP9C9mQO8Ry1keP1Fo4JmaDSGQEcuIQmElOGVk4WViGlAmZY3dFXRXqQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UmWeP5pa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UmWeP5pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774954850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TNuT2cAuD0OlKPSarRBqH1oonNnIziA47qF4/GN+rec=;
	b=UmWeP5paB+GOw/U6mFTj9abqNgLExaSvN/geX6h+MppcA/Ei48uL25B3OtNiOwlKRdngQ5
	LZ7D9dkzx2cKoLajK9QBbXmN0xIffEc97IosBqHn+Y2p9yijFrFnH6QVEcxiEuIAsXm7X6
	6RxBfWey59RRgUVYx9X4dqQuDAbjZI4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-YDbL3fC4MyW1ulyVcUfRwQ-1; Tue,
 31 Mar 2026 07:00:46 -0400
X-MC-Unique: YDbL3fC4MyW1ulyVcUfRwQ-1
X-Mimecast-MFC-AGG-ID: YDbL3fC4MyW1ulyVcUfRwQ_1774954843
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C18301944F2F;
	Tue, 31 Mar 2026 11:00:42 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.187])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9385A1800763;
	Tue, 31 Mar 2026 11:00:33 +0000 (UTC)
Date: Tue, 31 Mar 2026 19:00:28 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v6 4/6] selftests/mm/vm_util: robust write_file()
Message-ID: <acupTAjkYf3USAGo@gmail.com>
References: <20260324013316.2590422-1-chuhu@redhat.com>
 <20260324013316.2590422-5-chuhu@redhat.com>
 <acZ4wTxSmPn_s_mn@kernel.org>
 <acjwcQjCP81JldAX@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acjwcQjCP81JldAX@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Sun, Mar 29, 2026 at 05:27:13PM +0800, Chunyu Hu wrote:
> On Fri, Mar 27, 2026 at 03:32:01PM +0300, Mike Rapoport wrote:
> > On Tue, Mar 24, 2026 at 09:33:14AM +0800, Chunyu Hu wrote:
> > > Add two more checks for buflen and numwritten. The buflen should be at
> > > least one, otherwise the 'buflen - 1' could underflow and cause trouble.
> > > The numwritten should be equal to 'buflen - 1'. The test will exit if
> > > any of these conditions aren't met.
> > > 
> > > Additionally, add more print information when a write failure occurs or
> > > a truncated write happens, providing clearer diagnostics.
> > > 
> > > Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> > > ---
> > > Changes in v6:
> > >   - save/restore errno before and after the close(), so the log could show
> > >     the correct error info on failure. Suggested by AI.
> > > Chagnes in v5:
> > >   - new patch for making improve on write_file. Add more safety checks and
> > >     diagnostics info in log
> > > ---
> > >  tools/testing/selftests/mm/vm_util.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > > index ad96d19d1b85..572ccb99de8e 100644
> > > --- a/tools/testing/selftests/mm/vm_util.c
> > > +++ b/tools/testing/selftests/mm/vm_util.c
> > > @@ -767,15 +767,23 @@ int unpoison_memory(unsigned long pfn)
> > >  
> > >  void write_file(const char *path, const char *buf, size_t buflen)
> > >  {
> > > -	int fd;
> > > +	int fd, saved_errno;
> > >  	ssize_t numwritten;
> > > +	if (buflen < 1)
> > > +		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
> > >  
> > >  	fd = open(path, O_WRONLY);
> > >  	if (fd == -1)
> > >  		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
> > 
> > We have ksft_exit_fail_perror(), fits great here
> 
> the ksft_exit_fail_perror() don't accept the fmt string, it only accept
> a single string as parameter.
> 
> ```
> static inline __noreturn void ksft_exit_fail_perror(const char *msg)
> 
> ```
> 
> But we can change it also support va_list arg like 
> ksft_exit_fail_msg(msg, ...) does:
> 
> static inline __noreturn void ksft_exit_fail_perror(msg, ...)
> 
> I can have a try in next version.

Tried in v7.

In v7, I tried to change ksft_exit_fail_perror to support va_list args,
and I used vasrpintf() to print the message to the buf and then pass it
to ksft_exit_fail_msg(). But it requires _GNU_SOURCE can cause a build
issue in mm-unstable tree from the kernel test robot report. 

The vasprintf, the static buf[] (will trucate long message), or make
a copy of body of the ksft_exit_fail_msg and append a perror string,
none of these ways is clean, using ksft_exit_fail_msg may be still
a better way.

What do you think, Mike?

> 
> > 
> > >  
> > >  	numwritten = write(fd, buf, buflen - 1);
> > > +	saved_errno = errno;
> > >  	close(fd);
> > > +	errno = saved_errno;
> > >  	if (numwritten < 1)
> > > -		ksft_exit_fail_msg("Write failed\n");
> > > +		ksft_exit_fail_msg("%s write(%s) failed: %s\n", path, buf,
> > > +				strerror(errno));
> > 
> > and here.
> 
> Same answer with above coment.
> 
> > 
> > > +	if (numwritten != buflen - 1)
> > > +		ksft_exit_fail_msg("%s write(%s) is truncated, expected %zu bytes, got %zd bytes\n",
> > > +				path, buf, buflen - 1, numwritten);
> > >  }
> > > -- 
> > > 2.53.0
> > > 
> > 
> > -- 
> > Sincerely yours,
> > Mike.
> > 
> 

