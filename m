Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83682EEE84;
	Sun, 11 Oct 2026 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746666; cv=none; b=tPHMM7CipNxrULKDGAs19EHkaXHumeoFRCg1Y11ieBelWWa/AHU9O8cc/RyEwm3yimOW3axEMEGAbRaAk6W8+5SRVXBcg+r7EFYfImwFJgJN1M2u8ZgYUd2/CJUu97lOSsFss3nEsotTgnLSy4PqNDnmD0PWqHUaI2daicbXCG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746666; c=relaxed/simple;
	bh=6z3edQlEDvC3IkHzHgPv3UOI4/fS4rwWs0AqgCIdqoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MqoQPVejRMsyK1ApUzYoyvn5+tBYs05EggsteG8JD0x27ghemkSEWqit3J/PmYUHy5KQtEj4k1aRDRHxViGIfSZSmfNUG0WRiyceFUdxOODi3eRN1aSRmHmHtb6PmgYcTnxim+jeOCPETtG17pngpsDZDW8x/3FyHIt9k71mDqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=u/ZJ+GuB; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=ihOdGZ/0; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="u/ZJ+GuB";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="ihOdGZ/0"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 69BJNbfe010945;
	Sun, 11 Oct 2026 21:23:42 +0200
Received: from localhost.localdomain (unknown [160.80.105.87])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 94916121E31;
	Sun, 11 Oct 2026 21:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1791746612; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:references; bh=RqIShypECdIvl2ppW+FzNE+VyiErw29bDc4KRYaYcfs=;
	b=u/ZJ+GuBp3S24vw6iaTMjKsYOhrPqQjcVF65qQTDfRHeGDGknaXJY9MD7XddnhgSDA83n1
	RgiroZC7VzEu/lDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1791746612; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:references; bh=RqIShypECdIvl2ppW+FzNE+VyiErw29bDc4KRYaYcfs=;
	b=ihOdGZ/0dKsv7wyrMyN0j1O3hxZU4yzpiScc9k4aJ4n+hLz0rvk58eWJVCN2MJnR+Zpdn1
	uvPbmjNutHu6R/vWVHSdD3CqPRTbSncV5VBFRXKt3nYZ+Mr+gufCsmf7o5qVdUReNDmPTY
	Pls0y9pecOt9yL3HIgyJqTHzXBDtpsRG7YUcqbvCMFnP2w3Wh+IKhgjgM6eSi9+j5aKwQn
	mrMpnzFfcoElV5E92igmvHLuPF8GF+PUzjlJHnTVCvQKK5qvDxw616vTiU9AaAbJRRHEY+
	yPPHtAQvBja4aw8GNZs7YwZSFet13SJXyjoGpMmRVdi2IlL3zYM+oozKEt3RnQ==
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
        Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: [PATCH net-next 0/5] seg6: fixes for the PSP flavor of SRv6 End
Date: Sun, 11 Oct 2026 21:23:05 +0200
Message-Id: <20261011192310.55-1-andrea.mayer@uniroma2.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
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

Thanks,
Andrea

Andrea Mayer (5):
  seg6: handle a Fragment or AH header before the SRH consistently in
    PSP
  seg6: handle a consumed SRH in SRv6 End with the PSP flavor
  seg6: apply the PSP flavor together with NEXT-C-SID in SRv6 End
  selftests: seg6: add tests for PSP together with NEXT-C-SID
  selftests: seg6: add tests for PSP with a consumed SRH

 net/ipv6/seg6_local.c                         |  87 +++-
 .../selftests/net/srv6_end_flavors_test.sh    | 373 +++++++++++++++++-
 2 files changed, 444 insertions(+), 16 deletions(-)

-- 
2.43.0

