Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A17B46F49F
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323582; cv=none; b=UYUVgLadNBF8FejN0r0JLD9bMSacbnGthO1aemNovWXkPEey7YxBWaBZBN7Kbxljd63FU13K54Hg8aaVKqiijmkBsdMUOuwZVrwpeiNqcad5We0l8b6Fj2SwWgJejmmUFiid0T+2MMaPRLXKUfTkoAjgRJZSmIagNvUCtGS71iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323582; c=relaxed/simple;
	bh=1wU+uk5RgbeVNIF2OJ7Wn/q9EhZ7NLk+fdNjRqspoqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtU9Ca/GRH2JOz3FrkjOoUOtRWz9UJ0HjQ84JzQYGgGYoHVHL+DtnEicaRf9n1kh+NZu5hQO4nea1h68bjndoWYDZZcGz/lqvFCOK6soPfF7xtAqiswvsR5PJlmVgn18JH1hNzCMH+kh+/6Lym/tlYl3cCZwM0oGY85iFFy9XFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qb2Gy1dM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qb2Gy1dM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785323578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28Zkru9RabKvfwqnyIDm8zpT77pBDgmjELOb5fGVcaU=;
	b=Qb2Gy1dMaxkZIojrBeK5I7AnoQFM/FixkUWO8XvVbm94u0zBlXf2vOXk8oXR1/jLH1crBq
	CwPXL4saWfnl3sT1I5s0YUYet9elCJJUIFQvNPk7uDVzrBv3h5Un/OyxBc43ii6gU2ZFNp
	c4g4+uXq+NnHAk0Gdts5ih68qCJar8g=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-387-hKbZ4t5uMkW4QIj-2iRHug-1; Wed,
 29 Jul 2026 07:12:56 -0400
X-MC-Unique: hKbZ4t5uMkW4QIj-2iRHug-1
X-Mimecast-MFC-AGG-ID: hKbZ4t5uMkW4QIj-2iRHug_1785323575
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 590A61800348;
	Wed, 29 Jul 2026 11:12:55 +0000 (UTC)
Received: from fedora (unknown [10.44.33.21])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 78AC0300019F;
	Wed, 29 Jul 2026 11:12:52 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 29 Jul 2026 13:12:54 +0200 (CEST)
Date: Wed, 29 Jul 2026 13:12:50 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>, Nam Cao <namcao@linutronix.de>,
	Shuah Khan <shuah@kernel.org>, Wei Yang <richard.weiyang@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, Mateusz Guzik <mjguzik@gmail.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/epoll: add a regression test for
 pipe->poll_usage
Message-ID: <amngMt6ZdrehMNgu@redhat.com>
References: <amna1QtCtqll1LFj@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amna1QtCtqll1LFj@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Sashiko suggests to check the results of pipe() and write() as well:

	https://sashiko.dev/#/patchset/amna1QtCtqll1LFj%40redhat.com

Not sure this makes sense, but I'll send V2 just in case.

Oleg.

On 07/29, Oleg Nesterov wrote:
>
> pipe->poll_usage was added to ensure that edge-triggered epoll consumers
> get a wakeup on every write, even if the pipe was already non-empty.
> However, none of the existing epoll_wakeup_test cases cover this; the
> test suite passes even with WRITE_ONCE(pipe->poll_usage, true) removed.
> 
> Add a test that writes twice to a pipe and verifies that epoll_wait with
> EPOLLET reports data each time. This covers the pipe-specific per-write
> wakeup behavior that edge-triggered consumers depend on.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  .../filesystems/epoll/epoll_wakeup_test.c     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
> index f6f1a7ff01b0..6ad7905ef95a 100644
> --- a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
> +++ b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
> @@ -3538,4 +3538,28 @@ TEST(epoll65)
>  	close(ctx.efd[1]);
>  }
>  
> +TEST(epoll66)
> +{
> +	struct epoll_event event;
> +	int pfd[2], efd, err;
> +
> +	pipe(pfd);
> +
> +	efd = epoll_create1(0);
> +	ASSERT_GE(efd, 0);
> +
> +	event.events = EPOLLIN | EPOLLET;
> +	err = epoll_ctl(efd, EPOLL_CTL_ADD, pfd[0], &event);
> +	ASSERT_EQ(err, 0);
> +
> +	for (int i = 0; i < 2; ++i) {
> +		write(pfd[1], "", 1);
> +		EXPECT_EQ(epoll_wait(efd, &event, 1, 0), 1);
> +	}
> +
> +	close(pfd[0]);
> +	close(pfd[1]);
> +	close(efd);
> +}
> +
>  TEST_HARNESS_MAIN
> -- 
> 2.52.0
> 

