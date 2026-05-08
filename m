Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9023806C2
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251851; cv=pass; b=jGzWUFjQNmqcy83AuHjmzaOxlYOH90icUkAlK968Ej2Wns2rRZybGXuS92rvjblN+Ljl02TOZcwNpftbdIAQabQwktuE2l0w+ki3VoU8+dobQ1wih9zPy009g9oNDewFZlLAP2JRzn3oNPxex+mx6MQH2cIw//jfAYd+r7Hha34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251851; c=relaxed/simple;
	bh=Wpy4n9kwoAj8uW9K1jFd40zpy7PHG8nSEoDNiVZDohE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PYugRHz9M8ysQbiJsl52G6nuTG37rUYRCnnwO9ObXb1X+jH354ykWOReu2ArimFZ7+7/m1T0b8G6UzNK84KNQgtopGZs7WQt9E4B/ncG+3pO9zf6rFmZi+KMejheIeY4XWbpoBzCgZCmLZ+uQE9KeAUCdBTMV9PXbhNkLGWzWoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJjUVr8+; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJjUVr8+"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50e97863425so18601661cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 07:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778251848; cv=none;
        d=google.com; s=arc-20240605;
        b=U+32orRJUek6cPJvdmjAhzLQ7h9S0AdxKM4V41iXUllPuXmMzT4C4hEbRQGvcTGKGT
         O8Z1Q4iT4EDSL7pGo+5PfV3bqUe5U17NlFzP5qIRiSb19JO0O8UxomaS6Y8Tw8d7h632
         VhgqvqQ0I5LRUQ2V7TJXma/m81zoln4WL8XRFoB7k9xK2D14EOOFnoSKE1d7i8hZMdiU
         fXRmg+NP2+T6/lf2lGBC1HLrZbS8H5QX5/t6lcvhuYgkGpDqHOBlvVC54Rim0a9xzOwg
         zvUPFPGRWDjo5DB4DCFoghTzfaZlssu+xur6tq4m02KqavZYKRXCAm4Wc9Nas6ex9s2c
         3elw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OTGWS6xjrIK1OUQTkl0bPy2qh3lFzXq36Ag0mPZq448=;
        fh=pY1UkRH/0kwOfvb1UJWSJyTELE2sOj3SGzkh1d9LDnU=;
        b=bqbfKgbEI5C+oNdM0hAw7EJE8U7lmL9I9zsty3rFc8QiQzwtfRR4EXdpAQH+LjrRFS
         G64uS8xLdWQvHutRo4DssO5IIbHCIYjSQ9LLF+UQSyzUMcJyBFDWl5aEqSAtrhF3uOCk
         XiPxUyJEZKXUhMvQKAazm8ivhYAkBkcpausuMz5Vh9mbPBzhLrTTebN9UhotcmMMYb0i
         Yz2HMgOqoEu+013H5RYVxf0DSUxWWL+yTU5W40AHU2ipUfzrqfxIYy14rn3U7B/8OFt3
         W7bcpzC8nUI8LkOdcOe+ExlvojVvghwzwSe8HuRtqfkQDuQprHXBco+cS4M3ZLeAamZv
         M63w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251848; x=1778856648; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OTGWS6xjrIK1OUQTkl0bPy2qh3lFzXq36Ag0mPZq448=;
        b=jJjUVr8+fUGkkkcZxIG0EN811dl7XxZKXPl7XiML7sMJbtRB2hdtnjKmsA39ZTqrNA
         1PvHBneHQBF8hiMuQgs2B09GzQ6CrdoeY9R6Gz7mH1dMDq+UJCk/hNUjNRyw6zoCIGuz
         dE/ncexgVFt3dK3N8Zhx702+94rfeOrBOtz8avI0qGXMaSdG4WgtInSm8Hu4JG6rkeb9
         VRLS6YkiaVeAD9ORiawDx5hnHsaGHoNrMNe80PCw02WDTjKimuk4/1jlgs8mEJA+qMKh
         b1mevwIPUnDueSN1uKq5ZwyG63+bic5aE3wssR0cXuJiqcD1VuBfFjJans+TUX7x7UJG
         IXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251848; x=1778856648;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OTGWS6xjrIK1OUQTkl0bPy2qh3lFzXq36Ag0mPZq448=;
        b=VqTLuhKqpXOJcOW+XliAwlxqatKh3hZkz1m9gPp7V5N2DZynULWA4K340UT2YV+Eix
         grmeeUpHkzAfMF9tbjdfPvm/HllGaH9db7+6FLX0/uTiOeGEYrDCgXtVXC0tB321p7x5
         P/SFa51EhmuGRKGUDbUV8qC873duNFZYsAXISBqBRdEcRv6HvK8CGOZjW3v9j93h6X73
         jwgxeO+YOE2b0aue2r1LnSm8j5DZxH3frj6wzm0ZkiVJ/N7DotQ7qZbznHeHHvU36Wh/
         MK8umKr3UHO1MnjgpdILtQMZSHTUmX6dYrEhTN2c+O8a36FjaQYy4ukLlH/a7Qxp7r0A
         NpCQ==
X-Gm-Message-State: AOJu0Yx3IRqLbC4Xm09IPX0q3o78dBII5XBX7M/O4izgnkV8mHeoZU8H
	vRKSNCNP4kEjzOSByKL2Yv+o2C4ybMAnnCEgFi+8pgQZEqg3L3FGKAmgoGgURIQ1TBd+xyIarcE
	Sl/c9r9OarGaksqMboKw4sjvmEgj5G48XFkAbn14=
X-Gm-Gg: AeBDievXq9SvqJcWG4glzmiEJZX5MPh8olcQaCtzCGOkoaLmQ1/tntzPF7EP827KMoI
	ec2Tng2F9OpaDwVZz9OvKIc9qx1iFYjFpJ7GMNxmEhxQUqw4L5UHVwszaNay2GZCmqROs5upoW+
	q8VE03bHfTC93qFkS7i1+NKekwy/WvdjW6vqXO3i3lWISXPpqtyUw1KfLpVzvu1dgpjuqqL80xX
	KA1Tjgheuy7kkeICoGXTiVZWZuQIAaVwSmv3odghi41oF/VwZfXKw+bJYHHBQZo0sufLqn+tsgt
	+NFeBw==
X-Received: by 2002:ac8:7d56:0:b0:50e:5aed:caea with SMTP id
 d75a77b69052e-51461bea0f5mr188460591cf.14.1778251848331; Fri, 08 May 2026
 07:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: however liu <liuhowever@gmail.com>
Date: Fri, 8 May 2026 22:50:36 +0800
X-Gm-Features: AVHnY4Kif2HUVp6Ffe7oZCXc9MZrja2Pe7XBlWQJ8OFevl2lKXFrH-PaE3k7BBs
Message-ID: <CABkjU0eoePx4rSLodKT5HbHw-NdDKF0iF-Cq0KqYPYjZ62V-Lg@mail.gmail.com>
Subject: [PATCH] lib/tests: Add KUnit tests for bsearch()
To: linux-kselftest@vger.kernel.org
Cc: kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

The generic binary search function bsearch() has no unit tests, while

  the adjacent sort() function already has KUnit test coverage.



  Add comprehensive KUnit tests covering:

  - Empty arrays, single-element arrays

  - First/middle/last element hits

  - Keys outside the array range and in gaps between elements

  - Duplicate elements and all-identical arrays

  - Different element sizes (u8, int, u64)

  - Descending-order arrays with reversed comparator

  - Struct-based search where key type differs from element type


  The tests exercise both the exported bsearch() and the inline

  __inline_bsearch() implementation through the standard API.



  Signed-off-by: Liu Zhuoran <liuhowever@gmail.com>

  ---

   lib/Kconfig.debug         |  10 ++

   lib/tests/Makefile        |   1 +

   lib/tests/bsearch_kunit.c | 275 ++++++++++++++++++++++++++++++++++++++

   3 files changed, 286 insertions(+)

   create mode 100644 lib/tests/bsearch_kunit.c



  diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug

  index 8ff5adcfe..67d600e86 100644

  --- a/lib/Kconfig.debug

  +++ b/lib/Kconfig.debug

  @@ -2348,6 +2348,16 @@ config TEST_SORT



          If unsure, say N.



  +config BSEARCH_KUNIT_TEST

  +     tristate "Array-based bsearch test" if !KUNIT_ALL_TESTS

  +     depends on KUNIT

  +     default KUNIT_ALL_TESTS

  +     help

  +       This option enables the KUnit test for 'bsearch()' at boot,

  +       or at module load time.

  +

  +       If unsure, say N.

  +

   config TEST_DIV64

        tristate "64bit/32bit division and modulo test"

        depends on DEBUG_KERNEL || m

  diff --git a/lib/tests/Makefile b/lib/tests/Makefile

  index 7e9c2fa52..4c8b758ef 100644

  --- a/lib/tests/Makefile

  +++ b/lib/tests/Makefile

  @@ -5,6 +5,7 @@

   # KUnit tests

   CFLAGS_bitfield_kunit.o := $(DISABLE_STRUCTLEAK_PLUGIN)

   obj-$(CONFIG_BASE64_KUNIT) += base64_kunit.o

  +obj-$(CONFIG_BSEARCH_KUNIT_TEST) += bsearch_kunit.o

   obj-$(CONFIG_BITOPS_KUNIT) += bitops_kunit.o

   obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o

   obj-$(CONFIG_BITS_TEST) += test_bits.o

  diff --git a/lib/tests/bsearch_kunit.c b/lib/tests/bsearch_kunit.c

  new file mode 100644

  index 000000000..b3b1d5d98

  --- /dev/null

  +++ b/lib/tests/bsearch_kunit.c

  @@ -0,0 +1,275 @@

  +// SPDX-License-Identifier: GPL-2.0-only

  +/*

  + * KUnit tests for bsearch()

  + */

  +

  +#include <kunit/test.h>

  +#include <linux/bsearch.h>

  +#include <linux/module.h>

  +

  +static int cmp_int(const void *a, const void *b)

  +{

  +     return *(int *)a - *(int *)b;

  +}

  +

  +static int cmp_int_desc(const void *a, const void *b)

  +{

  +     return *(int *)b - *(int *)a;

  +}

  +

  +/* Empty array should return NULL */

  +static void bsearch_test_empty(struct kunit *test)

  +{

  +     int arr[] = {1};

  +     int key = 1;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 0, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_PTR_EQ(test, result, NULL);

  +}

  +

  +/* Single element: found */

  +static void bsearch_test_single_hit(struct kunit *test)

  +{

  +     int arr[] = {42};

  +     int key = 42;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 1, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(int *)result, 42);

  +}

  +

  +/* Single element: not found */

  +static void bsearch_test_single_miss(struct kunit *test)

  +{

  +     int arr[] = {42};

  +     int key = 99;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 1, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_PTR_EQ(test, result, NULL);

  +}

  +

  +/* Multi-element: key at beginning */

  +static void bsearch_test_first_element(struct kunit *test)

  +{

  +     int arr[] = {10, 20, 30, 40, 50};

  +     int key = 10;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 5, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(int *)result, 10);

  +}

  +

  +/* Multi-element: key at end */

  +static void bsearch_test_last_element(struct kunit *test)

  +{

  +     int arr[] = {10, 20, 30, 40, 50};

  +     int key = 50;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 5, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(int *)result, 50);

  +}

  +

  +/* Multi-element: key in the middle */

  +static void bsearch_test_middle_element(struct kunit *test)

  +{

  +     int arr[] = {10, 20, 30, 40, 50};

  +     int key = 30;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 5, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(int *)result, 30);

  +}

  +

  +/* Key smaller than all elements */

  +static void bsearch_test_below_range(struct kunit *test)

  +{

  +     int arr[] = {10, 20, 30};

  +     int key = 5;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 3, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_PTR_EQ(test, result, NULL);

  +}

  +

  +/* Key larger than all elements */

  +static void bsearch_test_above_range(struct kunit *test)

  +{

  +     int arr[] = {10, 20, 30};

  +     int key = 35;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 3, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_PTR_EQ(test, result, NULL);

  +}

  +

  +/* Key in gap between elements */

  +static void bsearch_test_in_gap(struct kunit *test)

  +{

  +     int arr[] = {10, 20, 30, 40, 50};

  +     int key = 25;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 5, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_PTR_EQ(test, result, NULL);

  +}

  +

  +/* Duplicate elements: should find one of them */

  +static void bsearch_test_duplicates(struct kunit *test)

  +{

  +     int arr[] = {10, 20, 20, 20, 30};

  +     int key = 20;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 5, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(int *)result, 20);

  +}

  +

  +/* All elements identical */

  +static void bsearch_test_all_same(struct kunit *test)

  +{

  +     int arr[] = {7, 7, 7, 7};

  +     int key = 7;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 4, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(int *)result, 7);

  +}

  +

  +/* Descending order with reversed comparator */

  +static void bsearch_test_descending(struct kunit *test)

  +{

  +     int arr[] = {50, 40, 30, 20, 10};

  +     int key = 30;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 5, sizeof(int), cmp_int_desc);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(int *)result, 30);

  +}

  +

  +/* 1-byte elements (u8) */

  +static int cmp_u8(const void *a, const void *b)

  +{

  +     return *(u8 *)a - *(u8 *)b;

  +}

  +

  +static void bsearch_test_u8(struct kunit *test)

  +{

  +     u8 arr[] = {1, 3, 5, 7, 9, 11};

  +     u8 key = 7;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 6, sizeof(u8), cmp_u8);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(u8 *)result, (u8)7);

  +}

  +

  +/* 8-byte elements (u64) */

  +static int cmp_u64(const void *a, const void *b)

  +{

  +     if (*(u64 *)a < *(u64 *)b)

  +             return -1;

  +     if (*(u64 *)a > *(u64 *)b)

  +             return 1;

  +     return 0;

  +}

  +

  +static void bsearch_test_u64(struct kunit *test)

  +{

  +     u64 arr[] = {100, 200, 300, 400, 500};

  +     u64 key = 300;

  +     void *result;

  +

  +     result = bsearch(&key, arr, 5, sizeof(u64), cmp_u64);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(u64 *)result, (u64)300);

  +}

  +

  +/* Two elements: hit first, hit last, miss */

  +static void bsearch_test_two_elements(struct kunit *test)

  +{

  +     int arr[] = {10, 20};

  +     int key;

  +     void *result;

  +

  +     key = 10;

  +     result = bsearch(&key, arr, 2, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(int *)result, 10);

  +

  +     key = 20;

  +     result = bsearch(&key, arr, 2, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, *(int *)result, 20);

  +

  +     key = 15;

  +     result = bsearch(&key, arr, 2, sizeof(int), cmp_int);

  +     KUNIT_EXPECT_PTR_EQ(test, result, NULL);

  +}

  +

  +/* Struct-based search (key type differs from element type) */

  +struct sample {

  +     int id;

  +     const char *name;

  +};

  +

  +static int cmp_sample(const void *key, const void *element)

  +{

  +     return *(const int *)key - ((const struct sample *)element)->id;

  +}

  +

  +static void bsearch_test_struct(struct kunit *test)

  +{

  +     struct sample arr[] = {

  +             {10, "alpha"},

  +             {20, "beta"},

  +             {30, "gamma"},

  +             {40, "delta"},

  +     };

  +     int key = 30;

  +     struct sample *result;

  +

  +     result = bsearch(&key, arr, 4, sizeof(struct sample), cmp_sample);

  +     KUNIT_ASSERT_NOT_NULL(test, result);

  +     KUNIT_EXPECT_EQ(test, result->id, 30);

  +     KUNIT_EXPECT_STREQ(test, result->name, "gamma");

  +}

  +

  +static struct kunit_case bsearch_test_cases[] = {

  +     KUNIT_CASE(bsearch_test_empty),

  +     KUNIT_CASE(bsearch_test_single_hit),

  +     KUNIT_CASE(bsearch_test_single_miss),

  +     KUNIT_CASE(bsearch_test_first_element),

  +     KUNIT_CASE(bsearch_test_last_element),

  +     KUNIT_CASE(bsearch_test_middle_element),

  +     KUNIT_CASE(bsearch_test_below_range),

  +     KUNIT_CASE(bsearch_test_above_range),

  +     KUNIT_CASE(bsearch_test_in_gap),

  +     KUNIT_CASE(bsearch_test_duplicates),

  +     KUNIT_CASE(bsearch_test_all_same),

  +     KUNIT_CASE(bsearch_test_descending),

  +     KUNIT_CASE(bsearch_test_u8),

  +     KUNIT_CASE(bsearch_test_u64),

  +     KUNIT_CASE(bsearch_test_two_elements),

  +     KUNIT_CASE(bsearch_test_struct),

  +     {}

  +};

  +

  +static struct kunit_suite bsearch_test_suite = {

  +     .name = "bsearch",

  +     .test_cases = bsearch_test_cases,

  +};

  +

  +kunit_test_suites(&bsearch_test_suite);

  +

  +MODULE_DESCRIPTION("KUnit tests for bsearch()");

  +MODULE_LICENSE("GPL");

  --

  2.54.0
