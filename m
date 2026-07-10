Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB29841B363
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 11:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682599; cv=none; b=mdMLhq3I3mFZqWWyX55ooM5mLTzDADbzqyqO5DHaRbLAFXjvGgpr0viXaPqxni2IjziFP49YJogwudThqpWc60qqM5dj5Bpm4RSSA7KVg3QiZVhJMgg5Z/KZa9bfdDyAxnu1bqdn1mn0WEWoI32VHhmNQI2NGf+TLVnB8mCY2j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682599; c=relaxed/simple;
	bh=xtmbTd65LaYxw1rrR+/UJneXgCI1qTcmdy2s9dQ+T8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lw2XDX4SphoHfUCVV8uQ3NYtv1tlg2aZW2taHRgGey9nTGsCX5wUfo0clewniMV+fgBm7efYModKFsaDroLVJ4s/WYLNVvW3pEiPEjqJbT6uCghwLgJnzR+t9gw3B1V14HjbZGVDgXnlLGFelOIVT3PD5C1M9X6Gp0Oe+pbJWi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bOKSHxSg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bOKSHxSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783682590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1An98c98xItbXRfuoFzbd/aWjFu9Ub2ZC7pWnp2Ub+A=;
	b=bOKSHxSg748asHgn3f2r7FZYenKu87cjo2iwYGmtdYH0Ja0yMvTD39Lkz0Ep9ByDxuZ/1L
	OmMHLVhSpSck9NBoE5ZwwG0qgxBskq/hE374IUrs9ZRo24b6f1tO9ifekcCXnYc7feCDyb
	n1dCTQgAttIGnhqOw0byJIZyb14+dE0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-371-x4Nxs5kuPwSsUIfI0dGxsA-1; Fri,
 10 Jul 2026 07:23:07 -0400
X-MC-Unique: x4Nxs5kuPwSsUIfI0dGxsA-1
X-Mimecast-MFC-AGG-ID: x4Nxs5kuPwSsUIfI0dGxsA_1783682586
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D3ADE1801376;
	Fri, 10 Jul 2026 11:23:05 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.49.56])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CFA0B1800348;
	Fri, 10 Jul 2026 11:23:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Bongsu Jeon <bongsu.jeon@samsung.com>,
	netdev@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: nci: Fix wrong size of status variables in nci_dev test
Date: Fri, 10 Jul 2026 13:23:00 +0200
Message-ID: <20260710112300.512433-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Thomas Huth <thuth@redhat.com>

pthread_join() stores the thread's return value (a "void *", i.e.
8 bytes on 64 bit computers) into the address of "status", but the
"status" variable is declared as "int" with only 4 bytes. The extra
four bytes clobber whatever is adjacent on the stack, which could
silently corrupt other local variables. Use "intptr_t" to declare
the "status" variables with the correct size.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tools/testing/selftests/nci/nci_dev.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 312f84ee0444f..4e7a5856f7ea3 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -6,6 +6,7 @@
  * Test code for nci
  */
 
+#include <stdint.h>
 #include <stdlib.h>
 #include <errno.h>
 #include <string.h>
@@ -404,7 +405,7 @@ FIXTURE_SETUP(NCI)
 	struct msgtemplate msg;
 	pthread_t thread_t;
 	__u32 event_group;
-	int status;
+	intptr_t status;
 	int rc;
 
 	self->open_state = false;
@@ -497,7 +498,7 @@ static void *virtual_deinit_v2(void *data)
 FIXTURE_TEARDOWN(NCI)
 {
 	pthread_t thread_t;
-	int status;
+	intptr_t status;
 	int rc;
 
 	if (self->open_state) {
@@ -585,7 +586,7 @@ int start_polling(int dev_idx, int proto, int virtual_fd, int sd, int fid, int p
 	void *nla_start_poll_data[2] = {&dev_idx, &proto};
 	int nla_start_poll_len[2] = {4, 4};
 	pthread_t thread_t;
-	int status;
+	intptr_t status;
 	int rc;
 
 	rc = pthread_create(&thread_t, NULL, virtual_poll_start,
@@ -605,7 +606,7 @@ int start_polling(int dev_idx, int proto, int virtual_fd, int sd, int fid, int p
 int stop_polling(int dev_idx, int virtual_fd, int sd, int fid, int pid)
 {
 	pthread_t thread_t;
-	int status;
+	intptr_t status;
 	int rc;
 
 	rc = pthread_create(&thread_t, NULL, virtual_poll_stop,
@@ -816,7 +817,7 @@ int disconnect_tag(int nfc_sock, int virtual_fd)
 {
 	pthread_t thread_t;
 	char buf[256];
-	int status;
+	intptr_t status;
 	int len;
 
 	send(nfc_sock, &nci_t4t_select_cmd3[3], sizeof(nci_t4t_select_cmd3) - 3, 0);
@@ -860,7 +861,7 @@ TEST_F(NCI, deinit)
 {
 	struct msgtemplate msg;
 	pthread_t thread_t;
-	int status;
+	intptr_t status;
 	int rc;
 
 	rc = get_nci_devid(self->sd, self->fid, self->pid, self->dev_idex,
-- 
2.55.0

