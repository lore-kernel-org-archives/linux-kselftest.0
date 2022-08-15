Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03337C00140
	for <linux-kselftest@archiver.kernel.org>; Mon, 15 Aug 2022 09:16:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiHOJQc (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 15 Aug 2022 05:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiHOJQb (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 15 Aug 2022 05:16:31 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9846C1C929;
        Mon, 15 Aug 2022 02:16:30 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id z12so8361731wrs.9;
        Mon, 15 Aug 2022 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=m6s8qUOEVr22U83noP/tVr9KuoftkbcmVdQXPhi8USo=;
        b=MF2Hsx8eRQ+ddABJaioZXRQkbWdBoSBaxKAlFAtxBrkr8Y+evgMunZB9CIJAF7CTis
         stE192n7C2pOoxiHxpjyZD+eVUXLI4vM0OM8xIjLmhsccYDVK0TI7vCRa07kjUZso7UF
         Eh+AieL3Wmiva9tOR551uh3GIxxuzblsd8uoI7v95052ZPbjwsj7CcVscCHTQm01jydj
         KlravQklA25nDStpW77CFH0K44ST5NwZTQgIRUe/zZj0j5dCy4TEc1G0hQ7Gx2jCa95L
         F38YwRAvs6LkVcUzDl8XfsSjuORZVmL5B5hKiYev7Zo85/SM30v+xrLFbeDiJCs2MI2m
         X0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=m6s8qUOEVr22U83noP/tVr9KuoftkbcmVdQXPhi8USo=;
        b=LSmCx4rRsaj4riI12m3X8DSsKHX2pKjY73RVGDevtPWrfu0uB7RlsM/h+v2TXxgyWz
         nVx8c9bvkCwYH/qbXNsNHijuN3wtoUawDl6LcubOqdfewvKgMa4UowguVIRgj/tY1ZXs
         T55ctvy0MXemP/mz4SYuRqo9+2f8QrxVtwJ+Y+mjfrmP2OHHVINbjMbrg0QQzoypqj8y
         O2L5XV5tgTRU56ui0BiRax/lnYuFvwfyI/WN4bPnzpddOXDM9hHmcu+mDFeaZcrB6pJu
         zDUBbUWSpNz1yGP9ZEfMC2GQT4A8yWy7hO5zCywW3nlCBhs2Vss3fjhmUfOwzvx5CXsm
         Jm/w==
X-Gm-Message-State: ACgBeo2n0U1TNUv2TpDonO+RtSMH9Ft4WKylloXvJ8SKQhGFryAcSmuY
        /142WYzlOdZKeenBilKbiMAK4BYmMoAJ0S5t2Os=
X-Google-Smtp-Source: AA6agR7gXKfN77SzaLMeTdFqtiYsU6lHUssHitQUEdOJvdjGY3TuA/oL4/qRV4Y4Mvuh1kkL7uhP1tchGqpTQTr4jPk=
X-Received: by 2002:a5d:6b12:0:b0:21f:1568:c7e1 with SMTP id
 v18-20020a5d6b12000000b0021f1568c7e1mr8151636wrw.532.1660554989136; Mon, 15
 Aug 2022 02:16:29 -0700 (PDT)
MIME-Version: 1.0
From:   Ramon Fried <rfried.dev@gmail.com>
Date:   Mon, 15 Aug 2022 12:16:16 +0300
Message-ID: <CAGi-RUKv-8zyku-3pjXdjxbyMP_X_YV5rd6y2wyaCOJJ9UOQAw@mail.gmail.com>
Subject: Running kunit tests on platform devices
To:     brendanhiggins@google.com, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi.
I implemented a test suite that checks a platform driver, that's the
only way I can test interrupts behavior in the code.
Because it's a platform, I can't use kunit_test_suite(), so I call
__kunit_test_suites_init() as part of the platform driver probe
function.

This works fine but has the following problems.
"TAP version 14" string is not printed and it's impossible to parse
the results using the script.
In addition, the suite is not displayed in /sys/kernel/debug/kunit.

It would be my pleasure to provide a patch that fixes this, I just
wanted to make sure that my testing strategy makes sense.

Thanks,
Ramon
