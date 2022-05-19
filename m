Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D13C433FE
	for <linux-kselftest@archiver.kernel.org>; Thu, 19 May 2022 22:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbiESWWz (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 19 May 2022 18:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbiESWWz (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 19 May 2022 18:22:55 -0400
Received: from a48-34.smtp-out.amazonses.com (a48-34.smtp-out.amazonses.com [54.240.48.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B9A6622A;
        Thu, 19 May 2022 15:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1652998972;
        h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
        bh=W5dL5IIIiJA2zdge9PK5/lbWNC80HjqnMb1aFoZBBK4=;
        b=hw9pB8LwzpVh9y4gAkThxxwBWltpCbH6QNC2bWm8QSIug+7qsljk3aG5dn8mjGoq
        O6gG4usmMEdkaxypEdvmW/7Ip1rs/OihCSwKY/5ddhxpCakC4sZQu3lNTmQ+Mj4r2n+
        mhfJmipltF6eBB3NfLrzLkg5QAxGMKqwlxb4Gyqc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1652998972;
        h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
        bh=W5dL5IIIiJA2zdge9PK5/lbWNC80HjqnMb1aFoZBBK4=;
        b=Ad2127uXoNQBMhwvHwtkovqgiszDIjWl0Euxzjs+uDXB/cs234EqTIZRWRhv0oka
        x0qfa6dlr9r3fdDj67y1wUBuGpwMUiuDnqjotiQ26KpwoZsckdRUUvrdodPyC+zNZmF
        S/r+b24VrY5nkDKzrYJ0XxFTvFINfxj6D7is+7Cc=
From:   lkft@linaro.org
To:     lkft@linaro.org
Cc:     lkft-triage@lists.linaro.org, linux-kselftest@vger.kernel.org,
        linux-next@vger.kernel.org, shuah@kernel.org
Subject: [REGRESSION] lkft kselftest for next-20220518
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID: <01000180de6aa3ac-3a1408f3-2645-4338-87dc-b580b034dad8-000000@email.amazonses.com>
Date:   Thu, 19 May 2022 22:22:52 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.05.19-54.240.48.34
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

## Build
* kernel: 5.18.0-rc7
* git: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* git branch: master
* git commit: 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
* git describe: next-20220518
* test details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220518

## Test Regressions (compared to next-20220506)
* qemu-arm64-mte, kselftest-cgroup
  - cgroup.test_freezer

* x86, kselftest-kvm
  - kvm.evmcs_test
  - kvm.hyperv_clock
  - kvm.smm_test
  - kvm.state_test
  - kvm.vmx_preemption_timer_test


## Metric Regressions (compared to next-20220506)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to next-20220506)
* dragonboard-845c, kselftest-proc
  - proc.proc-uptime-001

* dragonboard-845c, kselftest-rtc
  - rtc.rtctest.rtc.uie_select


## Metric Fixes (compared to next-20220506)
No metric fixes found.

## Test result summary
total: 5265, pass: 2783, fail: 537, skip: 1945, xfail: 0

## Build Summary

## Test suites summary
* kselftest-android
* kselftest-arm64
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
* kselftest-memfd
* kselftest-memory-hotplug
* kselftest-mincore
* kselftest-mount
* kselftest-mqueue
* kselftest-net
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
