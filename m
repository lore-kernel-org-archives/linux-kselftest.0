Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475710;
	b=3BnyfuJJKrYpQ+xs22QbrtZdM1WjPDhHI9TO7vEkDrxZsMrgs4vYM2vp+qI7vJSP58/k
	 hJJ7rr+9iLgp7XzF1Vxja1TPKiulZizCvUhxwODPcbfC16LWNrmoCHjb3dhfieBUhgrFF
	 +yZFMulXW6ZIp5mpNLEv4OYLyhEENdSthi9z77s30YOytEE2WX/tvYWtzvQaePpQU+R7t
	 xO3mz8SOoJtN1Sn0INm4MzxNwS/9jCxtyOiijuCnERUNSWhgO2BGBbLyFbTgZvAHm5MiX
	 i3BCGrlW5r3of8iMsRFDS4t91509w56XLoDrwwbOB6NEQQs3bmv6kull38ld9/5CKkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475710;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=X0YkHzZQGp+BZSgrM936DfHn7nfx5gY1Xw7CsQ3SGzw=;
	b=NYn9amRSpHHYpvxBcGJ5pIf2+IiZrqsTNe+Kff4wI/2MFNF+kREqlCldjEBFw9+nnizt
	 DZ2W9J1KBMiAxorl7MkW+8Vkq3E5ft/yt0YzQbTdHMmbyryA435NEgypw4zvoEw4RMJGD
	 TeDT8QuqqqHDfvEXd1HAr+2cdJn3T4Tt3+w+8bkJKmyGGcrBSrjx+52jD3SIgY6ZHDqJh
	 q+Jg9JTzu+9ZJ6nXCS4AWZusUjfo8p0HdswlX4RLpIbmEpxgUeGeGWwFMSkXyto0J0yjd
	 lIoCPaa+jAD7iSnfLh5rcCPYFEusKv74hEnykI2ZM6NlvyR4VkF1iq97pawCYZaYX8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tya7+ea8;
	arc=none smtp.remote-ip=95.215.58.152
Received: from mta1.migadu.com (out-152.mta1.migadu.com [95.215.58.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908BD606A33C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 09:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908BD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tya7+ea8
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E1YkdaMxIbLeUfRHHODlVmdheov0JaFnvpW0wY7+oyk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794475707; v=1; x=1795080507;
 b=tya7+ea8la0aJM9NzLcQURNTaMzl2vA3VuHe/HdBgw0UnQnwZNoPCOcHeRU/SyOSXHID2cQT
 /hbKIRAGITdJZTctJ4Hr+HgUE2+PmyB9rJQAbVciIjXCxze1y7SXFezGEQJZAhLo5Rb62WJkV9N
 ns6tbN2QqSZgS6Ti0AYEjrZ0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e96ee24549728be5;
	Thu, 12 Nov 2026 09:28:27 +0000
X-Mizu-Trace-ID: e96ee24549728be5
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Subject: [PATCH net-next v3 0/5] seg6: add End.X PSP flavor support and
 selftests
Date: Thu, 12 Nov 2026 17:27:55 +0800
Message-Id: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33N0QrCIBgF4FcJrzN+nXNbV71HxFj626ShoUM2x
 t498SIIosvD4XxnIxGDxUjOh40ETDZa73KojgeixsE9kFqdM+HAJXSc0xiS7M00JB9ij04vtBN
 tx5jUNShB8u4V0NilmFficKYOl5nccjPaOPuwlrPESv/HTYwCFRqYglqJ5t5cnutknY8n5QqX+
 IdgAN0vgmeiloNqTFu1RrAvYt/3Nx1wu94AAQAA
X-Change-ID: 20260922-srv6_flavors_endx-9489116d50c4
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

This series adds End.X PSP flavor handling in seg6local and extends the
SRv6 selftests to cover it.

Patch 1 splits the final forwarding step out of end_flv8986_core() so
RFC8986 flavor logic can be reused outside the End path.
Patch 2 uses that to add End.X PSP support through the same
end_flv8986_core() path.
Patches 3-4 refactor the PSP selftest setup/cleanup so flavor tests can
be added more cleanly.
Patch 5 adds End.X PSP connectivity coverage and updates the selftest
policy parser to accept an explicit action field.

The goal is to make End.X PSP behavior consistent with End PSP, while
keeping the selftest structure easier to extend for later flavors.

Run all srv6 selftests on debug kernel. All passed without error.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Changes in v3:
- Rebase on Andrea's "seg6: fixes for the PSP flavor of SRv6 End"
- Update selftest to support the new SID format
- Link to v2: https://lore.kernel.org/r/20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn

Changes in v2:
- rebase on Andrea's "seg6: ensure packet data is writable before modifying SRH and IPv6 DA"
- Patch 2: Update end_flv8986_core() comment for End.X
- Patch 3: Move ret check in this patch
- Patch 4: Do not remove noflv route
- Link to v1: https://lore.kernel.org/r/20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn

---
Hangbin Liu (5):
      seg6: split final End process out of flavor processing
      seg6: add RFC8986 flavor support for End.X
      selftests: seg6: move SRv6 End PSP setup into its own helper
      selftest: seg6: explicit cleanup for SRv6 End PSP test
      selftests: seg6: add PSP flavor testing for SRv6 End.X

 net/ipv6/seg6_local.c                              |  31 +-
 .../testing/selftests/net/srv6_end_flavors_test.sh | 322 +++++++++++++++++----
 2 files changed, 284 insertions(+), 69 deletions(-)
---
base-commit: c88fd6989aea9237a60a4859139a265bfb7ddc0b
change-id: 20260922-srv6_flavors_endx-9489116d50c4

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

