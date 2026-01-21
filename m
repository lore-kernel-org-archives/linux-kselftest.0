Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E70B47DF91
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989923; cv=none; b=Dv877hlZeTCZ26n7CP//QsbqIkMFI/xcGWrFKqoSyMVy72BijHWCXXuOlFTpsQBFt4aWo33Fnw98nBWoUYKmygInHet01+Ti4lFmsRQdQTT0CSzzUfpcYGxWlzhSqiT3KGQFTqrMJJRvbrxsO7ZIpEB1kSgC1N7vuyvAxLcYZd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989923; c=relaxed/simple;
	bh=YY6/FFJgXQlWIP3mmKIu2E3rPVaPJTpIrkq2QmEkBiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxVL/KoNU2N/bcIzef6pgN+hu4BQY7Lyzybt8fhEh/H5sF7CtBhX/si83/2w5nbfwGX/Z9JmjZbWxC0eFcyGjADFR8oZyWCs5rbFfSYcbhDsEaUCnyHMlCTKr4SNX5lVVKgXlJiA+wRN8Bwn+2kgUCVhCo7quEz0GrBeh1B/5GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RBlmNR0P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RBlmNR0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768989921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FzlJULBMmfD4Hv6GllYYNMLMcWJTIUobxNIOQX6Bvi8=;
	b=RBlmNR0P6zYChJglPm/H0ZoOaX3UcH5fi/B4QVFzpglUfUfMXizR7bZQy+0H+9Psr8jG2A
	CE8xE0BI81AbMv/9BS3r16AXyC/QLlrbnJlAK1/SousmSapOhCpSDTaP2SMr3hgj6SpI6C
	utlVZ5Cd5cZF4PurmVO1WXE4Phwl+Jc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-a9yPrVQMMNKbpLur4Y7EXQ-1; Wed,
 21 Jan 2026 05:05:17 -0500
X-MC-Unique: a9yPrVQMMNKbpLur4Y7EXQ-1
X-Mimecast-MFC-AGG-ID: a9yPrVQMMNKbpLur4Y7EXQ_1768989916
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC4F11954231;
	Wed, 21 Jan 2026 10:05:15 +0000 (UTC)
Received: from xudu-thinkpadx1carbongen9.nay.csb (unknown [10.72.116.124])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0126918004D8;
	Wed, 21 Jan 2026 10:05:10 +0000 (UTC)
From: Xu Du <xudu@redhat.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6 1/7] selftest: tun: Format tun.c existing code
Date: Wed, 21 Jan 2026 18:04:55 +0800
Message-ID: <d797de1e5a3d215dd78cb46775772ef682bab60e.1768979440.git.xudu@redhat.com>
In-Reply-To: <cover.1768979440.git.xudu@redhat.com>
References: <cover.1768979440.git.xudu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

In preparation for adding new tests for GSO over UDP tunnels,
apply consistently the kernel style to the existing code.

Signed-off-by: Xu Du <xudu@redhat.com>
---
 tools/testing/selftests/net/tun.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index 0efc67b0357a..128b0a5327d4 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -25,7 +25,7 @@ static int tun_attach(int fd, char *dev)
 	strcpy(ifr.ifr_name, dev);
 	ifr.ifr_flags = IFF_ATTACH_QUEUE;
 
-	return ioctl(fd, TUNSETQUEUE, (void *) &ifr);
+	return ioctl(fd, TUNSETQUEUE, (void *)&ifr);
 }
 
 static int tun_detach(int fd, char *dev)
@@ -36,7 +36,7 @@ static int tun_detach(int fd, char *dev)
 	strcpy(ifr.ifr_name, dev);
 	ifr.ifr_flags = IFF_DETACH_QUEUE;
 
-	return ioctl(fd, TUNSETQUEUE, (void *) &ifr);
+	return ioctl(fd, TUNSETQUEUE, (void *)&ifr);
 }
 
 static int tun_alloc(char *dev)
@@ -54,7 +54,7 @@ static int tun_alloc(char *dev)
 	strcpy(ifr.ifr_name, dev);
 	ifr.ifr_flags = IFF_TAP | IFF_NAPI | IFF_MULTI_QUEUE;
 
-	err = ioctl(fd, TUNSETIFF, (void *) &ifr);
+	err = ioctl(fd, TUNSETIFF, (void *)&ifr);
 	if (err < 0) {
 		fprintf(stderr, "can't TUNSETIFF: %s\n", strerror(errno));
 		close(fd);
@@ -67,9 +67,9 @@ static int tun_alloc(char *dev)
 static int tun_delete(char *dev)
 {
 	struct {
-		struct nlmsghdr  nh;
+		struct nlmsghdr nh;
 		struct ifinfomsg ifm;
-		unsigned char    data[64];
+		unsigned char data[64];
 	} req;
 	struct rtattr *rta;
 	int ret, rtnl;
@@ -127,31 +127,36 @@ FIXTURE_TEARDOWN(tun)
 		close(self->fd2);
 }
 
-TEST_F(tun, delete_detach_close) {
+TEST_F(tun, delete_detach_close)
+{
 	EXPECT_EQ(tun_delete(self->ifname), 0);
 	EXPECT_EQ(tun_detach(self->fd, self->ifname), -1);
 	EXPECT_EQ(errno, 22);
 }
 
-TEST_F(tun, detach_delete_close) {
+TEST_F(tun, detach_delete_close)
+{
 	EXPECT_EQ(tun_detach(self->fd, self->ifname), 0);
 	EXPECT_EQ(tun_delete(self->ifname), 0);
 }
 
-TEST_F(tun, detach_close_delete) {
+TEST_F(tun, detach_close_delete)
+{
 	EXPECT_EQ(tun_detach(self->fd, self->ifname), 0);
 	close(self->fd);
 	self->fd = -1;
 	EXPECT_EQ(tun_delete(self->ifname), 0);
 }
 
-TEST_F(tun, reattach_delete_close) {
+TEST_F(tun, reattach_delete_close)
+{
 	EXPECT_EQ(tun_detach(self->fd, self->ifname), 0);
 	EXPECT_EQ(tun_attach(self->fd, self->ifname), 0);
 	EXPECT_EQ(tun_delete(self->ifname), 0);
 }
 
-TEST_F(tun, reattach_close_delete) {
+TEST_F(tun, reattach_close_delete)
+{
 	EXPECT_EQ(tun_detach(self->fd, self->ifname), 0);
 	EXPECT_EQ(tun_attach(self->fd, self->ifname), 0);
 	close(self->fd);
-- 
2.52.0

