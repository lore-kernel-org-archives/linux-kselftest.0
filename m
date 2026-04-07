Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA90372ECF
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 02:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529927; cv=none; b=HIuFbJnkuhWt0FELz0JhsPlUGowUDaB/A9aGEwCdsXIa9RVoyQWxOcOneiYmVd2d2q7Wkmaq4xdurbrUSpSXfnzbtlEyDkJO/pgITsFNJwqLT1FmNQXUznoDI/tor3Wg+VUEPsqN7mpetYlwxUd3U00XCJEzzI5U4oVW/DciS1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529927; c=relaxed/simple;
	bh=yQUOKSy6VfcfXDDIRY90Etg+nb+Y+n6W8ukWh0hXxsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=To5lH/5iWiFkEdDZPf1twpJE1IYYneaUm/HDWp9eZa7JN3QYWhp8hCQHV85Zf/3MDK9fU43ekVGiiZ/GijeqMi631mtCVdXgbSjff7+EcuqOc3eYXTvFkn8k2VBoTjycCwYjW+38v5yeFMe4boJrTuYZ5mc69s16iQ/vWg99X9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HxZtCSYA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HxZtCSYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775529925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FDDFUAQFNb512S/LxyDIQRQ2l8wUPzRCjDTUtKlW1rE=;
	b=HxZtCSYAODE1nW22eqXEMQv3+ejg1xFemmhNqB0FtPLBW3RxbLX4ZVfc3tf3Uj5LxZaqjj
	egbIOVBPOCeGPdx8hehoUMEeP3TMo+tT82uRpRdgtPuq8UwL4RS9V4cLPRvsOmhHX0QbMX
	pu3LjFULEWvgt4rY5PFDyT1AUCGPglU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-yI-jBFHzNAyTZgkTk-uDZQ-1; Mon,
 06 Apr 2026 22:45:20 -0400
X-MC-Unique: yI-jBFHzNAyTZgkTk-uDZQ-1
X-Mimecast-MFC-AGG-ID: yI-jBFHzNAyTZgkTk-uDZQ_1775529918
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 99E801800359;
	Tue,  7 Apr 2026 02:45:18 +0000 (UTC)
Received: from xudu-thinkpadx1carbongen9.nay.com (unknown [10.72.116.131])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 95B6B300019F;
	Tue,  7 Apr 2026 02:45:14 +0000 (UTC)
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
Subject: [RFC net-next 0/4] selftests: drv-net: tso: add double tunneling GSO tests
Date: Tue,  7 Apr 2026 10:45:07 +0800
Message-ID: <cover.1775527362.git.xudu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This series extends the TSO selftest (tso.py) to cover double-encapsulated
tunnel scenarios, ensuring that hardware offload and the kernel GSO path 
correctly handle packets with two layers of tunnel headers.

Xu Du (4):
  selftests: drv-net: tso: retry connect on EHOSTUNREACH
  selftests: drv-net: tso: add helpers for double tunneling GSO
  selftests: drv-net: tso: add Geneve double tunneling GSO test
  selftests: drv-net: tso: expand double tunnel GSO test coverage

 .../drivers/net/hw/lib/py/__init__.py         |   4 +-
 tools/testing/selftests/drivers/net/hw/tso.py | 267 +++++++++++++++---
 .../selftests/drivers/net/lib/py/__init__.py  |   4 +-
 .../testing/selftests/net/lib/py/__init__.py  |   4 +-
 tools/testing/selftests/net/lib/py/utils.py   |  19 +-
 5 files changed, 248 insertions(+), 50 deletions(-)


base-commit: 2f60df9e61aa48bf40c36254bf2e839f09cffd98
-- 
2.53.0

