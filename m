Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598113BCD1A
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405183; cv=pass; b=R/IMPSs/dkr0YYX98Tu5R8alWTXxIj2/feBAvEcS5CbOaIAzCjoujd5jgFJ3U6FmHfBlx2mnQ84ywmGhBneSHo1gttDuGui1d3nqg4bwJFkiJ1gyjVLIOOAiWYdf5we+/2554OhpQdHMLL3aDNtlzruUpRcOrgShjGtyj/mIxKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405183; c=relaxed/simple;
	bh=BjAy+qTW2P7zLlraadp7vFxhR13oDPht1OQi+cpdS1c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=f4QewzxDSwGWWP8/40oRls8TdfAdYIR5JkYNdrkUVi7eLDBMuBt6tuiHc0l6mBL+1v1jupdobuef1ckO6lqGYhcxCwMyrTPUuP1rhCGxhGubzVwcMDJjsDIazOYYMhVVhxuH9Pzsi4ZWV+muOSDV6/sTwJWlc000PVzosCa/EvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=EJpYTRMf; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="EJpYTRMf"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67489c8202cso4401835d50.3
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 13:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791405179; cv=none;
        d=google.com; s=arc-20260327;
        b=CJYG6mD0vs+MjWYLnP4cAwjPtqjeSQxBet79I49xAa2mmyN7N/ug5P8rMgS1QxjaQe
         5eogDq2wolpbkxN4wuReIREwMmn68tCTEpyD0oimtatj/YLgQNNSAhrZ9WUfM7ucV3x9
         dXUsT8jiTyzjdyxsJAitHl7gQFQo9+ccWWQuvjx2gcZ0ZVOfreHxF150PoXD4kikWx6N
         HchLWf2bjLLMPBFtsWjUDjG0Ii3Fsn3HhOJDAXumc6U8eGANG2Qoxug/MReGdeXv7tuO
         XkLbUDjzEr46NjxMZtBmew/HSNzuvljumHsWTTnyM1AMcAskGlW7yFmXtdHenA/VNPEe
         +kuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ivTJVfjUBIc9wBwqrJfBdaCwNcPxo6RneZIv1F1z4qM=;
        fh=6Zm9V8RnDPOjbTPnDVKdJ4mhQGLLzwWg6sYN99JDV5M=;
        b=hIsLdqA9JQ94qJjc79T9NvUT6aNRAgxCVdw7Nf9aFQMcqZhrIyr41JkAXXnss12VzP
         gU6kQAtfUjr2TsgBGARyPalRH0Vl9l3vd4YYGII/xfVgtVTqwSdkntf+ZUf6OywfWTco
         QK0zauqJxEGRER2HmwPKe3hLDAoV+jqIT7qOZEUX3W0irRj6CgrN0V928a/m8/UCQBTx
         cWFYQNspS9YwjJO2uhBAS5nBni5yPZQNERXKnjAJ2T5gx5MKiSqy9J9+LWHmCsVX0uFu
         L5r8iNyLFm3IOBdijPqjUmFYoIT9Lfa+dY2TVfSBV98KNY/hxIafUzkTGOfhPyNX4MWs
         MTJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791405179; x=1792009979; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ivTJVfjUBIc9wBwqrJfBdaCwNcPxo6RneZIv1F1z4qM=;
        b=EJpYTRMfQYssBvCcWdhqSLVbT1FDzcuZDqprPVFq0T2fzHNh7Fd50L9QLlosdJe8+M
         kb4+BaMj3Q+xZzJN50R21N+1A1kaGfpk4PtIun9E2ApMMXJdSMfRNFk3m6b6z1KPXJtg
         mPYwP7sBFguQsIWRefa6QXD0vJ080bcjucq23eu5DrXjRB77IjBdNwRTsnv68y/KXo+i
         Zsq4DiuIu7YbrV9Mz9pGSEDUhdyEwTI3pgP7BqJ1GPtSTsMpTqD4OjS1+kTdzxHQ2P9y
         FdaVkjx3qTcf7rPA3TtkRRT7ZMTOKfmEaHdRRixode6RPCR0/WlxjRDgXfSp4Ij3VNXG
         CAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791405179; x=1792009979;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivTJVfjUBIc9wBwqrJfBdaCwNcPxo6RneZIv1F1z4qM=;
        b=25VqEowi6kGP7DghWgDqhX9lYU8KaL0J8paIPwysDzdmkbigco1KrykCcV308bT8F9
         LL4kSO3CS/anClQyF0IizhNp0eTGX2nv2o5r8ldo4RtTd95NOjQ0iSgq6TgdEf7A8gSI
         7b5AmJXLGYgXWRC9FwYSUPir6x8Bog722wlDrNVjwP6fWQSsQKNoWnbb/TqD8gGClSu8
         smbfr4sgCwr1/AocJYdpxF9Qv1ap0/wU7b8PgJNbxlPLYeL51hUJjpvQgoV0gV9meIKk
         Oz53RVPVccK4VrTbj+bfL5W381kurZ8li/9gFGC60rEY4kLfG+CzkLKFYyl3s4PbdetO
         BYLg==
X-Gm-Message-State: AFq9FYKNr/mxPkmItqgsV+Te6/QfwhuRY2Q7V5fT7ciQI0KJfTKD4iIX
	4UA9MAIrk3m8KnwBqTefMgRh5tIHbep42JBzxfnbmLi7lcjzxZ+9yTzHO+n7n+BWGt6oNtsQhMw
	IHodP1dm//V3dr1eYdTDRGztPTnCe8hkhLuQZ2YdQTVeesuAYAdX0D9006w==
X-Gm-Gg: AYBFou0KpqwhHcnGsU98DzMXX92IiGlv+mMKDfJncNPcRLUs3JaF1HrNAk0xJU8X0c9
	Pk86DTWnRD/6EMBOsEKpXDjOeY1cOkAwZXJhlazibTuC9D3DfMPYURTjndJ3wPV3hAjcRx0/IkR
	yU/X3Iql1a2fgqTmCxqS96JT7aUaF+0FzxzUrIWFQ9euEplPlW2eI+q6+terA2P1yo0IiFe49xA
	t5s6COTs2LfFY7Euff0uBEhqcFxZRJtMUZCuJ7hBz1tUbJYmF0a+v9bKO/a801R87IZNPH0V27V
	gSuKKbWIQLCTdkUju7GP2+cG2jSd4F0CtchQB/hzTkUIGjdZjuyx4tUtUn1nuoH8BiInDr9aYop
	DEMcK8mYSELc=
X-Received: by 2002:a05:690e:d86:b0:66f:c1be:a65d with SMTP id
 956f58d0204a3-6790a4c52f2mr2150347d50.79.1791405179114; Wed, 07 Oct 2026
 13:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 7 Oct 2026 15:32:47 -0500
X-Gm-Features: AclHuK8P1OmqSjxw1Q8TP15n8s49AfcTPTrHW89OlIGcXgdQz488ItjpqK1Zalo
Message-ID: <CAEev2e-6GVv45RWRLEF6LULovbiwrGE1-PxTzqKkD-zr4K=4KQ@mail.gmail.com>
Subject: run_kselftest.sh timeouts don't work properly
To: linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I noticed some hangs while running perf_events kselftests on some
RISC-V boards with potentially broken PMU overflow interrupts. It
looked like the timeouts worked properly and killed the first 3 jobs,
but the 4th one would just hang and never timeout.

# timeout set to 120
# selftests: perf_events: remove_on_exec
# TAP version 13
# 1..4
# # Starting 4 tests from 1 test cases.
# #  RUN           remove_on_exec.fork_only ...
# # fork_only: Test terminated by timeout
# #          FAIL  remove_on_exec.fork_only
# not ok 1 remove_on_exec.fork_only
# #  RUN           remove_on_exec.fork_exec_then_enable ...
# # fork_exec_then_enable: Test terminated by timeout
# #          FAIL  remove_on_exec.fork_exec_then_enable
# not ok 2 remove_on_exec.fork_exec_then_enable
# #  RUN           remove_on_exec.enable_then_fork_exec ...
# *# enable_then_fork_exec: Test terminated by timeout
# #          FAIL  remove_on_exec.enable_then_fork_exec
# not ok 3 remove_on_exec.enable_then_fork_exec
# #  RUN           remove_on_exec.exec_stress ...

This hang can be simulated on any host by adding an infinite loop at
the beginning of these 4 tests.

diff --git a/tools/testing/selftests/perf_events/remove_on_exec.c
b/tools/testing/selftests/perf_events/remove_on_exec.c
index 89e7b06835df..d9a76351efa6 100644
--- a/tools/testing/selftests/perf_events/remove_on_exec.c
+++ b/tools/testing/selftests/perf_events/remove_on_exec.c
@@ -99,6 +99,7 @@ FIXTURE_TEARDOWN(remove_on_exec)
 /* Verify event propagates to fork'd child. */
 TEST_F(remove_on_exec, fork_only)
 {
+       while(true);
        int status;
        pid_t pid = fork();

@@ -120,6 +121,7 @@ TEST_F(remove_on_exec, fork_only)
  */
 TEST_F(remove_on_exec, fork_exec_then_enable)
 {
+       while(true);
        pid_t pid_exec, pid_only_fork;
        int pipefd[2];
        int tmp;
@@ -171,6 +173,7 @@ TEST_F(remove_on_exec, fork_exec_then_enable)
  */
 TEST_F(remove_on_exec, enable_then_fork_exec)
 {
+       while(true);
        pid_t pid_exec;
        int tmp;

@@ -197,6 +200,7 @@ TEST_F(remove_on_exec, enable_then_fork_exec)

 TEST_F(remove_on_exec, exec_stress)
 {
+       while(true);
        pid_t pids[30];
        int i, tmp;

Then run like this
./run_kselftest.sh --test perf_events:remove_on_exec

Some digging around showed that there are 2 sets of timeouts, one is a
120s timeout imposed by the runner script (run_kselftest.sh) and
another is a 30s timer for each test process by the kselftest harness
(kselftest_harness.h). The harness's 30s timer causes the first 3
fails (at 30s, 60s, 90s), but neither of the timers seem to cause the
4th job to fail when we hit 120s.

It appears that the harness launches each test within its own process
group using setpgrp(), which might prevent the kill signal from the
runner at 120s from propagating to the test process.

This bug can affect other tests that timeout too. I'm not sure what
the best solution is here, and was hoping someone else could chime in.

Regards
Anirudh Srinivasan
