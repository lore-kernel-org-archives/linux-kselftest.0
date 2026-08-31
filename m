Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DA73B7759;
	Mon, 31 Aug 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197710; cv=none; b=d9sOjUj/ZUmuuhRmjxP+x7byEMqJuOywJIejnFIb47ay+GF4ApqLxhXs8vLE84idusQ2dJU12yaxoN99+SXBbGnjcnqQGX6kaztEBEYXBQGZcfYgYYY2h5olrEthxwBRc6opYdAEzsOsWhFaPhqfJd0Ly3U3ETdjd+ug80cAJKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197710; c=relaxed/simple;
	bh=2H4gOkjbkosuL2QTSh2px1EMOkBL4zBojeBjpxfKbQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKRQeEFmtsDMQay/RAmr7ZFwG7nIwZdYKQSMzjAJKBkcyoEuVxDoz5GKGUGITkEEf8taU2XZ/+Shq3yPpMHrNZe5GiXBHBMCj/5sooeriGWVRZNE+S+EZdYt2Ko2Wxtc9yohMZjXluT/yT30KYERVQXeJ917C0iG/yn7jP1xLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=CxkRm/sj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TffAw8jC; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="CxkRm/sj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TffAw8jC"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 0888BEC0207;
	Mon, 31 Aug 2026 13:35:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 31 Aug 2026 13:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788197708;
	 x=1788284108; bh=8FtdEuSSYu8b/97OkZPFPpyvwZMNqivkR7IA8HKt3VE=; b=
	CxkRm/sj2cjAM0hZ241h49ZQFJqCBFCFzPpLXHua8BZpE8zRRzzw5oWgTfJsf08v
	hBU3wiekllzbwa0oz1spUJNUehA0psgmqFwc05/4f9nRnVa9kXvzelZKG40uxwvR
	GzgOLCvu4XW6PEQdhaRKtXiLZ61LnIZ4k/2H9vfaM01pZ+o2fvBE4u0FYgE7YJ7Y
	ZOC3EnsORmlej/h+rSyQpbFRoUIEkPG3q7Iu88nRPmIChKNvqfO8bBfu9GjY9P+Z
	KGQHz1p71FAI+fQjCQM7FZYotGB6SzmxgAk5JcNnKuGnOa1VSy27atLRfMG8iYWl
	vXWzde6P5u7GX0Hi1zAg4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1788197708; x=
	1788284108; bh=8FtdEuSSYu8b/97OkZPFPpyvwZMNqivkR7IA8HKt3VE=; b=T
	ffAw8jCv0ES/9Z134kUyyCFcN8LO+tPpXdTs7n49QjGlWYYt+wglPHOaj7B+BCTy
	A1grVUD+iHFP30kwJUtVjHwCg1366f3EDQCW8O3flQnKsq+NAvP3BbHaBNRrssAG
	j3+9rSKPlv1tfi5FYpI8l2kFv7+SvUcK8f922TOva2lkk+iF6xfTjvatkqaAUVfv
	h/WgcQJ2Afh2rr8qyB1m0XVsclKR0+aXIdPTklDsBrF2p5YFUOwADuoRrwj+FJE1
	jCekiOSAGPoudPx9Qp0D5SWkMxRWymIoTj9Xq73H3l+wkfQShEE72e7AJIObsbKm
	JaFpkCVA6lFEOt5GiIITA==
X-ME-Sender: <xms:S7uVaju_vqLQLB_KS5eKQ5g5viI52-wl0XI6SFP-Z-nrqdvsT9B4Gw>
    <xme:S7uVasp-3OE1gKMgI5SF1TDfTgDpea6KJ8xlHonk1XKK0T3TynwPRG3apY4WK39rL
    VyvZCKj4dQOK72hF43Z3ZVa6gInlpHkAI-UKhM-AwK31m5xici_bUsu>
X-ME-Received: <xmr:S7uVaiU6ftx1_r_OYi0DhlMED-7fFr7PY8yw2AvgiE_gQhlokmZV67AZVrcpvR80vNFSWKWEo83HmMNiIbEfjxYQ5IB2sA>
X-ME-Proxy-Cause: dmFkZTF6JiRdfk5Vs3phyclJ7AyUnOw1eG5omI5b6IFtHmdMG1Lppg8fUif7VfKKU3b6EJ
    RBQvPQj6dVCJiEi5e+7Y3+kf8PG/Ge5w4TzaXZZ7j3sTkSkMwX4Mi+MkjA0yTzQsSv7usH
    00naaOBrgEdSne1kiz+bIxzSnoR/CSvQ0vMfe1Kjg/eHzpDhX2WM56g/1khOZ1TxFjNTNE
    9tDn1+PQ5yGMB+HjfDSkKDiUv+BDB6Z7IT1pYyJBpAMs+BnD/He17cBJuXR66FgqKrkqHU
    Ytvp0Z86JKudXFPmiy+Ok/IProGM+X4xLlD7XvjGiC7GqHdfdQ3Y+1rrG51Zu4Reqb29Nl
    Atc0gnHTouGJrHZyf6uHwv5jSx2zwc8mTOwngelw2YYRxBBqBWEKz2Cr6yRJFqzNN/lquI
    +uqVJPecXkbvq2M0u5cijqsh6m1+LYKTvFNXEYY5mxcBEK1FTOIF4DZkOUvpsHE3vVRpkv
    qB7gHe/v+EJ81/oHlaI0BnQuZowimB26w9YbFGblC15IiJn/ik51L1WRppTjZGxlapdOQs
    3gHXxxYx+9I62TgnOhmVGGDVxXAqSzhHXEOMifV73p6HtIrvdEsyt+jWWA0DGyjzmrONlD
    BTLZ35MZv5GtuQoS7NegVrvW35wYPZaUAzOWpIEDpSmVWdaCDnnNuSB8kgtQ
X-ME-Proxy: <xmx:S7uVas2FkFzA0bPxwC7pQGgG9Jt-wk3pY1JQLxGAAJT4SFuc30fsaA>
    <xmx:S7uVavtpCViU35gVxQVdbBi68J27A9J_H1AWNp27lPJZz8DSCBSobg>
    <xmx:S7uVasV0gkUDZf65Os3wTAYvgiy0hBy-SknKr_IRseiWLzNwhSEgzQ>
    <xmx:S7uVavzQ2xhdAJyq9SCFj_oRrdYvI0TPTUM0-ftDqKZlTkHB8Gb8Zw>
    <xmx:TLuVavVd8oSPunTQ6tT_-Tt2Id7Npc1UZ6RmC1DTQj9PXk9XHqadhZxH>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 13:35:07 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Mon, 31 Aug 2026 12:34:37 -0500
Subject: [PATCH net-next v6 1/6] selftests: net: fix get_refill_ring_size()
 to use its local variable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-iou-zcrx-v6-1-02d1d012f0fd@fastmail.com>
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
In-Reply-To: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=2H4gOkjbkosuL2QTSh2px1EMOkBL4zBojeBjpxfKbQg=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFlTd3uut5SaWiZrtS9qy+4M/drFJ+NSJ9zuXbNg95MzS
 71sTcLedExkYRDjYrAUU2TxeCnSojG1ovGuaoQgzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFNd5MfI8Kti7cQsiWVJrU9urf395XXVkh35P7ucXett9U4U37gx7x0jw2LNFW5
 3uEV9PWZ7G9d4iWcem8yg+Che/Ag3O1+Aq7MhKwA=
X-Developer-Key: i=juanlu@fastmail.com; a=openpgp;
 fpr=48E9148428957881DD2558116FF739276A6BB0D9

In preparation for multi-threaded rss selftests, fix
get_refill_ring_size() to use its local `size` variable instead of
assigning to the file-global `ring_size`.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index f6a8fc5fac24..df6b62204343 100644
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
@@ -132,10 +132,10 @@ static inline size_t get_refill_ring_size(unsigned int rq_entries)
 {
 	size_t size;
 
-	ring_size = rq_entries * sizeof(struct io_uring_zcrx_rqe);
+	size = rq_entries * sizeof(struct io_uring_zcrx_rqe);
 	/* add space for the header (head/tail/etc.) */
-	ring_size += page_size;
-	return ALIGN_UP(ring_size, page_size);
+	size += page_size;
+	return ALIGN_UP(size, page_size);
 }
 
 static void setup_zcrx(struct io_uring *ring)

-- 
2.50.1

