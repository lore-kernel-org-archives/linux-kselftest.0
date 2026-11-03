Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706639;
	b=c/CyCSdWcvuwQerogu8YctX6jFtdhAGp9IdvKLJD2xLWV91UNtI2btpV+dXujaBDCDvh
	 z4mXntHDftUjAs6dQLxxUhYKzZ2FaUzqs+qXh8uND/kdgvaUAnI1s6+XVR/o9SyQ+dcGX
	 gLYlTYdhadPxRh1XC1fErUWqx2ZAKS9gNyf4AVSjaZrs+UgRWb41fGhyyZeOR2LbvLZKH
	 i+i/jD2lgh5LA+JcpR2mgsit2ajg96A8X12UluQ66xAkYaW9m9ASMgKQyWBWbaj6022um
	 8hsZqT+TcoJ5g0Zq/Q4vdeJgOt1nw5dzNv73ZDu7zLhay0LmGnkTLKjj9yMUcydKPoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K2XfEeUcN1jWTOzmdT3RYJ78fSiNTv4T5ATMrI0edQw=;
	b=YbBjPokcNQUa6dUdwhVYWBK3UQQFyml7QuYrtxDe8wWQNm6IvLKc5YiCe4S06sU29pEA
	 vZLY8zhWgaaPTFL9rgTOSw+XLnSAznvLHMTsyoauVXwiHOJE37k8BEuC5xr6pfk9MWikG
	 LBQuL23woW7vh1tgOhb2DbrA28sV/wBICJK6ksugm/tlVRmcUPAwvza6nFik4MbNyM0Cc
	 JymrXkLj7pvcoFjhjJkTlVvMAvchvCCI3JmlyoZKvjlgG0edQKO4xoGgu+l9YUv7+Vwh4
	 zBef3DMQAWMirWDd/IzKz3eo8M8QMAsjJCqB81TGoBLnw0EzwVQb0TUp/MmPH1n2gMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=SM83Qf9N;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE338606EEB1
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 11:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE338606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=SM83Qf9N
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0a921ee46so34996267b3.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 03:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1793706637; x=1794311437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2XfEeUcN1jWTOzmdT3RYJ78fSiNTv4T5ATMrI0edQw=;
        b=SM83Qf9NT+SVsUiUy+tTcJBP+bhj27xdLr5TwKW9X3AhPEMUBFKimxyNr36cGB9ybP
         PWWD7bW/bpvEE6UX2ABkt5nox7TMUIHabOtmOqNpki/3A231PcqnuD7DiSnq3wHohoiR
         SnQ+C12ADuw0H7Vo/DhbHdpyPmlSW2yLlyiCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706637; x=1794311437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2XfEeUcN1jWTOzmdT3RYJ78fSiNTv4T5ATMrI0edQw=;
        b=S314oUKUOINrxyVBSgSRuDKfjYv0wirewQVn2F7E+n8WxiHgmILSd4o6EN2DA0spMU
         pdc4Ii7scUjXQ3NBTbBHDhsEltzhP6TSMejw+kFXHStuTpSLzm3BHzwT8J6tp2PDSZb7
         ud+lw6D+IqO+9Lki6MjgrUBw/i9JxQKGHvXVmMTlYu6rKF19iJ7AD612/qYwAkCg3Hb1
         DOO+Ltvb9mihiP4BG69NSopJsGbdt3c7kvzmnDMiC3t3ijXjN6eUMeiIn++gpa3ha95y
         wZb7QaeUgtZRtUse5+nEuReBsCBLEB5+zMJ9F/J3w8RCvLvFdxyNgONyqdiPIaCl1RQV
         3naA==
X-Forwarded-Encrypted: i=1; AKwUvBywUgEHtIi6kvPxOh/DQ3tQG+PfvmhUKD8F5/2gItiFX0HJTQOBPxdR/qML/tm04yCg/Kr9uaGEWj9lqzwWcAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L/pfpQSWtGKCk/wwKFRkTDoA2kx/Uy+oWCZSxsC3sXLrDGQdU
	ok5b9RjQOgp3qFv8YL+Q4W7lNDIoKbOMXAddP9vfVu0pMyH5CWGW3CFZXylB/9776g==
X-Gm-Gg: AYBFou2PDRcx4U61WIaQdcm4vhS5Wy4wAqXb53a43/EusS/gPhCChuihvYJWyvjsJBU
	tLPJtvEyUJTQxnOxxaT7ROmNrDbBYqIwUORpD7vwl+0uJaGYaARQ5XeEVH6oOeBraTRE/6eLGQr
	lbxKt0BnFlVqnWhzju/Lc1x1Sq+LGPgQSA3CTdRTiSn8nmq9b05CcpW0Saii0o/rXeuUfkEibT3
	b87h5vH1GucpuFBxvAMkv5PGcm7+hBFWJllXrQCSvk9AXU05JTKxUaZBrXcBI24ItmGyeCCWzxa
	Y2fJbpA7vves14drz8UMEVh56pQoiUGeYYk2M0zAc+cBOmbY0KCi3iOwXCIxYqpaPTTflWzPM4y
	dPQp7lNw6KfZZDkU+2UMWEzwjIYRbuFJnt2sF8ALrImYneXeMp0rAPFl1z81pzkv2kQgka7ONTp
	eYKOntHfJOy8ZMVbcqh+Ow+ss1RNdKQGIlZ0OQbL7CG0CCSUac0uPY9drmRmzGRVjuQC8qDpq/p
	a1nYlzZaHhm8Zc/n2CpJF5MTQ8I3F4Mr/nA0tTSuNaRjnLy3V11Emc3azPmUM2k44ED5TE6wLOV
	P67lTbeQK4Z9mpGClMMI+H8IU3mch7v5gKI9M7wkhNgQbN0BqvFPpSB2h/xN537w9YlraHUHwKN
	CeoR9bzqtB6Ofj7w=
X-Received: by 2002:a05:690c:fce:b0:8b1:738a:b44c with SMTP id 00721157ae682-8b2b66c780bmr74176927b3.23.1793706636793;
        Tue, 03 Nov 2026 03:50:36 -0800 (PST)
Received: from mbili.tail33bf8.ts.net ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b704d699sm70016857b3.5.2026.11.03.03.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:50:36 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	stable@vger.kernel.org,
	shaos <shawnq1@163.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Victor Nogueira <victor@mojatatu.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Tom Goff <thomas.goff@boeing.com>,
	Shuah Khan <shuah@kernel.org>,
	Yotam Gigi <yotam.gi@gmail.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 0/4] net/sched: fix short-skb metadata and namespace boundaries
Date: Tue,  3 Nov 2026 06:50:28 -0500
Message-Id: <SER-NSBD.v3.r0.20261103064310@mojatatu.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes three independent boundary problems in net/sched, and
covers the third one with tc-testing cases.

1/4 act_ife: encode a configured zero metadata value.  The u32 and u16
presence callbacks reserve an 8-byte TLV for a configured zero value, but
the encoders returned without writing it, leaking stale skb headroom bytes.

2/4 act_ife: require a full Ethernet header on egress.  An undersized
linear head can make the encoder read past the end of the skb data.

3/4 sch_teql: reject qdiscs from another network namespace.  The global
TEQL master lives in the initial netns; a qdisc created in another netns
could still mutate the master's MTU and flags.

4/4 selftests: tc-testing: cover each of the two teql attach rejections on
its own.  Case 124e moves to the initial namespace, where it creates its
own device, so only the root-only check can refuse it; a root attach from
the test namespace is refused only by the namespace check.

Origins:

1/4: reported by shaos <shawnq1@163.com> with a reproducer, which was
reproduced and verified in our test environment.
2/4: found by Sashiko (nipa and gemini) while reviewing Victor Nogueira's
parent act_ife patchset; independently reported by shaos
<shawnq1@163.com> with a reproducer, which was verified in our test
environment.
3/4: reported by shaos <shawnq1@163.com> with a reproducer, which was
reproduced and verified in our test environment.
4/4: follows Sashiko (nipa) reviews of the v2 posting, which pointed out
that a single case cannot witness both teql attach rejections.

The four patches are independent.  They target net and the three fixes
carry a stable nomination; the test cases do not.  They are sent together
because they share the short-skb and namespace-boundary review context.

Jamal Hadi Salim (4):
  net/sched: act_ife: encode configured zero metadata values
  net/sched: act_ife: require a full Ethernet header on egress
  net/sched: sch_teql: reject qdiscs from another network namespace
  selftests: tc-testing: teql: cover each attach rejection on its own

 net/sched/act_ife.c                                | 13 ++++----
 net/sched/sch_teql.c                               |  9 ++++--
 .../selftests/tc-testing/tc-tests/qdiscs/teql.json | 36 ++++++++++++++++++----
 3 files changed, 44 insertions(+), 14 deletions(-)

Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---

v2 -> v3: considers comments from Sashiko (nipa) on the v2 posting.  Case 124e
ran under nsPlugin, in a namespace where the teql0 master is not present,
so the namespace check answered it and the case no longer proved that a
child attach is refused as such; the case added in v2 covered only the
namespace check.  124e now runs in the initial namespace and creates its
own device, and the namespace rejection keeps its own case.  Both cases
were verified to fail when the check they exercise is removed.

1/4's and 3/4's diffs are unchanged from the v2 posting, so neither carries
a changelog; 2/4's Fixes: tag now names the commit that introduced the
unguarded copy.

v1 -> v2: considers comments from Sashiko (nipa) on the repost2 posting.  The
cross-netns check in 3/4 ran before the "teql can only be used as root"
check, so every case it did not catch was answered by that check, masking
the assertion that tc-testing case 124e makes.  The root-parent validation
now runs first and the namespace check second, and 4/4 covers the namespace
rejection on its own as suggested by sashiko-nipa.

1/4 and 2/4 are unchanged from the repost2 posting.
