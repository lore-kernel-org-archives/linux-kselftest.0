Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6502395247
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 07:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941554; cv=none; b=qsIPoSduaUu00jg46gtiWxGJ4grvsHknHrHXo8LQPeof7oaXXI/BtxUX8nSiJrIe48m+pJOrGkdG1pp92k4CJZgEiGepb6AAGekm//O4K117UHZj0AY/7PiUzWhmhXPhgIYSPcll0V9LYrIqdrfmE34/u5XtYdiFp6yCxlaAIQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941554; c=relaxed/simple;
	bh=jT4qFRXDMssN5Ffbg/Yb3DOawxErxMSqyE5BmmWF2cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTSLuDZCvnsnabzQmVj6F6nI/oPI6W1ZX7IL4u6LUecYQUOI2mYJ4qXkWZcQ89S3lkTIl4e6WbNH1Xzn/HCkbk/yxp8vxTduwOR+4wbBRMaPJ3zvjTlOadzu3IP8M9ZUCKtj2XQW+9WzDyHikJ9yoCnL1K10d93VvVhYVIOf2zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QVztDZB1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F6D7TPbN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QVztDZB1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F6D7TPbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774941551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N67mJoT6zBu5iQWKt0B0XRjd20kwe4lBGYJ6EUJjjbw=;
	b=QVztDZB17/8R6kNWeTe7poUlxbNp4Yf7B8acbMwL3sRH35i3s63NuzsnJMU0vi30wZqGIx
	jWItw6uIKLZyFzy0tWT8CXygQMW1s2RWn3mggcDLeIg4Pnq/atSX25USdx8cz1UOgRPUBQ
	WvX3/gcr2wFYvuHQRI76Gq0ECPYXabY=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-0yLzklAwOKqb-QmJQAqCnA-1; Tue, 31 Mar 2026 03:19:10 -0400
X-MC-Unique: 0yLzklAwOKqb-QmJQAqCnA-1
X-Mimecast-MFC-AGG-ID: 0yLzklAwOKqb-QmJQAqCnA_1774941549
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76b06f37a7so280497a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 00:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774941549; x=1775546349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N67mJoT6zBu5iQWKt0B0XRjd20kwe4lBGYJ6EUJjjbw=;
        b=F6D7TPbNmuEwpETgOePe+GoLv7LYQdKHo00+NxkuZKVM9N+1gJh2yY3jfoI7YcEKyu
         27CAL9kLoBLMMscN5dq7Jw0Q1UMZBURPDp+JskzRLl3u6el+KHDkw9TfpV6cDJ97MQnW
         DwbobbVdHSB0e/nRHlj//B3AvH22RWy9hR1Yf3PVuOujZMByCyrc1Mvj2E9Hrtwgc/Ro
         oXirAsqflJwNBturQWTdDjx9PTFfOalCHlinDNxS7mzT2faHfV+ZKzOCEiPDYOD0/PSh
         2u4NA2IMDJXzE0iZd+vkbbPoeGh5arzsK8d/IEq4vCOWNymOX7JnBGUMYqFtc8pkSIdI
         Mrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774941549; x=1775546349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N67mJoT6zBu5iQWKt0B0XRjd20kwe4lBGYJ6EUJjjbw=;
        b=eQTdLTDmS9t9Y7fy5/vNCmtzlPSwQOFIiIhqX2cbc8pV47KjwhnjnUTduUVIl9e2M2
         cI5HNsLW0VQMUtbFj8M3EnZcxmZhgokkiU+60ktiB/mWEGoaZpIG7XHeZVPjLHSHDO2Y
         TF+t7FfsaH1v1REk8mbtm4TnoJb7J9EQhNk2nkA6n4nMD8KPgvYDnqh/dAp5NAfpmgPJ
         N163eP4eNvV574qapfymexaIPk2cWaQv2aXoHB0j/xraORrzvra6Y5+3W7DLRh5/X6HG
         6b4lysuqHrGZ6ZQtR5L6Oar/7JPLLW9ijG6guHogYx94EYFejael1xnF7eCB1yBk6W1P
         QVFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoHCv8cAoZUdqpIxBi5/zsWP30kjO0EethdUgC0fWzADBAMH+t8Gtw4qDC7E99HuvkxtQvkv63FsukLm83wXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXiyoSKeaNKHeSemqCOcRPPytU9jZqK3BAXxVwLOP+sR0KWXeO
	ABjaDZK0Yufb2402KyRd00CedrBKEw8DbXEjaViwt0LXAlkIE9HCRhbT3DUWpHruEs1yGBg6Ji7
	LaOkKbUac9OrZ1jh2rP2nKHFrm89afaDN0A8OJyWlIKpfUHfp4rtpjWjXdX98I5sqp962GQ==
X-Gm-Gg: ATEYQzzKmqZnV5SRo98wjNz7+0TGKT5fkV92Wx/TQK9M3UWtf7cu1MHJer5Tv7QFFk5
	Uo0sUlhdh/JzUubmbj4Ql5jR3jWbGEaeFImsb33kq17kw7opkfEKyJnEPUOFm+S2FDz7LPsd3BV
	UUzHjBgUH2PjF4/ZmaQmkvhcAwsvchlABOR+CiWtxs8bWakIunO2HPVszNGPwSdelcXjxBH6JF6
	Q6w/mSXqnBpT+mwzyz+aPwUy5A/5jIYLOwHVZL+UjwCyhlbrwosddLlZsb2524udTlQCF6IzjBT
	ovMZpCeyDV8ZYhQwHgN/4/0ksd6e3QEQTYMM4g+PhYtX8E7DO+L+EGeuFJX0z5AqUONvJk4E92M
	1RSDEiS180YFDW/YOMA==
X-Received: by 2002:a05:6a00:438a:b0:82c:7f08:8826 with SMTP id d2e1a72fcca58-82c95e915fdmr13708623b3a.17.1774941549214;
        Tue, 31 Mar 2026 00:19:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:438a:b0:82c:7f08:8826 with SMTP id d2e1a72fcca58-82c95e915fdmr13708602b3a.17.1774941548801;
        Tue, 31 Mar 2026 00:19:08 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca849849fsm11095413b3a.26.2026.03.31.00.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:19:08 -0700 (PDT)
Date: Tue, 31 Mar 2026 15:19:05 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] selftests/lib.mk: set PWD from CURDIR to avoid wrong
 extmod path
Message-ID: <act1ae44xGmG86xT@redhat.com>
References: <20260331040156.119158-1-liwang@redhat.com>
 <20260331040156.119158-3-liwang@redhat.com>
 <20260330223025.4ad1cdb9b79e242f01d8b83d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330223025.4ad1cdb9b79e242f01d8b83d@linux-foundation.org>

On Mon, Mar 30, 2026 at 10:30:25PM -0700, Andrew Morton wrote:
> On Tue, 31 Mar 2026 12:01:55 +0800 Li Wang <liwang@redhat.com> wrote:
> 
> > When running selftests from the kernel top-level (e.g. make kselftest-all),
> > sub-makes might still inherit the caller's PWD from the environment.
> > 
> > Some selftests use $(PWD) in recursive kbuild invocations, which can
> > then incorrectly resolve to the kernel top directory instead of the
> > current test directory.
> > 
> > In that case, kbuild may generate an external-module wrapper Makefile in
> > the wrong location, potentially clobbering the top-level Makefile and
> > causing recursive include failures ("Too many open files").
> > 
> > Export PWD := $(CURDIR) in selftests/lib.mk so $(PWD) always matches the
> > actual current selftest directory.
> > 
> > Reported-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Li Wang <liwang@redhat.com>
> 
> I couldn't clearly figure out what I was doing to cause kbuild to
> destroy my top-level Makefile.  It happened three times and it wasn't
> fun so I Stopped Doing That.  
> 
> I tried a bunch of things *without* this patch and of course, Makefile
> is still intact.  So I cannot confirm or deny, sorry.
> 
> I've switched my script so I'll henceforth be running -j100, shall keep
> an eye on things.

No problem, actually I wasn't able to reproduce it, the patch just worked
out based on your description. We can kick out it from patchset unless
someone confirm it is needed.

-- 
Regards,
Li Wang

