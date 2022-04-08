Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BE7C433EF
	for <linux-kselftest@archiver.kernel.org>; Fri,  8 Apr 2022 22:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238080AbiDHWcu (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 8 Apr 2022 18:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbiDHWct (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 8 Apr 2022 18:32:49 -0400
Received: from a48-34.smtp-out.amazonses.com (a48-34.smtp-out.amazonses.com [54.240.48.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7249DFF99;
        Fri,  8 Apr 2022 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1649457043;
        h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
        bh=JlOno0RbPOR+ZrFBAzTWV718fPFn/q9yNd9mErrD8Yw=;
        b=QaJM/fYEBruqSE0/fXDd73EuWxSHURPRly+ZXZSObfb/LN+XRo2NeCwISfpLcl6P
        yrOWNrCMnHvBuekf50UTTdl+K1vrQN56NFJK2WIHXEkqqKgiA2JV2EXCVL82KKfBWeP
        k50vzT5j4olVAqiiN8oD08n3xVpixa1+rJ75WcxI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1649457043;
        h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
        bh=JlOno0RbPOR+ZrFBAzTWV718fPFn/q9yNd9mErrD8Yw=;
        b=jHUNJ8anymvQmHARhBo5SXnz4M/r/3y8PwfsGafUxQNA69d/qBz+kaKyfXZS43oG
        0Jryvh923soYMIizb+Y2xHKoSpcq2MFcyWZJaOPoLuDEGbZcRUpyIEOz2j6qQYt7bPi
        HAX9Xm/BbpcifpYblsyTeo7LAPfKpmQc3Ue9bkkw=
From:   lkft@linaro.org
To:     lkft@linaro.org
Cc:     lkft-triage@lists.linaro.org, linux-kselftest@vger.kernel.org,
        linux-next@vger.kernel.org, shuah@kernel.org
Subject: lkft kselftest for next-20220406
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID: <010001800b4d1847-89f89015-ddad-488e-92d4-a7cafaff5056-000000@email.amazonses.com>
Date:   Fri, 8 Apr 2022 22:30:43 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.04.08-54.240.48.34
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

## Build
* kernel: 5.18.0-rc1
* git: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
* git branch: master
* git commit: 109f6d10ec17302c4666f7df3dfa0e31d8589d41
* git describe: next-20220406
* test details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220406

## Test Regressions (compared to next-20220401)
No test regressions found.

## Metric Regressions (compared to next-20220401)
No metric regressions found.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to next-20220401)
No test fixes found.

## Metric Fixes (compared to next-20220401)
No metric fixes found.

## Test result summary
total: 0, pass: 0, fail: 0, skip: 0, xfail: 0

## Build Summary

## Test suites summary

--
Linaro LKFT
https://lkft.linaro.org
