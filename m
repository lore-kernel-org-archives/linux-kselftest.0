Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F9333509B
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 12:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980073; cv=none; b=AcL358xKksHK7Vk66Fl2/Ur9CqmNwPYPIuegg596y2OTICCUAqkoCOKAX71kre/Qhdk9fBU3ARXXcpgkIMhXqEDqBICgCNrH41l7sqvb/GpHxxWLCLp21qjMR47tCWfPjIr96rHorpA4f3MqMn6+dxgvN/9apjLOm5cxOn/pnoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980073; c=relaxed/simple;
	bh=bLUwe8uO9act5Ud1uMkHcK9bXkigBbI3FE1FZ8XAFwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ES+fTgsNYXc2ZlPo+2fxpgl5elkJQkXEAmjxbz9sPaAXfHS5ky2GKiVyCj9diKmr77CREstBEyQOjcOct8XteAOSyy5+cf1NbSLy2XnmqQAsZKtA26wXXXZ8OG6nwIAoQxAZsfHpCIo1k6QYSGEr67O6mgoFEPpzoCCHGsATAaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cyRyiGx+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cyRyiGx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791980070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2haka38DvFDMahhGFpE6R1Z6HzZa2FdPuOLWcLfUN2Q=;
	b=cyRyiGx+plMaEeSAREyKY9GCPaEWtkZXAuJhkTcahnmZAxdSTm0etIWZWco0obw7E9DIG9
	D2XwThP91KB0gbxePVdZ2rk+rwNEZFTg66DujzDgbc+donv519YZmFBWaxRgS4m8qiPu1K
	p4u3dOMRyEIkT+oSo9cumA4w5Qgutys=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-329-WIQq21bSNyOIcprNbnY3XQ-1; Wed,
 14 Oct 2026 12:14:20 +0000
X-MC-Unique: WIQq21bSNyOIcprNbnY3XQ-1
X-Mimecast-MFC-AGG-ID: WIQq21bSNyOIcprNbnY3XQ_1791980059
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 259441800678;
	Wed, 14 Oct 2026 12:14:19 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8517230000E7;
	Wed, 14 Oct 2026 12:14:16 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Shuah Khan <shuah@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] selftests: tc-testing: use $IP in hfsc test 8c39 setup
Date: Wed, 14 Oct 2026 14:14:12 +0200
Message-ID: <20261014121414.2373985-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Test 8c39 brings up lo with a bare "ip" command. nsPlugin runs it as
"$IP netns exec <ns> ip ...", and as tdc runs commands with an empty
environment, "ip netns exec" searches only the default execvp() path
(/bin:/usr/bin). On systems that install ip only in /sbin, like Fedora,
the setup fails:

  # ./tdc.py -e 8c39
  Test 8c39: HFSC classify walk still reaches leaf after lateral drift
  -----> prepare stage *** Could not execute: "ip link set lo up"
  -----> prepare stage *** Error message: "exec of "ip" failed: No such file or directory

Use $IP like all other tdc tests do.

Fixes: 1e24c4f2ee44 ("selftests: tc-testing: add a lateral-drift hfsc classify-walk test")
Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 tools/testing/selftests/tc-testing/tc-tests/qdiscs/hfsc.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/hfsc.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/hfsc.json
index 4f6bbb8b57f9..557730eef055 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/hfsc.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/hfsc.json
@@ -181,7 +181,7 @@
             "requires": "nsPlugin"
         },
         "setup": [
-            "ip link set lo up",
+            "$IP link set lo up",
             "$TC qdisc add dev lo handle 1: root hfsc default 30",
             "$TC class add dev lo parent 1: classid 1:1 hfsc rt m2 100kbit",
             "$TC class add dev lo parent 1:1 classid 1:10 hfsc rt m2 50kbit",
-- 
2.56.0

