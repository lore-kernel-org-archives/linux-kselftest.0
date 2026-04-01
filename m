Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB043DA2D
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051222; cv=none; b=TJOGsdieW2Y7Bqji7Sm1Mgq9Sj6P2Vsz0grs0LJonA1kqOgo1GLuXcsqI/LvHzrxdsJpNOv6Hyp6EiyOX/LqLpwM1nkZQrfznVdaKqFkWL1IKN9W4QrF9uVSmA51UEkP2AwNO04s1qI9co+yNIRyDu1T14CzcY55RucqvxQPlvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051222; c=relaxed/simple;
	bh=nQI3N22OMr68ckFnN/PfIySqki1Qim7wH2R9n5AQPnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpvyIlU4BIiIcSbYkUqj8BOASBfuAhWBE+Hj35HvHPIOv2oePckt5T8ZfthnBpsycG7WibxGUbkg+5sLWLKqiXUUM/fUMchtujGqx6GHsmIcV5Ks8rJXiloNfh9icMtzd69Cp9WL++/2N0SqPnq9NWwFLAqXRfLysEHSOoRBo6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X7vL58Mp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X7vL58Mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775051219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EB1KQ617Kr5VhuoNKPvDM4wGdT34Y57wo3PzW9IfKw=;
	b=X7vL58MpIn1vmT93vOYoa2pSAiKxRmVuNgwabUr04EurvHrxoebBBdnlULavMY7trnq0nk
	ZE8aAm+zN5UUtmHllv/en6wetyP9o9UdGlEXvtzl2xqFTpNnA+wjtmg2cRV5tMYU0rpJIS
	yMh7rogbUXdJkxuW5SCl36N4Cv1zP/k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-H8Yb78HpM766BeEiqGoEjw-1; Wed,
 01 Apr 2026 09:46:54 -0400
X-MC-Unique: H8Yb78HpM766BeEiqGoEjw-1
X-Mimecast-MFC-AGG-ID: H8Yb78HpM766BeEiqGoEjw_1775051211
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C64DF19560A2;
	Wed,  1 Apr 2026 13:46:50 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.80])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B9421800767;
	Wed,  1 Apr 2026 13:46:39 +0000 (UTC)
Date: Wed, 1 Apr 2026 21:46:32 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Mark Brown <broonie@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH v7 4/7] selftests: ksft_exit_fail_perror: support printf
 style arguments
Message-ID: <ac0huDc_GH2uSgsZ@gmail.com>
References: <20260330151503.670415-1-chuhu@redhat.com>
 <20260330151503.670415-5-chuhu@redhat.com>
 <efbad6c5-8d5e-4774-8d0a-d455e6e2c182@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efbad6c5-8d5e-4774-8d0a-d455e6e2c182@sirena.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Wed, Apr 01, 2026 at 12:03:09PM +0100, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 11:15:00PM +0800, Chunyu Hu wrote:
> 
> > The ksft_exit_fail_perror function previously only accepted a single string
> > argument, which limited its flexibility for providing specific context to
> > failure messages.
> 
> > This change updates ksft_exit_fail_perror to support variable arguments,
> > similar to ksft_exit_fail_msg.  Adding the __printf(1, 2) attribute enables
> > compile-time checking for format string correctness.
> 
> This is causing build regressions on the arm64 selftests:
> 
> /arm64/fp/za-fork-asm.o -o /build/stage/build-work/kselftest/arm64/fp/za-fork
> In file included from za-fork.c:12:
> ../../kselftest.h: In function ‘ksft_exit_fail_perror’:
> ../../kselftest.h:427:13: error: implicit declaration of function ‘vasprintf’; d
> id you mean ‘vsprintf’? [-Wimplicit-function-declaration]
>   427 |         if (vasprintf(&buf, msg, args) == -1) {
>       |             ^~~~~~~~~
>       |             vsprintf
> 
> This is because za-fork uses nolibc which does not implement
> vasprintf().
> 
> I need to look at why this managed to pass the build testing I do in
> -next...

I can reproduce this issue with nolibc compile. Thanks for the
debugging. It's great if we have that definition in nolibc lib.

For thsi series, because according to man page, vasprintf()
requires _GNU_SOURCE, and implemeted it in kselftest.h will
add the burden to all c files, or fore a _GNU_SOURCE to
all c files included, I tend to go back to ksft_exit_fail_msg.
;)

