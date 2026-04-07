Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE27A373BE9
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 02:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529929; cv=none; b=JABhbGPX4z2KThdPnZIsA81bLvgOYvZkPp9HnHJ3qiudeUxzt2vFGbq3u8uO4a5RVb2Lcxx+mTKqUW1UN5TRvKMBrmRbHwoFdrSsCIqwyxRjXUuQMvgkNnd+oBZbU5Oewioj7kWcdWKW26ryV/Z6//Fz6STJThovv4INpBRS9YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529929; c=relaxed/simple;
	bh=Ja+s+qesPzExVKKINDPzevrST5k6ihEc1TyUc3HpcdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngIBML82hSFA5LkYBXqF3nImb4WPFjH2Jxp68fIUN5+EBzzinToDMVBUb3vDbkFXmWrDrznWH9NVL8wcbrBCEHICjjybPbRsea1Vva5CXs4G/4P3abPiUyysNwVyDyywh6xvnPezUkXVYFEzz03Cn7HFPDwVYQnXfr5ROPTcivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WrpTsVHQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WrpTsVHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775529926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+fBSYxsCHm/g97qqEX2hKEUxcvlEWL8dj5yDnsF1Z0=;
	b=WrpTsVHQsSt3iNxB4jdPG5/QMGciLZU9abunAOE/XQW3oL/DMXq4CXSeMIZkqx+Ia0YLhP
	57va9JO9lCjeIh7isrKUWN7kr2GsdSY9FGV6047AxKf2calRQXcEnsInU+6ejy0nbclCQj
	bvJxq/q7+bjh7fFOW+cu4jGXZ11jgqc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-JmArAdLOOCahNa7o7-_fbw-1; Mon,
 06 Apr 2026 22:45:24 -0400
X-MC-Unique: JmArAdLOOCahNa7o7-_fbw-1
X-Mimecast-MFC-AGG-ID: JmArAdLOOCahNa7o7-_fbw_1775529923
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D1B7195608A;
	Tue,  7 Apr 2026 02:45:23 +0000 (UTC)
Received: from xudu-thinkpadx1carbongen9.nay.com (unknown [10.72.116.131])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4187F300019F;
	Tue,  7 Apr 2026 02:45:18 +0000 (UTC)
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
Subject: [RFC net-next 1/4] selftests: drv-net: tso: retry connect on EHOSTUNREACH
Date: Tue,  7 Apr 2026 10:45:08 +0800
Message-ID: <a030c72662673990263aeb62c7050cdf58e18af3.1775527362.git.xudu@redhat.com>
In-Reply-To: <cover.1775527362.git.xudu@redhat.com>
References: <cover.1775527362.git.xudu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The TSO test occasionally fails with "No route to host" (EHOSTUNREACH)
when connecting to the remote socat listener. This can happen when the
neighbor resolution has not yet completed by the time the test attempts
to connect, particularly in tunnel setups where neighbor entries may
take slightly longer to establish.

Add a retry loop (up to 5 attempts with 0.5s delay) around the
sock.connect() call to handle this transient condition gracefully.

Signed-off-by: Xu Du <xudu@redhat.com>
---
 tools/testing/selftests/drivers/net/hw/tso.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index bb675e3dac88..f792115adfb3 100755
--- a/tools/testing/selftests/drivers/net/hw/tso.py
+++ b/tools/testing/selftests/drivers/net/hw/tso.py
@@ -3,6 +3,7 @@
 
 """Run the tools/testing/selftests/net/csum testsuite."""
 
+import errno
 import fcntl
 import socket
 import struct
@@ -47,10 +48,20 @@ def run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso):
 
         if ipver == "4":
             sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-            sock.connect((remote_v4, port))
+            sockaddr = (remote_v4, port)
         else:
             sock = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
-            sock.connect((remote_v6, port))
+            sockaddr = (remote_v6, port)
+
+        for attempt in range(5):
+            try:
+                sock.connect(sockaddr)
+                break
+            except OSError as e:
+                if e.errno == errno.EHOSTUNREACH and attempt < 4:
+                    time.sleep(0.5)
+                else:
+                    raise
 
         # Small send to make sure the connection is working.
         sock.send("ping".encode())
-- 
2.53.0

