Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF06356777;
	Sat,  1 Aug 2026 00:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785544216; cv=pass; b=kkD9oqysan75rH9yZ+tIb15xzFUF5BTWbmssQABSrHoBDerwRXg4zPe/QalPVylWTPCqVBbMNNCVQ5D1eXegsQwe9jyOSrnJXxLqAqKj/+VEUP/pL3W4L5ZSAcIfSLHYv37q6Yq/Z/1/dd3TPx7U8kcwDVUd1uom/E98gV41BS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785544216; c=relaxed/simple;
	bh=vbDdHPLYsJBn1MmaoZYwxgB7QZRgd5YLQssaabKahzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEaInI0pVFEKqsac8x2wvnQYlPW2tHIyzbeqGbiXbG8/oRO2rQjB8bEyKbvHAb0cVpdS/vXFI18kiUvfUXayo0gAqKZKXEfAhIogiYoGmhIkA0Zgio1ah5xPmLlsM95e350k/7qfegAtb7Vdv4jSGk6t/QFNkOEdwY/vEdBXBAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=R4HZ5eul; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="R4HZ5eul"
ARC-Seal: i=1; a=rsa-sha256; t=1785544199; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=cZ0d8GoKZ/nfSvV/4LxByvxu3P9XBcuOf/QcAxxMsudKGBYMl0ADP4Sz/K4uthAagu63wSLohHDHKTlRjIirXkQTSHN97kCNakfNyRdH5yUHnvOjZI8qYY/k7NA2rku+EACX+y6FPTNOW5Hlq+GvxjagLF6KxCybZWql79fL8Dg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785544199; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vbDdHPLYsJBn1MmaoZYwxgB7QZRgd5YLQssaabKahzM=; 
	b=N3kv4YzR7wOLqghbbDkv4sg+uU6ld8MQ0K+DFhYS4Gbl9fyZRah4JwhofIsfpuO19rE1Rz/tNQAqmgC0WClswhXEV8ynuIRXqEU59igAAnS5tjVkTgFv59Gq7THi/5hsdRMnEeS5nU8IB21zcEV2PmpwEHkov6ZbQg2y0/t2z9Y=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785544199;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vbDdHPLYsJBn1MmaoZYwxgB7QZRgd5YLQssaabKahzM=;
	b=R4HZ5eul/tAJSLzavvevLwYlSATEX/fBbOe7iegLe+6DLEwYLJyTrZIPTfngUTab
	VPX5gFpeP0BQasE8fr2Ko6+ze2YHzD5hv80IKiFaPtygjbAz/B5yeMtn23h3y8s3Xfh
	PqFhI7rMpfZYRaJXpok5EYTi7xiPPfy+gSx7+2i4=
Received: by mx.zoho.eu with SMTPS id 178554419779435.15803406835005;
	Sat, 1 Aug 2026 02:29:57 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: xiexinet@gmail.com
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/3] net: hsr: clone before updating path and LAN IDs in tagged frames
Date: Sat,  1 Aug 2026 03:29:44 +0300
Message-ID: <20260801002944.241301-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728143604.26-3-xiexinet@gmail.com>
References: <20260728143604.26-3-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Clone first, privatize with skb_cow(), reacquire the header or trailer
pointer, then write the id: this removes the shared-buffer mutation for
both hsr_create_tagged_frame() and prp_create_tagged_frame(). The error
paths (clone failure, cow failure, NULL trailer) all free the clone and
return NULL, and adding kfree_skb() on the NULL-trailer path also closes
a leak. Using skb_cow() rather than skb_cow_head() is right since the PRP
RCT sits at the linear tail.

Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>
