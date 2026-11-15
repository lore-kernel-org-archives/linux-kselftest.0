Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794761103;
	b=b6qDvPqICRiyN65UR5r8hS6b9UTXZYxs9Q4U9sKZ0QHRv9ZuZvTv50/2FjEUtGeMo4+T
	 ka1s4LRWhwUp2b/ggst4MHIpIdUSgPmw0lVijcE/kRLfiHdIefZo5MSJoH7+qxQ6vJRle
	 gEXOCGcl7nWITekc81rK6pSw/nK0jqWW6/1KZmFwbxiDJK1zLJYsBbJyigR6CY7qLCFVJ
	 D3C7NoBl3ArtwF7toYAmGRGOcZSD5rv7YFTbpU55D02Q68+5Z8FNkAhsrQBiH6eRl7irB
	 Rm9dqhvAlEWL6IDJV0GQ4jLfLgUErRokBgKaU18bARLpzfhNBVErCU/iebyrJ36rSug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794761103;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=b/DfPJy+2uYKRpX6w6CNhqsEzbASLJMq+YufYF8FHt4=;
	b=vZVXYj3zXAFCWRpdOZl4kytMb9hjvmOoTor1mIzL5AKHwnaEolztf1C0dGmfHpIHSTPW
	 cxrZq3xfFZxb1TTdLAIyIAxSsmjYUQRipOLVxbf9AyMMQSN6K+c+0abcbTJpbFY1Ijh83
	 XI4yix1c1gXQD/AA+C43vEfLz0Bi/ubSG/6YbmkvssVCshp89flS9LQPPpjb0uEuUOOre
	 k7NZmHeyiv9hzYocchzLHQEfNwl9lqOhZfshj3vGHoljdCOokta0n4t6YsLdEq0+uu8xi
	 3F+TXJwhauQikawhsdaid0sueeGODtm+KVw+SedotNp+ii72IxAhAQ/BIYnC3GOfLOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=kOJG2U5F;
	arc=none smtp.remote-ip=195.121.94.183
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FFF606A31A
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 16:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3FFF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=kOJG2U5F
X-KPN-MessageId: e1639533-e113-11f1-92b2-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id e1639533-e113-11f1-92b2-005056992ed3;
	Sun, 15 Nov 2026 17:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:content-type:mime-version:message-id:date:subject:from;
	bh=b/DfPJy+2uYKRpX6w6CNhqsEzbASLJMq+YufYF8FHt4=;
	b=kOJG2U5FTh666cuMjFX9RrbbmF+dncvpQsRh31TPaFqgRHWk8iLEKCOC38bzA0qKMpG4Gaj75OeVV
	 k3kCIYt1piZsO2uD9mo35tIEf6rcqerKImXhdz6VrA3onsyKDt6pJBVsGlfbtU1/+4Z4898I2SV9f9
	 jixvzdPlwNj7qFBAMsNdxgYJCBeWcUvNXkwQz/rJCGHtXA9RcELcr/HdWc0ZEpVIN89BCV3tC0Gz9t
	 l/6hbYRaiRsD5RuDO9lWcdfsZUYyHDFR2t166CFG6PzEirdp0r259lYmRKnDRQHxTdbWWiSEFeotGS
	 X48HmN4zyNZ4//mpBEMlKTF+1npq0HQ==
X-KPN-MID: 33|kCIijK9gxFBtrM9QZ78tcoXfYT3xqi8Mf2a1yB8ULK9OJFVmvamPp936lNS2lTm
 8q5wjv/x3kGts9QC/bKpLUlN3WmBR6HRfCFjuLmbnik4=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|to6Iqsj6nxS/rpZWkHx4Xq4qiZyWZAxpi05ldA8YbTVtQEwMNM7ePx+bv0xqcPr
 K3SfWrysw+3ff7U1wx39HMQ==
Received: from [10.56.187.180] (unknown [83.172.175.28])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id de27d926-e113-11f1-9bd1-00505699d6e5;
	Sun, 15 Nov 2026 17:44:52 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Subject: [PATCH 0/3] selftests: allow wildcards in TARGETS and SKIP_TARGETS
Date: Sun, 15 Nov 2026 11:44:45 -0500
Message-Id: <20261115-ksft-targets-wildcard-v1-0-7512a50d0976@xs4all.nl>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAxA0atI1gYaQS1eRVykTkaDopIMbUG8u
 4PLt/j/BBdTceiKE0y+6rpvGVQWMM68TYIasqF6VQ0R1bh4TJjYJkmOP13DyBaQOQZ5t1R/qIX
 cHiZR/8+3H67rBpjpq6pnAAAA
X-Change-ID: 20261115-ksft-targets-wildcard-aafde8715b17
To: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

It would be nice if you could "make run_tests" all the tests related to
e.g. filesystems by using a wildcard like TARGETS="filesystems*". There
is run_kselftest.sh but that requires installing any tests first. This
series implements this wildcard (in "selftests: allow wildcards in
TARGETS and SKIP_TARGETS"). The other two patches are a sorting clean-up
and a refactor to allow the kselftest Makefile access to the full list
of TARGETS for matching the wildcard. That is churn, but cleaner than
other options.

Actually, it might be better to let the wildcard be the default
behavior, i.e. that "make TARGETS=filesystems run_tests" runs the whole
suite recursively (this is what I expected and what run_kselftest.sh
does). But this would change user visible behavior. If we can do that,
it would have my preference instead.

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
Jori Koolstra (CIQ) (3):
      selftests: sort the TARGETS list
      selftests: move the default target list into TARGETS_LIST
      selftests: allow wildcards in TARGETS and SKIP_TARGETS

 Documentation/dev-tools/kselftest.rst     |  19 +-
 tools/testing/selftests/Makefile          | 320 ++++++++++++++++--------------
 tools/testing/selftests/kselftest_deps.sh |   4 +-
 3 files changed, 185 insertions(+), 158 deletions(-)
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
change-id: 20261115-ksft-targets-wildcard-aafde8715b17

Best regards,
-- 
Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>

