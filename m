Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F94570F2
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322220; cv=none; b=ixnptWL23V1N1bgWLICEJUZgh1H8Zfbb9hp0VdbZpPiJAEzFEoIx1qhXbxODwLU0k/ModRtnuilrOyO3Pc1a6XUgUIzoH7YIQmKgTwdpTTezZWclHeVjg4y/76c+TXDBgzHpjuZauVDw0d4f6nBGFhBRj6wMqdj3AEL+Lgi/hsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322220; c=relaxed/simple;
	bh=FLL3E2g/w9WM4FPz4zD/XykR2Hyjz4/SnqppCPsg7vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2/LwGwbvOgvH2FcWICffjJI+NXk5a+IcVLHIwWO2nRbriaOVNF2nlkfGFvsPjLY7w6Rkm2VebY9mrT1A+FtQ+P4FCIvghgcLOEkmbjI7Wlnh7TKoSqznEPMntQGPhSaQhp4QUBGzPAtQx8CBvSDVIF++nX2xYdwGkJaS8FKKUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BlxbSqCI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BlxbSqCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785322209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=YgL738EKpx8fFg4ctcg9qDtf5cqZDGR6WxZoheSakTw=;
	b=BlxbSqCIP/SYlJDbNcn/97tNYTCZfqZWIfk5JPg9awUNeYrK75IsHuOKi6ZYWGLOU6xlPU
	7zyd0m2OPUxSg4C1bNOV5A+ogroJxCl2qCjCderZjwGECY+sy+TIuOki3cu6pmfXGpbNzF
	utjDsXIlhV63tPFH5qO2cPs3JOGMglc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-L1cYXrrAPeW3E3vXn7nhkA-1; Wed,
 29 Jul 2026 06:50:04 -0400
X-MC-Unique: L1cYXrrAPeW3E3vXn7nhkA-1
X-Mimecast-MFC-AGG-ID: L1cYXrrAPeW3E3vXn7nhkA_1785322202
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6BDB18002E2;
	Wed, 29 Jul 2026 10:50:02 +0000 (UTC)
Received: from fedora (unknown [10.44.33.21])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 97EE419560AB;
	Wed, 29 Jul 2026 10:49:59 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 29 Jul 2026 12:50:02 +0200 (CEST)
Date: Wed, 29 Jul 2026 12:49:57 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>, Nam Cao <namcao@linutronix.de>,
	Shuah Khan <shuah@kernel.org>, Wei Yang <richard.weiyang@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, Mateusz Guzik <mjguzik@gmail.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/epoll: add a regression test for pipe->poll_usage
Message-ID: <amna1QtCtqll1LFj@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

pipe->poll_usage was added to ensure that edge-triggered epoll consumers
get a wakeup on every write, even if the pipe was already non-empty.
However, none of the existing epoll_wakeup_test cases cover this; the
test suite passes even with WRITE_ONCE(pipe->poll_usage, true) removed.

Add a test that writes twice to a pipe and verifies that epoll_wait with
EPOLLET reports data each time. This covers the pipe-specific per-write
wakeup behavior that edge-triggered consumers depend on.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 .../filesystems/epoll/epoll_wakeup_test.c     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
index f6f1a7ff01b0..6ad7905ef95a 100644
--- a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
+++ b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
@@ -3538,4 +3538,28 @@ TEST(epoll65)
 	close(ctx.efd[1]);
 }
 
+TEST(epoll66)
+{
+	struct epoll_event event;
+	int pfd[2], efd, err;
+
+	pipe(pfd);
+
+	efd = epoll_create1(0);
+	ASSERT_GE(efd, 0);
+
+	event.events = EPOLLIN | EPOLLET;
+	err = epoll_ctl(efd, EPOLL_CTL_ADD, pfd[0], &event);
+	ASSERT_EQ(err, 0);
+
+	for (int i = 0; i < 2; ++i) {
+		write(pfd[1], "", 1);
+		EXPECT_EQ(epoll_wait(efd, &event, 1, 0), 1);
+	}
+
+	close(pfd[0]);
+	close(pfd[1]);
+	close(efd);
+}
+
 TEST_HARNESS_MAIN
-- 
2.52.0


