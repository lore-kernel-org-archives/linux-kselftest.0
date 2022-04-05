Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAA7C41535
	for <linux-kselftest@archiver.kernel.org>; Tue,  5 Apr 2022 23:52:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243697AbiDEXft (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 5 Apr 2022 19:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457628AbiDEQUI (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 5 Apr 2022 12:20:08 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EAE193D3
        for <linux-kselftest@vger.kernel.org>; Tue,  5 Apr 2022 09:18:10 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id fu5so6607805pjb.1
        for <linux-kselftest@vger.kernel.org>; Tue, 05 Apr 2022 09:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t/kYwTnutWSJ3Cq11DxO+smiNxPRlDwl7vlTvbUvZqE=;
        b=crccXq1JCJ16ilp2sP4FzD1pLdqWsxx1GTbXYBFQnk+F9/a7QuW3umNgk2NU/JnYAp
         PMuVT+nIvQy6YuwSnitqp/YOgEH0cGkCZd3+g2lY2ldC/SvpCbbaJ00iheoRtrB89jMx
         lewNSd8l9Asz+zLNuqpU++KSkMN9uSCnUUFHyOLLWMVNzMgP+shLTpUFBBN1Hh1Ekk0u
         9xXc/AKUEXnPDGd1Qma/5O4DsGht75i1SHVwNVSV6If06DIgDWb+qsWcNhcTwlqqsbZ9
         ntGznQ8YKRD9Vh3Xdfe/tf16KNzPWDZK7hD02cQKVtPXhXkcHDkiruXZnzG4qMhlZsbA
         pLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t/kYwTnutWSJ3Cq11DxO+smiNxPRlDwl7vlTvbUvZqE=;
        b=hFkobOfY4+m/w6mhJ3zN+3F7242F1IV9x23xuBPKaRjoccXvvjPcNa/zs+ReVMLaNg
         fwCpsYTcDtY9FmBmf5bKwCFQX4yqenlUB2EII/LJokyMoAQtHVpmTAxUKEYcoLNARGzl
         d/LhJhsZAT+ieSAp3qhbfwOLX6mcVPRTlm4FJj9QfcxgdlV7ec6MM9kjK4NTrKooLq/u
         WduKaWZbQYlkO31fY6HPGn84yA54cun3ahNcSYJQbZt4UL6G6D39/E1VrlSGottO7QuJ
         uxej3DYmw5CjTakoLycjPQA2z0DnSZeb5USsQqLd27OI1ZZSg7AZ+teRQgbqL45pA0Zt
         aJfw==
X-Gm-Message-State: AOAM533PG5sDFiWUKDRxETm/FqUhh7bXKyOvSaHxNuY1c2WoAju/4+P8
        mSPWB7WmkcFsi5MseiTYuUow1BdRCiU1VyLf/ck=
X-Google-Smtp-Source: ABdhPJy56/i5q9gjo99wGpjXYjSRsXiJvLjWFtBsoRORaPtZfu3rHOheVL9onWqKgK+0qzcZN1vGzA==
X-Received: by 2002:a17:90a:cf94:b0:1ca:7ff9:73eb with SMTP id i20-20020a17090acf9400b001ca7ff973ebmr4978353pju.173.1649175489947;
        Tue, 05 Apr 2022 09:18:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s19-20020aa78d53000000b004fdaae08497sm15356204pfe.28.2022.04.05.09.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 09:18:09 -0700 (PDT)
Message-ID: <624c6bc1.1c69fb81.ed2ec.8d36@mx.google.com>
Date:   Tue, 05 Apr 2022 09:18:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: kselftest
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: v5.18-rc1-7-g79ee8aa31d51
X-Kernelci-Report-Type: build
Subject: kselftest/fixes build: 8 builds: 0 failed,
 8 passed (v5.18-rc1-7-g79ee8aa31d51)
To:     kernelci-results@groups.io, linux-kselftest@vger.kernel.org,
        shuah@kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

kselftest/fixes build: 8 builds: 0 failed, 8 passed (v5.18-rc1-7-g79ee8aa31=
d51)

Full Build Summary: https://kernelci.org/build/kselftest/branch/fixes/kerne=
l/v5.18-rc1-7-g79ee8aa31d51/

Tree: kselftest
Branch: fixes
Git Describe: v5.18-rc1-7-g79ee8aa31d51
Git Commit: 79ee8aa31d518c1fd5f3b1b1ac39dd1fb4dc7039
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselft=
est.git
Built: 4 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest+arm64-chromebook (arm64, clang-14) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
