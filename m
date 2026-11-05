Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843999;
	b=ZNq81GWcKdKwC6tuYSD7pSV4EphRHWFIiqbzWyD9iPAvOCgtj96LPReLwIqpD0BkiyaA
	 43M61AHi0IS3gA7NMFNjrSMATZSFSWgefe+QHEVRN20JDVUAO4x20GIpR47lt1YXSA6un
	 Kjysmn6augmjkz++rzYeVjKJWu8i4QDlY8zL1sqUxkyOHODBdvu8C6IEkNn89+xVKiLrN
	 Sjlyco2cVRE6Ll2Y+51i2P9HIaOcEjfANkw4hlsbAaxLYR3SyE7EQVIBGsbVX3hg6qn+l
	 vC29KEAfk3/yAcKT7ZbMnynFlQ/iUPP/aVFCgX4OHPpfWKxXknJD2C7Q22FxVMiZmyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843999;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
	bh=lAgFo5cNU839HTD2kkfBJhQ4RtPbBigMz3oOPkseBAE=;
	b=gu8npuhHFSntH1yOgW5r+bnu8sVD1A++/NbmedQI33odCbjG0h2HWpw0WNNvY4UKZC/B
	 z/6yougmJbdRbmV1SzG2uMBoWlAMeBShGhurWV6AREUAA9M3C46LJv5WNCKwW2r4NWeUD
	 Y0lIjHCNB89GUCekcUeDcblVedSAax0A9qPMW5pTzQhROw4pVyK5FMYNkfOF1nL8cDBKc
	 35O74d8hDYo3rkJDmn0dq6ztH4jy+3Tv9qVp9ZdX4IgnqA14cHUiI5oHcfOi+cfuXSgVR
	 x0rG3fHMnzzy9Flxoo6GwP9G/BnVlyVM2aYuYhTLvew20x4iViw4VsTIZp0YO7MP7+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=tsL6fB0k;
	dkim=temperror header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=ZxS05IjA;
	arc=none smtp.remote-ip=160.80.4.35
Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.35])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5619606A31B;
	Thu,  5 Nov 2026 01:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5619606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=tsL6fB0k;
	dkim=temperror header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=ZxS05IjA
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6A51xCMm001495;
	Thu, 5 Nov 2026 02:59:17 +0100
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id B36AA1209D4;
	Thu,  5 Nov 2026 02:59:07 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1793843947; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:references; bh=lAgFo5cNU839HTD2kkfBJhQ4RtPbBigMz3oOPkseBAE=;
	b=tsL6fB0kHOOKmSXZZbyOGjltkpVBuvqN/1ZDxqtGg6dmQf8lmxngcmKec1kVtJrVu8jFYb
	yxbha24ImdgkF1Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1793843947; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:references; bh=lAgFo5cNU839HTD2kkfBJhQ4RtPbBigMz3oOPkseBAE=;
	b=ZxS05IjAmfgGoKwrxe6zHLAHs8OhDcKmYGR4rPQaTEFYkeTOrIAMhA6Qo2T6Nc4VaxmxgB
	Fzrv6HSrR+TAWgNUEcQzk/WVOkOPsshE2vs8BqWkM8BOVJR/kj87O8O0uCmKngD923+Pgk
	0eupUzqI1I2ofehVvjNx6sPn9UUaQfIIXANVB+v0X2/uBX18uW+QvYk+QR20+21Be4QrV+
	oKyK9AP5DAinK+/fxM9wf2xgZtEgvsMvDiHdNXtZsqwFH2uGwFXTWPWSKlUOEk+MoGYFQs
	by16kMDN0KAzH259QuR2tJnEJyTVmT+EUIDvP03BNoIP7/NFyzz45SmJltN23Q==
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>,
        Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Hangbin Liu <hangbin.liu@linux.dev>,
        Justin Iurman <justin.iurman@gmail.com>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        Ahmed Abdelsalam <ahabdels@cisco.com>,
        Stefano Salsano <stefano.salsano@uniroma2.it>,
        Andrea Mayer <andrea.mayer@uniroma2.it>, andrea@common-net.org
Subject: [PATCH net-next v2 0/5] seg6: fixes for the PSP flavor of SRv6 End
Date: Thu,  5 Nov 2026 02:57:10 +0100
Message-Id: <20261105015715.57-1-andrea.mayer@uniroma2.it>
X-Mailer: git-send-email 2.39.5
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
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

This series addresses three related issues of the PSP flavor in the
SRv6 End behavior, all present since commit bdf3c0b9c10b ("seg6: add PSP
flavor support for SRv6 End behavior"). The three fixes build on each
other.

The main one is a route with both the NEXT-C-SID and PSP flavors.
RFC 9800 says that the PSP flavor is unchanged when combined with
NEXT-C-SID (NEXT-CSID in the RFC) [1]. Currently, a packet with a zero
Argument (i.e. when the IPv6 DA carries no further C-SID) is processed
as End without flavors, and PSP is not applied. With this series, such
a packet is processed as End with PSP.

The other two are:

 - A consumed SRH (Segments Left 0) before the SRH to process. This is
   a corner case, e.g. when the seg6 inline mode inserts an SRH in front
   of the one already in the packet, and a later End behavior consumes
   the inserted SRH. End without flavors skips the consumed SRH, while
   End with the PSP flavor alone drops the packet. With this series, End
   with PSP skips the consumed SRH as well.

 - A Fragment or AH header before the SRH. This order does not follow
   RFC 8200 [2] for the Fragment header and RFC 4302 [3] for AH. At the
   penultimate segment, End with the PSP flavor alone handles it
   inconsistently: it drops the packet when other headers come between
   the Fragment or AH header and the SRH, but removes the SRH when
   nothing comes between them. With this series, End with PSP drops the
   packet in both cases. Packets with the Fragment or AH header after
   the SRH are not affected by patch 1/5.

The series is organized as follows:

 - Patch 1/5 fixes the Fragment or AH header case.
 - Patch 2/5 fixes the consumed SRH case. It relies on patch 1/5.
 - Patch 3/5 fixes the NEXT-C-SID and PSP route. It relies on patch 2/5.
 - Patch 4/5 adds the selftests for PSP together with NEXT-C-SID.
 - Patch 5/5 adds the selftests for PSP with a consumed SRH.

The series targets net-next because the three issues have been there
since PSP was added.

Tested on net-next with the srv6_*.sh selftests, including the new tests
of patches 4/5 and 5/5. The ping traffic of srv6_end_flavors_test.sh has
no Fragment or AH header before the SRH. For this reason, patch 1/5 was
also tested with crafted packets. KASAN reports no error.

[1] - https://datatracker.ietf.org/doc/html/rfc9800#section-4.1.7
[2] - https://datatracker.ietf.org/doc/html/rfc8200#section-4.5
[3] - https://datatracker.ietf.org/doc/html/rfc4302#section-3.1.1

v2:
 1/5, 2/5 and 3/5:
  - no change, with the Reviewed-by of Hangbin Liu (Thanks Hangbin).
 4/5:
  - install the End SID with NEXT-C-SID and PSP from __setup_rt_policy(),
    only on the routers of the Policy (suggested by Hangbin Liu);
  - move the install code to a helper, setup_rt_endpoints(), also used by
    the noflv and psp cases;
  - check the SID with its prefix length;
  - change the C-SID layout to xpyy, e.g. 40e9 instead of 04a1 for rt-4,
    with /36 underlay routes;
  - drop the Tested-by and Reviewed-by of Hangbin Liu, since the install
    code and the C-SIDs changed.
 5/5:
  - accept the echo request on the receiving host only if its first SRH
    is the extra SRH (ip6tables srh match, Sashiko review);
  - fail a test if the route that inserts the extra SRH cannot be added
    (Sashiko review), or if the rules on the receiving host cannot be
    added;
  - skip these tests when ip6tables with the srh match is not available;
  - add CONFIG_IP6_NF_MATCH_SRH to the net selftests config;
  - drop the Tested-by and Reviewed-by of Hangbin Liu, since the tests
    now check the SRH on the receiving host.
v1: https://lore.kernel.org/netdev/20261011192310.55-1-andrea.mayer@uniroma2.it/

Thanks,
Andrea

Andrea Mayer (5):
  seg6: handle a Fragment or AH header before the SRH consistently in
    PSP
  seg6: handle a consumed SRH in SRv6 End with the PSP flavor
  seg6: apply the PSP flavor together with NEXT-C-SID in SRv6 End
  selftests: seg6: add tests for PSP together with NEXT-C-SID
  selftests: seg6: add tests for PSP with a consumed SRH

 net/ipv6/seg6_local.c                         |  87 ++-
 tools/testing/selftests/net/config            |   1 +
 .../selftests/net/srv6_end_flavors_test.sh    | 624 +++++++++++++++++-
 3 files changed, 681 insertions(+), 31 deletions(-)

-- 
2.43.0

