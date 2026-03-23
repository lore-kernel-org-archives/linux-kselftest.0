Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD7714A8B
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 03:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774236093; cv=none; b=MolDhNINpW7tTxX7fVf/jFmFrzdftPAKu1ghVljbJ5o5M2gG23hyuoEt8U1lmjnRKV/hfOjaEHxYtita5aYY/PycxdK3pqxWw+hj+a7xeAchff0nxT91OQav5xYQxh2pFev2Z70TA4z1jEUa0ONUD+LZSCDS9BRh9foxQTcz9ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774236093; c=relaxed/simple;
	bh=7mHbfImAVtI+SDrjtpBEQZ0paPAK0FURZZbYA0FiaM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mfo1dghhlanlgQkWHP5TisvMetyyOYjURMY63PxNGED7ks/z3tZfvlH/HCWmnc09mzaO1isd05cwzMjzIp8aYk+A0PCE5utwvJI1hoaRezvnezj9SzaBlzE8tz5Jf0SVvS5eBdTv9MPnTT1KOrSs5ez/uE7R4sWwm261ISp+mh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hcJSZNDZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hcJSZNDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774236091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aRwkYLYyO8q6WWNTg48brkFByTgN0JR6z4WTvpCGOMc=;
	b=hcJSZNDZY6aQGKXAX2E0retCON44ndUJlf76wKVY5VhUwAnVlrWgMMjhlWWenG0NJp+EZu
	Mr3UzyTChh8ImzuMAHFbu9t7AXQzg+KJxDPNgweqAR99r7N/et/xR0SeWIV6lIFhtBu9gO
	x7S/z9oCAnHuYj7GLJqd0NND6Cbm5qQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-jiOunJ4JP1yFOLulXAHucg-1; Sun,
 22 Mar 2026 23:21:26 -0400
X-MC-Unique: jiOunJ4JP1yFOLulXAHucg-1
X-Mimecast-MFC-AGG-ID: jiOunJ4JP1yFOLulXAHucg_1774236083
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F1B119560AA;
	Mon, 23 Mar 2026 03:21:23 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.175])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 42154300019F;
	Mon, 23 Mar 2026 03:21:13 +0000 (UTC)
Date: Mon, 23 Mar 2026 11:21:08 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH v4 0/5] selftests/mm: skip several tests when thp is not
 available
Message-ID: <acCxpF5l_lveG2MD@gmail.com>
References: <20260319160656.1480279-1-chuhu@redhat.com>
 <20260319194604.0a9a733f521caf2dc2bf18c8@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319194604.0a9a733f521caf2dc2bf18c8@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Thu, Mar 19, 2026 at 07:46:04PM -0700, Andrew Morton wrote:
> On Fri, 20 Mar 2026 00:06:51 +0800 Chunyu Hu <chuhu@redhat.com> wrote:
> 
> > There are several tests requires transprarent hugepages, when run on thp
> > disabled kernel such as realtime kernel, there will be false negative.
> > Mark those tests as skip when thp is not available.
> 
> A couple of questions from Sashiko:
> 	https://sashiko.dev/#/patchset/20260319160656.1480279-1-chuhu%40redhat.com
> 

AI question one:
```
> +void write_file(const char *path, const char *buf, size_t buflen)
> +{
> +	int fd;
> +	ssize_t numwritten;
> +
> +	fd = open(path, O_WRONLY);
> +	if (fd == -1)
> +		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
> +
> +	numwritten = write(fd, buf, buflen - 1);
Is it safe to keep the buflen - 1 behavior in a shared generic utility?
Since this is now a generic API in vm_util, callers passing the exact buffer
size (like sizeof(buf) or strlen(buf)) will suffer a 1-byte data truncation.
Additionally, if a caller passes buflen = 0, buflen - 1 will underflow,
causing write() to attempt writing an invalid size.
```

Here I think there's no single anwser. We can use buflen, but if user don't
provide a '\0' in the end of buffer, out of boundary access could happen
when such as printf(). We called it buflen, then we expect it's a '\0'
ended buffer as I undersand. So maye we can just leave as it is and user
should be awared of the requiremnt of the helper here.


AI question two:
```
> +	close(fd);
> +	if (numwritten < 1)
> +		ksft_exit_fail_msg("Write failed\n");

Does this drop useful debugging context compared to the previous version
in thp_settings.c?
The old implementation printed the buffer contents on failure. With this
generic message, if a test fails to write, it will only print "Write failed"
without indicating which file path failed, what data was being written, or
the underlying errno.
```

That makes sense, indeed we dropped the printing of the buffer content
compared with the version in the thp_settings.c. I can append a new
patch in v5 to improve this, together with other safety checks.


