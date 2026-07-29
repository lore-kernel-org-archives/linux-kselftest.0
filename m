Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB90381E95
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785324837; cv=none; b=HD2JhhvYN14/1+WtokIEVqjhkNBkjrnOEbJC658DwbET5lBzOqL3+Lo0DwgmXZ2LH7AUYiRH+GDNsRsbGcejgN4Wjprg8Akf8GYx9UsoEp18asorW31y55fKdMd3WzSVRzalyXHe1Nm6q+hA+DH+IY94nPakstd2VBT9GKpzYC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785324837; c=relaxed/simple;
	bh=NbAwnUdCuYwD7a3ygueu2+GMvWM/Ii2vr4VsLNVHfBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OIdMY8IpfLZwgbs1d7QBXDLuzgAd4tdmjkN0k2FtuCe0zzJxMrXna0t4cnGN0UJScJ25B4EXirj536Hr/LTHzIbVzqMTCvsoD2xmWmUIKRvJF8WhSvogSxFfVkjdohd1wK+6kNO4+yx1UTSpUdXscPzkbxgq2ceiGFPCX3iVLXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SLyqxMRs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SLyqxMRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785324835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8Pc/MvwmOme+dJKVAmWlyZtQIWAhQjn5KhDEVV84CyI=;
	b=SLyqxMRsUxQYNeED1VrmiEMlRgsd4e60RhQUMKk1dTf1gfRZrbEGb/lPC2Pa/W13u4LqXE
	UDsKMzr98UPsPyAN4uJFK+O3oYhziByI3Un8qrgzzb9oVTEM4JyLLYjSKwyj9BWixsH00/
	PZCB/TcwAcyLyKgTCBsihSw2+9MiUNs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-132-Hk6JSt_nNY-M5cFrvmNCQg-1; Wed,
 29 Jul 2026 07:33:50 -0400
X-MC-Unique: Hk6JSt_nNY-M5cFrvmNCQg-1
X-Mimecast-MFC-AGG-ID: Hk6JSt_nNY-M5cFrvmNCQg_1785324829
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 26E2419560A2;
	Wed, 29 Jul 2026 11:33:49 +0000 (UTC)
Received: from fedora (unknown [10.44.33.21])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 02AF0414;
	Wed, 29 Jul 2026 11:33:46 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 29 Jul 2026 13:33:48 +0200 (CEST)
Date: Wed, 29 Jul 2026 13:33:45 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>, Nam Cao <namcao@linutronix.de>,
	Shuah Khan <shuah@kernel.org>, Wei Yang <richard.weiyang@gmail.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/epoll: add a regression test for
 pipe->poll_usage
Message-ID: <amnlGZesXu-SUK2H@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

pipe->poll_usage was added to ensure that edge-triggered epoll consumers
get a wakeup on every write, even if the pipe was already non-empty.
However, none of the existing epoll_wakeup_test cases cover this; the
test suite passes even with WRITE_ONCE(pipe->poll_usage, true) removed.

Add a test that writes twice to a pipe and verifies that epoll_wait with
EPOLLET reports data each time. This covers the pipe-specific per-write
wakeup behavior that edge-triggered consumers depend on.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 .../filesystems/epoll/epoll_wakeup_test.c     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
index f6f1a7ff01b0..81a994943e12 100644
--- a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
+++ b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
@@ -3538,4 +3538,27 @@ TEST(epoll65)
 	close(ctx.efd[1]);
 }
 
+TEST(epoll66)
+{
+	struct epoll_event event;
+	int pfd[2], efd;
+
+	ASSERT_EQ(pipe(pfd), 0);
+
+	efd = epoll_create1(0);
+	ASSERT_GE(efd, 0);
+
+	event.events = EPOLLIN | EPOLLET;
+	ASSERT_EQ(epoll_ctl(efd, EPOLL_CTL_ADD, pfd[0], &event), 0);
+
+	for (int i = 0; i < 2; ++i) {
+		ASSERT_EQ(write(pfd[1], "", 1), 1);
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


