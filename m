Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82034C4332F
	for <linux-kselftest@archiver.kernel.org>; Fri, 25 Nov 2022 13:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiKYNZB (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 25 Nov 2022 08:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiKYNZB (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 25 Nov 2022 08:25:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A39D1055D
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Nov 2022 05:25:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB0CA623F6
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Nov 2022 13:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DC1C4347C;
        Fri, 25 Nov 2022 13:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669382699;
        bh=qG+4nEz973oI+TULMdBKedxDBSTKhVdZD3gbmwbMSPQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KanQoV/BBKiNPznU7ccV1rlA4FsPLJUThLY103U/6OlxGgZh9ISj8nNxYNSMqKCah
         BM/Ms8e2qpicn1b6lCxMGSr8JTQZJk0Okcb6Hv79RYcmNlu+KGbdzJtFH2QyIz14i1
         zEpyNfWhwPWWC0ttLDCQjZOG8NiW+M/aeWelBivqYPknkriNQaifLp5LBwUBp5+Ige
         F3ps4PmQJ2U6yml9lpmajGBwp7cDewK9MsMsga/TLXPXY4RefaZ32DgA2G+lHo3CLI
         ciTyKBTitw2ZtopICes28gfLuFAAacyCUg6XSwOPsXdJbTfMcT7OZrMAS0k8lhqwX0
         iaVI1NWjfNmog==
From:   Will Deacon <will@kernel.org>
To:     Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     kernel-team@android.com, Will Deacon <will@kernel.org>,
        linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] kselftest/arm64: Set test names prior to starting children
Date:   Fri, 25 Nov 2022 13:24:49 +0000
Message-Id: <166937888548.3467524.6413963016649639565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221124120722.150988-1-broonie@kernel.org>
References: <20221124120722.150988-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, 24 Nov 2022 12:07:22 +0000, Mark Brown wrote:
> Since we now flush output immediately on starting children we should ensure
> that the child name is set beforehand so that any output that does get
> flushed from the newly created child has the name of the child attached.
> 
> 

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64: Set test names prior to starting children
      https://git.kernel.org/arm64/c/642978981ec8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
