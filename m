Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D494301493
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175212; cv=none; b=ufNxya6OAKJjM8AJ/qVjVocSww1mOHAtz4q58GUOB6vs+yZW+uAElokucmI7buT8zwEETxAJTgEk7yZng+4R2RCZUFJFZSRnGKNHmQa5tZp/wtBlrUZxpWe8Kh+IKRdDy7TQxRCRjaIYNIK3gMoAHqVGfpPB0BipWEGSXq+FiXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175212; c=relaxed/simple;
	bh=Fgy1tFmfF35ftBDNMgSCd40rnxMyiRynTGtXv1c/WXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDbLwLr0vmy+kWoYgl/Iwb539IxAbkb3/MHuhqexMO1sKk/YjB6BM0bAEND0Zq33EpN8ncKx+f34Q3kCL2yhndFuv6A3DZ/iEb0Gmi8TUktKSuCRjWlDekpQH+WsONFh1ir1QnfN1/ZLjdUQSDvd3Pov89BO1ssD6wy0XmWye9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WMq11IiY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WMq11IiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769175210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lLhcYYedh3hfzldrcwUUr9xBpyL/rwKLSqNMQ5untPs=;
	b=WMq11IiY8JcYzyBCYw6z2i3z3T+zAJx6+dvyudzkpMOLrW8mD656VfWbAqR0IJfBdiU2AL
	N9ZU9O7YPtAUsAnk306HS05p+SYIztRrGNBn8T/T4cbKIY2jQqlldLinD6nkFs/3b/iOlb
	H41BXyp1AlACNdqFsDEIY6XAaCQxu4I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-RLxqBvJhPreQLwumG7M_sg-1; Fri,
 23 Jan 2026 08:33:27 -0500
X-MC-Unique: RLxqBvJhPreQLwumG7M_sg-1
X-Mimecast-MFC-AGG-ID: RLxqBvJhPreQLwumG7M_sg_1769175206
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 650FC1944B1C;
	Fri, 23 Jan 2026 13:33:26 +0000 (UTC)
Received: from fedora (unknown [10.72.116.62])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 055881800665;
	Fri, 23 Jan 2026 13:33:19 +0000 (UTC)
Date: Fri, 23 Jan 2026 21:33:12 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Alexander Atanasov <alex@zazolabs.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: ublk: use tmpdir for scratch files and
 improve relative paths use
Message-ID: <aXN4mFuoXhtJDKyF@fedora>
References: <20260123112039.1370223-1-alex@zazolabs.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123112039.1370223-1-alex@zazolabs.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Fri, Jan 23, 2026 at 11:20:36AM +0000, Alexander Atanasov wrote:
> Create a temp dir for temporary files and use it instead of
> placing them inside source tree.

Many temporary files are backing files of file storage target, so far
the code requires O_DIRECT, or the size could be a bit big.

In case of ramfs/tmpfs of temp dir, it may cause problem for tests.


Thanks, 
Ming

