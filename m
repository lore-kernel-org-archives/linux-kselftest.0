Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3B7C4167B
	for <linux-kselftest@archiver.kernel.org>; Sun,  5 Nov 2023 10:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjKEKKM (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 5 Nov 2023 05:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjKEKKM (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 5 Nov 2023 05:10:12 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375A1E9;
        Sun,  5 Nov 2023 02:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1699179007;
        bh=0u3uQclr9KeM0ENhYG53g6C2cNg0bkADmGU32llTbks=;
        h=From:Subject:Date:To:Cc:From;
        b=oBGo7eBuzR3wvBvWubGSE/ecvSDXEcvWFrX+fyDqga5ItWEFao8bLix2doxYq6IRj
         +lRQJfI5Opk4SGhwIBS9aBVjcjbMh+zY9NqCwmZujeFn4eg/WbhhlPVs+WeVtQH9x/
         9wlg/EUZY/sdSSya+8t0CrVp+sh9im2hFKXPqCzg=
From:   =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/6] tools/nolibc: MIPS bugfixes and refactoring
Date:   Sun, 05 Nov 2023 11:09:54 +0100
Message-Id: <20231105-nolibc-mips-be-v1-0-6c2ad3e50a1f@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPJpR2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQwNT3bz8nMykZN3czIJi3aRUXQtLI3ML05QU49TERCWgpoKi1LTMCrC
 B0bG1tQDaPLEEYAAAAA==
To:     Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc:     Zhangjin Wu <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699179006; l=946;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=0u3uQclr9KeM0ENhYG53g6C2cNg0bkADmGU32llTbks=;
 b=/1GOSOXuIWGkbFUws8gqq998EhbGQJr8s1+rLqbvJiLzzFBdaLzNp14zzc04Lnaquj/cTyDu3
 5E/ytoy6j+/De/ps5zqRomyFx0SsSZCvy1fjz5/wXVkqJomkFHismZK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Two bugfixes and some minor refactorings of the MIPS support.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (6):
      tools/nolibc: error out on unsupported architecture
      tools/nolibc: move MIPS ABI validation into arch-mips.h
      selftests/nolibc: use XARCH for MIPS
      selftests/nolibc: explicitly specify ABI for MIPS
      selftests/nolibc: extraconfig support
      selftests/nolibc: add configuration for mipso32be

 tools/include/nolibc/arch-mips.h            |  4 ++++
 tools/include/nolibc/arch.h                 |  4 +++-
 tools/testing/selftests/nolibc/Makefile     | 25 ++++++++++++++++++++-----
 tools/testing/selftests/nolibc/run-tests.sh |  2 +-
 4 files changed, 28 insertions(+), 7 deletions(-)
---
base-commit: 6de6466e41182875252fe09658f9b7d74c4fa43c
change-id: 20231105-nolibc-mips-be-892785dd3eaa

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

