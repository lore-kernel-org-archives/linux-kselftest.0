Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FA8C5517A
	for <linux-kselftest@archiver.kernel.org>; Wed, 11 Nov 2020 20:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A194208B8
	for <linux-kselftest@archiver.kernel.org>; Wed, 11 Nov 2020 20:46:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sent.com header.i=@sent.com header.b="G28shBuM";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jbfenD4g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgKKUqD (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 11 Nov 2020 15:46:03 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:36181 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726871AbgKKUqC (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 11 Nov 2020 15:46:02 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id E2A62B45;
        Wed, 11 Nov 2020 15:40:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 11 Nov 2020 15:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
        :to:cc:subject:date:message-id:in-reply-to:references:reply-to
        :mime-version:content-transfer-encoding; s=fm2; bh=Ao4OQzNEMkLUB
        rt8fQw2khsG2IVAwlRTCnIBOCh4AzI=; b=G28shBuMvus0pki1eu5Vkq4Grf0lO
        b34p4MR90hWIeKICBMvCssewrtQ3rLrRBNfzSeNDp8ARtpsflL2oo4bOWjrCn+yc
        5h8y8K9DzFYRM7yR7Crb7VnlIDqYG8S4BcAm9KYa5T5WNZk/m9zmepDofqC2iIFw
        Mx+dQAq4ftmG7+MBAYkKeY+TAbfGGeQ8wdJ5yDSfvxnFsPVvErvKk3rAAFMN5j3I
        N99KJvcP2cyos451wXIsc0x18J/TJPA9ZWarZ3IuIYg6jA5UYqcXp6+bQeHbKxoY
        +S5KmSrMhCjlJbjGKkAKAdsfOboH99oQUy6pr5p0hDflQqOZfniVT9zuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:reply-to:subject
        :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=Ao4OQzNEMkLUBrt8fQw2khsG2IVAwlRTCnIBOCh4AzI=; b=jbfenD4g
        zwnLr0RWKlmTz1To0IBFs7Tld1sqLWJrUZUm6le2AJdhi7D86YBjXf3zfOsb0MA0
        mtuq6K+t8lFOht4xCpVZD2h4+y8T1EDzKqJpRDiqSMdt3Y3V6VkvsEs/tO6ZgVYq
        /HuJD2sQm2vAO+PVYD3s825UenK0atu7XqIgJYBhtQBxIL5o8gunwGLwMLMPk4zO
        VAXc9rpf2P1OA2lKGbKN7ssGONkwVZRHcg0xllPNrR8icvmUZjZAbauP5qHu4nyS
        6nOiZXuVxzrbbOEVFoG577eKcQeuSFGD0z3I//Q3dYGJjHMq58N00tkA7VzJGizq
        OlJ/lIa8FV6dsw==
X-ME-Sender: <xms:SUysX6qqmK3yMVUxwLspyLLBdRYccrQjH-z1f1pfKS6-Mxxooc2-eQ>
    <xme:SUysX4qCAxy09oQ1V39cJlF-dXdQugDXUJ2K-iDoq0Llvx-zKnPrkBt4LtOQt3SMd
    9bh4SuqBK5yyhb2Aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvtddgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
    rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
    dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecukfhppedu
    vddrgeeirddutdeirdduieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:SUysX_PoXg9dxMKJ5nlY1Ivq0z8YYvFinRlgG3jdnXzwUpbyXCRICA>
    <xmx:SUysX57tmo_MBmvRkS1dyvcie2WhVcER9v54ewADAj8wSV7CgB96HA>
    <xmx:SUysX57kXqS-K2asmvxiQ-zLRwm_L8BZ5K9O6FidRBwdVzpjZZ8n6Q>
    <xmx:SUysX2za3-HDbncLZCaJWew_OGLPvyxa3iQYQDeYTuG2k51SsYU_IRaTndE>
Received: from nvrsysarch6.NVidia.COM (unknown [12.46.106.164])
        by mail.messagingengine.com (Postfix) with ESMTPA id ED343328006B;
        Wed, 11 Nov 2020 15:40:40 -0500 (EST)
From:   Zi Yan <zi.yan@sent.com>
To:     linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Cc:     "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Yang Shi <shy828301@gmail.com>,
        Michal Hocko <mhocko@kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        David Nellans <dnellans@nvidia.com>, Zi Yan <ziy@nvidia.com>
Subject: [RFC PATCH 5/6] mm: truncate: split thp to a non-zero order if possible.
Date:   Wed, 11 Nov 2020 15:40:07 -0500
Message-Id: <20201111204008.21332-6-zi.yan@sent.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111204008.21332-1-zi.yan@sent.com>
References: <20201111204008.21332-1-zi.yan@sent.com>
Reply-To: Zi Yan <ziy@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Zi Yan <ziy@nvidia.com>

To minimize the number of pages after a truncation, when truncating a
THP, we do not need to split it all the way down to order-0. The THP has
at most three parts, the part before offset, the part to be truncated,
the part left at the end. Use the non-zero minimum of them to decide
what order we split the THP to.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/truncate.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/mm/truncate.c b/mm/truncate.c
index 20bd17538ec2..6d8e3c6115bc 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -237,7 +237,7 @@ int truncate_inode_page(struct address_space *mapping, =
struct page *page)
 bool truncate_inode_partial_page(struct page *page, loff_t start, loff_t e=
nd)
 {
 	loff_t pos =3D page_offset(page);
-	unsigned int offset, length;
+	unsigned int offset, length, left, min_subpage_size =3D PAGE_SIZE;
=20
 	if (pos < start)
 		offset =3D start - pos;
@@ -248,6 +248,7 @@ bool truncate_inode_partial_page(struct page *page, lof=
f_t start, loff_t end)
 		length =3D length - offset;
 	else
 		length =3D end + 1 - pos - offset;
+	left =3D thp_size(page) - offset - length;
=20
 	wait_on_page_writeback(page);
 	if (length =3D=3D thp_size(page)) {
@@ -267,7 +268,24 @@ bool truncate_inode_partial_page(struct page *page, lo=
ff_t start, loff_t end)
 		do_invalidatepage(page, offset, length);
 	if (!PageTransHuge(page))
 		return true;
-	return split_huge_page(page) =3D=3D 0;
+
+	/*
+	 * find the non-zero minimum of offset, length, and left and use it to
+	 * decide the new order of the page after split
+	 */
+	if (offset && left)
+		min_subpage_size =3D min_t(unsigned int,
+					 min_t(unsigned int, offset, length),
+					 left);
+	else if (!offset)
+		min_subpage_size =3D min_t(unsigned int, length, left);
+	else /* !left */
+		min_subpage_size =3D min_t(unsigned int, length, offset);
+
+	min_subpage_size =3D max_t(unsigned int, PAGE_SIZE, min_subpage_size);
+
+	return split_huge_page_to_list_to_order(page, NULL,
+				ilog2(min_subpage_size/PAGE_SIZE)) =3D=3D 0;
 }
=20
 /*
--=20
2.28.0

