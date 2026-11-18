Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009231;
	b=gTiWTlpDle+2ILxyTGBbN9BVLDqw+6bdGJsotxma4l/ojkuN3xmPgHT/YDl7pY4pJK07
	 gQjJvgnOkNvQhx5rahHATzbZa0t6oDOflBHj99/kZSqKRRXF+cJUrdbuJAEfqKBwM4C56
	 6HJNjll32MwOLQ/3OCBsmycP6a2W3i8lqrVTD+p6Dr1Krsn4odMzQPkZo6zyUtC051cFl
	 WOWj1SJYbfGZWOOri4vPvYXWGD3pYNxZ+OfGrZaHEjwnPp5TdvI91RpRo0tM++dZPJA0J
	 0VB1vCb5T5xJEC3F5gyeL5kBl5mliX73HOvLB6QSgNMriAEwLJIOFLG2aqpsTiYt+Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009231;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=eE3Q5w+pSqd4UtdSA0jQ/qK39TFdapJT41KR34oRoMo=;
	b=diTau9mc5x15CQVHcn9DAuw93RU3X8mJBcyOqcZxwd5x1RqyC4SnUfuwfqh4Fb9LFp3h
	 2Gi/l3DFaJ1KgKZwJf/WSvbG6+csoxErxZ1o8RT4lxSG3LV9VKBHyG16/b1HmRO+5qlDz
	 eKvH7BLPw0gctjz6FC3SRQFO5pLMnamaID8bqfBCbzy3jBBjmYAu0+o5XPPzvb2d5eRKY
	 55gv9lxgxIsZX3RHexy5QIWOyJtbN3IOyu7PRIjdjA3Iiueeoo/6vXZJ6XfjqRzSanr/x
	 7gHiy22j5jwyi/lpTtDTtANOSArPaRwAfm2qcQJJ/3cilqMaRUsu3ykfD1R/kSyJ6uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=FAap7tBc;
	arc=none smtp.remote-ip=195.121.94.186
Received: from ewsoutbound.kpnmail.nl (unknown [195.121.94.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B8E606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B8E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=FAap7tBc
X-KPN-MessageId: 9a0dd8ae-e355-11f1-a112-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 9a0dd8ae-e355-11f1-a112-00505699b430;
	Wed, 18 Nov 2026 14:40:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:content-type:mime-version:message-id:date:subject:from;
	bh=eE3Q5w+pSqd4UtdSA0jQ/qK39TFdapJT41KR34oRoMo=;
	b=FAap7tBcbSM8HaPG9LNxi9+VY2LksQAR0bHB5dkuOKS3nwDl1cssuAsevMlsyqCXz/TA1VdeULi6U
	 e42Er1vgvZxzcrrqB8eWVpBUuWt4d/nd0KJS/H5IAeRshKusRqPlXgCBZNiOcNp+1ksFzxSrN793l5
	 Yyr7JFKrR1pOBtWBxa2iaE6TwBis+rRFKMbgcmmpg2vH8tzjy4gbtxWLarGDnITu5t7+ELt8roCcpS
	 NsQxkx7vFMB3hBqErBfWpGtayfMNuJ6pllU6bs/O3AyRMQ5/BYndX4XuNrbhPZjFl+iuvGdxoT62Ji
	 za/jTeIoYUNqxpBAJY29EYP1thtlhLw==
X-KPN-MID: 33|Q7DQQlTAFKhNuJ3H31f6EzyskdVihSBVT8cCfCIhR5jOgqerhH15XgPOF7YCAvp
 wDy/Ib6nmI9bKtfn4vf9Ch2rspNV1bsGBUK/+WpXA0Ds=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|HSGfxGRT1XqkLuYSsNifFiWzZ65ewkDRbRvrs6Gxog97Hfp7v/bkBVDIsmnsbW1
 IXseDGflLnx1TWQyiCEHxBA==
Received: from [192.168.122.1] (unknown [178.226.154.85])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 97245f71-e355-11f1-a6ee-00505699772e;
	Wed, 18 Nov 2026 14:40:22 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Subject: [PATCH 0/3] selftests: add option to print the time spent per test
Date: Wed, 18 Nov 2026 08:40:08 -0500
Message-Id: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nz3ezi1Jy0ktTiEt2i0jzdkszc1CLdlDTjxGRTY0MzU6NUJaDOgqL
 UtMwKsKnRsbW1AFMrWMplAAAA
X-Change-ID: 20261117-kselftest-run-timer-df3ac531652e
To: Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Hangbin Liu <hangbin.liu@linux.dev>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

For CI/CD purposes it is useful to know how much time each selftest
took to complete, for instance, to know which suites to run for a
quick-fail diagnostic, or what percentage of tests you can expect to
complete on a paricular --override-timeout value.

Add a -T/--timed option to run_kselftest.sh. When it is set, run_one()
prints a KTAP diagnostic line with the elapsed wall-clock time just
before the result line of each test that is actually run, e.g.:

      # selftests: timers: nanosleep
      # time: 12.34s
      ok 3 selftests: timers: nanosleep

The other two patches clean up the use of 'local' in runner.sh and fix a
bug when using --netns in run_kselftest.sh. Strictly these could be sent
as separate patches, but "selftests: add option to print the time spent
per test" builds on these, and it would otherwise require needless
rebasing for two small fixes.

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
Jori Koolstra (CIQ) (3):
      selftests: use local variables consistently in runner.sh
      selftests: pass the timeout override to tests run in a netns
      selftests: add option to print the time spent per test

 tools/testing/selftests/kselftest/runner.sh | 50 ++++++++++++++++++++++-------
 tools/testing/selftests/run_kselftest.sh    |  8 +++++
 2 files changed, 47 insertions(+), 11 deletions(-)
---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
change-id: 20261117-kselftest-run-timer-df3ac531652e

Best regards,
-- 
Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>

