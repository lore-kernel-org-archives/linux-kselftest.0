Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6732E432301
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509964; cv=none; b=qaItrNFgAnAMXxluBa5zTtiIOh+5nQkG6+2bryX6sJCCPrKZJuFDU2XHbjObybIQB5MZ3YG28XTdE0cKExHILQnLosgOYARAOTdLzanSAclwlGv/5wh+ge0n4Wq8BK0Ewk+q2fy4DkYipiGtfPJQZJqWqcxbK2KGRil00CUJNYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509964; c=relaxed/simple;
	bh=c6cPb7PSp3JUeUhUO4+oAzTADEyNQE4jXFaaHyq4WQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZjV06u9CL3mygjiytJjTtlSBtaWgmCVXu5cXKkznE0A5Wu+psGCiTPGaxed09VdNnuWRkee2UmXnjGhghkhl1UVl/dQNmpACEkWH3UGus2/6DrlZuQXtoayXzz0SCnsFXjbPM72Q5LjJitR92zJSyMsXQnSkovzy2nLMuq9kVtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SdMw5GNx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SdMw5GNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785509962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zfzl5161juAkmaNitF1Hm5SCf0UuByVgyEH28WzLNRA=;
	b=SdMw5GNxLDuYQ855kHR4fwxz7uKSHOhQW0qDJUk5dNFVp+Z1DQ152pbtrP22MUHtSOh8yX
	WUS7M9z1+BBhNLi5pBlr5CI/11xJPuxOtSG5oTOGud3I+9VMdXnDVtalWxU0O9VjYIAeqM
	nxmartclkfWl7ek/fM/DUJ0khz10hP8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-ELLellS0MraqB44IboUyNQ-1; Fri,
 31 Jul 2026 10:59:18 -0400
X-MC-Unique: ELLellS0MraqB44IboUyNQ-1
X-Mimecast-MFC-AGG-ID: ELLellS0MraqB44IboUyNQ_1785509957
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA97F1956088;
	Fri, 31 Jul 2026 14:59:17 +0000 (UTC)
Received: from bgrech-thinkpadp1gen3.rmtustx.csb (unknown [10.2.16.27])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B5A6D42A;
	Fri, 31 Jul 2026 14:59:16 +0000 (UTC)
From: Brian Grech <bgrech@redhat.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Brian Grech <bgrech@redhat.com>
Subject: [PATCH] selftests/net: fin_ack_lat: fix latency threshold typo
Date: Fri, 31 Jul 2026 09:59:14 -0500
Message-ID: <20260731145914.4014912-1-bgrech@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

The FIN-ACK latency threshold was written as 100000 (100ms) instead
of the intended 1000000 (1 second). Connections completing between
100ms and 1 second were incorrectly flagged as high-latency outliers
and printed as failures on loaded systems.

Add the missing zero to restore the intended 1 second threshold.

Signed-off-by: Brian Grech <bgrech@redhat.com>
---
 tools/testing/selftests/net/fin_ack_lat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/fin_ack_lat.c b/tools/testing/selftests/net/fin_ack_lat.c
index 70187494b57a..4117332eb1a9 100644
--- a/tools/testing/selftests/net/fin_ack_lat.c
+++ b/tools/testing/selftests/net/fin_ack_lat.c
@@ -69,7 +69,7 @@ static void client(int port)
 		lat = timediff(start, end);
 		sum_lat += lat;
 		nr_lat++;
-		if (lat < 100000)
+		if (lat < 1000000)
 			goto close;
 
 		if (getsockname(sock, (struct sockaddr *)&laddr, &len) == -1)
-- 
2.55.0

