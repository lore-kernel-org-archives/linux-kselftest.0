Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538648;
	b=WOH68iU61AeF26Tl+baKoRVqJzj9JQU3L31kYuvPt4Ai+WzgsIuIge5B/KhVNTvU3yyL
	 x9uqL3WnaM6kdOmOpHXp1A142rQv3fuWxWvwm2RPtZJ55j8Y6XP6R0zQoOEnzQjQKikKd
	 7vToebH8pEMxVAkL5OQ0ZXkMkxFXStXyCgnHObXTfHBUPHDQl4r4SNdAiV46r7+UTzzDG
	 rIXz/CnkCQUUfxDD65YXeiMyojWN613gPlmP9IHjXttC0DWsQmADdffSYyvr6qwesakuC
	 yVLWqAZ09xWHh/wcLQFQ2PjXmH9eHcIHu3Fw5F5KPQ2Xr5nrUd+ZRG7juwI+9yxRxzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538648;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=U3xnSH+BmaWYcojS6vbFOMgwGWNHdEs82Sghjm/1X/E=;
	b=C7XYGvIsFkq5NZ4kye2B9TxzIH3Y4/YAk7+uq0Nh1SzT2DLhDDEEhEVdWwpc1KiAaLA9
	 zvU1bmTJsoKOH5yt7ZHkto5oexfrLgVq/VBGvH+Wqa12QZ2k2+V7d0ABOaaVw+GoUayTw
	 cEmIs95T8RqTqWP9lHXURq8fMknyy6b8vE/ywY8wpvb9iJjSkrKxbn6CTc+6uxBBmxmra
	 Ba5y5GzDpsyi7tqcnlcR5qqkWTfDrnBdZtsOmh47aXVBPtEYtkHPyAvwMHC2pNp7JXgcn
	 4A/T8koHOCE4G+IwL+sRAFx/OxgEAdRDa4bND0XVMnrMQMEvQGAP5xmbBuc0QjiPLzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHHYFuK+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F26606A330;
	Tue, 24 Nov 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHHYFuK+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795538647;
	b=yy22FEfsnzQLH7g2usbnb5eX/0am2FRhHB2npE/zLF6Og8DVnLroB0xzIPKsYFLW38V4
	 npoFAGEfx1MmIMYA/OiJO5AZ1mWJTD4wtpn0+TCwT+QXwQTwDaej9B1N+RrDGmRPy4MeU
	 OWxJVP0C5o8cfoS6Z/hDcHC7wm++TmDTMzO/cOdLkfBa7++YcNwZq++t26z+LiFETa4F+
	 2BVUD+Zau8h+ndfGcSs9oXc81dVT0i7g9Vez2ywc7P7RTF/AHi3cKMG4BuyQDsVAETPIr
	 UT4Ix8YDOS3q+S4CCpscPgOAREqmOkxdpTG8Nkc2qNmNrF/rB1+bPcKBq8l5vCIhhpA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795538647;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=U3xnSH+BmaWYcojS6vbFOMgwGWNHdEs82Sghjm/1X/E=;
	b=Zv0K9koEEpsk6tgCFZNEyazTaPXpSfREeZJMxEEdrYKgz2v1+wfptValUR8K6qI2g/l3
	 QJelpmrqpDN0vxndbPzTS8h5WbVBUKoW8qIhqAzlOe0zIJywuK9HhXZb9FiZqTN6tQm1x
	 n1f4SBLUK9cPEaguiTkArGmcWrRpPtjxqUPOmHp1LnQpBEdV1mJYeNRCpSGqq80Mmt0eD
	 upYr6YI0FjxxPrWSTEjeYg0Ex3JJcjm/eCgS2eiNP9hd+55PwWC3lNgvxLE8HdPnat1C0
	 u4K4bfoOiwgm5Mcr5ohpoOd1n9xdNe8yUdIYkI2SZklEO55m//B8GBLkm+0qmpRsvAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 138C41F000C0;
	Tue, 24 Nov 2026 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538647;
	bh=U3xnSH+BmaWYcojS6vbFOMgwGWNHdEs82Sghjm/1X/E=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RHHYFuK+EbcMGqn+CLHRLz+NcwD5HH0sr4QqHI9Xu6Cdt+/X8J6C2/b1GF/s19D+Q
	 4JsCdowIN4M3MXk1wMj8jr1wxmS82xSfsGZ8hgJDs///klQdvPF/yg8qIE2BdY0zR8
	 wHvjurcHs4itoGCBPOBCdGVZD6f2SXqjiB3eeFMkZdVnM0IlIJcFiPQr9mSHR0wADP
	 FpcLiC5gdm5eMVBYJozCauOHHuPl+zsgyYSgkxuk7vV815QUX305kaQibjn5yv0BgB
	 JbwGCOu9LJIcIXn3tOSUZSBkdCEUgr3i5eZcPrZr8MIPpVrrLamyp2Q8dmPVI4dUZS
	 BpqsLEXyqP0dQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 622404CACC;
	Tue, 24 Nov 2026 16:43:51 +0000 (UTC)
From: "Louis H. Poulin II via B4 Relay" <devnull+poulin.louis.student.oaklandcc.edu@kernel.org>
Subject: [PATCH v2 0/2] kunit: tool: Preserve failures in parsed KTAP
 results
Date: Tue, 24 Nov 2026 11:43:50 -0500
Message-Id: <20261124-kunit-v2-v2-0-e1adbcad6b48@student.oaklandcc.edu>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3ezSvMwS3TIj3RQDi1QzS0szCzNzIyWg8oKi1LTMCrBR0bG1tQB
 9Lc+LWgAAAA==
X-Change-ID: 20261124-kunit-v2-d08e69968672
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795538631; l=1626;
 i=poulin.louis@student.oaklandcc.edu; s=20261123;
 h=from:subject:message-id;
 bh=FMmuGf0BvxD0W/kVIvoDe3PsvdyB9kbT8Oxfr84qE2A=;
 b=R/6HJuE+JO6Wx1KCO8BgcX6FZE6aa2X3Rvu4wlCprUZwj+kKrgu17Au3kouPr40TRp1JSvJ+Y
 4wbeMPw5Du6A0CVyEIQ0own1xh0BDIFU4GpSTjxToTP3TXJe+XqjMaS
X-Developer-Key: i=poulin.louis@student.oaklandcc.edu; a=ed25519;
 pk=LwBiuOLz0gqWTufz54rXgw2coado8UrJcWQ13DbYfxw=
X-Endpoint-Received: by B4 Relay for
 poulin.louis@student.oaklandcc.edu/20261123 with auth_id=1616
X-Original-From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
Reply-To: poulin.louis@student.oaklandcc.edu

The KUnit tool's saved-log parser does not consistently propagate two
failure conditions. A suite reporting not ok with only skipped children
leaves the run SKIPPED. A result with an out-of-sequence number can
still be counted as successful, so kunit.py parse may exit 0 for that
malformed log.

Patch 1 preserves the suite's reported failure in aggregate counts.
Patch 2 marks out-of-sequence result records as failed. It depends on
patch 1 for a malformed parent suite whose child tests are all skipped.

Tested: kunit_tool_test.py (100 tests, all pass) and strict checkpatch
on both patches. No live kernel run was performed.

Changes in v2:
- Resend using b4; v1 was mangled by line wrapping in the mail client
  (reported by David Gow).
- Rebase onto v7.4-rc1; no changes under tools/testing/kunit since v1.
- Patch 1: move the Fixes: tag adjacent to Signed-off-by:. No code change.
- Patch 2: no change.

v1: https://lore.kernel.org/r/CAGQButum4PYb4A%2Bhmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com

Signed-off-by: Louis H. Poulin II <poulin.louis@student.oaklandcc.edu>
---
Louis H. Poulin II (2):
      kunit: tool: Count failed suites with only skipped tests
      kunit: tool: Fail on out-of-sequence test numbers

 tools/testing/kunit/kunit_parser.py    | 15 +++---
 tools/testing/kunit/kunit_tool_test.py | 92 ++++++++++++++++++++++++++++++++--
 2 files changed, 98 insertions(+), 9 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261124-kunit-v2-d08e69968672

Best regards,
-- 
Louis H. Poulin II <poulin.louis@student.oaklandcc.edu>


