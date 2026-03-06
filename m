Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4719D36606C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813605; cv=none; b=Gpv3mNqkb94/unGaJ5gl8uawvcgCSaJkw4UJ/dArfGtYjgCgXo+/psV9E5TFmYgNpSpi2Crx/2bbvBiT25mnUnihLA5bI8ol0xoMPkXU6D8/Xvehww0FyQz2HmwmoRxDCLQvuqYYoNbIG5eCS8TptnYcgmERjBj3qV2SKABj304=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813605; c=relaxed/simple;
	bh=6ramR1fvhsZBmeuhcDVJvLLvzGmdUw5Q/IjxWV44FFk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ToKkRkuQuX1zK1H/nGul0RYVwodHW1JXBwTymcAmIbxxrzdJ4/99AIYnNj367OuEaVHBUuXkhGh8s8lTCYGvEcwwF2aaaC56GLit/UN8ia7i75YpydKqP6xkdxB5re3zsmdwnf48cL8NfDimXVsz02DKEl6p7t8lDvam4C/EHCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QOoHmhN9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QOoHmhN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772813603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ltB62fWfgsjHxIIEPtVwdiuBolpYhQWjUTW9f1V37ug=;
	b=QOoHmhN9Vnm0lP0E3iacu5ckYwLLncS3vr8ZCMjpnw5RSoE/68Zur3723niVDSyjt1SweG
	AEGDWl+mjRgIjBKcfJ3hvLCaXFMUR2yDHl+++KGwjsH7rHYhPhlTg+9eRrdtCUs30Htjcp
	pR2KU/Ru7z1ZkAuzHUuoaFDCfu9oDVc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-raQa7F1wOEyHngLPiC6lDw-1; Fri,
 06 Mar 2026 11:13:20 -0500
X-MC-Unique: raQa7F1wOEyHngLPiC6lDw-1
X-Mimecast-MFC-AGG-ID: raQa7F1wOEyHngLPiC6lDw_1772813599
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 878B418002C8;
	Fri,  6 Mar 2026 16:13:18 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.3])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 099633003E9F;
	Fri,  6 Mar 2026 16:13:12 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH RFC 0/7] selftests/sched: Add comprehensive SCHED_DEADLINE
 test suite
Date: Fri, 06 Mar 2026 17:10:05 +0100
Message-Id: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWRtIU5qCW8EDuBUXafNHR2taM
 qkIpXc36vK9xbeSIDGE9tVKCS8WnmKJelfRcHPxCsW+NBltrG60VcssOcE9lYfzI0eoh2AMGZJ
 Fha5pOweja2upEHNC4PePP9PpeKDLf8rS3zHkL0zb9gHEfTp8hQAAAA==
X-Change-ID: 20260306-upstream-deadline-kselftests-f7357ae20166
To: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Valentin Schneider <vschneid@redhat.com>, 
 Clark Williams <williams@redhat.com>, Gabriele Monaco <gmonaco@redhat.com>, 
 Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>, 
 Luca Abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772813592; l=4656;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=6ramR1fvhsZBmeuhcDVJvLLvzGmdUw5Q/IjxWV44FFk=;
 b=pgRxKhMzUAYzhCRLufPpi6TRu0PVN31ZMMeNhSxRxQtGW23aNd36KibqqXvFZc1ohTUKcTWga
 DcywfEPGJi2DLppnxvcE7vweASFme3tXgK18h3DrY/RN9/y5mvkJiAE
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This series introduces a comprehensive test suite for the SCHED_DEADLINE
scheduler, providing coverage for core functionality, bandwidth admission
control, and the fair_server (dl-server) mechanism.

I've been playing with/using this set of tests for a while and they
helped me a little checking for regressions and corner cases. So, I
guess I've also now found the courage to share this with everyone and
see what happens. :P

Motivation
----------
SCHED_DEADLINE currently lacks dedicated test coverage in kselftest.
While the scheduler itself is well-tested in production, having automated
tests helps catch regressions during development and provides examples of
correct SCHED_DEADLINE usage for developers.

Development Process
-------------------
This series was developed using Claude Code (claude.ai/code), making it
both a testing improvement and an experiment in itself. The goal is to
explore what AI-assisted development can contribute to kernel testing
efforts - from framework design to test implementation to documentation.

All code has been reviewed and validated by the human maintainer, but the
bulk of the implementation, test design, and even this cover letter were
produced through iterative collaboration with Claude. This represents an
experiment in whether AI tools can help scale testing efforts while
maintaining code quality and kernel development standards.

Feedback on both the test suite itself and this development approach is
welcome.

Design
------
The test framework follows the pattern established by sched_ext selftests,
using ELF constructors for automatic test registration. This allows tests
to be self-contained and easily extensible - new tests are added simply by
defining a struct dl_test and calling REGISTER_DL_TEST().

The suite includes a utility library (dl_util) that provides reusable
helpers for common operations: setting SCHED_DEADLINE parameters, managing
bandwidth, controlling CPU topology, and process management.

Series Overview
---------------
Patch 1: Framework infrastructure with test discovery and structured output
Patch 2: Utility library and cpuhog helper program
Patch 3: Integration with kselftest build system
Patch 4: Basic functionality tests (scheduling, parameter validation)
Patch 5: Bandwidth admission control tests
Patch 6: fair_server (dl-server) tests
Patch 7: Regression test for ENQUEUE_REPLENISH bug

Testing
-------
All tests pass on x86_64 with both VM and bare-metal systems. The tests
adapt automatically to system configuration, detecting available bandwidth
and dl-server bandwidth allocations dynamically.

Tests can be run via:
  make -C tools/testing/selftests TARGETS=sched run_tests
  make -C tools/testing/selftests/sched/deadline run_tests

Or selectively:
  cd tools/testing/selftests/sched/deadline
  make
  ./runner -h

Current test results:
  PASSED:  7
  SKIPPED: 0
  FAILED:  0

Series also available at

git@github.com:jlelli/linux.git deadline-kselftests-rfc

Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
Juri Lelli (7):
      selftests/sched: Add SCHED_DEADLINE test framework infrastructure
      selftests/sched: Add SCHED_DEADLINE utility library
      selftests/sched: Integrate SCHED_DEADLINE tests into kselftest framework
      selftests/sched: Add basic SCHED_DEADLINE functionality tests
      selftests/sched: Add SCHED_DEADLINE bandwidth tests to kselftest
      selftests/sched: Add SCHED_DEADLINE fair_server tests to kselftest
      selftests/sched: Add SCHED_DEADLINE ENQUEUE_REPLENISH bug test

 tools/testing/selftests/sched/Makefile             |   8 +
 tools/testing/selftests/sched/deadline/.gitignore  |   3 +
 tools/testing/selftests/sched/deadline/Makefile    |  54 +++
 tools/testing/selftests/sched/deadline/bandwidth.c | 270 +++++++++++
 tools/testing/selftests/sched/deadline/basic.c     | 127 +++++
 tools/testing/selftests/sched/deadline/cpuhog.c    | 107 +++++
 tools/testing/selftests/sched/deadline/dl_test.h   | 238 +++++++++
 tools/testing/selftests/sched/deadline/dl_util.c   | 530 +++++++++++++++++++++
 tools/testing/selftests/sched/deadline/dl_util.h   | 294 ++++++++++++
 .../testing/selftests/sched/deadline/fair_server.c | 260 ++++++++++
 .../selftests/sched/deadline/replenish_bug.c       | 337 +++++++++++++
 tools/testing/selftests/sched/deadline/runner.c    | 219 +++++++++
 12 files changed, 2447 insertions(+)
---
base-commit: d658686a1331db3bb108ca079d76deb3208ed949
change-id: 20260306-upstream-deadline-kselftests-f7357ae20166

Best regards,
--  
Juri Lelli <juri.lelli@redhat.com>

