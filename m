Return-Path: <SRS0=du8n=WS=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C994FC3A5A1
	for <linux-kselftest@archiver.kernel.org>; Thu, 22 Aug 2019 18:40:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C93F23400
	for <linux-kselftest@archiver.kernel.org>; Thu, 22 Aug 2019 18:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ex7I0HZM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387714AbfHVSkW (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 22 Aug 2019 14:40:22 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37191 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731699AbfHVSkW (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 22 Aug 2019 14:40:22 -0400
Received: by mail-pl1-f194.google.com with SMTP id bj8so3947209plb.4
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Aug 2019 11:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=l3f7J9dLXFEkkPEpHoZfCHDBojT5vl2BXru+bCQWM9k=;
        b=ex7I0HZM1XZ6nwcwJqKZFzWwvGvKmcP9p6rxpsVI/+xYBxClCbtueXcVx0JxcT5oID
         JXpkwA/Bhug+LEiV8vtZANPVM3IxNyQ+W/6m3o6LQa+FPXzahsdNpQXLz2q9/iBg5cf9
         Q81XzJ2UHw+Xu2lkdOP+AvS2qPMEACeupEn/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=l3f7J9dLXFEkkPEpHoZfCHDBojT5vl2BXru+bCQWM9k=;
        b=nSPX5LQlZeI1SFVH6mf2ZuWzfp3hRzlgVkOyRnxTo3QyqPABo7R6JMmLfffZr0L/ZK
         8YiNCnjRl7lewRgYgCRqdeEMrJzTUloS8haer7Ba+48FlcTOLjfixIqIeG93I6KWzvJ1
         R3TzhBvKyNEFcxylv1BZHQkUkdXGFrC/RX50q9Klzo+K8gAgh+dzQcb0Ov/Djp3CBEh/
         ME3q493iV/+lQQwpmtk75WOUyfWHrMw8TU0scXEamDpz7tRkYjiVZBJSk8/oHK9ZeOVB
         k7aEFuHeRdXKyMUx0qM4wv1ExQJe8wIk5aWF1z5EvoMYZUV5dThZsffdHl1rPNv6NqGV
         qx6w==
X-Gm-Message-State: APjAAAUU5I0fWFcmwKsuFVd5VDUb/NdIAHqMLIA57gQ4FetEDLjR1UjX
        X5n+bJLF+5V0VGJou30NeVxWzA==
X-Google-Smtp-Source: APXvYqxPQ9aH3jF39LKTjf20cbeWadPkB+uuUPl7/RjqxCo7ecZeQNFkTtcAcpXBrjBObejQFr9TmQ==
X-Received: by 2002:a17:902:a8:: with SMTP id a37mr226321pla.316.1566499220955;
        Thu, 22 Aug 2019 11:40:20 -0700 (PDT)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id z19sm51056pgv.35.2019.08.22.11.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 11:40:20 -0700 (PDT)
From:   Scott Branden <scott.branden@broadcom.com>
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Kees Cook <keescook@chromium.org>,
        Takashi Iwai <tiwai@suse.de>, linux-kselftest@vger.kernel.org,
        Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH v2 0/2] firmware: selftest for request_firmware_into_buf
Date:   Thu, 22 Aug 2019 11:40:03 -0700
Message-Id: <20190822184005.901-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

This patch series adds kernel selftest of request_firmware_into_buf.
The API was added to the kernel previously untested.

Changes from v1:
- Dropped demonstration patch for a race condition discovered
while testing request_firmare_into_buf.
The new test exposes a kernel opps with the firmware fallback mechanism that may
be fixed separate from these tests.
- minor whitespace formatting in patch
- added Ack's
- added "s" in commit message (changed selftest: to selftests:)

Scott Branden (2):
  test_firmware: add support for request_firmware_into_buf
  selftests: firmware: Add request_firmware_into_buf tests

 lib/test_firmware.c                           | 50 +++++++++++++++-
 .../selftests/firmware/fw_filesystem.sh       | 57 ++++++++++++++++++-
 tools/testing/selftests/firmware/fw_lib.sh    | 11 ++++
 3 files changed, 114 insertions(+), 4 deletions(-)

-- 
2.17.1

