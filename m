Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F40126F1C
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Apr 2024 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713533128; cv=none; b=GaQtbormhn/TxOpiYlLww1oBSWzqHYa5NGetoUoXvdNToTpIb+A4FZeerbJ2BJ3KjS5wBUGjmIKHmcDwkvwlan115OMldDD+OJWvWsLeaFSGPsz0BVw8DbiQ/Rmd3AguTeenjHjTio62BA8wCDCfPxRDeF4FJNNFw1bxC83Pavk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713533128; c=relaxed/simple;
	bh=zmdkTFihWpy+XhiLb7Ai9Fv3Kxr9kNr6UrAO97Mor0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MztiUeqyYxyn+8mNkzq1IP2WCEgljpmQZWzuYoZT+QDY0ITEfvo6nG6iKFokQimyrfemYy+1jTDEsAYpBRHy/qxCYLw5VyiJLP49zfgNn719sBBe44diCk1+FxDa3mE7CCiImXgwKQF/m2CoGGbV1BCBBOZMJ31ENxvKNLmBZgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KB3+0Kw5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KB3+0Kw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713533125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKFWmD89ZfxI3WrGZY3k5MGYxU+9FObI37ylz+l21us=;
	b=KB3+0Kw5/8Ywf5NsL9xwjrZhGih1qclaoN9qi8wEINl1H376vtvaM4DXZfj+yjVNeJ47Ng
	efQALwG1uVuv5GalJKVUR+8IPV7gwQDrQ8GAXzN8ADh2pFQRPcLTQp1kNlr763ieIrBRD4
	SRjS5idjhyxBNdBWF+p1aKAhiUMWn/o=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-286-xs4GAnh4PMSaDOM1y3cvUg-1; Fri,
 19 Apr 2024 09:25:21 -0400
X-MC-Unique: xs4GAnh4PMSaDOM1y3cvUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDD952820B78;
	Fri, 19 Apr 2024 13:25:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.8.218])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02C1F4EA71;
	Fri, 19 Apr 2024 13:25:16 +0000 (UTC)
From: Wander Lairson Costa <wander@redhat.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-kselftest@vger.kernel.org (open list:KERNEL UNIT TESTING FRAMEWORK (KUnit)),
	kunit-dev@googlegroups.com (open list:KERNEL UNIT TESTING FRAMEWORK (KUnit)),
	linux-kernel@vger.kernel.org (open list)
Cc: Wander Lairson Costa <wander@redhat.com>
Subject: [PATCH v4 2/2] kunit: avoid memory leak on device register error
Date: Fri, 19 Apr 2024 10:25:02 -0300
Message-ID: <20240419132504.9488-3-wander@redhat.com>
In-Reply-To: <20240419132504.9488-1-wander@redhat.com>
References: <20240419132504.9488-1-wander@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

If the device register fails, free the allocated memory before
returning.

Signed-off-by: Wander Lairson Costa <wander@redhat.com>
Fixes: d03c720e03bd ("kunit: Add APIs for managing devices")
---
 lib/kunit/device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/device.c b/lib/kunit/device.c
index 25c81ed465fb..d8c09dcb3e79 100644
--- a/lib/kunit/device.c
+++ b/lib/kunit/device.c
@@ -131,6 +131,7 @@ static struct kunit_device *kunit_device_register_internal(struct kunit *test,
 	err = device_register(&kunit_dev->dev);
 	if (err) {
 		put_device(&kunit_dev->dev);
+		kfree(kunit_dev);
 		return ERR_PTR(err);
 	}
 
-- 
2.44.0

