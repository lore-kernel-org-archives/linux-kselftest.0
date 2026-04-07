Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD032372EDE
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 02:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529943; cv=none; b=XwBNTEuJfyImRMYvqSOfNKZe+WlLfbxrfxLzTIRhNHelSeIIq88jZ7wvdhZacHdsmOckJXfEJkUqTBzgzOaRVuNRXaCsonft+dY88vxppXF4tKS571AZN3fr/Ihbzrayw2HUEfMx4SkZgm1nbkD0IaTJnQLtpf7r1y18pVUTiT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529943; c=relaxed/simple;
	bh=NA8XcEs7Rx23RPVBK4DgyYLEyZpuUgGoQ451Bpm7vcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzGqVBibgdCxk8a9M1Z8fO6KWPXe1r4aQtyyfHoy58kD/ygOeIBxR4/X2ANxAz2LB/dymker09whrzOgmIfTQVLGV08GBKgUeX7k6QMPLgg3MEb9U2VqVo3CSyro1QCCYNViZnu2WDWbNqUdhB4ll3rquprkh5FzY+qHZ4xqo70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c/X9XglN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c/X9XglN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775529941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBjjPwiqEnQlQJWcx1TjKWKQU5N6GjqGMfXPuwlgZhw=;
	b=c/X9XglNimfMCT/hOihVoPP/FGXW1kzysA+V2Tvj6uU40QKsJjJOO9cVMzUduql5b1Yaye
	4tLNe2pgEm5J60kvgykcJtFjT2opANYF0VsSLCk5N3Xo+SzaizYbwlOcSejc7JKfXvZE7M
	bTcxIW/7KhWWPc3kQ8JQ99qIJTVU0qs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-0e-91N8UPG2jQWWPUBiQkg-1; Mon,
 06 Apr 2026 22:45:37 -0400
X-MC-Unique: 0e-91N8UPG2jQWWPUBiQkg-1
X-Mimecast-MFC-AGG-ID: 0e-91N8UPG2jQWWPUBiQkg_1775529936
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 83D97180035C;
	Tue,  7 Apr 2026 02:45:36 +0000 (UTC)
Received: from xudu-thinkpadx1carbongen9.nay.com (unknown [10.72.116.131])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B26B4300019F;
	Tue,  7 Apr 2026 02:45:32 +0000 (UTC)
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
Subject: [RFC net-next 4/4] selftests: drv-net: tso: expand double tunnel GSO test coverage
Date: Tue,  7 Apr 2026 10:45:11 +0800
Message-ID: <b68b86bdee10126f1552a22149bc7e631ac0701a.1775527362.git.xudu@redhat.com>
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

Add Geneve test variants with GRO hint and TTL inherit options
to exercise additional tunnel configuration paths.

Also add double VXLAN tunnel test cases to complement the existing
double Geneve coverage.

Signed-off-by: Xu Du <xudu@redhat.com>
---
 tools/testing/selftests/drivers/net/hw/tso.py | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index 6b4639ce6139..6930eb3fde29 100755
--- a/tools/testing/selftests/drivers/net/hw/tso.py
+++ b/tools/testing/selftests/drivers/net/hw/tso.py
@@ -373,6 +373,12 @@ def main() -> None:
                 ("vxlan", "id 100 dstport 4789 udpcsum", "", ("4", "6")),
                 (),
             ),
+            (
+                "vxlan2", "4", "tx-udp_tnl-csum-segmentation",
+                ("vxlan", "id 100 dstport 4789 udpcsum",
+                 "tx-gso-partial tx-udp_tnl-segmentation tx-udp_tnl-csum-segmentation", (),),
+                ("vxlan", "id 200 dstport 5789 udpcsum", "", ("4", "6")),
+            ),
             (
                 "gre", "4", "tx-gre-segmentation",
                 ("gre", "", "", ("4", "6")),
@@ -390,6 +396,24 @@ def main() -> None:
                 ("geneve", "id 200 dstport 6082 noudpcsum udp6zerocsumtx udp6zerocsumrx",
                  "", ("4", "6"),),
             ),
+            (
+                "geneve2_csum", "", "tx-udp_tnl-csum-segmentation",
+                ("geneve", "id 100 dstport 6081 udpcsum",
+                 "tx-gso-partial tx-udp_tnl-segmentation tx-udp_tnl-csum-segmentation", (),),
+                ("geneve", "id 200 dstport 6082 noudpcsum", "", ("4", "6")),
+            ),
+            (
+                "geneve2_grohint", "", "tx-udp_tnl-csum-segmentation",
+                ("geneve", "id 100 dstport 6081 udpcsum gro-hint",
+                 "tx-gso-partial tx-udp_tnl-segmentation tx-udp_tnl-csum-segmentation", (),),
+                ("geneve", "id 200 dstport 6082 udpcsum", "", ("4", "6")),
+            ),
+            (
+                "geneve2_inherit", "4", "tx-udp_tnl-csum-segmentation",
+                ("geneve", "id 100 dstport 6081 udpcsum gro-hint",
+                 "tx-gso-partial tx-udp_tnl-segmentation tx-udp_tnl-csum-segmentation", (),),
+                ("geneve", "id 200 dstport 6082 udpcsum inner-proto-inherit", "", ("4", "6")),
+            ),
         )
 
         cases = []
-- 
2.53.0

