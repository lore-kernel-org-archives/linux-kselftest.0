Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE753093D3
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 01:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775092450; cv=none; b=Dp65RLslHK/ArdgP5RfI5w6yjUBnII5KMYrKiPS1RTlK9IqgZICq8sNxxrVp+kobIO3QQKw31hZgDdpeM3Wn5639qPiWJ6q87qJ0orkOv3tMxn6WeuAADG0J0T0hoyvriUsLd/Ubn9z/blN43cPN7zGbQEUUpQDhpeX6RTeLKaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775092450; c=relaxed/simple;
	bh=foDVFVbcuWW1ekLdnpJH9JMK+N8WAAFswyL/EY42dbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4ks4d8CaEWilRujh9B8r/u/xS6ovQ+WKS8sNfs/mVmg8yskRfDNs0Z0x+OkuXrv33obA/kYkw0ZRtq9iXBt1Yb4XoYNmtjdOuGboIQ84TB5Lfe7W86T5eKIXwao2dfCRjlt+ogpXhEE6hiXzpqVwkICflUHbUjSkwW0N+ZM5Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HhRuXTsu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HhRuXTsu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775092448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b1BrIuh4JRk9mChsYnd7IZf+UTRPtmSlQTkGsjvBknE=;
	b=HhRuXTsuxMakh+NIWy/QJ0Hv9TgMNJkmvBvNPElOTwP9oKvu81ZU4IvxbJaxP2SojGsmZF
	Wl74SuDcI4PEaCbcGaQ+6PS/isqX2/Dx8fx07ns+No6tzz6zMGOcUS9h2EUphBD7WErZW6
	kCkiJweSN0eRhQx14VEW/IvRyQqcLJM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-RM-cyG3sMXiA47fcz3YQsQ-1; Wed,
 01 Apr 2026 21:14:04 -0400
X-MC-Unique: RM-cyG3sMXiA47fcz3YQsQ-1
X-Mimecast-MFC-AGG-ID: RM-cyG3sMXiA47fcz3YQsQ_1775092443
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1AC181800464;
	Thu,  2 Apr 2026 01:14:03 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.80])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E57B319560AB;
	Thu,  2 Apr 2026 01:13:59 +0000 (UTC)
Date: Thu, 2 Apr 2026 09:13:54 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, akpm@linux-foundation.org
Subject: Re: [PATCH v7 4/7] selftests: ksft_exit_fail_perror: support printf
 style arguments
Message-ID: <ac3C0iozW_xgS40r@gmail.com>
References: <20260330151503.670415-1-chuhu@redhat.com>
 <20260330151503.670415-5-chuhu@redhat.com>
 <efbad6c5-8d5e-4774-8d0a-d455e6e2c182@sirena.org.uk>
 <ac0huDc_GH2uSgsZ@gmail.com>
 <20260401143831.31f40405758f78d7955ff6db@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401143831.31f40405758f78d7955ff6db@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Wed, Apr 01, 2026 at 02:38:31PM -0700, Andrew Morton wrote:
> On Wed, 1 Apr 2026 21:46:32 +0800 Chunyu Hu <chuhu@redhat.com> wrote:
> 
> > > I need to look at why this managed to pass the build testing I do in
> > > -next...
> > 
> > I can reproduce this issue with nolibc compile. Thanks for the
> > debugging. It's great if we have that definition in nolibc lib.
> > 
> > For thsi series, because according to man page, vasprintf()
> > requires _GNU_SOURCE, and implemeted it in kselftest.h will
> > add the burden to all c files, or fore a _GNU_SOURCE to
> > all c files included, I tend to go back to ksft_exit_fail_msg.
> > ;)
> 
> Thanks.
> 
> Can we please get this sorted out fairly soon?  It's not good
> to be breaking -next for others.

Sure. Will post v8 soon. Added back two mail lists.

> 
> I would prefer to retain the series - all those false negatives
> on no-THP kernels are undesirable!
> 

Thanks! 

