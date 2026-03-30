Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3AF387352
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855397; cv=none; b=s5uJnODrYS1Hk82qQw65jkVbD0TWFytj1Mve2zWmFxBPaZZPfmCkBg3ql6vAneeQcJZKFZBDjRN+JishhMFgvEj7vh1Se6qMBa48TacJrX9ujJ0EZdWuUBKCG+SOXD+gk/Uq7/IRF+bPA5AEBZ6UQelrWAb/9HZBZ7cF8ugotxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855397; c=relaxed/simple;
	bh=BdSusAkF/oQFRNlMBbzmWyLxgLq1gUDuAB+K4Y2gWQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtD/Kpxk1CaScvw0j7R+z+NxyadvvIG3GqXXx8xpv1uVrur604mCMlykRkD/E43dcLPlrcOrBNZelwb9Crl0GKEhKlV8cfmkriGbClqeUmaQee/DiRumXYjuh9PwKd6cC+Zq7kadqoHikPLGfSohLM8IpHlPs+wRAFpvpipCE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SoRw3OdR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o/t8v9A8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SoRw3OdR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o/t8v9A8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774855395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NZ0LQnOR95aHR/QhroiVMVa82mQ7m1GAsbziC8rzFfs=;
	b=SoRw3OdRKd4H+luoKMfHN3lW90JeoBPlfMgJHUh9TNft2YX+bccmRHA+Bl8lJOgzIeZxUf
	+ac7roifXB2K0QlM8YMdi3Zes8wBwoKHmLkoNzNdwHc4JwlWUEGexFnzRUisYEgXX9ryyl
	C/qVVS3ejFADlS5a5A89tfDWWaxyXDs=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-1ZKKwLNzN-yp4soB0umNQA-1; Mon, 30 Mar 2026 03:23:13 -0400
X-MC-Unique: 1ZKKwLNzN-yp4soB0umNQA-1
X-Mimecast-MFC-AGG-ID: 1ZKKwLNzN-yp4soB0umNQA_1774855393
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c38b85c25so7870196b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774855392; x=1775460192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NZ0LQnOR95aHR/QhroiVMVa82mQ7m1GAsbziC8rzFfs=;
        b=o/t8v9A8KR68HcG5x2EwxpvqoBw6yf9EgNBwUNc531APA9cqkRPhD3bRfTPQvLPbS9
         PMAdlZyy1zBQZmIkX5Q9vHpykExjqy4uOd/coc2xESyFP46Wde91mzIx3mFi2+S+aGSq
         65PGdIcvmIkQeEhjdXfiZs9SCLls2lRt6IQAIbKF2900mo7Flbvw8XowAFfSfNWuMr7X
         eJo927pNbKcvT/mWjgMdb6nWff5Qjda3vWadtud82EQH4pu+Mg/gOtoiPWPj6V6xiGhf
         KU+HAzLP7tV4TL5OSh4RtdjDlu8An1DpFSS6YvQSIVe5tDO977l7ZelJObX41GASGmj3
         J7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774855392; x=1775460192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ0LQnOR95aHR/QhroiVMVa82mQ7m1GAsbziC8rzFfs=;
        b=m4Vfqb0+KvXX3yolxNGCpdbY2nVAHu1Iph8Cj+EKJG/ulZHKFh6FDDQTsqlBWnPLBe
         nU1pFU42XJ6N0vkkjrbI0IfF8h0wnXxzCJXOBXjY3PT6vINO+dwvaKIhy+2xu1En/Emi
         MBYvq5JF/wwGrP7xG8VHPSWZTLnUFCKomqChEumkycf8T8z+X05zvjhJzLFZrSKTU/G+
         vJq7gyrVr5DmwYazI9CS0r6G5nYTvCZn2sB4gz55gyQVuTptLPUjR+OBFtTfjsvpR2U+
         2XNr6SKK83Vu/LqxXfIfC13M9S/8epLVc1cSHqmLsWilQbRZLsvIUh4J18D7mMFCW/0C
         cklw==
X-Forwarded-Encrypted: i=1; AJvYcCXMD4eLQaYqLrneJnKncKAze8itkN2sl7IlIwW3xlroGM6XguJhXvB5hUSOSuOwp9jjSCbxYitPcCD5cKrWuPM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrn/F6XtLFiqa01fHJ330Ra13thmFiSTTMVPXdKZyQcYpx7wK4
	Jjtyww9K0vrROwJGprrkXgjYL+ZgFfsDZeNIdNhnTBKDoSFDE+00fZmTCyq1r66qhg4gjuC60tS
	5OrmjUY05eYe7S4VESKJpnqF4TiRJICxDxAHlEW46fyDyMyn7r3EF31Xt+/w0rR/sjXtFSw==
X-Gm-Gg: ATEYQzyU34+fBW+20+6k27w/mZJxo9hX+kxeQXSUbFdwMVksqGJfdttX8/HZdOsYlLg
	SnULIztigYJQFJbQjoNUFja7ukNUXJ5UiYJw0i2107pZ0vmB0OeOR9qLNvnjzBZ0gXodIpiYrN7
	Zvg5JRod5TLbi9EwXoOh4oxIvTwsYkoe4c08uoHNKen9+DZ/By7E8RCFoK3bWZzjL1JSnBsth0+
	V94MnecEyQkXddJ56n7kFeMTT1o6dDj/LdFqGW1EO2xAt2EwuS4TlN34V+DFPJqGY0ChiDTG0A6
	ScTDB0UlD1is6N+6Oi4l7m/VQNx3/yTGQKP7nnLP+hLtv+irXzwBhO3wPQuwcNE/+ladataxXsb
	uQ8nUN8serGKP7sgkiw==
X-Received: by 2002:a05:6a00:2d01:b0:82a:79b8:2049 with SMTP id d2e1a72fcca58-82c95c21e4fmr10957435b3a.25.1774855392509;
        Mon, 30 Mar 2026 00:23:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d01:b0:82a:79b8:2049 with SMTP id d2e1a72fcca58-82c95c21e4fmr10957402b3a.25.1774855392034;
        Mon, 30 Mar 2026 00:23:12 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d3a71sm7217393b3a.30.2026.03.30.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:23:11 -0700 (PDT)
Date: Mon, 30 Mar 2026 15:23:08 +0800
From: Li Wang <liwang@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, rppt@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, aubaker@redhat.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3] selftests/mm: skip hugetlb_dio tests when DIO
 alignment is incompatible
Message-ID: <acok3JY66OcV0Qab@redhat.com>
References: <20260330053915.75442-1-liwang@redhat.com>
 <a5b7add7-0507-40c0-a324-81f243ffa261@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b7add7-0507-40c0-a324-81f243ffa261@kernel.org>

On Mon, Mar 30, 2026 at 08:02:01AM +0200, David Hildenbrand (Arm) wrote:

> >  	/* Open the file to DIO */
> 
> This comment is misleading as we are not opening "the" file, but we create a new one.
> See below, maybe we should clean that up.

+1

> >  int main(void)
> >  {
> > -	size_t pagesize = 0;
> > -	int fd;
> > +	size_t pagesize = psize();
> > +	unsigned int dio_align = get_dio_alignment();
> 
> Both could be const.

+1

> Why can't we simply open the file once and pass the fd to run_dio_using_hugetlb()?
> 
> fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
> if (fd < 0)
> 	ksft_exit_skip("Unable to allocate file: %s\n", strerror(errno));
> dio_align = get_dio_alignment(fd);
> if (dio_align <= 0)
> 	ksft_exit_skip("Unable to obtain DIO alignment: %s\n", strerror(errno));

Yes, apparently this is a good suggestion. Thanks!

-- 
Regards,
Li Wang

