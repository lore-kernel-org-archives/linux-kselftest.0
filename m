Received: from outbound.qs.icloud.com (qs-2001a-snip4-1.eps.apple.com [57.103.87.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5B63BBA04
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 21:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.87.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792271154; cv=none; b=HDO9AIslR3H3ZU0g1GkDlTG/NJg6QfOy8ITneq2QTJoZJ9Yg0TUM/dznDqQY3C8ZioU8Pp4skM/RWtUFzZ2AtLay8goyLm4zhuzGTji+On7QECkAf6KConbt2voF9FkDnwOoH0yT30yzk2QT/6IIbj0DlP/hdxtSEYEjBtW/sys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792271154; c=relaxed/simple;
	bh=bL8ihAJ8K6/rFB1Ib9ddQleGmeaAEp4AXl2TMngR9tU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OTbeEdcGamgIaAPWMGHlZZS15CbOplt2vQnwIdyXYMqzZcVKIX+YWl05Z4U1WlCsDTCuKEtDrUArCgBX3u+NbeCZs+5BOqtr67A3U0cVr8H5+jC3LI/OqWfRj9z5oKKkYY0R06QHa+3b7NWQlSZV+NuXA3bHMY9fJ823FwtGUTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg; spf=pass smtp.mailfrom=verdict.gg; dkim=pass (2048-bit key) header.d=verdict.gg header.i=@verdict.gg header.b=FeQAjs7/; arc=none smtp.client-ip=57.103.87.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=verdict.gg header.i=@verdict.gg header.b="FeQAjs7/"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-3 (Postfix) with ESMTPS id 51DD3180023E;
	Sat, 17 Oct 2026 21:05:45 +0000 (UTC)
X-ICL-RepId: 01a14baf-5be7-741c-b10d-eb7369955142
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQ1OHVwORQFEF0oBTVIPDxRcFFofVgVyBlwKVwRUHxwXXlhVCQodVwJdEVAZGQxVUEsbDlwFS1oVVRcOAkIfUB9MFldDRhgcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKHVcCXRFQGRkMVVBUEVdQC1kCQg9JA1wAWQNADEgLQwBaCkQAVQJAUw5eGUsZXS1BDkAUUBtHQ1AMDFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1792271149; x=1823807149; bh=2RioRjyecr1GTEmdraEcH7h3EEOAsdfshvoUWzXv6hg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=FeQAjs7/WjZmK9UUHB5zjGRo8qKLVrZnu3FmDEFeFtJeWQjZjP37dWFxj4EHMnKi46PsFglHz8FlWIRapdwBldEn7rpKlHJPd1p1Ic7pj9oSoygwSB3vbwrF2z+fHxqa98Cp3uVH7ToF6E2w6pkYI37g3G06C8XdoILdeoN/agF9Xx0G5cYnJsQf/c9m3Ly+odM4pr6HrlzhvVU6ep0DjKJ81pHoqr3lxjbzJWgtyi4YcuzwOjSEl2uoR+4W5Ub5mzVaDCpatWAH7Ed/l+m38tLfO9GeUrHuvwJusLZlHLNQSkt6XsW49Q8ULnAstwf1MCPCe8rFVDNu6ECvROLyYw==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-3 (Postfix) with ESMTPSA id 261D818001C0;
	Sat, 17 Oct 2026 21:05:43 +0000 (UTC)
From: Vladimir Vdovin <deliran@verdict.gg>
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
	Vladimir Vdovin <deliran@verdict.gg>
Subject: [PATCH net-next 0/2] ipv6: Cache pmtu on all paths of a multipath route
Date: Sun, 18 Oct 2026 00:05:06 +0300
Message-ID: <20261017210508.71849-1-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=YeqwJgRf c=1 sm=1 tr=0 ts=6ad3e32b
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=M-GJfg4rohwlMfOtAIgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA4NCBTYWx0ZWRfX3J1hyH8OlMrE
 KBxmifipAgzuxM21Ln2qz3C7X+6Cvr2Fr7uFNE8bcaT+5AmRC888VwjGHCt74p3TWCTnfYSQ76I
 wuar/hC5/fMS2PiPqBd3sNWVCMDb5o3QMHMjXR/i174Pu+73cH+7tqGtoQEZ8UgPFcJYsU7Bzug
 giNygu9/bbyUKcjeumHaJNxGny0OtRm40u4IQ2giI8kEzp7mVl4/+tkjIL2z7MMum5QSTcmg12T
 ubkLNjaztRUlyJYhKhXwOS003R3QUQQsNFMc1+iiLqAm5g+coSO4Gjil9IFbUjEWLO7PPUTkPCb
 HdvQn35CfCzHgLpBWqRuQcodfh6Tp+cPf4dHbyAk+WKz7Mc2TM+BPWDqnYrChQ=
X-Proofpoint-ORIG-GUID: NveupJGEPi-nB_kPtP1L0S3iPmKThnHs
X-Proofpoint-GUID: NveupJGEPi-nB_kPtP1L0S3iPmKThnHs
X-JNJ: AAAAAAAB2FxQxBnAPvwbcGZwxFOWg/Cf9ecWpttzFSsEGKjtzXKIpPkquzfgl1pYNXgYF8C/etS0obszwI0fCO9onKuSHvGG3LdTlT5uUCRi8DOZ8GbPMjQYOMrnvGg6hqOLN8H9v43O6A020dHSa8dgFu7karumQvbccdX/9xdWizKSYIatjvEDAMDY1n8sxUNq0B6J/McDpOkLPH1qnUR3eZ7EP/MsozsRXkKHhGUSAfy+SI2JcJHgwUr+Mk5LgVmtd7ITgoqRbIMscQqf7G11X7MNmiU1Fpb1aY8jizKzHCfeR1GygMqbKY/lSORy3rz77m4KGkNx6d/Pd6Lg37WGdoyoUkxCK42XK+eGdXn03M/6D11w1kkrPwSIzV7Z0jNdUO/lv3SdMKnPKcSPkzeUewvV0saOG7Z5dG4DpUAm15FRozZCcxNk997zBLBelkAA0mhHVs2Us0ErApP6wTsw+SMahN9abUuOF6TeuN3qqCxDCS/HGpWZQpKQZAF8SkgQGMBJ4rxJJWCFDDRx7Et3YEwfF4X+TexaTZHhC6wZLuJJD717bJ+M6GRC1HGwl7MP3+dYW2vfIaEE91kNWG2fkf1Qkv0sbj26KNNvxJynjEk+1tqqt2Oo5rXSvHyNIy9hX2d3YBR6+yfFySMQOqRGZh9Yq2gJgFEk4miU2a5p9VvX1fpqEIQoHiqsLJDm307P+aZdhnur9kdcmFu7tRusNA35aCngX9FS12IqwFGDSrllioj3i4MD18pqOTEY1KGkuVBAMszW6FlwqnBFtAtcPSOPc8igwoLO9aEQ6JgY5EPz2oK2Gg3ocM7eqXeqkJwWlknwAvo+oYoSCrG37JyphNTEDp1IrOkH8c1AOfuN4816Tgj6hQ36CmcqBigiqh+GrWBFrf+XKZ/1h/SXTmajUpJeYGenGV9/NFspl1shGRMjVdBNFLkwe3pDtCwHirIDqpfr8np7Ma981ow6mkDqQHLnZX+
 1yeb1nRuBS4xpVFkdUkxSD5ao7LsLBUjcAkc3JpwClkritwSYh6l2bZJ48PuCym+0dE2a7PGs3uMEy7vCvb/ZUmugXRvLbT5aUEJjDMnOvuIsZTbw177MH8fo284/lCtLjQoa2+SW1TuzOJUP9Rm47eI4MIL5luBg5o2Nc3aEwI2hoLGXSSnZqRcHJiSQ6SaTl3OYUhXKBaDvEAkuzl9CL8MSDqxFxndRrS7GEPyLZ9GxK3FNyo6/l23ZA0j9XvwNdPGJeFPv6XfdwFtZmcS13CVsPMiyX8/nWp5Jip8vBjL6S058b9+2dO3qxe84gyc1qTfo2eH/fsUUv7AJGjus

IPv6 counterpart of commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for
all packet paths if multipath enabled"), deferred back then:
https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/

Patch 1 creates the PMTU exception on every path of a multipath route,
patch 2 adds the IPv6 variant of the pmtu.sh multipath test, which
fails without patch 1.

Vladimir Vdovin (2):
  ipv6: Cache pmtu for all paths of a multipath route
  selftests: net: pmtu: Add IPv6 multipath exceptions test

 net/ipv6/route.c                    |  88 ++++++++++-----
 tools/testing/selftests/net/pmtu.sh | 162 +++++++++++++++++++++-------
 2 files changed, 185 insertions(+), 65 deletions(-)


base-commit: 98c2ad4f5d805dbc1ea436a334ee59311806a48c
-- 
2.56.0

