Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85B24A044
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Mar 2026 07:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772954063; cv=none; b=LPN/Ma2NXoC7pUkXuoY7+51CM7+WBHWLUxcsXnca4gXNUBdf1bEwhjMKU8DuLsSogx1busvjmlD/r1odvUdPYxrGTOHfkAC9H70kkr7rRMowZY8tBlmQBxesUU6IbLuyfFH/FtMJVnFJKYhnVXWUZ+mo7NGV90dSsza8ezAOynA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772954063; c=relaxed/simple;
	bh=0rikxr2F+VNkKJq2PEz0iySpe8hatBuOWYOswEyDftw=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=A24Id7ONo9EMtAc8+jbAl2/OhqLqKObcarw+vKVgRsc9Vw9cAUhHL1XVSok3bkvfefJDtm4frEbJkWcQyVPFYNpDq/Pn5X3NgA+0H+rZSaaTFmkJnmZHYUIUoHfCJhGkAhMNyvFzWOfMIXOnouV/vZuToEwVNj0W3Db4ZfiY8wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lumphini.org; spf=pass smtp.mailfrom=lumphini.org; dkim=pass (2048-bit key) header.d=lumphini.org header.i=@lumphini.org header.b=eLbdP3Zb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KlMK9Ar6; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lumphini.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumphini.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumphini.org header.i=@lumphini.org header.b="eLbdP3Zb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KlMK9Ar6"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 603BC140008E
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Mar 2026 03:14:19 -0400 (EDT)
Received: from phl-imap-16 ([10.202.2.88])
  by phl-compute-04.internal (MEProxy); Sun, 08 Mar 2026 03:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumphini.org; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1772954059; x=1773040459; bh=npnlJosXL3
	qLpCgabwCX5xZzncSa6v3/eH12ETQvNd0=; b=eLbdP3ZbfzVwnuUvA6e5pkBuU2
	yoR89fK4izNGotjgwyhKkwUccLHFxUsdanB0ZMomVm5r+XFCBx68ebABNuYCanGx
	qeUgA7FOfAj+hyEa9mGwRRu4LOB9Z8D2Kt9S+XqqoHY552tPUsAiKU7vV8nJwWD1
	MCeFQlfIlA5+wL5jNJ9DUvaAKbp6Nhg7eXKsn+HpXx8+lMKseSiuOC+yrIGUYcDR
	S8FVdRr6IER1CNtnRVluiL7AGOrUcRj08BKck5XnhGhcRgg/+YZzV5cVftI8sUpQ
	8SqZ1Swf2qQMBzJI2oAgRCO8vQMBOK1+wueMP9rUSMTdgrWu6zzLLg6Nff1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772954059; x=1773040459; bh=npnlJosXL3qLpCgabwCX5xZzncSa6v3/eH1
	2ETQvNd0=; b=KlMK9Ar6Sw34aGeBM1FhjmMocVN2KUN7ciaUxc3/oToxlOtqVQ9
	uVnS1D8E5BVSfcgVwKmpg6n//hO3Nsddgw3VbMNGP052+HTXVkrVtwh1TbpBW73n
	T2Ra6C6A1q1D6Mgftboy3xLFHL6HzgHgxQ1hqB4v9xOUaNRyyk9vncrplLG8cwtL
	Jn4HEbnTOxbFwx0W2znOwqSl46xqRuOyK+6P3O0i59J2Tx+7L4PHvnVp8Np9F4Mc
	jBvg3dq/xBERugGES/0Z+1PvU3HYtUqm4d4V/pJSKrdd1hmUqnnMj7NM/h0PWn4Q
	tsMkEZVXJVPmIQYqDn4JKASGeExsUV20vPg==
X-ME-Sender: <xms:yyGtaSe_2ismqc2uSmwgNlSHVwUenC-hr3UVRdCD9cr-fIXRJMI73A>
    <xme:yyGtaXBBYxlcsTgK6blsjjULk8dtDuCnl3emHirmfi4Esk-tqPs8g13e_p5nmPASb
    m0xhnPHazK4To036kaeXsbWMOp3v2XvGfDfq6MUwL8WCgjvyVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeegheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkffutgfgsehtjeertdertd
    dtnecuhfhrohhmpeftrghnghhouceolhhiiigrrhgusehluhhmphhhihhnihdrohhrgheq
    necuggftrfgrthhtvghrnhepjeduhefhheeifeeugeejudeuiefhleegueekieehvdfgue
    ehgeeuvdevudfhtefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheplhhiiigrrhgusehluhhmphhhihhnihdrohhrghdpnhgspghrtghpthhtoh
    epuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhhsvghlfhht
    vghsthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:yyGtabMOoUqFmC7NwUjyWRa67LRHyzoQZVawmBZ2E7oEevUQXTjAkw>
    <xmx:yyGtaV6VQan10E7U2nDn4_m-eFUd8mpedcislrIVUps_6jWygc3EGw>
    <xmx:yyGtaXIC7NR9S-LO9t_uunW7CB89StjMLNU-lBU87esfqZiTEnMuRQ>
    <xmx:yyGtaXdjcpENrWhJy-ko6ZCT3xbjqWiB3HcirSLe05_zCRIgRG2uMw>
    <xmx:yyGtaZijq_xOIAIxnFEW8ADQo_ZweImnXN1RUCMclBc7XERqJm8lsxqS>
Feedback-ID: iefb4495e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 374AB2CC0083; Sun,  8 Mar 2026 03:14:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 08 Mar 2026 14:13:57 +0700
From: Rango <lizard@lumphini.org>
To: linux-kselftest@vger.kernel.org
Message-Id: <c113f422-ad6d-4495-ab47-6e46b1e23a43@app.fastmail.com>
Subject: [PATCH] kunit: list: add tests for circular entry helpers, prepare_entry, and
 hlist_splice_init
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Add KUnit tests for list.h macros/functions that currently lack
test coverage but have non-trivial edge cases:

- list_next_entry_circular / list_prev_entry_circular: verify both
  normal traversal and the wraparound case where iteration crosses
  the list head boundary.

- list_prepare_entry: verify the NULL pos case, which is the primary
  use case for this macro -- it allows list_for_each_entry_continue()
  to start from the beginning of the list when no prior position
  exists.

- hlist_splice_init: verify that splicing one hlist onto another
  correctly chains the nodes and empties the source list.

Written with the assistance of Claude (Anthropic).

Signed-off-by: lizard@lumphini.org
Co-developed-by: Claude (Anthropic)
---
 lib/tests/list-test.c | 115 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/lib/tests/list-test.c b/lib/tests/list-test.c
index 6d9227a..9e0eec7 100644
--- a/lib/tests/list-test.c
+++ b/lib/tests/list-test.c
@@ -765,6 +765,83 @@ static void list_test_list_for_each_entry_reverse(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, i, -1);
 }
 
+static void list_test_list_next_entry_circular(struct kunit *test)
+{
+	struct list_test_struct entries[3], *cur;
+	LIST_HEAD(list);
+	int i;
+
+	for (i = 0; i < 3; ++i) {
+		entries[i].data = i;
+		list_add_tail(&entries[i].list, &list);
+	}
+
+	/* Normal advance */
+	cur = &entries[0];
+	cur = list_next_entry_circular(cur, &list, list);
+	KUNIT_EXPECT_PTR_EQ(test, cur, &entries[1]);
+
+	/* Wraparound: next from last entry should return first */
+	cur = &entries[2];
+	cur = list_next_entry_circular(cur, &list, list);
+	KUNIT_EXPECT_PTR_EQ(test, cur, &entries[0]);
+}
+
+static void list_test_list_prev_entry_circular(struct kunit *test)
+{
+	struct list_test_struct entries[3], *cur;
+	LIST_HEAD(list);
+	int i;
+
+	for (i = 0; i < 3; ++i) {
+		entries[i].data = i;
+		list_add_tail(&entries[i].list, &list);
+	}
+
+	/* Normal retreat */
+	cur = &entries[2];
+	cur = list_prev_entry_circular(cur, &list, list);
+	KUNIT_EXPECT_PTR_EQ(test, cur, &entries[1]);
+
+	/* Wraparound: prev from first entry should return last */
+	cur = &entries[0];
+	cur = list_prev_entry_circular(cur, &list, list);
+	KUNIT_EXPECT_PTR_EQ(test, cur, &entries[2]);
+}
+
+static void list_test_list_prepare_entry(struct kunit *test)
+{
+	struct list_test_struct entries[3], *cur;
+	LIST_HEAD(list);
+	int i;
+
+	for (i = 0; i < 3; ++i) {
+		entries[i].data = i;
+		list_add_tail(&entries[i].list, &list);
+	}
+
+	/* With a valid pos, prepare_entry returns it unchanged */
+	cur = &entries[1];
+	cur = list_prepare_entry(cur, &list, list);
+	KUNIT_EXPECT_PTR_EQ(test, cur, &entries[1]);
+
+	/*
+	 * With NULL pos, prepare_entry returns the list head as an entry,
+	 * so that a subsequent list_for_each_entry_continue() starts from
+	 * the first real entry. This NULL case is the main reason the
+	 * macro exists and is worth testing explicitly.
+	 */
+	cur = NULL;
+	cur = list_prepare_entry(cur, &list, list);
+
+	i = 0;
+	list_for_each_entry_continue(cur, &list, list) {
+		KUNIT_EXPECT_EQ(test, cur->data, i);
+		i++;
+	}
+	KUNIT_EXPECT_EQ(test, i, 3);
+}
+
 static struct kunit_case list_test_cases[] = {
 	KUNIT_CASE(list_test_list_init),
 	KUNIT_CASE(list_test_list_add),
@@ -805,6 +882,9 @@ static struct kunit_case list_test_cases[] = {
 	KUNIT_CASE(list_test_list_for_each_prev_safe),
 	KUNIT_CASE(list_test_list_for_each_entry),
 	KUNIT_CASE(list_test_list_for_each_entry_reverse),
+	KUNIT_CASE(list_test_list_next_entry_circular),
+	KUNIT_CASE(list_test_list_prev_entry_circular),
+	KUNIT_CASE(list_test_list_prepare_entry),
 	{},
 };
 
@@ -1181,6 +1261,40 @@ static void hlist_test_for_each_entry_safe(struct kunit *test)
 }
 
 
+static void hlist_test_splice_init(struct kunit *test)
+{
+	struct hlist_node entries[4];
+	struct hlist_node *cur;
+	HLIST_HEAD(list1);
+	HLIST_HEAD(list2);
+	int count;
+
+	/* list1: entries[0] -> entries[1] */
+	hlist_add_head(&entries[0], &list1);
+	hlist_add_behind(&entries[1], &entries[0]);
+
+	/* list2: entries[2] -> entries[3] */
+	hlist_add_head(&entries[2], &list2);
+	hlist_add_behind(&entries[3], &entries[2]);
+
+	/*
+	 * Splice list1 (up to and including entries[1]) onto the front
+	 * of list2. list1 should be emptied.
+	 */
+	hlist_splice_init(&list1, &entries[1], &list2);
+
+	KUNIT_EXPECT_TRUE(test, hlist_empty(&list1));
+
+	/* list2 should now be: entries[0] -> entries[1] -> entries[2] -> entries[3] */
+	KUNIT_EXPECT_PTR_EQ(test, list2.first, &entries[0]);
+	KUNIT_EXPECT_PTR_EQ(test, entries[1].next, &entries[2]);
+
+	count = 0;
+	hlist_for_each(cur, &list2)
+		count++;
+	KUNIT_EXPECT_EQ(test, count, 4);
+}
+
 static struct kunit_case hlist_test_cases[] = {
 	KUNIT_CASE(hlist_test_init),
 	KUNIT_CASE(hlist_test_unhashed),
@@ -1200,6 +1314,7 @@ static struct kunit_case hlist_test_cases[] = {
 	KUNIT_CASE(hlist_test_for_each_entry_continue),
 	KUNIT_CASE(hlist_test_for_each_entry_from),
 	KUNIT_CASE(hlist_test_for_each_entry_safe),
+	KUNIT_CASE(hlist_test_splice_init),
 	{},
 };
 
-- 
2.53.0

-- 
Rango
 lizard@lumphini.org
