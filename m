Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149398;
	b=N6puMS4l7f4E31HifdmStTa/Nu+c3OpubxqfjBrH8KCkRGpLy6UDnEuuR+sLwkQvAUJT
	 TtJOQlklSVG1Zc/OT4DtggaT8o3lgT6DHUyTtCuI9lYWmewPf4V1XshEzy2Wa0mLIrX3X
	 RtkcRWXDzF1nwecjabJkIIeuQvI0oVAbf3EYOl1xKbfCrHMJz2gcahJQangK36WDqsxoi
	 4MDRFaUZje7sRvb32binOX8pfjvwzXA1qC4f+yvYb1+O2HuKjIsVgw7hGOTp/r+L07Vag
	 73UxzHRmG+MhaNwCK5thOQAdwJPA62lYuJ7xVDn9G21X0zmc4IZLN5q8ozYr9P99a3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149398;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZhEKc45wg9ja/I6OBslZH8YXgn2o7121d7yFkBAteOI=;
	b=am8mwQsru8pGmzVm3pCy+8OEPxQYGF9X1PhY5ITNZ6knZ1r6fgoSKvzno/0RgIaJFnTA
	 nYYV+j0ueuOQNv6sCHeAR8QRePC2CQyWTaWM8g3qkyMIY/4YxFK+yK+sFHbKt8nfQpkoY
	 x54qCdaNuRjeRBLTXKMAqOhGgPpZ89yZge0g8Xtx+kUQM7KYgIubaUu2DF8a8dgjosign
	 RbArebamWpbLryKkR07MlmTUUTW3d5tPLdqvzYZOuErQiopV/fCLy9JyieRlfr/FqlFQo
	 LzAsRqo7llJAkJ4HfLVTSpw2SuIahpWJgglc4ZHBvfOMHgQSbr4pIxXIypWLt5RR04A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=B82dEkbu;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C61D606A320;
	Sun,  8 Nov 2026 14:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C61D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=B82dEkbu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794149396;
	bh=ZhEKc45wg9ja/I6OBslZH8YXgn2o7121d7yFkBAteOI=;
	h=From:To:Cc:Subject:Date:From;
	b=B82dEkbuKRiY1S6yHi73o/TIC4ID0vJFWBAJ2BEzk7c36akTQhNXTjFk0wBC/b2+7
	 FMoYHfrYwNQWqmnE5UcQDJkhsour1KU7dTyOpMZYMGUI2oj1hMfGwcWz6e/ZKwMPEL
	 sDNguSUC4r1Dg6tjsY0p7PpM7Iey99OqDw6LD6absWU7bNFq7gatvxU39VsF3cgfMB
	 8++pdUTKTx3G/NWhTyQP/vlPfud8iy94stS+Lx10c8etAr4ROaa3oPQleYJCg4nU0L
	 vNO9DFgQ9AkWOC3gwNQjYs6HE+v2XYbnoo2/nFhICFm5AmVnXji3OTWSTZMBBcaSPY
	 5I0YCRtn/yglg==
Received: from thinkos.internal.efficios.com (unknown [64.58.40.251])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jMwn02gRLzMk4;
	Sun, 08 Nov 2026 09:49:56 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 0/4] selftests/futex: Fix flaky futex_wait and futex_waitv tests
Date: Sun,  8 Nov 2026 09:49:48 -0500
Message-Id: <20261108144952.1531160-1-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
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

Hi Thomas, Peter,

The futex_wait and futex_waitv selftests assume that a waiter thread
blocks within 10ms, and that the main thread wakes it in time. Under
load, both assumptions fail. With the built-in locktorture, the tests
failed in 0.5% to 1% of the runs in 8-CPU VMs. Repeated runs of
futex_waitv also run out of System V shared memory segments.

These four patches fix both problems:

 1  Let the futex_waitv() helper take no timeout.
 2  Retry the wake in futex_wait until the waiter has returned, instead
    of sleeping a fixed time.
 3  Do the same in futex_waitv, and join its waiter.
 4  Remove the shared memory segments that the tests create.

How this was developed
======================

An LLM coding assistant wrote these patches and their messages, under
my direction and review.

Changes since v1
================

- v1 was patch 2 alone. It retried the wake for up to 5s, and gave the
  waiter a timeout of 10s. Both bounds were timing assumptions too. In
  v2, the main thread retries until the waiter has returned from
  futex_wait(), and the waiter waits without a timeout.
- New patches 1, 3 and 4.

Based on v7.4-rc1, 6628e7d4c6b2.

v1: https://lore.kernel.org/all/20261108142309.1527337-1-mathieu.desnoyers@efficios.com/

Mathieu Desnoyers (4):
  selftests/futex: Let futex_waitv() take no timeout
  selftests/futex: Retry the wake in futex_wait instead of sleeping
  selftests/futex: Retry the wake in futex_waitv instead of sleeping
  selftests/futex: Remove the shared memory segments of the futex tests

 .../selftests/futex/functional/futex_wait.c   | 59 +++++++++++++------
 .../selftests/futex/functional/futex_waitv.c  | 52 +++++++++++-----
 .../selftests/futex/include/futex2test.h      | 14 +++--
 3 files changed, 86 insertions(+), 39 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

