Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D1FC433EF
	for <linux-kselftest@archiver.kernel.org>; Thu,  3 Mar 2022 03:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbiCCDBf (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 2 Mar 2022 22:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbiCCDBe (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 2 Mar 2022 22:01:34 -0500
Received: from a48-34.smtp-out.amazonses.com (a48-34.smtp-out.amazonses.com [54.240.48.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD3926AC5;
        Wed,  2 Mar 2022 19:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1646276448;
        h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
        bh=9ClZgaseIwYExjYJsdjEh8oapLPGGSYCPwbSe7kdUuo=;
        b=QKqQpRlALVQtRpy1p/hmBsCsfAGRZny61kakqZ6ldCeqIH0pRE+K85wqd1g3QHQP
        Nt+Fvzma7zGbNY7dpcrdWn5iZLOb2ggZK2BRwJFSsdIY+C3uGhku2sSjcjY7Ruu4jqw
        M7DRDjPxqqXToAyw2gSy/gd7oNXNcvpTLziW1mYI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1646276448;
        h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
        bh=9ClZgaseIwYExjYJsdjEh8oapLPGGSYCPwbSe7kdUuo=;
        b=W7NT3Z5/N6P2GwQpR+OXaPXy1VaDAQfGb8W6JPfRz2+xhubQ8+NZOT4QPJONiK/Z
        1Y9woSj+mucPlZwbrExKokxgSBpFMlDFEMFp8Ul9qZer0rqPiNW8hWa45gWRxINoPGZ
        PdJCA9jKA7dehTRNG5zyYdCqy96bsasWbIZRiO4c=
From:   lkft@linaro.org
To:     lkft@linaro.org
Cc:     lkft-triage@lists.linaro.org, linux-kselftest@vger.kernel.org,
        linux-next@vger.kernel.org, shuah@kernel.org
Subject: lkft kselftest for next-20220302
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID: <0100017f4db90fa4-031778f7-c53b-42be-8b7c-7f4188af11ff-000000@email.amazonses.com>
Date:   Thu, 3 Mar 2022 03:00:48 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.48.34
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

## Build
* kernel: 5.17.0-rc6
* git: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
* git branch: [None, 'master']
* git commit: adaedcf826dccf01b69d9a1f1997c9446c6b2c54
* git describe: next-20220302
* test details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220302

## Test Regressions (compared to next-20220301)
No test regressions found.

## Metric Regressions (compared to next-20220301)
No metric regressions found.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to next-20220301)
No test fixes found.

## Metric Fixes (compared to next-20220301)
No metric fixes found.

## Test result summary
total: 1656, pass: 951, fail: 179, skip: 526, xfail: 0

## Build Summary

## Test suites summary
* kselftest-android
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-cgroup
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-cpufreq
* kselftest-drivers
* kselftest-efivarfs
* kselftest-filesystems
* kselftest-firmware
* kselftest-fpu
* kselftest-futex
* kselftest-gpio
* kselftest-intel_pstate
* kselftest-ipc
* kselftest-ir
* kselftest-kcmp
* kselftest-kexec
* kselftest-kvm
* kselftest-lib
* kselftest-livepatch
* kselftest-membarrier
* kselftest-openat2
* kselftest-pid_namespace
* kselftest-pidfd
* kselftest-proc
* kselftest-pstore
* kselftest-ptrace
* kselftest-rseq
* kselftest-rtc
* kselftest-seccomp
* kselftest-sigaltstack
* kselftest-size
* kselftest-splice
* kselftest-static_keys
* kselftest-sync
* kselftest-sysctl
* kselftest-timens
* kselftest-timers
* kselftest-tmpfs
* kselftest-tpm2
* kselftest-user
* kselftest-vm
* kselftest-x86
* kselftest-zram

--
Linaro LKFT
https://lkft.linaro.org
