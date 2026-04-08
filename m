Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B15126C03
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 03:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775620012; cv=none; b=HiMKEOWMTkqjKekD4ijnm8P1QHK0qCBL626SZM9cM8UpkW+ay8XAk5IQMmmJK6OZxu+kEe8C8jV+fwBh92UkSbS9TA0cQs526u3MSF4Ewi8GF8pgZA0Fhurk5IXStdNY10n4d0V77RRc42F3QB9aHki+EglZ96WXkew9X19CtZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775620012; c=relaxed/simple;
	bh=AWZaHMp5Y3kDfngrBhyXQ6IWzb5k19vWHsdSsBlE58Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kGb0UXGyfrMYn7AKDqNUGXDtExJ52UGYf3t6sA7sEUw4cMRskpTO20VTtechghSbI/ZGGnYxc9jjHZPNlzdFVapiSh3CIwEk+HnBfqs+l4vXIbHhsDxXNxd8l+tBNnnqdDsUVWdaXrOInjmiVupKAt3Yx8vWSJS+mls7/wYcjHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6weBStA; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6weBStA"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7991db3dc98so62994637b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 20:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775620009; x=1776224809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao/tDqIOqPv5CEUbM/jNG3rVTQ2lzCd5+HVzODHN//0=;
        b=k6weBStAWwGU7e/4EaKujjAn4zkk7pPs6tVouJG8DhaMr8YeiQnt8463+Z3iaf+t9c
         nvTwmjy0Bl1YeTHRt14XR0/wKvNlAk2FbbACGt3/mJOzQ9HPhLEWxdF395HN7BJVEj1V
         KsT6szKkAhipKp66h0jykg7+bxippSC0PxzbouN8GAFXJXRu1EcfmG+jToKKwsmJgJpV
         sHvHGiGBO9PO3qSK/doxvx/3fYAaXpBzgUu/6oiF7bO+B6TiEV648e75bapWMmKiVEuU
         Yx4/fo+SoipGbvcjLnakEoiUUz8tlPIYoq6/bHFSOZSVmhOLhEyghhdVCDakqOixYRDS
         wNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775620009; x=1776224809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ao/tDqIOqPv5CEUbM/jNG3rVTQ2lzCd5+HVzODHN//0=;
        b=SsPfJ5g45gCLpqjkcItcgZ8xxQ8EblpAZOuuBMsbHkh62cqsD40RFGHUjHZtcEboeP
         g6RQ/KxfFPs5SxG6PA5z+OiROX4+4Pt8fYY1Mbg+xXf1gaDemgKj7nbUtExKs8bfeTbd
         nQlCq5HMNWzok87s+XT3FrdcRohOuFWJCBYFX/Rt91KjTLHNVjtSHZM6SdJrXWCtOeqN
         coXabruYHyGhFqQL2tMTu4eQJnMUguVeiZGConDVsx0PSCPQE69353khq9dfsQg9xmbx
         9ly+jDoBU/p73a2632CitIlYm75fQvDzhI/ZpxbaoZvJDl6JQXrjkoj6nJoitjbMcdxs
         rBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY4b6EzsHOASutcy0yX2IJnPmMtGwF4n79MIiYGyI3+d78B4lL8xidk0xSgQ4ysQWT/tzmncguObVL2PQM3ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA/vvkkUHS/bR6UmVzidnWrmRKGwkQj2I/lKfOuX+LMeuq8pga
	CaujUlBX61e07R0TmdpKPqzhXB1evQYWZxa0MRlGhZWUWupHrkZGWv6H
X-Gm-Gg: AeBDievQD7qkJRIPbBzRWBYE2C/vZVEcC/n5UMSj0yAtCuM/4nu6gP7Wg0LuSHPVm2X
	MtXxJAh+f6WPojjamWIf0D7b6R01nUEHsDLooBr6PUUjMB/bxDdXn3jz36rwvdofQuUHsd/g2bf
	SyHnzhJCqz6LmVMBO/wjzL/FC2FcloVssTgRcfMCLcAlw6YC7TRYwTX0ZEj7cDSeVznXs/y/Y7v
	pTAHH3SPeyn4KkjZPSLFPGvUuFysJqbcl6PmM1sGRE3XqPr1kf8Hht3e+ZbBrKD2J54ad3CP418
	M+ENssxp8lXsNiPWrCicSeu23y49n3Qvn29LwDmp8ZQAlwL1id9u34b/asxuZj/4dNZ3hwWhDeD
	1teZz7C4PqAY1Hc3Baq8ZTCbcKKMIaFN+15G2PzE2A7nBV6l6r+LVTyp5XD02NJR36Bh84EH1Ts
	zt5qU2yBOggLitYJ3X4ooaW3q5kGhlrR+6Pbf7zoGzV9nFVs5eM4pL78ndt1mKR6kfaHhbKC4jz
	ZPt1KiMwoJWyj6hF3dAAQHgePn/VhhXWT160Nod9zFkuTtJZ6ouXOQty9gN+UBsruE=
X-Received: by 2002:a05:690c:e4a9:b0:79f:eed5:ba44 with SMTP id 00721157ae682-7a4d2ff25f4mr153724247b3.2.1775620009216;
        Tue, 07 Apr 2026 20:46:49 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370df155csm79129167b3.36.2026.04.07.20.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 20:46:48 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Cc: martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	horms@kernel.org,
	syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v4 0/2] bpf: fix short IPv4/IPv6 handling in test_run_skb
Date: Wed,  8 Apr 2026 11:46:21 +0800
Message-ID: <20260408034623.180320-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_prog_test_run_skb() may access IPv4/IPv6 network headers based on
skb->protocol even when the provided test input only contains an
Ethernet header.

Fix it by rejecting such short IPv4/IPv6 inputs before accessing the
L3 headers, and add a selftest that exercises the reported
bpf_skb_adjust_room() path on ETH_HLEN-sized IPv4/IPv6 EtherType
inputs.

Changes in v4:
- Split the selftests into a separate patch.
- Rework the selftest to actually execute a BPF program calling
  bpf_skb_adjust_room().
- Reuse a single struct ethhdr eth_hlen and initialize h_proto from
  the test case table.
- Add the Fixes tag to the test_run.c patch.

Link: https://lore.kernel.org/bpf/CABFUUZF_CWQZrRk=L9cNxO=8Z4iSgGfXi3J=hpzeyTKDbfE2-w@mail.gmail.com/T/#mfabfe7e86bb30c0141fbc9f751b8b1cb07767f01

Sun Jian (2):
  bpf: reject short IPv4/IPv6 inputs in bpf_prog_test_run_skb
  selftests/bpf: cover short IPv4/IPv6 inputs with adjust_room

 net/bpf/test_run.c                            | 20 ++++++----
 .../selftests/bpf/prog_tests/empty_skb.c      | 40 +++++++++++++++++--
 tools/testing/selftests/bpf/progs/empty_skb.c |  7 ++++
 3 files changed, 56 insertions(+), 11 deletions(-)


base-commit: cbfffcca2bf0622b601b7eaf477aa29035169184
-- 
2.43.0

