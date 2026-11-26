Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674464;
	b=3Z0AYs69TfAF85r26mkuLAtEg1LMvjm9+1fOf5rQPzfL3j8ror9BaPRnTfM7ru91u6xY
	 ZKBfpENKoa93QoygythbGu5Q/igHOCoY1kDO6wGzMl+sKoyqTRdAxHMhz31JuHpzEvV/7
	 NbkdpdO5/HZ8QBI/s/Lb+lLkWFJFOYXQtI4iyNt/VT4spqE5H7mh7Hnf+Zz2Dfw+2j4vm
	 iEx9YirGLW51PWSNOoEkLq9eWl9tkYP3FutpNQtoFySsRVaSmSo1Fg2kA2C9cgIYA1KGd
	 HsXcp0xsU8q0JPE5Yo8qdFGzFTcSVYBsALppa6BpMasCCF58jJjyBt0g15/248Nkglw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674464;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=13XRomopXwt6Q1hpq9aDhpwOMkQtlN9+yFQSEusZX1Y=;
	b=fNUloJWs3mVBEm1XBzHJooWB3e8bw4ZJDRLbtNQlhoohQVQLV7QhMlJ6SwrexmirGmOQ
	 eZ9ef0FRQNM+1Wi+R/6ajvuC8ymCGJMP2QdCbXz2VfyVsnmj3h1SWlNATy0wTC0Ds8mii
	 yMhavqN83nuPy5rFOQZq8Z35mPnDSFtZPPEpiwlHnWBL7zLnAOjymVDMm2KP9Gx/hP5Au
	 +c/jfXgdoEVjOfK3uIul/BLG5fPXZqyctp+z+MXpASYa+7x6APlNyixvhXPWdyDn3J36c
	 MlsFaydm5S/GE45cBp0/iDZfKZtW5yvrFRm/7+C6n5WRfTYFPYZ74HbhL3KKaefJAXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q2uzKyUW;
	arc=none smtp.remote-ip=95.215.58.208
Received: from mta1.migadu.com (out-208.mta1.migadu.com [95.215.58.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7399B606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 06:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7399B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q2uzKyUW
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SzKF0geNnY3hQJz+ooTlCMfDo+JXvPqOuz4T1XRzYAs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795674461; v=1; x=1796279261;
 b=q2uzKyUWmYW76gWww2TN06L8nxMqkpe9D0yNRCFWfn3Eth4vYVL4MGDfjedQfeLLBYkfj+S2
 U/hl/BA9Qb+L8KJSjyFAjVInQog3p2v5iG8ObAOpn/kcCdo8qXvTEHA4ke52FSLOWykyBE59rJz
 /AYCMHUYPKuVphS6DPe7dVM0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id fc064d7af9643606;
	Thu, 26 Nov 2026 06:27:41 +0000
X-Mizu-Trace-ID: fc064d7af9643606
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Subject: [PATCH net-next v5 0/5] seg6: add End.X PSP flavor support and
 selftests
Date: Thu, 26 Nov 2026 14:27:22 +0800
Message-Id: <20261126-srv6_flavors_endx-v5-0-4d8232eec404@kylinos.cn>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OTWrDMBAF4KsErauikUd/WfUepQRbGjeiQS6SE
 Q7Bd4/wIm2J6fLxmG/ejRXKkQo7Hm4sU40lTqkF9XJg/tynT+IxtMykkFo4KXnJVZ/GS1+nXE6
 UwsIdWgeggxIeWbv7zjTGZTPfWaKZJ1pm9tGacyzzlK/bswpb/49bgQuOQYAXyqMZzNvX9RLTV
 F592rgqHwQI4fYI2Qile29G29kR4YnofgiA3RVdI7wDY4ZhCE6rJwJ/E7srsBHSog8DWiSiP8S
 6rncAjmXdhgEAAA==
X-Change-ID: 20260922-srv6_flavors_endx-9489116d50c4
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
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
Changes in v5:
- various fixes and updates on patch 5, suggested by Andrea Mayer.
- Link to v4: https://patch.msgid.link/20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn

Changes in v4:
- Thanks for Andrea' reviewing. All the changes are based on Andrea's suggestion
- Patch 3:
  - always report on every setup error
  - keep adding proxy entry __setup_rt_policy
- Patch 4:
  - update commit subject and description
  - defer proxy route
  - defer setup_hs_lo_addr
- Patch 5:
  - add helper __get_srv6_node_id() and __get_srv6_adjacent_id to get
    node id and adjacent id. Remove __get_srv6_rtcfg_all_id.
  - merge three __get_*_func() to one __get_func() helper
  - update build_csid() to use the 2 new add helper
  - __setup_rt_policy
    - add a check to drop incorrect policy
    - use get_rt_sid() to get the policy
    - read the element once, and pass only what setup_rt_endpoints() needs
  - add a check of the kernel support for End.X PSP.
  - add a own SID for each adjacency
  - add consumed SRH testing for End.X
- Link to v3: https://patch.msgid.link/20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn

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
      selftests: seg6: explicit cleanup for SRv6 End PSP test
      selftests: seg6: add PSP flavor testing for SRv6 End.X

 net/ipv6/seg6_local.c                              |  31 +-
 .../testing/selftests/net/srv6_end_flavors_test.sh | 614 +++++++++++++++++----
 2 files changed, 543 insertions(+), 102 deletions(-)
---
base-commit: 4cd558c2f1de7f1800f7d9065303ca5833cbad56
change-id: 20260922-srv6_flavors_endx-9489116d50c4

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

