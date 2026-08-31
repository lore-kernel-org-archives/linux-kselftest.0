Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9B542902D
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182742; cv=none; b=G8tcF2P6gfUsSV9PGXIHPt782ROrDKVG+iSDvU8jFmP5RKoE1FfVJcuUmtAH+crgE65p2klvHzQoJf3gCOqGyJNeI8ys261/ZqjGPVkMpeDKOGPVnZK/4QdOiGgFVhD8Axi3LrMBGtB/yQS9OO05SDvGGASeuIE2lLj8h+jbE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182742; c=relaxed/simple;
	bh=PE4JPXxCMmTovVJCHys+isKwpKyed0ZqK7DIvREANXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHoKwJdroy0C2q8WQHdx4vl2Hr1GRzDwDMavEi+UrlR11p80LMx787MrFeNWfjv5DwfP0iuKe9Mc7d2w6ugC6jamcyViLeH1M7KxF6qDCIivQgRfDjn2QTNpspAbshvGMvCBglF/4rRcXDwMv5YN3pBfYGe3k6o2AVflZ/SFBgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hDd/MBKz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hDd/MBKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788182738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykDFvI3Z1xGBk6sVr4D5Kbs14PCVANsX2P0KGcoLyiA=;
	b=hDd/MBKzyuHnUbn6QZIP3X/DJQ0ud+35L9WzUH7iPAZYbHN7baTryiKmc0HCzP3hPIcuRY
	OxNMDKSZmBwQ16eEAmiz4kMolSm7/Xn7Do8XCoSwd6cEW0/LeBrJKVjNNDyYqTLFzVbELU
	XKrbaZIb5G+Zj/DfYKRXhiuRoLlxrD4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-310-dS4ZbrEXMQez5N6CxENTiA-1; Mon,
 31 Aug 2026 09:25:34 -0400
X-MC-Unique: dS4ZbrEXMQez5N6CxENTiA-1
X-Mimecast-MFC-AGG-ID: dS4ZbrEXMQez5N6CxENTiA_1788182733
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54A7F18A3C09;
	Mon, 31 Aug 2026 13:25:22 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D54A40E;
	Mon, 31 Aug 2026 13:25:20 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 31 Aug 2026 15:25:12 +0200
Subject: [PATCH v6 2/3] selftests: cgroup: Add KB() helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-kunit_cgroups-v6-2-63b6c7695287@redhat.com>
References: <20260831-kunit_cgroups-v6-0-63b6c7695287@redhat.com>
In-Reply-To: <20260831-kunit_cgroups-v6-0-63b6c7695287@redhat.com>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Albert Esteve <aesteve@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788182715; l=776;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=PE4JPXxCMmTovVJCHys+isKwpKyed0ZqK7DIvREANXQ=;
 b=215S8Y2djG8kZm2WkG+9TfxCaGvQGMCtOyYrmzkgu0AlJ+nyvuiaAFSJ8k2I9i9JZjOOU80GG
 XDgaD8gFoARAaTw6i4rK6+yCxtF9j0g4UVyDsV0pfEDRNujuSB9a3O5
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

cgroup_util.h already has MB() and GB() for size
literals. Add KB() in the same style so tests can
spell kilobyte values without in-code shifts.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 tools/testing/selftests/cgroup/lib/include/cgroup_util.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
index 5d39c709ac7a..0e5d7b87ad19 100644
--- a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
+++ b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
@@ -6,6 +6,7 @@
 #define BUF_SIZE 4096
 #endif
 
+#define KB(x) (x << 10)
 #define MB(x) (x << 20)
 #define GB(x) ((unsigned long long)(x) << 30)
 

-- 
2.55.0

