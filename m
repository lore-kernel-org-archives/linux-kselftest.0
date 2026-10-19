Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F991FBC8C;
	Mon, 19 Oct 2026 03:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.220.120.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380727; cv=none; b=UxVe8luogbvr3/vi5B1pUNDbWtiMKRu209vAMfKbvZB+VuEuQ3jj0Zbh/ZtHGSt63lipJuTyuAmBXvZoaZHyU+N5hbH7J/+rBhxkGatHpu4xNtSTviz/RGtOASrMeOzobQQhRJGdi+YTYo5lfQSr/AD2hTzcuU2XQu0H6H9PfHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380727; c=relaxed/simple;
	bh=2LchfmMXqEkp53a3MK8snehWYjHNIdRHlq5NnjKSkDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezfnMU+lMyGYvZg7np7d90eJLdQodE8ejifY4KaVVPA3u9a3sC1RiIw/YsD6FTZewqWqWOt4wgc+GncjqIJxbgPT+KpLO9n/YQtlGrCuUfYfe2JmZE4BraBCVLQMkr0N4FfLnzd0SkfeYYMocyUfP0jCQRAVIehWZZ3BnHIKLlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org; spf=pass smtp.mailfrom=grapheneos.org; dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.b=OM9n8N97; arc=none smtp.client-ip=206.220.120.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.b="OM9n8N97"
Received: by mail.grapheneos.org (Postfix) id D756C3C08EF31;
	Mon, 19 Oct 2026 03:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1792380278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oSaKTkm2VoVYXs44XIPo5O2omjJiGGPW5XaCPiUwhFw=;
	b=OM9n8N97E+b0n763nYK3x+/X4wBrkvBi3Qs4ng4fS0hzOQKlSzEnomIh8f+eoNoQhnoN/n
	32t9YnWb1NhymfmLKlIi0qnsM+YpV8i/eQNrCRsQoWiqbyoznOwxVeMP4vrMdihVZA3Jli
	MY/ilg/T72pnexTIHUNMdo/jKR4TgaZPa9exW59MaMPIFBJHUUAvPxy8V8fXdPWAh+fwO2
	jT46kV3WTTFZfSHCa9icavxMRP5MnhSKOCk1t+WIy82cZNXX9bfBfNIVcbrh2EiwDtDpqz
	JwRehjK1p+iwkVgTPGmh22adIcIbh1ug+3tsGnJqF3Q6sQ9WPyTHD7oAI6IL2g==
From: liamsmith827 <liamsmith827@grapheneos.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liamsmith827 <liamsmith827@proton.me>
Subject: [RFC net-next 0/2] ipv4: Honor prohibit when oif specified
Date: Mon, 19 Oct 2026 03:24:04 +0000
Message-ID: <20261019032406.88874-1-liamsmith827@grapheneos.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: liamsmith827 <liamsmith827@proton.me>

This RFC proposes honoring prohibit rules and routes when an output
interface is specified.

When flowi4_oif is set (SO_BINDTODEVICE, IP_PKTINFO, IP_UNICAST_IF,
etc), prohibit rules and routes cause fib_lookup() to return -EACCES,
but still allow the packet (and any necessary ARP) to be transmitted.
This is documented as the expected behavior in the tests, but is
confusing for route and rule maintainers.

Android uses prohibit rules as the basis for its VPN "kill switch", with
the expectation that any packet encountering such a rule will not be
allowed out. Due to this interface binding exemption, apps can trivially
bypass the kill switch. This is most serious on cellular networks, where
a connection to an arbitrary IPv4 address can be established without
requiring ARP resolution.

The first patch preserves -EACCES from fib_lookup() instead of
constructing an on-link route when an output interface is specified.
This honors prohibit rules and routes while retaining the existing
fallback for other lookup errors.

The second patch enables the existing test that expects an
interface-bound ping to fail.

I would appreciate feedback on compatibility implications and whether
this change is acceptable given the longstanding behavior.

liamsmith827 (2):
  ipv4: Honor prohibit when oif specified
  selftests: net: Test prohibit when oif specified

 net/ipv4/route.c                          | 11 ++++++-----
 tools/testing/selftests/net/fcnal-test.sh |  7 +++----
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.47.3

