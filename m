Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E0339719
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 22:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785880880; cv=none; b=hlNDB0PwzORaDSj3Z1drUVZnE8KR+rnSFdirKjnYju5q+C9DAmiIr8yVMOA4bFyWpBn78QnGcMxh1VJWZglSY9cEfSNIQBKXfVnkni1TKtZ2iZgLdR9OFnhyUGbD3vMbzswAeurAzt1A49UHrZKkOFw+tv2CL/8j+muqHzFTU0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785880880; c=relaxed/simple;
	bh=CtuHMW71aRHu06GjXYnauI73d16ZkzPDw4ZvP0se94E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8bAUK4TpyqYPFi9ORMwRrEuobjfKNofuBYpf/3lX6zA70xQdGdIOVd3duo19baREuAjO6ITXukt8GRd9nP5fnE81PuIIZzGl1Umihb0+XH5muC79jb2bLsZggRpzLwBT8k7S6QiNDkxuuC0oRJIwMPuTuQQwiYPboTrqvjIaiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IiRCCGof; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IiRCCGof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785880878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4rkQKf60hLXqoIgBxA6Jm3Hc2+y/ugAgl4QJUR5/D0=;
	b=IiRCCGof2PnZyaxUMHzGP+Qs8vknLrzM7STjs1V7g0sHdShCJt+50RYmeNPKbXtmoK73FH
	foBkinxAuHBYp6iKfDPv2JgEpMOqlb2epVnBC2BxFF4CHzoTSnikB1GVQRJ7OZW+C5GGOk
	cO6AJkBaahbAuCCXVInh8sANL6Egsh8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-83-tuGiHkpOMGyF2_xKrPLMvw-1; Tue,
 04 Aug 2026 18:01:15 -0400
X-MC-Unique: tuGiHkpOMGyF2_xKrPLMvw-1
X-Mimecast-MFC-AGG-ID: tuGiHkpOMGyF2_xKrPLMvw_1785880873
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3BE319560AA;
	Tue,  4 Aug 2026 22:01:13 +0000 (UTC)
Received: from bgrech-thinkpadp1gen3.rmtustx.csb (unknown [10.2.16.127])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1BEFC414;
	Tue,  4 Aug 2026 22:01:11 +0000 (UTC)
From: Brian Grech <bgrech@redhat.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	kuba@kernel.org,
	Brian Grech <bgrech@redhat.com>
Subject: [PATCH] selftests/net: fin_ack_lat: fix latency threshold typo
Date: Tue,  4 Aug 2026 17:01:08 -0500
Message-ID: <20260804220108.1630366-1-bgrech@redhat.com>
In-Reply-To: <20260731145914.4014912-1-bgrech@redhat.com>
References: <20260731145914.4014912-1-bgrech@redhat.com>
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
v2: Added missing maintainer CCs

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

