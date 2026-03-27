Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8D33D647C
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604409; cv=none; b=M4lPfdNlVau5a5pQ0vwH179Vm4M+gYeJJJi2FlsdfmSGULRmxos4qwDO/noTYMO1upvBU8TgIMQm7PSZapXyjhS5zRYmG1LG5WqbGs5mS8gDk+0WxUJKzQFq1qO3NhkqP7tl24M89be4HZj95cylWX/Mh1tkZbdJxgOzvDJljy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604409; c=relaxed/simple;
	bh=Ey8WLB6VdxKp1WgfWUNJnVcybz+km8fh2sjOpkwiTuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQTxZ+zSekitsHXKNG7wZFKcURzF7EzKDrc32+XSwF8YzVdVBPtjB0RZUmIqNR56NhoY+smNgXXK+8n/ITPr5aK/S15lUQ1sxOBja93UJ71OeSPRmcROqirxMwVREJH6V/WnpJkepxmvrNsl7G7RyaaOO/hQpBWucrCGdEA1h6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dtXBeTL1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JbuANZYN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtXBeTL1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JbuANZYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774604403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YOdbKfae4JbEA0UPM7uma0S92BFh9dlLyUY4bnqBIVE=;
	b=dtXBeTL1jqjzWmjn6ZZ8VXcW0Yqx8SPCzBR2LHwzQeMF25PzeiC43I2rurZvGCd7hJITVa
	SFdvFDCmjZj/2psMDk2X8Kenvxsw7f4SPui0HN/GLnnIeFAmxUVLFRJSJQBbc/AZgsy1rM
	QrLBXaXH0XdpIGI79SL+9llXDrcjjdM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-ce-ZbWUNOOessH7k7KbJPQ-1; Fri, 27 Mar 2026 05:40:01 -0400
X-MC-Unique: ce-ZbWUNOOessH7k7KbJPQ-1
X-Mimecast-MFC-AGG-ID: ce-ZbWUNOOessH7k7KbJPQ_1774604401
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0b57e192bso16544235ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 02:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774604400; x=1775209200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YOdbKfae4JbEA0UPM7uma0S92BFh9dlLyUY4bnqBIVE=;
        b=JbuANZYNVQW0vQV5022xl1VXLjIP4OJLN8iT/bSnDdeIBTg/OnsD3jG+zCFh5xwXrW
         S/fKwSqwJ7NJnPTBlGmZh4hMMFruGZBVztDpg1xQM7PZNFPgDHa7KK6imsLD3DwMNlKC
         reeStQVtfMXyplv+8p0llnwJ/aA8qQ1W+2YgjOqZMKVP7vEilTTIUqIigi9hRAzrMHOz
         4weowBEMLgJQpgvV1H6TQ8D8kx3ew1P9F2b0Bmzk0Xq74yJ/VzobbMLay9Y5nGqHAr/M
         T/A/+OKa9cvLnH7zu2n27XS7bFG+qlf4GUVz9JMnriuu5o/bvTDDrXnNSl3Aj6NpFAED
         Kp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604400; x=1775209200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOdbKfae4JbEA0UPM7uma0S92BFh9dlLyUY4bnqBIVE=;
        b=Kxs/SwhcU73w3hA5qPoJfeu01K9fj+lwSh1ggzIujnd3gR/EnFM5yDvJANjOUbYOCh
         Pyk1L/qg+M2QyjrfWDMfH/yiz6++YTHZxzfF9taJPf/efp/2xhWilJlW7YiChbHm5RUx
         GDJTOsbNb6K6PPTOsSZbYArEfjhxrvcbNkvU7qjL0BTEu+ASf8fWS7iCvzH3tEblsWjS
         Ey478Jn0doMRgxe6GR/p/z9hEv67dPW/pG481Uz9RzxeSKYWmC5n7Ovisz7GdcdrQeNq
         WyiD3RBTj0Y18Vyg0bbPBwWBnT9XtgnYn7gKdPETt1kV9VYWl762ENFYHs6nboo5POVq
         qPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCULmcOTVaIUtJs65KoJmugcx6CoL+pdTMYIV8id0/6EOHWZXbqWDOsEK5don4bFKRbtI1R8RUO8tKHKtWfziko=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvKKdQ2B9Tup9ddDmFu+Y3TXXNTHyxRnWzI5EE5PXDcU5MJndj
	2xFr3qVfmiyY3ZDc+QEta6QfWU4okiZYsy7qYAnn0FZEzH3CIlPhpU/iS0xFAvKcPZ5u7YJ//5o
	krR6kZUb/el9I+qfWg//WXgWnpbL7w6O8F1G2ceOScu3pQUudMBWwFZ242lk1D3QhOhrY0g==
X-Gm-Gg: ATEYQzxzrWEALAoNnuguYTvQm4KId8jd7/+BGexeT923KqvBGAQbT5nL26vbgAuVvNv
	hr3Rk3kWJMa+FKPUQ/Hi9FQkfLtMtEb6GnX4IkJw0rMfxpN1CHhgixdEbqXTcfPyGwf2fTCKOYv
	xQBB/KfkREYpmSFLKPfCDN1hKtgwMuLIjJMsBB7HW0uVUpbbLLeowfwelgdMVL7qu87ka/5E4gV
	1TjKfKmYAg2W3urfbKQhwLW3STyaDbI085BbJdlr7YbGgq0FO6hWTHm1Y/pB2chGqTD7PIdAmzM
	t3gOVw6qW1HPnrKBhcm0sNQTiV5azyQwuR8uEHOu6S27neRLnbumlLQW1e188e612rCJ+1mvNlT
	oHgXOKTRszYhmPacIGA==
X-Received: by 2002:a17:903:1b65:b0:2b0:afad:7aad with SMTP id d9443c01a7336-2b0cdd3e3abmr20490255ad.45.1774604400554;
        Fri, 27 Mar 2026 02:40:00 -0700 (PDT)
X-Received: by 2002:a17:903:1b65:b0:2b0:afad:7aad with SMTP id d9443c01a7336-2b0cdd3e3abmr20489965ad.45.1774604400082;
        Fri, 27 Mar 2026 02:40:00 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76b92asm53890105ad.15.2026.03.27.02.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:39:59 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:39:57 +0800
From: Li Wang <liwang@redhat.com>
To: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, aubaker@redhat.com, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip hugetlb_dio tests when DIO alignment
 is incompatible
Message-ID: <acZQbTMiXctRPXII@redhat.com>
References: <20260327031243.15903-1-liwang@redhat.com>
 <acYs_-UOv72cmO-P@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acYs_-UOv72cmO-P@kernel.org>

> > --- a/tools/testing/selftests/mm/hugetlb_dio.c
> > +++ b/tools/testing/selftests/mm/hugetlb_dio.c
> > @@ -20,6 +20,31 @@
> >  #include "vm_util.h"
> >  #include "kselftest.h"
> >  
> > +#ifndef STATX_DIOALIGN
> > +#define STATX_DIOALIGN		0x00002000U
> > +#endif
> > +
> > +void check_dio_alignment(size_t pagesize)
> > +{
> > +	int fd;
> > +	struct statx stx;
> > +	unsigned int dio_align = 1;
> > +
> > +	fd = open("/tmp", O_TMPFILE | O_RDWR, 0664);
> > +	if (fd < 0)
> > +		ksft_exit_skip("Unable to allocate file: %s\n", strerror(errno));
> > +
> > +	if (statx(fd, "", AT_EMPTY_PATH, STATX_DIOALIGN, &stx) == 0 &&
> > +				(stx.stx_mask & STATX_DIOALIGN))
> > +		dio_align = stx.stx_dio_offset_align;
> > +
> > +	close(fd);
> > +
> > +	if ((pagesize / 2) % dio_align != 0)
> > +		ksft_exit_skip("DIO alignment (%u) incompatible with sub-page offset %lu\n",
> > +				dio_align, pagesize / 2);
> 
> This also needlessly skips the test with aligned offsets.
> 
> I'd suggest detecting dio_align here, passing it to run_dio_using_hugetlb()
> and moving the check that skips a test there.

Good point, as the first test case use 'pagesize * 3' is fully aligned
and would work fine. But apparently I overlooked that.

Also, Sashiko reminder few minor issues, which I would fix them in next
version as well.
  https://sashiko.dev/#/patchset/20260327031243.15903-1-liwang%40redhat.com

-- 
Regards,
Li Wang

