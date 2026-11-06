Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973719;
	b=sC9PObMIwoDml4AA3G4wHpY7wOsxmKLq1c/+b445v6ORDhzV1yRtM2226mvY8L7VmGiO
	 D66WfDkX6lP5PuFb5Tyfqv35v0HtM1x7OwXtFEHit6a/rzW2+JlO1Im3d+0lQ8cUjoEuZ
	 DGCDrOoT0sRogWNsDR5qVbYlMSNu+N6xnmpZWAx57f5GvJl8Hyqc2T7cds0Bg/vw8HFNY
	 2lmquG3j1Evy8EVJ6AsxbrZW1HmJcFjalihI1jWrHxt0pCLzvJttFe7vQlF43Nh5W3NeD
	 mpt0NITjCGsTh0geBC+bjlwrCkvwn/Er6xXBQmaEzbfoLirwJ3Xihz8nLnxvTfCaMAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=gVr/Wyc2uyQROsmCt+IKCFC14ShR0qGLck6PYeMVB7k=;
	b=OL5mIEkU80S/ieIZJx0b8zCmNEDYhQhV+54E3NrOCwfBOUgrEoxSmOXdI/0UiXGECxfU
	 JtUaKnfCj+UwJpmvuN9+XBaZZktEPUAwLBiif1D5Km4kJBAOVtRYujT2i+MGs14Cv9jYY
	 HyLPGDnd7/0p5zA9OUO7Tf8tHZZQjLa1xiyqZbJHaDayQ6aePF+4XCQkNJcrT0/faAWJm
	 iOtE7a2qMKbPWi03l2tNSaaGV6eR69d0v2btoRnqjon06I6iZr/RIITSXN7i5biToVBmz
	 ohX2lGAypTWwh314rzi5VM00hn8SUCSLa6gO6uqYEklOflZGqGry2sYjNoCZLqIKgZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Puk1wQy2;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505BE606A32C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 14:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505BE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Puk1wQy2
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8871ada1a26so5010967b3.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 06:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973718; x=1794578518; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gVr/Wyc2uyQROsmCt+IKCFC14ShR0qGLck6PYeMVB7k=;
        b=Puk1wQy2NGJOVR8mv8OjMDEDY0mDVzTOlVqDWwMiSIyfOooiPo75OKwp7sKA9UgQoj
         MCFq0NqjMZ49oSeBKicD9/ao7EUEV4UULw605NrW9YD72dJqQG4ZvYKVkQzLjTpBy+8G
         bcXNYFfWCfdHQC8ARlVBLmodCD208j1NaiGhPD7RceTeNB9UC12EYNxYpsGHM+3DaJPp
         vIiwvKl8u2bBJdqPJsKuorbsu5ZCyduGhXa7A45ZEwGpmR2to46AEzzeFVlla31eUfXR
         6Mpb0oopyJBrtXB90fpQacXnxqeUQbmMH2ybbfFobJbCgsblnB/7gAEg0+wXpo1o221X
         anuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973718; x=1794578518;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gVr/Wyc2uyQROsmCt+IKCFC14ShR0qGLck6PYeMVB7k=;
        b=UhraboHZLYYw5aDcozrmmrDamy4KV3sydW9UZP4+z7bLHbMfyzywEzIRr6VZ3DiCML
         VqpNY9mnvScyadQ3AWRz6kGHR1sFtXmtpE+1kGQS9JxdwP+JJNHvnjCBfPuFSyJT/wHr
         s7HS6YrdSvEHLsqTWzba7EC+gH4q3gUngdGooAt9VoEl0JgWECxoNA9sKPYzHfFKqUKO
         Fl/YjeqFZdR7NcGvHoVtRYtsyne1G+QWMbXSjMtFG8FifMaXn7HWYiOdDN78GuwrtmLv
         eAJQmvEsAdCFHp1R1ARGaDbRB4gtLshcGkEvBTwDnOyGJIdFTYVpIPthvktXg1NZDc1A
         i7eA==
X-Forwarded-Encrypted: i=1; AL+hErGKOLFkWt+7K5P34d07VO9fh4JjZXDxlNgUVanf7o5cY6hSe6I4bqtyy2R+ByrXSMykVBbfaCYSPb8/ViY8JBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BvHylbuixDjp2Gxu+W2Z/IW20ze3pu7jS3R1bjzMOJZoeuC8c
	HKzj22khhFkb7Am9pe/kh3ii54LQpngsdGFoKHQk5jrr6rbCsdLYJ0WU
X-Gm-Gg: AYBFou2YwKD4rRIji8P/BfMR2aYQK3IQaa/YQXmklTKFYGFGSUh+F4gr69EmqGkrF/Z
	D3fpJSXkXlVrRN088+IJkuKJr6SA+66y8tbs3kz/PFODAPj2NW5qTtKJA+Emnn1V7mpKfFv9nq3
	gclhSQDyDU94osfUclVti9vyLNLXEo6HaYWjixwr7A9ZeQctXcZNdVS1jIbJAWqIWGqATTtKAiv
	NUIWfu4bJk7voFxNEFK+o2AJj7MMmgso6+O0DfmrmuX5IapBpf9jtVxHCU6x963DCG1X+1NCTJi
	fNVdOWD3BEYaYGLOCaNW/ePYXzLt+9WFEpEz3yqcS22K4WGEwUbkReG9bbAsL57NZ4OB7aN8q1Y
	QIcmpWkas3isGttsYVs8/T1uuksm9hLijqT2AeaWWgGTT31/+YWqDjMzCQB8B3kC27IzaSXxpuW
	rD24RELrI33eDeCsX9tfG/00XLkL6sQllNvUKL3mJ3nv0QSTxP+kTUBAD5rY7tLZIVMN9a2Pf6O
	3w9HdZ6llthH+CySd7XJKdSo29r5B/1ZZ+fHqowpZwC4ARM+/D1Ur4+tq6VdagwmHtJTgCJshNP
	Q9m1CyDBFfUFJNZipKg/5Gg15jPmOr3UTP6n0+JEUu4d13HSN93DWc7PbIIxlr5DWdJGdCD8qJC
	OVfAwTslqb6Q2o5xU2UX2kFod4GL75+Mo/ossoQKrPCOqn02yADV3lH8X6Hww
X-Received: by 2002:a05:690c:86:b0:8b1:bd8a:9588 with SMTP id 00721157ae682-8b3419b9bbemr11152827b3.86.1793973711902;
        Fri, 06 Nov 2026 06:01:51 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f88c62dsm18956827b3.43.2026.11.06.06.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:01:50 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Date: Fri, 06 Nov 2026 09:01:48 -0500
Subject: [PATCH] lib/tests: add KUnit tests for the timerqueue
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-kunit-timerqueue-v1-1-1913a0bf2d45@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMvd7WoC/yXMOw6DMBBF0a2gqWPJNuAiW0EUYB5hQDHEHxQJs
 fcYUp7i3oMCPCPQszjIY+fAq8tQj4Ls1LkXBA/ZpKU2SkkjluQ4ishv+E9CgtBSmqqzZd3rgXK
 2eYz8vZdN+3dI/Qwbrw+d5w/8JXnNdAAAAA==
X-Change-ID: 20261106-kunit-timerqueue-20064ac35b2d
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

lib/timerqueue.c is the time-ordered queue behind hrtimers, POSIX CPU
timers and the alarm timers, and since commit 1339eeb73d6b
("timerqueue: Provide linked timerqueue") it also has a linked variant
that keeps prev/next pointers for hrtimer rearming. Neither has unit
tests.

Add a KUnit suite that covers:

- an empty queue, and timerqueue_iterate_next(NULL);
- timerqueue_add() returning true only when the node becomes the
  first, and timerqueue_del() returning true while nodes remain;
- iteration in expiry order, and nodes with the same expiry time
  staying in the order they were added;
- a deleted node being queued again;
- 256 nodes with pseudo-random expiry times (fixed seed): order and
  count after inserting, deleting from the middle and draining from
  the front;
- the linked variant: prev/next links in both directions after
  inserts, deletes from the middle and the front, and re-adding; and
  the same pseudo-random stress with every prev link checked.

An AI coding assistant (Claude Opus 5.5) was used to draft the tests.
They were run with "tools/testing/kunit/kunit.py run" on UML (6/6
pass), built with W=1 without warnings, and checked against
deliberately broken versions of the two comparison functions and of
timerqueue_del()'s return value, which the suite catches.

Signed-off-by: Amit Patole <amit.patole@gmail.com>
---
Tested on UML with a kunitconfig of CONFIG_KUNIT=y and

CONFIG_TIMERQUEUE_KUNIT_TEST=y: 6/6 pass.
---
 lib/Kconfig.debug            |  13 ++
 lib/tests/Makefile           |   1 +
 lib/tests/timerqueue_kunit.c | 293 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 307 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..5707ed622d5d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3461,6 +3461,19 @@ config RATELIMIT_KUNIT_TEST
 
 	  If unsure, say N.
 
+config TIMERQUEUE_KUNIT_TEST
+	tristate "KUnit test for the timerqueue" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for lib/timerqueue.c,
+	  the time-ordered queue behind hrtimers and POSIX CPU timers.
+	  The tests cover ordering, the return values of the add and
+	  delete helpers, equal expiry times and the prev/next links of
+	  the linked timerqueue.
+
+	  If unsure, say N.
+
 config UUID_KUNIT_TEST
 	tristate "KUnit test for UUID" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index df0537e1b91f..1d18cfdca256 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -58,5 +58,6 @@ obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
 obj-$(CONFIG_UTIL_MACROS_KUNIT) += util_macros_kunit.o
 obj-$(CONFIG_RATELIMIT_KUNIT_TEST) += test_ratelimit.o
 obj-$(CONFIG_UUID_KUNIT_TEST) += uuid_kunit.o
+obj-$(CONFIG_TIMERQUEUE_KUNIT_TEST) += timerqueue_kunit.o
 
 obj-$(CONFIG_TEST_RUNTIME_MODULE)		+= module/
diff --git a/lib/tests/timerqueue_kunit.c b/lib/tests/timerqueue_kunit.c
new file mode 100644
index 000000000000..2499626126ef
--- /dev/null
+++ b/lib/tests/timerqueue_kunit.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for the timerqueue in lib/timerqueue.c, both the cached
+ * rbtree variant and the linked variant used by hrtimers.
+ */
+
+#include <kunit/test.h>
+#include <linux/module.h>
+#include <linux/prandom.h>
+#include <linux/timerqueue.h>
+
+#define TQ_STRESS_NODES	256
+
+static void timerqueue_empty_test(struct kunit *test)
+{
+	struct timerqueue_head head;
+	struct timerqueue_node node;
+
+	timerqueue_init_head(&head);
+	timerqueue_init(&node);
+
+	KUNIT_EXPECT_NULL(test, timerqueue_getnext(&head));
+	KUNIT_EXPECT_FALSE(test, timerqueue_node_queued(&node));
+	KUNIT_EXPECT_NULL(test, timerqueue_iterate_next(NULL));
+}
+
+static void timerqueue_add_del_test(struct kunit *test)
+{
+	struct timerqueue_head head;
+	struct timerqueue_node a, b, c;
+
+	timerqueue_init_head(&head);
+	timerqueue_init(&a);
+	timerqueue_init(&b);
+	timerqueue_init(&c);
+	a.expires = 20;
+	b.expires = 10;
+	c.expires = 30;
+
+	/* timerqueue_add() returns true when the new node is the first. */
+	KUNIT_EXPECT_TRUE(test, timerqueue_add(&head, &a));
+	KUNIT_EXPECT_TRUE(test, timerqueue_node_queued(&a));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_getnext(&head), &a);
+
+	KUNIT_EXPECT_TRUE(test, timerqueue_add(&head, &b));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_getnext(&head), &b);
+
+	KUNIT_EXPECT_FALSE(test, timerqueue_add(&head, &c));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_getnext(&head), &b);
+
+	/* Iteration is in expiry order. */
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_iterate_next(&b), &a);
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_iterate_next(&a), &c);
+	KUNIT_EXPECT_NULL(test, timerqueue_iterate_next(&c));
+
+	/* timerqueue_del() returns true while the queue is not empty. */
+	KUNIT_EXPECT_TRUE(test, timerqueue_del(&head, &b));
+	KUNIT_EXPECT_FALSE(test, timerqueue_node_queued(&b));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_getnext(&head), &a);
+
+	/* Deleting a node that is not the first leaves the first alone. */
+	KUNIT_EXPECT_TRUE(test, timerqueue_del(&head, &c));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_getnext(&head), &a);
+	KUNIT_EXPECT_NULL(test, timerqueue_iterate_next(&a));
+
+	KUNIT_EXPECT_FALSE(test, timerqueue_del(&head, &a));
+	KUNIT_EXPECT_NULL(test, timerqueue_getnext(&head));
+
+	/* A deleted node can be queued again. */
+	KUNIT_EXPECT_TRUE(test, timerqueue_add(&head, &b));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_getnext(&head), &b);
+	KUNIT_EXPECT_FALSE(test, timerqueue_del(&head, &b));
+}
+
+static void timerqueue_equal_expiry_test(struct kunit *test)
+{
+	struct timerqueue_head head;
+	struct timerqueue_node n[3];
+	int i;
+
+	timerqueue_init_head(&head);
+	for (i = 0; i < ARRAY_SIZE(n); i++) {
+		timerqueue_init(&n[i]);
+		n[i].expires = 100;
+	}
+
+	/*
+	 * Nodes with the same expiry time stay in the order they were added,
+	 * and only the first one added reports itself as the new first.
+	 */
+	KUNIT_EXPECT_TRUE(test, timerqueue_add(&head, &n[0]));
+	KUNIT_EXPECT_FALSE(test, timerqueue_add(&head, &n[1]));
+	KUNIT_EXPECT_FALSE(test, timerqueue_add(&head, &n[2]));
+
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_getnext(&head), &n[0]);
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_iterate_next(&n[0]), &n[1]);
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_iterate_next(&n[1]), &n[2]);
+
+	for (i = 0; i < ARRAY_SIZE(n); i++)
+		timerqueue_del(&head, &n[i]);
+	KUNIT_EXPECT_NULL(test, timerqueue_getnext(&head));
+}
+
+/* Check that the queue holds exactly @count nodes, in expiry order. */
+static void timerqueue_check_order(struct kunit *test,
+				   struct timerqueue_head *head,
+				   unsigned int count)
+{
+	struct timerqueue_node *node, *prev = NULL;
+	unsigned int seen = 0;
+
+	for (node = timerqueue_getnext(head); node;
+	     node = timerqueue_iterate_next(node)) {
+		if (prev)
+			KUNIT_EXPECT_LE(test, prev->expires, node->expires);
+		prev = node;
+		seen++;
+	}
+	KUNIT_EXPECT_EQ(test, seen, count);
+}
+
+static void timerqueue_stress_test(struct kunit *test)
+{
+	struct timerqueue_head head;
+	struct timerqueue_node *nodes;
+	struct rnd_state rnd;
+	unsigned int i, left;
+
+	nodes = kunit_kcalloc(test, TQ_STRESS_NODES, sizeof(*nodes), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, nodes);
+
+	prandom_seed_state(&rnd, 42);
+	timerqueue_init_head(&head);
+
+	for (i = 0; i < TQ_STRESS_NODES; i++) {
+		struct timerqueue_node *first = timerqueue_getnext(&head);
+		bool expect_first;
+
+		timerqueue_init(&nodes[i]);
+		/* A small range, so that some expiry times are equal. */
+		nodes[i].expires = prandom_u32_state(&rnd) % 64;
+		expect_first = !first || nodes[i].expires < first->expires;
+		KUNIT_EXPECT_EQ(test, timerqueue_add(&head, &nodes[i]),
+				expect_first);
+	}
+	timerqueue_check_order(test, &head, TQ_STRESS_NODES);
+
+	/* Remove the odd nodes, then drain the queue from the front. */
+	left = TQ_STRESS_NODES;
+	for (i = 1; i < TQ_STRESS_NODES; i += 2) {
+		left--;
+		KUNIT_EXPECT_EQ(test, timerqueue_del(&head, &nodes[i]),
+				left != 0);
+	}
+	timerqueue_check_order(test, &head, left);
+
+	while (left) {
+		struct timerqueue_node *first = timerqueue_getnext(&head);
+		struct timerqueue_node *next;
+
+		KUNIT_ASSERT_NOT_NULL(test, first);
+		next = timerqueue_iterate_next(first);
+		left--;
+		KUNIT_EXPECT_EQ(test, timerqueue_del(&head, first), left != 0);
+		KUNIT_EXPECT_PTR_EQ(test, timerqueue_getnext(&head), next);
+	}
+	KUNIT_EXPECT_NULL(test, timerqueue_getnext(&head));
+}
+
+static void timerqueue_linked_test(struct kunit *test)
+{
+	struct timerqueue_linked_head head;
+	struct timerqueue_linked_node a, b, c;
+
+	timerqueue_linked_init_head(&head);
+	timerqueue_linked_init(&a);
+	timerqueue_linked_init(&b);
+	timerqueue_linked_init(&c);
+	a.expires = 20;
+	b.expires = 10;
+	c.expires = 30;
+
+	KUNIT_EXPECT_NULL(test, timerqueue_linked_first(&head));
+	KUNIT_EXPECT_FALSE(test, timerqueue_linked_node_queued(&a));
+
+	KUNIT_EXPECT_TRUE(test, timerqueue_linked_add(&head, &a));
+	KUNIT_EXPECT_TRUE(test, timerqueue_linked_node_queued(&a));
+	KUNIT_EXPECT_NULL(test, timerqueue_linked_prev(&a));
+	KUNIT_EXPECT_NULL(test, timerqueue_linked_next(&a));
+
+	KUNIT_EXPECT_TRUE(test, timerqueue_linked_add(&head, &b));
+	KUNIT_EXPECT_FALSE(test, timerqueue_linked_add(&head, &c));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_first(&head), &b);
+
+	/* The prev/next links follow expiry order in both directions. */
+	KUNIT_EXPECT_NULL(test, timerqueue_linked_prev(&b));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_next(&b), &a);
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_prev(&a), &b);
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_next(&a), &c);
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_prev(&c), &a);
+	KUNIT_EXPECT_NULL(test, timerqueue_linked_next(&c));
+
+	/* Deleting from the middle relinks the neighbours. */
+	KUNIT_EXPECT_TRUE(test, timerqueue_linked_del(&head, &a));
+	KUNIT_EXPECT_FALSE(test, timerqueue_linked_node_queued(&a));
+	KUNIT_EXPECT_NULL(test, timerqueue_linked_prev(&a));
+	KUNIT_EXPECT_NULL(test, timerqueue_linked_next(&a));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_next(&b), &c);
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_prev(&c), &b);
+
+	/* Deleting the first node moves the head to the next one. */
+	KUNIT_EXPECT_TRUE(test, timerqueue_linked_del(&head, &b));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_first(&head), &c);
+	KUNIT_EXPECT_NULL(test, timerqueue_linked_prev(&c));
+
+	/* Re-adding a deleted node with a later expiry links it last. */
+	a.expires = 40;
+	KUNIT_EXPECT_FALSE(test, timerqueue_linked_add(&head, &a));
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_next(&c), &a);
+	KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_prev(&a), &c);
+
+	KUNIT_EXPECT_TRUE(test, timerqueue_linked_del(&head, &c));
+	KUNIT_EXPECT_FALSE(test, timerqueue_linked_del(&head, &a));
+	KUNIT_EXPECT_NULL(test, timerqueue_linked_first(&head));
+}
+
+static void timerqueue_linked_stress_test(struct kunit *test)
+{
+	struct timerqueue_linked_head head;
+	struct timerqueue_linked_node *nodes, *node, *prev;
+	struct rnd_state rnd;
+	unsigned int i, seen;
+
+	nodes = kunit_kcalloc(test, TQ_STRESS_NODES, sizeof(*nodes), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, nodes);
+
+	prandom_seed_state(&rnd, 7);
+	timerqueue_linked_init_head(&head);
+
+	for (i = 0; i < TQ_STRESS_NODES; i++) {
+		struct timerqueue_linked_node *first;
+		bool expect_first;
+
+		first = timerqueue_linked_first(&head);
+		timerqueue_linked_init(&nodes[i]);
+		nodes[i].expires = prandom_u32_state(&rnd) % 64;
+		expect_first = !first || nodes[i].expires < first->expires;
+		KUNIT_EXPECT_EQ(test, timerqueue_linked_add(&head, &nodes[i]),
+				expect_first);
+	}
+
+	/* Remove every third node to exercise relinking. */
+	for (i = 0; i < TQ_STRESS_NODES; i += 3)
+		timerqueue_linked_del(&head, &nodes[i]);
+
+	/* Walk forward checking order and that each prev link points back. */
+	seen = 0;
+	prev = NULL;
+	for (node = timerqueue_linked_first(&head); node;
+	     node = timerqueue_linked_next(node)) {
+		KUNIT_EXPECT_PTR_EQ(test, timerqueue_linked_prev(node), prev);
+		if (prev)
+			KUNIT_EXPECT_LE(test, prev->expires, node->expires);
+		prev = node;
+		seen++;
+	}
+	KUNIT_EXPECT_EQ(test, seen, TQ_STRESS_NODES - (TQ_STRESS_NODES + 2) / 3);
+
+	for (i = 0; i < TQ_STRESS_NODES; i++)
+		if (timerqueue_linked_node_queued(&nodes[i]))
+			timerqueue_linked_del(&head, &nodes[i]);
+	KUNIT_EXPECT_NULL(test, timerqueue_linked_first(&head));
+}
+
+static struct kunit_case timerqueue_test_cases[] = {
+	KUNIT_CASE(timerqueue_empty_test),
+	KUNIT_CASE(timerqueue_add_del_test),
+	KUNIT_CASE(timerqueue_equal_expiry_test),
+	KUNIT_CASE(timerqueue_stress_test),
+	KUNIT_CASE(timerqueue_linked_test),
+	KUNIT_CASE(timerqueue_linked_stress_test),
+	{}
+};
+
+static struct kunit_suite timerqueue_test_suite = {
+	.name = "timerqueue",
+	.test_cases = timerqueue_test_cases,
+};
+
+kunit_test_suite(timerqueue_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for the timerqueue");
+MODULE_LICENSE("GPL");

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261106-kunit-timerqueue-20064ac35b2d

Best regards,
--  
Amit Patole <amit.patole@gmail.com>

