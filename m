Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EDC1B4F2C
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 03:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774235479; cv=none; b=l/ikfD+TeG4i0YJVB5yveW8sKWCsghlUi6/Z6Y30hNh8UICS3hQ/1DIZPFT92oAsLqyDfBWZ/ooOIxVDCDc0qFR8gjwkO0z6dmegYyqpV8QbuBkKSA1I6I5fiXVb46+NsierBmIUMrZwQZz9dZvot7+n22hcpdE6t9KAENVJC0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774235479; c=relaxed/simple;
	bh=D622889m55zAsyQJ6OrGTattYrPQ10YSchZVvaUdZhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQfyeByAmZjtOw7/XDfcqqEhJWm0MMNspJhpfOYy0cBAB/k8XeL5a5YkWUo9okfseGuQ4w6Upg2BCZEjbijoOfPw/anUZw49vFu/tmZw3cH15VLk7roUjHnryC8Rb8pch6Nn0LNOHtGLbjl8/YxYigvO9CiEvrSKug5jfSMNcaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nj/gU9Z9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nj/gU9Z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774235476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EisQwFemUONm3eFuD9fzaWUikQLN9S4IonXmw2NBtMs=;
	b=Nj/gU9Z9L07UD2bDAVnAh+tKEC/Y1Ony9+pUq0QVXmJrxsxoIjdYxsqfOsg71kWeiROhpt
	pCp6yI51PjFjMcAdwfOv5ATeziaNCefRfF10BKynTekUZUPsBgyQcAba/xqqpEWdd+eEYa
	kK/WtFPC5+W3k9YfEIA4ScWlYa8MQL8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-IGVfM-gtOxu5FC31Js5uWQ-1; Sun,
 22 Mar 2026 23:11:12 -0400
X-MC-Unique: IGVfM-gtOxu5FC31Js5uWQ-1
X-Mimecast-MFC-AGG-ID: IGVfM-gtOxu5FC31Js5uWQ_1774235470
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2423195604F;
	Mon, 23 Mar 2026 03:11:09 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.175])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54AD71955D71;
	Mon, 23 Mar 2026 03:10:58 +0000 (UTC)
Date: Mon, 23 Mar 2026 11:10:54 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, shuah@kernel.org, linux-mm@kvack.org,
	ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH v4 3/5] selftests/mm: move write_file helper to vm_util
Message-ID: <acCvPrjndaJoSnF-@gmail.com>
References: <20260319160656.1480279-1-chuhu@redhat.com>
 <20260319160656.1480279-4-chuhu@redhat.com>
 <78352e6f-fa40-41ee-b044-62f682f3ca43@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78352e6f-fa40-41ee-b044-62f682f3ca43@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Thu, Mar 19, 2026 at 10:48:38PM +0100, David Hildenbrand (Arm) wrote:
> 
> > +
> > +void write_file(const char *path, const char *buf, size_t buflen)
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
> I guess we could indeed test here easily for
> 
> 	if (numwritten != buflen - 1)

Looks like you are right. AI provided other questions on this helper,
maybe I can append a patch in the series to do such robust improvement.

> 
> But then, we don't really expect only partial writes to succeed here.
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David
> 

