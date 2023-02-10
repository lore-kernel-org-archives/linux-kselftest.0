Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E006C64ED9
	for <linux-kselftest@archiver.kernel.org>; Fri, 10 Feb 2023 21:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbjBJVyO (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 10 Feb 2023 16:54:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233729AbjBJVx5 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 10 Feb 2023 16:53:57 -0500
Received: from 66-220-144-178.mail-mxout.facebook.com (66-220-144-178.mail-mxout.facebook.com [66.220.144.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AEA366BB
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Feb 2023 13:53:56 -0800 (PST)
Received: by dev0134.prn3.facebook.com (Postfix, from userid 425415)
        id 88E346BFC2D7; Fri, 10 Feb 2023 13:50:33 -0800 (PST)
From:   Stefan Roesch <shr@devkernel.io>
To:     kernel-team@fb.com
Cc:     shr@devkernel.io, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, david@redhat.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org
Subject: [RFC PATCH v2 09/19] docs: document general_profit sysfs knob
Date:   Fri, 10 Feb 2023 13:50:13 -0800
Message-Id: <20230210215023.2740545-10-shr@devkernel.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230210215023.2740545-1-shr@devkernel.io>
References: <20230210215023.2740545-1-shr@devkernel.io>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Document general_progit knob.

Signed-off-by: Stefan Roesch <shr@devkernel.io>
---
 Documentation/ABI/testing/sysfs-kernel-mm-ksm | 8 ++++++++
 Documentation/admin-guide/mm/ksm.rst          | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-ksm b/Documentatio=
n/ABI/testing/sysfs-kernel-mm-ksm
index d244674a9480..7768e90f7a8f 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-ksm
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-ksm
@@ -51,3 +51,11 @@ Description:	Control merging pages across different NU=
MA nodes.
=20
 		When it is set to 0 only pages from the same node are merged,
 		otherwise pages from all nodes can be merged together (default).
+
+What:		/sys/kernel/mm/ksm/general_profit
+Date:		January 2023
+KernelVersion:  6.1
+Contact:	Linux memory management mailing list <linux-mm@kvack.org>
+Description:	Measure how effective KSM is.
+		general_profit: how effective is KSM. The formula for the
+		calculation is in Documentation/admin-guide/mm/ksm.rst.
diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-g=
uide/mm/ksm.rst
index f160f9487a90..5c4daf44d79d 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -159,6 +159,8 @@ stable_node_chains_prune_millisecs
=20
 The effectiveness of KSM and MADV_MERGEABLE is shown in ``/sys/kernel/mm=
/ksm/``:
=20
+general_profit
+        how effective is KSM. The calculation is explained below.
 pages_shared
         how many shared pages are being used
 pages_sharing
--=20
2.30.2

