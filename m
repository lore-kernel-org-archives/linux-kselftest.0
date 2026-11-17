Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913709;
	b=b0v9m9QoijpwiF6R9r2U/kwzZJ37YU2msTDLI0jrAbJCsN3lKl1tIJCsK8poBQ/sUDSD
	 eHMR9XTdnPJLgMrbOfX5iNXgHKbLKlXUk9LtgSNSye/4+Aw/VXsg9qmkaqZB7tgajpyiW
	 NqgeLN6ZFbIM5UGz1nwpZB6oZXor1ErTTLUfnbStTfgAq6IkR98fBu3K6/PHBYKbvH1iS
	 PrQWGJOjDSx9GC1bJ4LGuqZxvQkgmvDOB/6W0ZQJg5D+MI2600SnPUUD+OV7ZftzP+R59
	 aJvkHkDgQ3p4/rKeUQ7c4fUOasxYmedBDYapL3RfNU76DFycDhhHrM3LsgP6fsd1sxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913709;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:DKIM-Signature;
	bh=bElf91F0TDGB0uVW6EDy7Ea2SeZyP2p1hq68BB9tv3M=;
	b=WTNfDqCxVJ9mKPjeF42qy15sY4OnoRicslpW8ru6msUwVaoRtywRuMtMFbs25LOyoX13
	 cXiwnKawAmlQf7Mhd271TSPuWCyLoMK8BwONgvk1dRR33DEu2UdPJ5Kt/pxCdjJ0sIZy3
	 Rzl9VHnkTGdUvlUSHSgNySNvW9XW/FwZvogbqg5JlQb9Em1CHv/muAh4nYHciZfqWf0ii
	 EMFnsbIdzKiuRCWzyTR2kjQYMmONjwqHTuIzsDfY9gXyi3ykOPIIU5HR9Dn/XfLmlxlZV
	 Lzhlk4HZ0g9uC0WCbamZHxE5NcLkF3FxGdUUA69bEXmsn7xFeo/nflsFka2qQ6weoqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=DowB7CRb;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CBF606A33E
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 11:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31CBF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=DowB7CRb
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id C3A3C60CD6
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 12:08:25 +0100 (CET)
Received: (qmail 22106 invoked by uid 990); 17 Nov 2026 11:08:25 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Tue, 17 Nov 2026 12:08:25 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: netdev@vger.kernel.org
Cc: leonard@lausen.nl,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Shuah Khan <shuah@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 0/2] ipv6: Honor suppress_prefixlength in fib6_lookup()
Date: Tue, 17 Nov 2026 11:08:10 +0000
Message-ID: <20261117110813.9894-2-leonard@lausen.nl>
X-Mailer: git-send-email 2.55.0
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
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.99937) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.59937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=vUMxaJE9CM9kOao/0IjJwCXP/HS6Q7+W3oTGXUJmYz8=;
	b=DowB7CRbKriw+t/ovbD0hD6xHVK6kHKoydTbuiw+JtVrRiEO7RoQSuCHTRTjyeLmWiPVEEKrdn
	1AmYSI5+3PBr8gamW3DC7C1q4Zp6VplsCrg9Ei/56dm/m0VmipQSBhBGtwlOVsG50gQDLKF79ENT
	MyHgSXBRDKm+86/IaVpG56Wu0tgGyd7j6tjcaz8Pr+bhsOTcp0Zh5Gc99AxGgdge8hWAf4aP4yO4
	8mRvLTPGqmOjNM75avlIGDJ9QkzJphHofFklTV8L/jxuXwImpQDDU2y4sB86dgPKjO1Lv4vOoEsf
	EDks3TqS90ZrO1/MDe/E2MDHdiHV6DEx88L65biexhuOY8KzCw5Xd2vFidnU3b4bVvaJlYR5ZpUz
	D/eXtEOWeqyvKIBJRCsQq7Iayzxf93lxd9vE6TDqP9ZbZQ5UOfHafrW6rvn1VKXBqXuYK5UKhJJ8
	dkJw0fGFvjdtNnI9o/e5oasWtZ3sBiayBqUSKdnrSCDlxmWi4O+sNj0bMFhFsZ7UrRxmhflnuOKo
	bnllFfKQ5vB70AqC0ystk0DqkaedX0ScNL4Lafre09XoDjm2ynRubaVu5Vs0WbDBOKOLojfkOWsi
	lhnp5B5YWpFEPL3sCrXkWLtw13mAjnCUE4JH8Eo9JkLKvqtLLviuEDGWD16VtN33yvcQ5TzxKnER
	k=

This revision removes the cached-exception patch and its PMTU test, as
requested. The series fixes the nftables regression introduced by
1c32b24c234b and leaves dst-based prefix suppression unchanged. The
cached-exception work is deferred to net-next after the fib6_lookup()
fix is present there. Interface-group suppression also remains deferred.

Patch 1 makes fib6_lookup() honor suppress_prefixlength while preserving
terminal reject results, including blackhole nexthop objects. Patch 2
adds six checks to nft_fib.sh using its existing fixture.

Changes since v3:
- Drop the cached-exception fix and its PMTU regression case.
- Remove the PMTU-only gateway and peer setup from the test fixture.
- Renumber the remaining fix and test patches as a two-patch series.

V3 review:
https://lore.kernel.org/netdev/20261117091340.GA581197@shredder/T/#t

The rebuilt v7.4-rc2-based laptop kernel now contains the v4 series,
without the deferred cached-exception fix. All six added selftest checks
pass in normal and eight-second-delayed runs; both full runs exit 0.
Twelve separate reject-route controls also pass. The changed source
compiles without warnings and passes 17 focused ASan/UBSan callback
checks. Automated kernel-log checks were unavailable. Target-net runtime
and full W=1 config builds remain unchecked.

OpenAI Codex assisted with investigation, reproduction, implementation,
tests and descriptions. Prompts asked it to investigate VPN failures,
simplify the series and address review feedback.

Leonard Lausen (2):
  ipv6: Honor suppress_prefixlength in fib6_lookup()
  selftests: netfilter: cover IPv6 FIB prefix suppression

 net/ipv6/fib6_rules.c                         |  6 ++
 .../selftests/net/netfilter/nft_fib.sh        | 90 +++++++++++++++++++
 2 files changed, 96 insertions(+)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.55.0

