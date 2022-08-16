Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967EDC25B0E
	for <linux-kselftest@archiver.kernel.org>; Tue, 16 Aug 2022 11:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbiHPLWc (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbiHPLWN (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 16 Aug 2022 07:22:13 -0400
Received: from a48-34.smtp-out.amazonses.com (a48-34.smtp-out.amazonses.com [54.240.48.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0A672856;
        Tue, 16 Aug 2022 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1660643226;
        h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
        bh=LYFlOcIVFvdivR+Rwv4swHLZ+p+fNNlm7UpWjDH28P4=;
        b=pWkD0bKjhyrsyvJamg7OV9fsdJAB7HYvfYhMadYGHuKtT9Kz4pRYHot2mKamqgQ2
        6vww6H9KRwXqtARGI/RjyyKl1zM74ECmPeONAdmdTgh3aeewUcf0PUydk2hTwq+aC+x
        uSjoeZhn5kOe+tNb3s3K+/hqB5J1V/sFt/uuW6Js=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1660643226;
        h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
        bh=LYFlOcIVFvdivR+Rwv4swHLZ+p+fNNlm7UpWjDH28P4=;
        b=ObfIDbhq36ejjM4cqn3gvYQbnfWsUx6UYg+o+hdiaHffZQsfW/IJII689ltwAsly
        ZLiZsGisb95MyzwltdDMSqnvezOanfRWB2cf+larapr0bEJh1qCL7yYPKTI1jRtEYpI
        b6jlstxDhs+cCSFz2Cp7LhiWgtjNKUVWwLqpf2ts=
From:   lkft@linaro.org
To:     lkft@linaro.org
Cc:     lkft-triage@lists.linaro.org, linux-kselftest@vger.kernel.org,
        linux-next@vger.kernel.org, shuah@kernel.org
Subject: lkft kselftest for next-20220816
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID: <01000182a60cb1e3-4ebc4ee4-d176-4411-948b-0e06c37c9875-000000@email.amazonses.com>
Date:   Tue, 16 Aug 2022 09:47:06 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.08.16-54.240.48.34
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

## Build
* kernel: 6.0.0-rc1
* git: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
* git branch: master
* git commit: e1084bacab44f570691c0fdaa1259acf93ed0098
* git describe: next-20220816
* test details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220816

## Test Regressions (compared to next-20220815)
No test regressions found.

## Metric Regressions (compared to next-20220815)
No metric regressions found.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to next-20220815)
No test fixes found.

## Metric Fixes (compared to next-20220815)
No metric fixes found.

## Test result summary
total: 0, pass: 0, fail: 0, skip: 0, xfail: 0

## Build Summary

## Test suites summary

--
Linaro LKFT
https://lkft.linaro.org
