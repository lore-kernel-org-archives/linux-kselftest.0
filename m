Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD4BC64EC7
	for <linux-kselftest@archiver.kernel.org>; Tue, 28 Feb 2023 17:08:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjB1RIV (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 28 Feb 2023 12:08:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjB1RIU (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 28 Feb 2023 12:08:20 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B7C77B478
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Feb 2023 09:08:19 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 638A6FEC;
        Tue, 28 Feb 2023 09:09:02 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F2493F881;
        Tue, 28 Feb 2023 09:08:18 -0800 (PST)
From:   Ryan Roberts <ryan.roberts@arm.com>
To:     Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>
Cc:     Ryan Roberts <ryan.roberts@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        kvmarm@lists.linux.dev
Subject: [PATCH v1 0/2] KVM: selftests: Fixes for broken tests
Date:   Tue, 28 Feb 2023 17:07:54 +0000
Message-Id: <20230228170756.769461-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

During the course of implementing FEAT_LPA2 within the arm64 KVM port, I found a
couple of issues within the KVM selftest code, which I thought were worth
posting independently. The LPA2 patches, for which I will post v2 in the next
few days, depend on these fixes for its testing.

Ryan Roberts (2):
  KVM: selftests: Fixup config fragment for access_tracking_perf_test
  KVM: selftests: arm64: Fix pte encode/decode for PA bits > 48

 tools/testing/selftests/kvm/config            |  1 +
 .../selftests/kvm/lib/aarch64/processor.c     | 32 ++++++++++++++-----
 2 files changed, 25 insertions(+), 8 deletions(-)

--
2.25.1

