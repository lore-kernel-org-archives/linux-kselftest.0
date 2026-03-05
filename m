Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30425374183
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700412; cv=none; b=h63QEaEwEqm4/cS98UqoezfiOtsJUCGlXiZoD6DJ2FkwYLKyTM30imFeYBBFiALst4OZ66vIH4ScOdazf8gcbdFmVfPFHpimvirjeEd1l3EtW/XJKoVDrhLb2Z9+si3xLWFP+YLw3yKgVbsKNsVt/1X87zuej7iy5tHc/iaRKEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700412; c=relaxed/simple;
	bh=mdoprt5pfQiawnNQf+PVIE40bn4zUw1G1O5KgSH6WgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTJgCW+roxlVCxW6hDcxJtmV7Pdv5rCdRKNzuuSWPO1JB6uhuG8kf7eZvTWUFfL9b8F1tTVBVcJ7gqbWZa/o5z7/jAItmagGKcpz4LGZCYQ/5tKoHuuSD3NqnwUi/m4wIEXkKXaWyN2oy3iblJoT24Uu+ncJdfQOMriHbV2J9Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cQW4Ctv/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cQW4Ctv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772700408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcDhn5Pj+q46p8oVnRAtNQqN8KEvJ5Nk8v4t22oVPvw=;
	b=cQW4Ctv/xLXQLhn4v3Uz6RTRwyaOK2deECL6m/3fdIe6s09kwwQ9hw4Y92ktiUpAhRHZJf
	TOAa05UIj10xDhtww410+2wEqkWwW1KyGE2lMf5jCMS6takMaCVn/hpydnzk9wZfKp5XVx
	KdOB+eIYpTkyDvQ2QBhpRX9r/0+0T2o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-xdt8xs7lOW24P8dr1tLnAA-1; Thu,
 05 Mar 2026 03:46:43 -0500
X-MC-Unique: xdt8xs7lOW24P8dr1tLnAA-1
X-Mimecast-MFC-AGG-ID: xdt8xs7lOW24P8dr1tLnAA_1772700401
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 735AD19560A5;
	Thu,  5 Mar 2026 08:46:41 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.173])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0FE8E180049D;
	Thu,  5 Mar 2026 08:46:37 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: sun.jian.kdev@gmail.com
Cc: kuba@kernel.org,
	shuah@kernel.org,
	horms@kernel.org,
	netdev@vger.kernel.org,
	kees@kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	linux-kernel@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com
Subject: Re: [v3,v3,1/2] selftests/harness: order TEST_F and XFAIL_ADD constructors
Date: Thu,  5 Mar 2026 09:46:24 +0100
Message-ID: <20260305084624.242751-1-pabeni@redhat.com>
In-Reply-To: <20260225111451.347923-1-sun.jian.kdev@gmail.com>
References: <20260225111451.347923-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
selftests/harness: order TEST_F and XFAIL_ADD constructors

This commit fixes a constructor ordering race where XFAIL_ADD() could run
before TEST_F() and read a NULL _##fixture_##test##_object pointer. The
fix uses constructor priorities to ensure TEST_F runs first.

> TEST_F() allocates and registers its struct __test_metadata via mmap()
> inside its constructor, and only then assigns the
> _##fixture_##test##_object pointer.
>
> XFAIL_ADD() runs in a constructor too and reads
> _##fixture_##test##_object to initialize xfail->test. If XFAIL_ADD runs
> first, xfail->test can be NULL and the expected failure will be reported
> as FAIL.
>
> Use constructor priorities to ensure TEST_F registration runs before
> XFAIL_ADD, without adding extra state or runtime lookups.
>
> Fixes: 2709473c9386 ("selftests: kselftest_harness: support using xfail")

Should the Fixes: tag point to commit 24cf65a62266 instead?

The existing tag points to 2709473c9386 ("selftests: kselftest_harness:
support using xfail"), but that commit used static initialization
(.test = &object) which had no race condition.

The race was actually introduced by commit 24cf65a62266
("selftests/harness: Share _metadata between forked processes"), which
changed TEST_F to use constructor-based allocation and also changed
XFAIL_ADD to read the pointer value in its constructor. This created the
race where XFAIL_ADD could run before TEST_F and read NULL.

> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index 16a119a4656c..4afaef01c22e 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -76,6 +76,9 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
>  		memset(s, c, n);
>  }
>
> +#define KSELFTEST_PRIO_TEST_F  20000
> +#define KSELFTEST_PRIO_XFAIL   20001
> +
>  #define TEST_TIMEOUT_DEFAULT 30
>
>  /* Utilities exposed to the test definitions */
> @@ -465,7 +468,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
>  			fixture_name##_teardown(_metadata, self, variant); \
>  	} \
>  	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
> -	static void __attribute__((constructor)) \
> +	static void __attribute__((constructor(KSELFTEST_PRIO_TEST_F))) \
>  			_register_##fixture_name##_##test_name(void) \
>  	{ \
>  		struct __test_metadata *object = mmap(NULL, sizeof(*object), \
> @@ -880,7 +883,7 @@ struct __test_xfail {
>  		.fixture = &_##fixture_name##_fixture_object, \
>  		.variant = &_##fixture_name##_##variant_name##_object, \
>  	}; \
> -	static void __attribute__((constructor)) \
> +	static void __attribute__((constructor(KSELFTEST_PRIO_XFAIL))) \
>  		_register_##fixture_name##_##variant_name##_##test_name##_xfail(void) \
>  	{ \
>  		_##fixture_name##_##variant_name##_##test_name##_xfail.test = \

