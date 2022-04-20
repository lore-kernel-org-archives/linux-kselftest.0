Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E8CC433F5
	for <linux-kselftest@archiver.kernel.org>; Wed, 20 Apr 2022 03:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359132AbiDTDKp (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 19 Apr 2022 23:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359235AbiDTDK3 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 19 Apr 2022 23:10:29 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5B3657B
        for <linux-kselftest@vger.kernel.org>; Tue, 19 Apr 2022 20:07:37 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id x1so684378pfj.2
        for <linux-kselftest@vger.kernel.org>; Tue, 19 Apr 2022 20:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=H9MRmjSXChtbhQywZBnijm91ln1P4F/8ZDoCnfdlklE=;
        b=QabGDjG+OU5UIspWNBk0BYodRXdJzBwSNcGl8VI4sdOzkEYgk9H0BQOARqpCwsJF+r
         /X+iOjCQLwC1DVG+LzQtxwdD+0ftxqYXiHZ7x5DxYMTgj29HX+TQCc2nUEN0rUSjwUXB
         nGuiGRa+qK/shuoM2hehVpFXnCN2MJZqyVDxtXhVeObxCCnUMTDXGmGXVbuxsdJL2EIv
         ve6JrOnZrPpjXDGWzko94p4Q+czcZZkl2dHtzS02mu2kvN8Pi8SDBNhVrkm5dKzfHkjF
         Rwl4P9tSb/aIsRwE4BrTEwB2rinJKshqbSuGwd8B25hYkYCmWODoVOo5vpLasdhmkEtB
         WxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=H9MRmjSXChtbhQywZBnijm91ln1P4F/8ZDoCnfdlklE=;
        b=QW69ipiToDRgzvn2YCFwuY+75BsLoxe6VirDGneDXt+idYJ4HUJ1kDUe7DITZ5B8v9
         zoDGoI15ZHFhE+VTaCyL/nh0H9mPkWyAAbM5ELLfUehdzIm+oKSXh4oKorHKhnN+c5TC
         0COvgCbYeHb1DSxXZ+gjUzjOqy6PeLctZhAcD5o98ESUcE9ryJx/qXF6gXMM0wkD0JEQ
         +MJixUmOgC1WLARCo0QaZm/3bT6bgGyqcSgq44iJOoOh0zDCiapKmXutO9G3uGgCNSmv
         pFrtuuXvo2k5F+T4Yh+6LBUdfTrOXkTTYEBMXcw1EApuigX+0ct2zeBUbCCNsBxQ/fuM
         bq/w==
X-Gm-Message-State: AOAM532Klwv49BXatDKai0jRs5hHsYAfm4TAec2zbznNIAMz2QE+d/Nv
        Uoaci6ACWNnXLON9d4SDP9TqJg==
X-Google-Smtp-Source: ABdhPJwafDQg63aWsZzypCeFMWMPSBjisiu8wA/9JY5lou4HYfOCWe0aD5l9NCYHPG89syEQC2/IIA==
X-Received: by 2002:a05:6a00:10d3:b0:4fe:5d:75c8 with SMTP id d19-20020a056a0010d300b004fe005d75c8mr20798984pfu.6.1650424056817;
        Tue, 19 Apr 2022 20:07:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s10-20020a63e80a000000b0039e5c888996sm18056409pgh.86.2022.04.19.20.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 20:07:36 -0700 (PDT)
Message-ID: <625f78f8.1c69fb81.6e5b8.b62d@mx.google.com>
Date:   Tue, 19 Apr 2022 20:07:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: kselftest
X-Kernelci-Branch: next
X-Kernelci-Kernel: v5.18-rc3
X-Kernelci-Report-Type: test
Subject: kselftest/next kselftest-lib: 9 runs, 1 regressions (v5.18-rc3)
To:     kernelci-results@groups.io, linux-kselftest@vger.kernel.org,
        shuah@kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

kselftest/next kselftest-lib: 9 runs, 1 regressions (v5.18-rc3)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | clang-14 | defconfig+kse...4-chro=
mebook | 1          =


  Details:  https://kernelci.org/test/job/kselftest/branch/next/kernel/v5.1=
8-rc3/plan/kselftest-lib/

  Test:     kselftest-lib
  Tree:     kselftest
  Branch:   next
  Describe: v5.18-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kse=
lftest.git
  SHA:      b2d229d4ddb17db541098b83524d901257e93845 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | clang-14 | defconfig+kse...4-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/625f6c8f67acf2af6aae069e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest+arm64-chromebook
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220415063012+3400d=
0293a14-1~exp1~20220415063056.119)
  Plain log:   https://storage.kernelci.org//kselftest/next/v5.18-rc3/arm64=
/defconfig+kselftest+arm64-chromebook/clang-14/lab-collabora/kselftest-lib-=
mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//kselftest/next/v5.18-rc3/arm64=
/defconfig+kselftest+arm64-chromebook/clang-14/lab-collabora/kselftest-lib-=
mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ks=
elftest/20220411.0/arm64/initrd.cpio.gz =



  * kselftest-lib.login: https://kernelci.org/test/case/id/625f6c8f67acf2af=
6aae069f
        new failure (last pass: v5.17-rc5-17-g2aaa36e95ea5) =

 =20
