Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291366;
	b=wNVBXiMziu2ZCC5/8oOFbBIPuv4ptufAv1OmwBob3ubGkDpjsVS+eQXcGFbHSUWB3CFE
	 83kKCvhMyuvlil4AHC9y3u6IVGQKFRiyKb8BtjB/GSlObUgaoqctnaL/apJW8VcpZmnER
	 ukX23OdkQVM4QsB4zyDfXvhQXz1/2l9ZYY7nMA1P+ad4klWKImOqDiIRnlB2SnZA27s+m
	 dCXEmV6gL/3iIOnKrpGkPDgoeaPx+0GB6tm5E+4CLEnQ1q92YpD295Oophc5vogrHnXlV
	 Ft9mOS9QN189xgmnNU57S0A5JixL7g1HnM0/fwShOnt0D7P9NXSRDIjgAe8STwnMsDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291366;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=4rpBnan4h9EaTRrTQa5iufmTkFiE4enWZJ7KpZ2EtyE=;
	b=RHS1QFCKPmtKz9scpWOaqOZa8pKdQSvlIx2aydBjek+KMp4L44XUl46k+DLI9dooB+Ms
	 PzJVAjWabDsYyAFMgWmVcz6MACYAT75ICGXaiAXA8QBHJ6h4wMCwh2i3Z7ds2hxJ5rxhH
	 LtnWMuiF816iYzt8KPb4QsaAC4Pf7lMN/bLYopxUKa/SIQPRLaMK+h9jcPsINC7qMn8dN
	 h766mkCLRPLTuV5yp1l63eecW270ej2QApwdA+CMbHwmwUPvRhf89MEDEpgKE371JeKUV
	 oE+KWkQYWjgL8XwQaQSnQT4uz4GDGLH/Z83JWbyrA+Kjc5TvyCfXAh6LNlD/xa5p42g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=pWN+Z8AS;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF59606A32A;
	Tue, 10 Nov 2026 06:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF59606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=pWN+Z8AS
Received: by mail.grapheneos.org (Postfix) id 8868C3C08EF3F;
	Tue, 10 Nov 2026 06:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794291359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4rpBnan4h9EaTRrTQa5iufmTkFiE4enWZJ7KpZ2EtyE=;
	b=pWN+Z8AS/hTfBYDuDe04b9qDbVQFO6GjMnQyT2M3LfKbxRM77S26loS5IBQj51zdsfgDNk
	HO8nSi4rBs3bPeVjNp9sXCruwQZlONsuZ8suLASmx5UAa/WQ5kL75N2uVVZhXIgNwNXMZf
	gtvkEarX9m1FyBSubwOEgHfmCLnOHwuacpXDTzB+8fflStiOZJHhq33qk8y1aoAaVt+Y9E
	TXZiF4la6wzg8TJB1KlBDpV1JLkvSOmY953lGFTBMSmhmmr188P3L+h7lA4HiPVlAUqY3O
	w2MY8bunH1G3gS5BF6Z+khhMWHOqa5l3HvPxPjv9XcMcYq7wLc8mgFzizu4i1g==
From: liamsmith827 <liamsmith827@grapheneos.org>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liamsmith827 <liamsmith827@proton.me>
Subject: [PATCH net v2 0/4] ipv4: restrict on-link fallback to lookup misses
Date: Tue, 10 Nov 2026 06:15:32 +0000
Message-ID: <20261110061536.10811-1-liamsmith827@grapheneos.org>
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

From: liamsmith827 <liamsmith827@proton.me>

For non-vrf unicast, the on-link fallback currently occurs regardless of
the particular error returned by fib_lookup(). As a result, routes and
rules that are supposed to restrict traffic (blackhole, prohibit,
unreachable) are unable to do so comprehensively.

A specific example of this being a problem is within Android, where the
VPN "kill switch" is implemented with prohibit rules. Any process that
can set flowi4_oif (SO_BINDTODEVICE, IP_UNICAST_IF, IP_PKTINFO, etc.) is
able to utilize this fallback, meaning unprivileged Android apps can
trivially bypass the VPN. This is particularly bad on cellular networks,
where ARP is often not needed.

The first patch adds FIB_LOOKUP_REPORT_MISS. IPv4 FIB lookup maps a
routing miss to -ENETUNREACH, which is also returned when an unreachable
rule is encountered. This flag prevents the mapping, returning -ESRCH
instead.

The second patch uses this flag to restrict the fallback to routing
lookup misses for non-vrf unicast. The fallback is still always taken
for multicast, regardless of any restrictions or misses.

The third patch updates tests now that the on-link fallback has been
restricted to routing lookup misses for non-vrf unicast.

The fourth patch replaces an existing comment which describes obsolete
fib_lookup(), MSG_DONTROUTE and IPv6 behavior.

This was originally observed on an Android device, by way of packet
capture.

Tested fcnal-test.sh in UML with CONFIG_IP_MULTIPLE_TABLES both enabled
and disabled.

v2:
- Restrict the fallback to routing lookup misses, instead of only
  honoring prohibit (-EACCES).
- Add FIB_LOOKUP_REPORT_MISS to differentiate a routing miss from an
  unreachable rule.
- Split the comment update out into its own patch and remove the
  signature.
- Enable all of the commented out device bind tests in
  ipv4_ping_novrf(), add a route miss test and update the UDP test
  expectations.
- Target net instead of net-next, add Fixes and Cc stable.
- Drop RFC.
v1: https://lore.kernel.org/netdev/20261019032406.88874-1-liamsmith827@grapheneos.org/

liamsmith827 (4):
  ipv4: add FIB_LOOKUP_REPORT_MISS
  ipv4: restrict on-link fallback to lookup misses
  selftests: net: test restricted on-link fallback
  ipv4: replace obsolete routing comment

 include/net/fib_rules.h                   |  5 +++
 include/net/ip_fib.h                      |  6 +--
 net/ipv4/fib_rules.c                      |  2 +-
 net/ipv4/route.c                          | 34 ++++++++--------
 tools/testing/selftests/net/fcnal-test.sh | 47 +++++++++++++----------
 5 files changed, 51 insertions(+), 43 deletions(-)

-- 
2.47.3

