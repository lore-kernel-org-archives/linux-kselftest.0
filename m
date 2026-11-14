Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648707;
	b=mqMZEkO3fXsrJEiIdM7yUBJ6EKQ1zQCQGeSgO6D4J+mCPRcMvkz7jPCi7UdEF0Yuchuk
	 AS8TO17vKYhJ/pwrxGtl+F/ZrMQBSsSc+Ce1hW2eepcvnkWg/PNIEapmQvHfy27i8EyRA
	 b99vGJRHz5cLXkjIK9p8bCO179q457YCUT4DDV2ERuT8UBunsiEtoGtULntV3wGn8UZ+o
	 PmoIq/jfCrWwADktFpL81KAuukMzxQmyyb11uUP4zmLCP5xgx9p03ABHA68JYE3i+g/w8
	 HywA5h5VTy/auqhDhF5wVFQ7FogA1seTsjQ+gOmvMD+KVMxf0wHGM4q9UoUboN1qA0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648707;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=pjQ4hmRMXf86draSgE9PCPT1dsMh/hpnhuF72YIEcWc=;
	b=v3ISqbz9ZyIRIC/w8qYLjB7F2OpaBFZ/5DUcUBErc7/Ti2TUk+QyMA/fDuChK+sEVJO6
	 cuPY8gFoUg396tkhLP1uH6CiJxSPtdmpCneVGrLD+2EBhYnkxXZ3ywZ0XorsmkE4tgVe4
	 4mfmETCyBgT2hZWmHRulF+e/8Z1k9aVkrsyxj5QH36nzht22WtbabVpqXK2PGUXAKYAtV
	 fmHKTPGqbWKg/W4h1qwauRAnqutekW6LQTHUmp1eTMIHNPI/sxQz5OBt64dWyFAcin+qX
	 JX6X4Gxy8rSl0S2vFa2dzEfY7VUElPfqXSeWgIxj6dvy/TZ2mg9PBB/tX4oP/0+6K8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=h7RSDeBk;
	arc=none smtp.remote-ip=195.10.208.40
Received: from mout-b-210.mailbox.org (mout-b-210.mailbox.org [195.10.208.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215AB606A323;
	Sat, 14 Nov 2026 09:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=h7RSDeBk
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-210.mailbox.org (Postfix) with ESMTPS id 4jRTR35LRZzFqNv;
	Sat, 14 Nov 2026 10:31:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794648703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjQ4hmRMXf86draSgE9PCPT1dsMh/hpnhuF72YIEcWc=;
	b=h7RSDeBk2zVD3zx6Goes5KaA8oQmvjQV7nxp2dqMH9r+zyfJGOZytf//QvM4NuzPo5iu0y
	B9uy/bHcxzyJgI6CPJhwfrs8VCWpDoLlIU5+hgAhC0cq4J28W9yos48RtiMkP7PDKWzeDo
	iM9jmgrr1pdeamIM19lDfBnS+Pedl/6msLiGiOccWvS+6CYk4ryGb0siu2BdgdkFN+o0NK
	+eXTvZbbml3EqE9qUg47jrVHPPDzp4KekgifuL/n+TDGqjXytTStW9MEq75iihmGwVF2/W
	OsPEtV1OTtsctyQlukVXIW+F4kBHiEmLFIa8zo3vJZAD6fFhmg+/G5WMSvfopQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Xavier HSINYUAN <XavierHsinyuan@outlook.com>
Cc: antonio@mandelbit.com,
	davem@davemloft.net,
	dxld@darkboxed.org,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Subject: Re: [RFC net-next v2 17/18] selftests: net: add ipxlat coverage
Date: Sat, 14 Nov 2026 10:31:32 +0100
Message-ID: <20261114093133.94298-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <TYCPR01MB11008CF54ABDF98AFA4CAF30ECA762@TYCPR01MB11008.jpnprd01.prod.outlook.com>
References: <TYCPR01MB11008CF54ABDF98AFA4CAF30ECA762@TYCPR01MB11008.jpnprd01.prod.outlook.com>
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
X-Rspamd-Queue-Id: 4jRTR35LRZzFqNv

On Fri, 06 Nov 2026 21:39:00 +0800, Xavier HSINYUAN <XavierHsinyuan@outlook.com> wrote:
> Hi Ralf,
>
> How about adding a selftest variant that forces software GSO? This may
> help catch checksum issues.
>

Will do. The iperf3 step already produces GSO skbs, but veth hands them
to the peer as CHECKSUM_PARTIAL and the receiver treats them as already
verified, so a bad seed is never caught. The next revision will add a
variant with tx checksum offload disabled on the egress veth, so
software GSO computes the final checksums and the receiver actually
verifies them.

Thanks!

-- 
Ralf Lici
Mandelbit Srl
