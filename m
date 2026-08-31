Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95114A60F;
	Mon, 31 Aug 2026 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197711; cv=none; b=n289AzG/LOW5mXE6Dormgp6z8/zVkN8gd3vMOXVzgMCjVVw9UbsY5W+uwEk2IonZci+iO3NfMPjJ7vRIE2kBn1H/EyDr8Wdl6nq/8MfwDVZpWE7fqwa7/YxK93uWXP1q4Dx/lr8NZgmFAajBcMjSiw0DxZbF7c1SgZCyW7jJ5Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197711; c=relaxed/simple;
	bh=DEZX7yB5hvGm3kzuhsLGPVm3T+hGf3MNeV/sibLg9bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+TOgk2C2d76/XtEF61OgRYn/B8jzg6YiieAhq7vb8wpDc1WviklEx9i9RNC7Ba+TiPhYDkpLBUkkHvoseCgZvujm1SDxAW7PDj9ST/KmClDAvLT2CYQ011+8QzXwrdI9fKlJzNnI3uZ/BXACar0rsyJMZs7Rfw78eRa51FrdaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=eoSdoh1k; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N5vKKoGk; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="eoSdoh1k";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N5vKKoGk"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B12731400139;
	Mon, 31 Aug 2026 13:35:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 31 Aug 2026 13:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788197708;
	 x=1788284108; bh=yqUaOTYpRUdIsvweYNWO62QWWSoFqMe5Y9Qks7f38qE=; b=
	eoSdoh1k9Kc2BbJ6iPyadr0BwNqU4Ecu2eWCv3jOd522Y0QV7tY15xR+wyx9GB1V
	nzsnfaym8KmZInbD+CrwcwfE9Pnk6nnpK/L3GTHQtrGNfia2gABa5rdSDdmxb70h
	YDlteW5O+nPEQ8aCgj++5UNnSwuPlYooDD9Zqg+loFwUPCf+f8TCMsXJQ6217YKn
	V6fkQ3CiA3TWTBvu7hMWKhApFyCGgIzInAsipohQZSzdBPemw0MYpYXySg2FFgg3
	OCwyT74I16u4cdu0TEn8Zf2gNSYz+Ua4+phFRsTMuUiG0nyVi1WF8OMisUOLoA2z
	T49L/lTr4Zh79ISU0HZXzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1788197708; x=
	1788284108; bh=yqUaOTYpRUdIsvweYNWO62QWWSoFqMe5Y9Qks7f38qE=; b=N
	5vKKoGk4DQK9TuZC+i6bCRkuC56JAL90D4N+AhNTcibmhZ67cLjOZCwcx68bhAmQ
	a33XmsRkodoJVYhVJfMLQ4GgTqsB2iYlAqEzLf8+iQV9y1q2OMNEPQsUBpaPhtFz
	sM/TUrJyOr6nOhTT6m30O7ilAnaoipUVOdOkMiordV2sTuECmMJOYOHBQhb9c5jg
	UVWL+H++RceiIbTxE89E+JUBBN70+TZHqPZy9tIYHWRtfYG5QWdHWX2VQJiBAFdM
	1adwmOIQg3z5VbjGspKpo8SHTntMqKT0JidQkM9yAcoBA0pJ7PUG0BMOkRWVOSnp
	VGrX7XLe4lg0RpAh64tZg==
X-ME-Sender: <xms:TLuVam3IVpBS7LZHUBOIpkVz_smz1jCdhBJ2keND-e9-N3qOhmXRag>
    <xme:TLuVahRV83meMJy88RKKpE5iK79OmRP_ySggFOd4ULKsWVi2T5Pq8YBUbldoXa5kM
    dIfW61Z0Ni--ONML6Q1KfgsZh1v3DZOgOA2EXCvqibJEOWns_qybJ9H>
X-ME-Received: <xmr:TLuVaqfz9dqrE1BPZHIazc0CIILjqVcT5SkaggT8l9Z6Q_D0PdJgXuY-FTgIA7Y-yaDEarP0OtdZeaThEn6nBFtoQViIOA>
X-ME-Proxy-Cause: dmFkZTFQfMUdzUqlU7171HqI99VjJPU5FWwAC39cIHa+QBRk2qkpcvNu0Xq8Nu1CLp5rar
    4om29N8rUgMPiaAn55b8wqeIgro45ez1ZeVzuUsypZKgI0z9z5C461P46dk5i9RGPeQVNC
    5RO0bU8H278ckzq46JJl1odmm5FqcexfFKmzXDdkifmOGP5Oo/W4ocXGHy/L1Z77KjLCdn
    3qtoXY0WC3rL9boZM+ekfmscjsxsGZBLz7uQLmXj6cYKr/YOZPdTCosXgag7Oq1y5LvV+v
    qDfkPmF7m3lAbzyqBNhHaFq4fvSu9gWex5tcetw20poYRNMhykcFTbWATYMfODj+DM7IVi
    vp8OFkyqr/kUHbQ8DcbShgeXTGM36limqAfoYr+uUdxkTii4AnzX6iwzSO0hvvGNtrHN8M
    xCyp72m1MFH9RfHDhrkxmDzCANkFOConY2svGnlRyBQHCxV0ryTXWwEwLCtnmBCSdXXlTB
    Cj+pUGdhKV0qtsMTeh6uPnPimQg616bgHqnKxVLGgJzv56GItaqZ3Ti11S6VI80OwemhLe
    /TyzoFG0mUw/3AD1tdZ7BxuZUu533d8YvM+WEOvAvW0EqodVgXg9A6ScYYtnuEw9wqw9W6
    T3Uf2Co0qTeIOvz08YwIMVg5l4P9iaHBuT0LjBPtxrW4hzMfS7KXFTmSh+FA
X-ME-Proxy: <xmx:TLuVaidODQZEF7isZH_6fuDn-SzZpd22NvYWx-A7ZqKPJxbY0BGnYw>
    <xmx:TLuVak2UI116BWEy6CkJxiJprZaj6mliyHsHd6A7uMSaq5f3mMPxlg>
    <xmx:TLuVaq8lRBNOYn0MlRfzrSOBmtcZBNJj4-5Lgpq5uv-U2dtZFtVBww>
    <xmx:TLuVap5g_rxBCNT4oNSMrEMY2W_wGP0NckFNQEkntEBvb-4Kvd7V4g>
    <xmx:TLuVapdK3jvIho2ajJqvlw8K54NEz0wRGyyTl9rtE0vvATYmvCiWCzH6>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 13:35:08 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Mon, 31 Aug 2026 12:34:38 -0500
Subject: [PATCH net-next v6 2/6] selftests: net: remove unused variable in
 process_recvzc()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-iou-zcrx-v6-2-02d1d012f0fd@fastmail.com>
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
In-Reply-To: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=DEZX7yB5hvGm3kzuhsLGPVm3T+hGf3MNeV/sibLg9bo=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFlTd3tesv9ynEOMdW1yR8UHKf+0BOWyGTb5X3SzFu/ba
 7xyaX5Nx0QWBjEuBksxRRaPlyItGlMrGu+qRgjCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNXLDjH8zzPUqbeUDbPskhOR1fSMOip7TOUHn6ftsxPGszfUvZOSZmR41fJ//no
 XkbPV/46c3uzKoB/3+1LAyuVquudul0y8UKrNAQA=
X-Developer-Key: i=juanlu@fastmail.com; a=openpgp;
 fpr=48E9148428957881DD2558116FF739276A6BB0D9

Remove the unused `sqe` variable in preparation for the multiqueue rss
selftest changes to process_recvzc() in the following commits.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index df6b62204343..c6dbd0ad5368 100644
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
@@ -269,7 +269,6 @@ static void process_recvzc(struct io_uring *ring, struct io_uring_cqe *cqe)
 	unsigned rq_mask = rq_ring.ring_entries - 1;
 	struct io_uring_zcrx_cqe *rcqe;
 	struct io_uring_zcrx_rqe *rqe;
-	struct io_uring_sqe *sqe;
 	uint64_t mask;
 	char *data;
 	ssize_t n;

-- 
2.50.1

