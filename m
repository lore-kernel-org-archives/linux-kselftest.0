Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964199;
	b=bqnt9BablzYZqeShaA1HSLLEFBDY6UnzXWI0A4SxySkJJ+Ha6Mkg6Y5kfahHMHNNj7vC
	 qNBUK+AKMy0ESb306PhjdNyhNK8uXyDQCs1yBJscJSIWRCZDiMJgdTyp8j4RXYLewpf9V
	 oMDqpvtPKl9SerSr4fPzxwXVsmEeCZnerNAnXD83bfI5nw/1LM4DBjdBrdKlF2EPkP4cH
	 DGvQi0ve1H24IXyruJXU9ozimBi1aFw/1bYAoRTkKBWimtubHZZhAPdwtlYU889w/GHgJ
	 MXHb6il8Xnlcw/g5kx01zGececlU9tQvaraZmGwLqLnMbbIsrJo9e8At9UZRRSBpKWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964199;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hWQHu+CU2Ukrh7gYyBBTFdpejmrOTyW+PIRdeqJLFcE=;
	b=KnUqEyMVFqJJCcEcOt3ZA3VLYV2hEVMf+LhMmCoL8EbrMT2Q18Oamw7/C+luYBFlsZ0Y
	 paOwGvjkWUvb02WiZ7eYWFOBvdoaT1Wgg/QXbJCpLNgl4AmcVUBHaQvY+PP6cvrQR4gUT
	 ee9O+BXBqYUMBzELwOdk26MVhtpWaVTnh/zxsW+JjPEOvyB9QJGV3PimiXN+AhAjOwj+h
	 58er8181ycOjk1JoOl2QnN0RqdQy25TI5RrS51XmkE7ixe57CDIzBpLK5w1MEH3vVQhLx
	 NlD0FKSd05omMOpkmAkoG6BvzxW6CqR+Uhj+GP6Jx1maBFZLZP0dXrv8rN/inUpT1ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2269606A31C;
	Wed, 18 Nov 2026 01:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2269606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c25f67fee2ec11f19a56ed5b684f684d-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1f42806e-b8f5-4f96-9502-39de1ee39999,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:2b668dafbc2b8d42976b3fba7603aee5,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:-3,I
	P:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c25f67fee2ec11f19a56ed5b684f684d-20261118
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 50048950; Wed, 18 Nov 2026 09:09:52 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: brendan.higgins@linux.dev,
	david@davidgow.net
Cc: raemoar63@gmail.com,
	brgl@kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] kunit: remove unused free_string_stream() declaration
Date: Wed, 18 Nov 2026 09:09:45 +0800
Message-Id: <20261118010945.46404-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

free_string_stream() has never been implemented or called since its
declaration was added; the free counterpart of alloc_string_stream()
is string_stream_destroy(). Remove the dead declaration.

Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 lib/kunit/string-stream.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/kunit/string-stream.h b/lib/kunit/string-stream.h
index 7be2450c7079..d0dede075df2 100644
--- a/lib/kunit/string-stream.h
+++ b/lib/kunit/string-stream.h
@@ -33,7 +33,6 @@ struct string_stream *kunit_alloc_string_stream(struct kunit *test, gfp_t gfp);
 void kunit_free_string_stream(struct kunit *test, struct string_stream *stream);
 
 struct string_stream *alloc_string_stream(gfp_t gfp);
-void free_string_stream(struct string_stream *stream);
 
 int __printf(2, 3) string_stream_add(struct string_stream *stream,
 				     const char *fmt, ...);
-- 
2.25.1

