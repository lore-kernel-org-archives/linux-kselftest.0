Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173950;
	b=E+KiQ1XJbJn9AWt0Vc74Yk0PHzJjrVU+8sMn9EEYFXtlUPywFroblphcQkt+6ENQVPZs
	 8kbtBhZ6GBaB0i1bDhQ6QaO4BZpF51Vn1gUIO8+qO7sJvvlyhtyLHeQ6cQSXQFGXyrsYO
	 93ej1a3kTeeK8I6MxiNDUb7iIGGLqIy9LyV2kcsWFJdSFaWgSf3FpAb3hVfF8MbK47OTN
	 DwWx+W8UNDaA2otST39LCivy2cHoOplD9JKeBqDusN5TTcct/NbiAHGW1Sgt3+43rqIk3
	 cduP9pZtfzMchGevDuJCMwMKXJlSXl0SKUjm4L4YSrbFJFENMowN5BMJssK/toTO5lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173950;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BlWEHqUMBfqlYT6RzxZzGtNgrS/B0W45FDa8RWpCMeo=;
	b=Y9TJ6yY4W6oYfa62nEz+ADCztT+SdRX98C9xCJetKTCf8TfevnkHkPRODj7G+Teij8tN
	 BYFed5WkSK4otYPRfn6zFYdeLYZA6cYVRXl8dM1Nubuz4uVL7p6CUUrqrJpznVwiZCiEI
	 6EF5bvWONuVboIo7WJta0fOW1wBjTe3rlyUGZQf/Z41nrWSaWtLq5RpuGCtO8KOzn/IWK
	 BrVV1hrgfRlDKl2MlgFdbiEj7zYkbeLdwgBwYleZFXkVruB74jy/cklnUGMDzThxAzjzV
	 aFz5Y34WFQbQi7u49NoTd5SG7GZC02c3RcMY/YnmnrifUuw9bJfTPf/8SryodvJUvBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=JVjsovkk;
	arc=none smtp.remote-ip=195.121.94.185
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2C606A320
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 11:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C2C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=JVjsovkk
X-KPN-MessageId: 1da285a0-e4d5-11f1-964c-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 1da285a0-e4d5-11f1-964c-005056999439;
	Fri, 20 Nov 2026 12:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:content-type:mime-version:message-id:date:subject:from;
	bh=BlWEHqUMBfqlYT6RzxZzGtNgrS/B0W45FDa8RWpCMeo=;
	b=JVjsovkk/tx7LHPECwSDZYYUnemGi8NT/PGU4bPD3DWrRCynwCeq5TPWbJqrVUgUaaskjS8RNLyNS
	 YD05SNq9d2hUK6em6GrxAnQK3N7iI8yxFjUuHYhKy3sIrNy1da4kjM0z1OJm654Dvop0iitrltDV2N
	 Ve0lvxIVBfdssUTFZe8ajY8EvwPVc7byNEth6eSpT5seYpeqwPh9HT0NDKsiX5eES5x2eRQlz7PVHL
	 xHP1TnL9QWerToxg1iRck3g79X7N4o4Yx2Hcj0x09e2nu0PF+D5NeqIBRG1sesEcObUu8KNBfHQHar
	 iyiISq9FSL2oPWHEp+HLUoQvFKYtexw==
X-KPN-MID: 33|MobqPwOJImcBCc+cLtMGVB255lynkFGkgg5+9Y1LDQhPPLwLda+xj9S/6QarXue
 qwe+L5p+PWNT7eTiMnjv90LV4imoA+q0osGu9DX7/sBs=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|xvyHc0hgKsCcPYT0JUki7vUYMz0ALynJqrDH53NqU1I6Bo+nCDp+3PKMV7KEtme
 KbUcFRvTqJntQxjq2ehp0rw==
Received: from [192.168.1.167] (unknown [178.226.154.85])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 1aaf0057-e4d5-11f1-92e0-005056998788;
	Fri, 20 Nov 2026 12:25:40 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Subject: [PATCH v2 0/2] selftests: add option to print the time spent per
 test
Date: Fri, 20 Nov 2026 06:25:27 -0500
Message-Id: <20261120-kselftest-run-timer-v2-0-9802690a370b@xs4all.nl>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7RjaChJX3sOwKDDIxFpIpxIM4
 e5WEncu30v++ysIBSaBS7ZCoJmFR59AHzJoB+vvhNwlBp3rUil1xoeQ6yNJxPDyGPlJAbve2LY
 wqiw0QVpOgXpe9uqtTjywxDG895NZfe2vV/3tzQpzLIytTNXortTNdZGTde7oHdTbtn0Aeerlp
 7YAAAA=
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

The other patch of runner.sh fixes a bug when using --netns in
run_kselftest.sh.

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
Changes in v2:
- Dropped convention change from the series (as Shuah requested)
- Link to v1: https://lore.kernel.org/r/20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl

---
Jori Koolstra (CIQ) (2):
      selftests: pass the timeout override to tests run in a netns
      selftests: add option to print the time spent per test

 tools/testing/selftests/kselftest/runner.sh | 21 +++++++++++++++++++++
 tools/testing/selftests/run_kselftest.sh    |  8 ++++++++
 2 files changed, 29 insertions(+)
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
change-id: 20261117-kselftest-run-timer-df3ac531652e

Best regards,
-- 
Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>

