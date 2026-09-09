Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6B73B5841;
	Wed,  9 Sep 2026 19:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983499; cv=none; b=KjSDCRnHuu2Q3jb+rw0kJNKtwvqgo0cf2S1rLJUuyINqBNwCx5+W1h6P/WlAKV6TrK2dRFSAIAIjS3qm9WHh+fUiAjdpWeBjLDygdfqKsKVNQiw9L5tVSIXYETagof+bpRG6T3402AbGvPzEowg0mdXWMIRITIHzK3jxZfopcsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983499; c=relaxed/simple;
	bh=2H4gOkjbkosuL2QTSh2px1EMOkBL4zBojeBjpxfKbQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=isMkUP0ZVVoGyOXwc1A7USWkpy1E18n95/AmetIMm8SCKS2a6GI7HdPyzKKLYtkI/7IrGsrrD3KfUgO0+n5dlVSnYY3DNEUoWgMYZdUmEpMeXShlhR/q0Z/HAoBTDl667ZQdFaycn0UIhx9oNRLc0ZqsBUFLJVIQAcGKAGxsBWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=GfhL+6OO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kndtWAKo; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="GfhL+6OO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kndtWAKo"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id D45F41D00067;
	Wed,  9 Sep 2026 15:51:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 09 Sep 2026 15:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1788983495;
	 x=1789069895; bh=8FtdEuSSYu8b/97OkZPFPpyvwZMNqivkR7IA8HKt3VE=; b=
	GfhL+6OOUIDqTAACZjPVwgvWDW9C3+DWhXMuBiGwmGha65Sp8Kjc59YBFpJAxk08
	si2NchbK4ju/OxEHzYjwwGrLW1AJm2klw7XR3ouKbjPNuecdNDGnmCHDc77leG/r
	c34jYUK2rGpH+Hh0wByObIbR/3dYIyZ1a3LdDLEksH6SsVEwvm9U1uw4VYofKhjj
	kHd4aUL8dCfnXnqba5vR1kuhElkhtrjpdyilb0Ji0y8ujKmKO/XIGRByO/7a/Bjd
	cWEUcwJTaYOVnfLqC/WWD6uXq2YSwCcg+LnEzcUcy/jIkDaXXw9QfZVBLtTAHMEg
	1v+a6XZIt0i14nghXVjGaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788983495; x=
	1789069895; bh=8FtdEuSSYu8b/97OkZPFPpyvwZMNqivkR7IA8HKt3VE=; b=k
	ndtWAKoCa110jgsSBKU3s5SECmYikPOd5LpNwWlczoFJSI4l9peU7sx66IC0SywN
	vR309rHhYc1C5M88EXLQDP/tlUMMNFyug9qdSto6PTDGOxi/HyTA1HDvCz9VL69p
	TgBZNKAWahAzSVwRCoIFw/9/od99B7lCbqu8MtzsHQwQdColJ39qvL/QTObYEQaH
	cVxjBUrint+PbthFEbZtqa1QC9mmdOodX9z9AglrRpACpSRDIrLkjyHG8RQt6WrI
	wOhm7IPHMy2+W9o3pKvDzxaypjxV+2x7JZAbdC6pRcd2TOLP15ilukHl9RIjlCMi
	zNMK7VvNSeZuK9/O8prtQ==
X-ME-Sender: <xms:x7ihalfo_WstQWCiHBB9--_J1-T7qLs5XG__yc3at3Ysa2yIcJA9OQ>
    <xme:x7iharYngH4yk7bxXX4WbWSnZWqg7SrBYp0jaGUvW6c0vEs-6yaArG3ryV89kenEh
    L3Wq5HpH2do5-BwT6tZqhlIvEeve28yD076p1yN3AE5M981-Ns19zZw>
X-ME-Received: <xmr:x7ihaqEugflo5fZJG9M15uNW4jwQt9rUHGczHP-b28d0yiqVBhDodmN-uMGJbpu8>
X-ME-Proxy-Cause: dmFkZTEgBr+UJG89vIfJp3eQOegU3abk3SipRx//dlEx5Pv0zLrGXPfJ9IBXN0E87On8Ye
    z0b3cKtfB3klUda7Mj3cH2iCccpqYnm+PsLIznAVjMTUzxmmX29UZV5X3+pqBCTmneZ3La
    cE7GZ4rYM5l73vV08VLI/qgOvOOK55AR7OHp5+/hTo0G22PafnlI1GqnNZa7i328kRBmGn
    WjUSDfW4Id4zkv/vUzeNS4l8a8vAqw5GvzRR8dwbm7I2nBj517HQuhREGyLpnXGKzNXZH9
    G/pWlMYRg3JqYwwLAVlwLVXlLjCBkLNT7/Qv1sRLzHHrIOswiOMQ+Q/wYFVsP0Ne9bO1k1
    C/PqLeoc9vkr70Fq56Yrq1UxeoOhKfHMAvOcxa/MCN8UMf/uoz2H1CPpJvkVNQFteBGVVo
    YHsAC9hjNhkx4hGBFGGc3XLu5APgsqKWyaljb3QSSIzXazZz/U9NHkplzrA0v3GJMpCR7s
    BBswy8m1OFVbqm9bOgjn8xE1eDcuGR+8CsA39zwzUrvN0WxHlmUgeze9nIDUKarkAXnOZ6
    pw/SsARQ28s2FtRVAxF9lhrdLArJrnf8ttpios+OLBbi4/DGrrd7B9JHmnEU3eBdj0uIJq
    7ouSB6FGeIBPe54j1TDw6LqnjdC3VYLTTjM0d+C99CUCk/4PrZNhRf5u3d5w
X-ME-Proxy: <xmx:x7ihapkGykiuPr30phUD3nb1-wtAXQDZ4sotEZsJPeRnRi95z21Deg>
    <xmx:x7ihateITDqPhWqjHIAX0NvxqZ0URM5SfIHqOvPXZsNQtSZ9VB_HSg>
    <xmx:x7ihanFAoCSl6-c5mCaB9lkPn8zM4HeiaXu8Le89o_3xsv1EK4RR6Q>
    <xmx:x7ihajgRGMhyFkCWac8O0xh5zHXF8NsU5w8ADJEcQMK2oASwpjIEqA>
    <xmx:x7ihajGkmAX_3LXnJuqTp1Tg2byWfGGyncmKj0CIsinayecpSU8wjKl8>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 15:51:35 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Wed, 09 Sep 2026 14:51:23 -0500
Subject: [PATCH net-next v7 1/6] selftests: net: fix get_refill_ring_size()
 to use its local variable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-iou-zcrx-v7-1-6b5d48a2a922@fastmail.com>
References: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
In-Reply-To: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=2H4gOkjbkosuL2QTSh2px1EMOkBL4zBojeBjpxfKbQg=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFkLdxzRmDx70nP+WaVZBQuWttWIpsolvDHjeZn14MiJh
 MoYJ/3QjoksDGJcDJZiiiweL0VaNKZWNN5VjRCEmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKptEhj+GR+0+Df//VT+e2dkPPN3LfsV8PmOn+7nim1ya71zVqz+coHhf5Tp7T9
 ngreJRu3dc0qw20h8iUcl79OHW1ht9q548O3VRjYA
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

