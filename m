Return-Path: <SRS0=7BFT=WK=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C15EC32750
	for <linux-kselftest@archiver.kernel.org>; Wed, 14 Aug 2019 02:22:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 283DF2084F
	for <linux-kselftest@archiver.kernel.org>; Wed, 14 Aug 2019 02:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565749375;
	bh=5rLlWUJ+nSWbLbJ/vJkace/NVU+oEELFK99umC/pAFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=peFQEeEAVk4qOcqRZ3tWnDbSG0al6OX+JD6iRBTh/q89kAu8BaNyvARY4sAw0R7Qv
	 la30hx+z+F3Rpp0NtwcQDgZ+RQqIYLkzbW0l0ZjE3RVMMLxmzxFTDhW8NCwWy19DzA
	 gLN6QcbaP9eXHW6ScQ19dByKV+KZFq5lsnVMCdZM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbfHNCSd (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 13 Aug 2019 22:18:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728348AbfHNCSc (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 13 Aug 2019 22:18:32 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A01302084D;
        Wed, 14 Aug 2019 02:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565749112;
        bh=5rLlWUJ+nSWbLbJ/vJkace/NVU+oEELFK99umC/pAFk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dvk+mxh4RjjbneTU8b2AU14sbbsKrW3v9usjimp82BkwtrbqQRmNE1gBNBFI9vjkY
         yZF6R+Y8gY8mFPu8JF5PdX0qDYzVxvWIQbXiI5zMrPLCaEz6VphQ5JEj6Bzp8DF1Oh
         RBF8XqmQMy5wNJaal4FbvKtFY/I/mbmBf50yiBnE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sasha Levin <sashal@kernel.org>, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 68/68] selftests: kvm: Adding config fragments
Date:   Tue, 13 Aug 2019 22:15:46 -0400
Message-Id: <20190814021548.16001-68-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021548.16001-1-sashal@kernel.org>
References: <20190814021548.16001-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Naresh Kamboju <naresh.kamboju () linaro ! org>

[ Upstream commit c096397c78f766db972f923433031f2dec01cae0 ]

selftests kvm test cases need pre-required kernel configs for the test
to get pass.

Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/kvm/config | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/config

diff --git a/tools/testing/selftests/kvm/config b/tools/testing/selftests/kvm/config
new file mode 100644
index 0000000000000..63ed533f73d6e
--- /dev/null
+++ b/tools/testing/selftests/kvm/config
@@ -0,0 +1,3 @@
+CONFIG_KVM=y
+CONFIG_KVM_INTEL=y
+CONFIG_KVM_AMD=y
-- 
2.20.1

