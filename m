Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F91D331A5E
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738028; cv=none; b=P/p3RhXJCbNTxtRiYHh+sEzWACD70q8wEEMO3uAksONdiyOHAOJ51LVhdwS9wzi8Z78ytg/L98nmIfNiMR5A/GB5IXycpAmT2Nm/YyJr33qQR6PDAhsqKdW03AQe1MUyEOex9vYaVotW/CKEIjbwZfNIrunetS4Ab5KjyfXdlo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738028; c=relaxed/simple;
	bh=VG9d8PQEQrMfuIF7UGzCQD8kj7dSnfgOISNY/i2xpf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYezwVeBAKSAYJCg5YEdmCe91Gu+ft3i2J4Qw5RCfIRRfkTcIukO8D7+QdOdBrq5PDKqKHnD7l9XjnNxhNOXPhazthBsGaggYs7z9YnjHTmoUlbqeipmjC2XQYKrQ0ilyrW3K8KXdv+Y22Nd/1UnsdaCpKt1UBmgrdZ2EGvIJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FOGNxoWT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FOGNxoWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773738026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LfW4PQO+j4EnEpboaPKhMu3WfMztmYGSmgtjCkFC7Vk=;
	b=FOGNxoWTuqgo60doXp25y2eVxodVuTBi0LAXOM2doTVFtGKrXIAEjY68WjoAx2ILq/Re9M
	YfJlRdxQGCCQ7i+si2kmlRhJMY/EEaQvyJw94ceEbvFSlcujyCQUpXNUpEuTjA8FwsvxJb
	CPwLgmig3whIoHSxQdXhcVKKcdD5jFM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-490-x904NKE3O2OvpD80PB_H_g-1; Tue,
 17 Mar 2026 05:00:21 -0400
X-MC-Unique: x904NKE3O2OvpD80PB_H_g-1
X-Mimecast-MFC-AGG-ID: x904NKE3O2OvpD80PB_H_g_1773738018
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30E0C18005B3;
	Tue, 17 Mar 2026 09:00:17 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E6D41800576;
	Tue, 17 Mar 2026 09:00:07 +0000 (UTC)
Date: Tue, 17 Mar 2026 17:00:03 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v2 3/5] selftests/mm: move write_file helper to vm_util
Message-ID: <abkYE-tUzy6cz_kH@gmail.com>
References: <20260316044335.1390608-1-chuhu@redhat.com>
 <20260316044335.1390608-4-chuhu@redhat.com>
 <abekn9aBMw1e1Rw1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abekn9aBMw1e1Rw1@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Mon, Mar 16, 2026 at 08:35:11AM +0200, Mike Rapoport wrote:
> On Mon, Mar 16, 2026 at 12:43:33PM +0800, Chunyu Hu wrote:
> > thp_settings provides write_file() helper for safely writing to a file and
> > exit when write failure happens. It's a very low level helper and many sub
> > tests need such a helper, not only thp tests.
> > 
> > split_huge_page_test also defines a write_file locally. The two have minior
> > differences in return type and used exit api. And there would be conflicts
> > if split_huge_page_test wanted to include thp_settings.h because of
> > different prototype, making it less convenient.
> > 
> > It's possisble to merge the two, although some tests don't use the
> > kselftest infrastrucutre for testing. It would also work when using the
> > ksft_exit_msg() to exit in my test, as the counters are all zero. Output
> > will be like:
> > 
> >   TAP version 13
> >   1..62
> >   Bail out! /proc/sys/vm/drop_caches1 open failed: No such file or directory
> >   # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > So here just leave one version of write_file, and move it into the vm_util.
> > This make it easy to maitain and user could just include one vm_util.h when
> > then don't need thp setting helpers. Keep the prototype of returning the
> > written bytes num.
> > 
> > Suggested-by: Mike Rapoport <rppt@kernel.org>
> > Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> > ---
> > Changes in v2:
> >   new patch from v2
> > ---
> >  .../selftests/mm/split_huge_page_test.c       | 15 ------------
> >  tools/testing/selftests/mm/thp_settings.c     | 24 +------------------
> >  tools/testing/selftests/mm/thp_settings.h     |  1 -
> >  tools/testing/selftests/mm/vm_util.c          | 16 +++++++++++++
> >  tools/testing/selftests/mm/vm_util.h          |  2 ++
> >  5 files changed, 19 insertions(+), 39 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> > index e0167111bdd1..93f205327b84 100644
> > --- a/tools/testing/selftests/mm/split_huge_page_test.c
> > +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> > @@ -255,21 +255,6 @@ static int check_after_split_folio_orders(char *vaddr_start, size_t len,
> >  	return status;
> >  }
> >  
> > -static void write_file(const char *path, const char *buf, size_t buflen)
> > -{
> > -	int fd;
> > -	ssize_t numwritten;
> > -
> > -	fd = open(path, O_WRONLY);
> > -	if (fd == -1)
> > -		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
> > -
> > -	numwritten = write(fd, buf, buflen - 1);
> > -	close(fd);
> > -	if (numwritten < 1)
> > -		ksft_exit_fail_msg("Write failed\n");
> > -}
> > -
> >  static void write_debugfs(const char *fmt, ...)
> >  {
> >  	char input[INPUT_MAX];
> > diff --git a/tools/testing/selftests/mm/thp_settings.c b/tools/testing/selftests/mm/thp_settings.c
> > index 574bd0f8ae48..02de28ecf31a 100644
> > --- a/tools/testing/selftests/mm/thp_settings.c
> > +++ b/tools/testing/selftests/mm/thp_settings.c
> > @@ -6,6 +6,7 @@
> >  #include <string.h>
> >  #include <unistd.h>
> >  
> > +#include "vm_util.h"
> >  #include "thp_settings.h"
> >  
> >  #define THP_SYSFS "/sys/kernel/mm/transparent_hugepage/"
> > @@ -64,29 +65,6 @@ int read_file(const char *path, char *buf, size_t buflen)
> >  	return (unsigned int) numread;
> >  }
> >  
> > -int write_file(const char *path, const char *buf, size_t buflen)
> > -{
> > -	int fd;
> > -	ssize_t numwritten;
> > -
> > -	fd = open(path, O_WRONLY);
> > -	if (fd == -1) {
> > -		printf("open(%s)\n", path);
> > -		exit(EXIT_FAILURE);
> > -		return 0;
> > -	}
> > -
> > -	numwritten = write(fd, buf, buflen - 1);
> > -	close(fd);
> > -	if (numwritten < 1) {
> > -		printf("write(%s)\n", buf);
> > -		exit(EXIT_FAILURE);
> > -		return 0;
> > -	}
> > -
> > -	return (unsigned int) numwritten;
> > -}
> > -
> >  unsigned long read_num(const char *path)
> >  {
> >  	char buf[21];
> > diff --git a/tools/testing/selftests/mm/thp_settings.h b/tools/testing/selftests/mm/thp_settings.h
> > index 76eeb712e5f1..7748a9009191 100644
> > --- a/tools/testing/selftests/mm/thp_settings.h
> > +++ b/tools/testing/selftests/mm/thp_settings.h
> > @@ -63,7 +63,6 @@ struct thp_settings {
> >  };
> >  
> >  int read_file(const char *path, char *buf, size_t buflen);
> > -int write_file(const char *path, const char *buf, size_t buflen);
> >  unsigned long read_num(const char *path);
> >  void write_num(const char *path, unsigned long num);
> >  
> > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > index a6d4ff7dfdc0..b4b3b48f8dc9 100644
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -764,3 +764,19 @@ int unpoison_memory(unsigned long pfn)
> >  
> >  	return ret > 0 ? 0 : -errno;
> >  }
> > +
> > +unsigned int write_file(const char *path, const char *buf, size_t buflen)
> > +{
> > +	int fd;
> > +	ssize_t numwritten;
> > +
> > +	fd = open(path, O_WRONLY);
> > +	if (fd == -1)
> > +		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
> > +
> > +	numwritten = write(fd, buf, buflen - 1);
> > +	close(fd);
> > +	if (numwritten < 1)
> > +		ksft_exit_fail_msg("Write failed\n");
> > +	return (unsigned int) numwritten;
> 
> If we exit on any failure, the function can be void just like in
> split_huge_page_test.c. This will also simplify write_num() and read_num()
> in thp_settigns.c

Good point. I will change it to void. I wont touch read_file() here.

> 
> > +}
> > diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> > index e9c4e24769c1..22c8805e0d7a 100644
> > --- a/tools/testing/selftests/mm/vm_util.h
> > +++ b/tools/testing/selftests/mm/vm_util.h
> > @@ -166,3 +166,5 @@ int unpoison_memory(unsigned long pfn);
> >  
> >  #define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
> >  #define PAGEMAP_PFN(ent)	((ent) & ((1ull << 55) - 1))
> > +
> > +unsigned int write_file(const char *path, const char *buf, size_t buflen);
> > -- 
> > 2.53.0
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

