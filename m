Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991567;
	b=D+v3512GQxgif3Jl3Hmi3VdTT7W2zAEgETzZrT1X1dOivA/yXIj2LWPXdUY4yNl4D98Y
	 PPEvCzXaLYVw+SZBds0NuFrRgLR574tPq3NcH8CkngL5HYTyp/JN25AE85iMmd8cWw9oe
	 F3kIAjZVAd/nOavCZ7b45Chj071bxZWl4iV6g51aMZHdBTvHTWuEzA8Zo6VmxbFR36A5t
	 8IS3thRtE9NSfkw9oeOmSoCeyDBZpwxZzza8UAT6SnKFtinhtu2e54IqAJ2bjrbRdZ9gL
	 JLMneG63XGB21jPCzZC1QiAY83sZ572sT2JxOewigSYDUQtk29B+EkAynWSQraRrz5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rH7dHadXHQBCAb1xibb6d+8zPhNSRfeCjnCBhbphGSo=;
	b=vT/lB5BXlXJ8+fSfSU9t709BZr57weN3dINnKedDFvw7CD6nRIlr7gXKbKwdbnDPFmeN
	 aYiDPjLrkHaFGtfxQnQ+E7096DEoL4BdVeMSSIpLQyjWuC5pD+/h6lmHKjGYLnE8AT5V/
	 Aby+KHLxE3FPfV0jinZYSknn5Y9omXtt/wqC/TlKur9NqGO4Pp5rohnxrSScBCNty+KAI
	 RN8tBXWVhNm5ypc8Ox92vnrh5QW9/pfdMr99xDFpLnXQL+I4qb5hpkB64IpZetTkuf0SD
	 GMZK3BYHgbkU0NQp3Pt33VUQ+3hHjplxEowhS0GrV6SGP3fR5diapkv9eRfrSKtUceQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEW8WNWB;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51CA606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 08:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51CA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEW8WNWB
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b244fb7fffso777196c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 00:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991566; x=1795596366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rH7dHadXHQBCAb1xibb6d+8zPhNSRfeCjnCBhbphGSo=;
        b=EEW8WNWByczu4ke+zSMCDWYT3ytnREhs02FtgVDVy97uFVL1M63IfMMn7i1shDNIKY
         EHSikcxcfwuXcY0KfiJy6NQEm98L/FTxMsIMMWTrnD+k1ngKNWjyIYCAaCTKsf3cvtNS
         2RzaOW6cjqRgjb42qoR+vz9uP66wtSwosjEi5ZwXSudA2RIVOUvqfEqWBgrcshrgkmrx
         ZrlL3LSBpgqvO8fYOTZxP9c8C2qbTjPSLhMJ99yDNDotRugINQDbFm6lxFzBZQ8crz3w
         OXmmDDcMlxKevtFaB50JGyJVMqF2axaLqGv03HguhlbVU/sINHXD1T/jFB8xE6MrbaCE
         2npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991566; x=1795596366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rH7dHadXHQBCAb1xibb6d+8zPhNSRfeCjnCBhbphGSo=;
        b=pHaW3MYK3JeWVixozyrIylhWIy0tJD5XMpIQX/HYTQujk3TZXyhs2hRRdqRdWlFRh5
         S+hUa+Y0k884Y/qImdA3YHZk957OMv1iVzoJ5kCXO9/Ug5d95s0yHN2aJKx+EF8vBPIT
         Y6/8HXymsydafVW1I9WmvvqUTP7SucBhZ/IkhzO5ACQ5k8YcBlCo1ibJJnw+0vkoUe6c
         uFHokmzBC8NYHWuE5kUIbbu4RkblQBvbJfzMQ8w9zgPy9KGk6PkFATyF1tP91AjnSYw8
         UJZid6oXvxVF1P5eolPpohy82xKvntqoZfStS6GDudxWy4Eu9fY3yDOSpApgAH9lUKP0
         svgw==
X-Forwarded-Encrypted: i=1; AL+hErEruJTdxMPy6fj/G/du50C9Bea7a+mNWDliPZ3ap0WNYz4FoLd1aLq4vGeqcvVuT4vce3CZq+an2mZ9L6iVEl0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ggpko/EyVqVRrYKlWAd8jW+1QZexkVOP2fxiPr4lEp35ahVVs
	VTcIIyr8Ud1O2l4bLzMGlsylzwjpCyF7e9qOQ1c4Znn3MW6iH9+kau9t
X-Gm-Gg: AYBFou1S8qfCvY41qFq4T/LB6grjYpifxvV67i5vVgHNq7u9QcUcgqymGnQFdHGixFq
	1lDCdMEAVBRZ44ENxrpyl8J24loQDb3g3+f+rdZ/JYaGsl0e9GIcyKmLiuCf3X0g0jQvnYJGPS9
	G4PPzjrhHMbr925F4FOGGqJ5TRMAX79QgD1qnLdCsSd31eAChfzRK1NBfTuo58WJUiwT9zUf1Cy
	pCqZJxUlatphyeGCL/CHtDSCnzqyPDkwXb12e5r5xAHsWjrCLIguaJC6JJdhSa8FQQbr+wbGywW
	HqZOCO7qQAkzEyxdk8YfL4KSmABVjO74G22sk3hOvDYR0/wzhYhg0qkkq0qPjITb4rW2CHsrZ7D
	AUU7VM/0DtauNSLH7AhQ9ogy1O/LU1R6/TbtjRuNRZQX9MmnR4Q2JUJ/wfAe+WzrCyiV+cY6Hvm
	H7cHpgYqWzPD5OGywa/aX7cnyx4Ohr5mpWBaqcWDGx0PYq1CGFLuBSQwK4AwT1O0nUjzZ6+0ip1
	o951aZKUkLedDLJytaGTmTChy3R+hloVXAlE8I/DKiywvRg6c41D/40fAaASZjeqxDMytDypqcK
	4vg4jixlTVuc4tD4COl/qRoktxVO6jOE9DpTY1IsbVx14MfGEbgpHD7r
X-Received: by 2002:a05:7023:a4b:20b0:1b5:32d6:677f with SMTP id a92af1059eb24-1b543cfc722mr1753116c88.34.1794991565842;
        Wed, 18 Nov 2026 00:46:05 -0800 (PST)
Received: from zypulse-in-radeon-MS-7E24.lan ([2406:da18:1601:7200:e02b:e41c:8db0:668d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm7220671c88.11.2026.11.18.00.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:46:05 -0800 (PST)
From: Yuen Su <zypulsecore@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH net 0/2] ipv4: allow route dump replay with nexthop IDs
Date: Wed, 18 Nov 2026 16:45:08 +0800
Message-ID: <20261118084510.332821-1-zypulsecore@gmail.com>
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

IPv4 route flush fails when a route dump includes both a nexthop ID
and its expanded compatibility attributes. This series fixes the
IPv4 kernel delete path so that existing iproute2 can reuse the dump.
If a delete supplies RTA_NH_ID, the ID determines the nexthop match.

The first patch limits the mutual exclusion check to operations other
than deletion. The second adds a regression case to the existing IPv4
compatibility test. The route type and IPv6 changes discussed in the
earlier iproute2 thread are outside this series.

In QEMU/KVM, with the same unmodified iproute2, the new flush and
route removal checks failed on the base kernel and passed with the
fix. The three selected kselftests passed all 36 checks with the fix.

Codex helped extract the IPv4 kernel fix from the earlier iproute2
investigation, add the test and run the baseline and patched guests.

Earlier iproute2 discussion
https://lists.openwall.net/netdev/2026/10/26/186

Yuen

Yuen Su (2):
  ipv4: accept nexthop dump attributes in route deletes
  selftests: net: test flushing IPv4 nexthop routes in compat mode

 net/ipv4/fib_frontend.c                     | 5 ++++-
 tools/testing/selftests/net/fib_nexthops.sh | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
