Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174B7262FEC
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776458; cv=none; b=eIKtfR1ERG1Bq8rQiVdz4983L44SrN0iF9K92V43j9Vc1qNT96zJSWPYvAceIIfVDIZu2gnALrV1fuowhI9xsEZEm0xCzCN4v/ncK92llbB3CHm67HFCAEIV2rBXsuTk+Lh+csllkwCIhS7Z1eh2NmHfooLxTwAfmy/flEzSzks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776458; c=relaxed/simple;
	bh=o+4eU8Vs4eJ15gOeVE+5kXrfmws5IR1eUexSZIXteao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOp+6nPedeB4xQYFkCML1y2G6JJ39+16sC52yXgQnnJVmFnGTDQTbFKVHqwe6HE3bs9FjShKaP2yCH1WHJjRKecvrHKEpLgqZsl1968m3+mmeDFBNGJJ0uMzDBJ21RshgUUlg2fb3kvpbO1f839WrmrvjEfz5YUpj356nYVEN3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IOGM2R7y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IOGM2R7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774776455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEHkLhpLN9BJCSGtTIfOJIo17BtlLLKI1kfp4Hozo9g=;
	b=IOGM2R7yZgGzewh1MaZkbCmX2lscL44EaTGUBFzCEf9DImmZiC9bnoAHVauJIK07MBLy3J
	eswbcSEDPibiCIHAUHt0S7kQH9G6A1ql5MtyWuP/nR5AluJlurPu4yAT3sIGFtEg3zhZuW
	tJDFMipce8W1wVF9q8KcS9NwdSYhRx8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-456-iXW6Oc3oMs2_m6qiq-31ZA-1; Sun,
 29 Mar 2026 05:27:31 -0400
X-MC-Unique: iXW6Oc3oMs2_m6qiq-31ZA-1
X-Mimecast-MFC-AGG-ID: iXW6Oc3oMs2_m6qiq-31ZA_1774776449
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C4281800344;
	Sun, 29 Mar 2026 09:27:28 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.11])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6265319560B1;
	Sun, 29 Mar 2026 09:27:17 +0000 (UTC)
Date: Sun, 29 Mar 2026 17:27:13 +0800
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
Message-ID: <acjwcQjCP81JldAX@gmail.com>
References: <20260324013316.2590422-1-chuhu@redhat.com>
 <20260324013316.2590422-5-chuhu@redhat.com>
 <acZ4wTxSmPn_s_mn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acZ4wTxSmPn_s_mn@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Fri, Mar 27, 2026 at 03:32:01PM +0300, Mike Rapoport wrote:
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
> > +		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
> >  
> >  	fd = open(path, O_WRONLY);
> >  	if (fd == -1)
> >  		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
> 
> We have ksft_exit_fail_perror(), fits great here

the ksft_exit_fail_perror() don't accept the fmt string, it only accept
a single string as parameter.

```
static inline __noreturn void ksft_exit_fail_perror(const char *msg)

```

But we can change it also support va_list arg like 
ksft_exit_fail_msg(msg, ...) does:

static inline __noreturn void ksft_exit_fail_perror(msg, ...)

I can have a try in next version.

> 
> >  
> >  	numwritten = write(fd, buf, buflen - 1);
> > +	saved_errno = errno;
> >  	close(fd);
> > +	errno = saved_errno;
> >  	if (numwritten < 1)
> > -		ksft_exit_fail_msg("Write failed\n");
> > +		ksft_exit_fail_msg("%s write(%s) failed: %s\n", path, buf,
> > +				strerror(errno));
> 
> and here.

Same answer with above coment.

> 
> > +	if (numwritten != buflen - 1)
> > +		ksft_exit_fail_msg("%s write(%s) is truncated, expected %zu bytes, got %zd bytes\n",
> > +				path, buf, buflen - 1, numwritten);
> >  }
> > -- 
> > 2.53.0
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

