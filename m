Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1EAC433EF
	for <linux-kselftest@archiver.kernel.org>; Wed, 13 Apr 2022 16:16:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbiDMQSc (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 13 Apr 2022 12:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbiDMQSc (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 13 Apr 2022 12:18:32 -0400
Received: from a8-73.smtp-out.amazonses.com (a8-73.smtp-out.amazonses.com [54.240.8.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0BC22B2A;
        Wed, 13 Apr 2022 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1649866569;
        h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
        bh=VG9bU6Jxubq039OaR2Ts/yhIZvljqG7NAO5TN3D6kTY=;
        b=tWas4f7ec7z2k2b6rWSMYGtHET3Imz5o692Gc9gIoQBS8r83FOi8K7RA+xPbyGkZ
        3rZMsRSCnWbBxBvB1Dn6AzXOmXsgKVhDceFS4ExrAMukwhqedl1JbcmSI6Udafmy4Fq
        rrBS1Rerk1KBCwXPqxoEtuFX8Xs7yWquTHps1oUc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1649866569;
        h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
        bh=VG9bU6Jxubq039OaR2Ts/yhIZvljqG7NAO5TN3D6kTY=;
        b=AgHuImY8lsY9wQHR9jDp9Yd0iAS3/6UUChdjMG+625pzP3l8P3tk18A6vkhVeRrC
        PcuibrEYIxpvWnK7wIQ8roMt6T2Ujh7i/TwCOwD5pBuvgtvU0ExVl2ybNn07ofBACPX
        UvI2axVWQoOJKo/I4Tfii+lTgaI9QInKuEzAurRU=
From:   lkft@linaro.org
To:     lkft@linaro.org
Cc:     lkft-triage@lists.linaro.org, linux-kselftest@vger.kernel.org,
        linux-next@vger.kernel.org, shuah@kernel.org
Subject: lkft kselftest for next-20220412
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID: <0100018023b5f4e3-3d559057-2590-42aa-9dd8-300e64c9f6dc-000000@email.amazonses.com>
Date:   Wed, 13 Apr 2022 16:16:09 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.04.13-54.240.8.73
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

## Build
* kernel: 5.18.0-rc2
* git: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
* git branch: master
* git commit: d0c745e7b2d6ce8bcc768b32361ab8ef520821ee
* git describe: next-20220412
* test details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220412

## Test Regressions (compared to next-20220408)
No test regressions found.

## Metric Regressions (compared to next-20220408)
No metric regressions found.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to next-20220408)
No test fixes found.

## Metric Fixes (compared to next-20220408)
No metric fixes found.

## Test result summary
total: 0, pass: 0, fail: 0, skip: 0, xfail: 0

## Build Summary

## Test suites summary

--
Linaro LKFT
https://lkft.linaro.org
