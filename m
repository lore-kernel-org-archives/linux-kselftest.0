Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0C36AB51
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773044459; cv=none; b=OJwjFw7JLa3noEGZkDEhC/A+VViD/va1ZszsygOBFtXGQpHeOGUOR0kZWUsD45HXuMD2g4xfCtX7GWGaA6jZyQYLhVwlFb2wWe1Oc6c3rwyD65lULZ6fbvtW/IoChmS831SCNGoYw/luu16vVLcmy8VsnxK5vlGcfVCoVcT6pGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773044459; c=relaxed/simple;
	bh=q+X2HeTkCmQxypDpYb86wF+o/Mj+IY0U0l1OkqBkGVk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pl7FM5WRVPunMBZzdAF5b8QBsQ/1hrfBlpOWkCHUx6NNPoPuI8mJWuTFU8XegtgLXGOrRyq7oeE1FjwDtX1jj2FZmC7l5k8s3BylsDxCIzEgMaXWwWAGDj2gDXw7MP8SnYpfsuNkHjHUWVuQJ+5WBqqm6vOTWA7RUzYdWMUZNWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WcKrNye6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QAt+NX4g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WcKrNye6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QAt+NX4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773044456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7dzON2Ht1i72klusdigIf8jNbxoEvyUgxDoT19+I2fg=;
	b=WcKrNye6JumH9nvAb1UcARfBIjsWpXQB8A+6oFg8bSAh/pRGV+06X9JZM7NYO2Wm6bEfSy
	Dy8OWoecfBTywTjk9+M0fYnhdy0dXLF/Aa0xWUuQmz4j+2bgoDM/fhqixxPx9i9OFE5zdY
	WKkQj9v5YZcwz8XAXF9felxqjCyoR04=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-2EPXWq12PYS03uJVCaJqJQ-1; Mon, 09 Mar 2026 04:20:55 -0400
X-MC-Unique: 2EPXWq12PYS03uJVCaJqJQ-1
X-Mimecast-MFC-AGG-ID: 2EPXWq12PYS03uJVCaJqJQ_1773044454
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439c2a0d821so4319331f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 01:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773044454; x=1773649254; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7dzON2Ht1i72klusdigIf8jNbxoEvyUgxDoT19+I2fg=;
        b=QAt+NX4gV8+mg4BouAUgU9OfP2JBuak9/ZguMJc9+9XD1e5gdF2S+6z7ZELaHXOcVG
         8YCHaMFO6saeDx+2YdnpFWymDkkAEdRl2KZnCsW467eQLubwN+bnphqAJkWAGiLGejLS
         +O5Bkf0tT3xka7MXC336j2aLJ2d7K9f3QFUReBYMGRGOZ1TlodnGhbMB5W8fyGIbgLqk
         nKxr8F5GUJ1ALlgvkFzsw2LUiYfmfOsIJ+NrX4dbtQDJhTS6MgvqTxWD4sjkMlWTxn+X
         JASX41Ne9TglM+L9WcuAw8T3WXd1j4Jb5iCsYyf9rqPsCs8/7QPkt45TEC0XuKnBD/3h
         sZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773044454; x=1773649254;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7dzON2Ht1i72klusdigIf8jNbxoEvyUgxDoT19+I2fg=;
        b=dgOHIjSGAq5IyvkTzB8DGTwF9FxNCbEj0kg6jgjTF4nkCMVN7FItB9ZaTxoHi50hCb
         qdUiK2upxcsKVB2LkQ7RTsrTn6sDnVqbhXAZpKPIO9dwb88r6OYiBqYw2J6JbB+PiUGl
         ZZnJNgZ8Ms1xrJ7cW7ODwSW2rd4c2wzaJG37NRessEHwl6B3ByhqVjjqvSTikiEP9Tf7
         PAaJyKZvl8KvYneeqadqC5COwyrN2smAuiI0HYS6DLRyrTJVXil74dpbsAsoXdAEshmG
         l+CrEsggDyVjubr5jaowqaWUhfkMV/nqq9yBMKLOLxo76350xmzOjMSIFlFbgQsmSnAj
         m6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGOBGd58Pd8ac8cfHGCJ/yYeiphHo9qWh9ADUIMZJk+Eb3D+jj9cGhWj7QEGfeHD2VPuHyAx8rQg5b+/wp//o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjbElb75bK6OLaUPbfLijwNtTE89QBC22/F2mqJ8xZSDbLcTek
	zvFXP9V/vHtRgrAHn8p61o57zqhNbYDT+S363rZpj3dClqPd7ZY8MQjLlyj3BJ6pncb0EzQ+oCs
	ho7y9qJ2x74Vv3TW9OblJczVrUyxh9HcYSDmeoIooDVSJHm6eYbciFL+C7VNEBDEHVVppyA==
X-Gm-Gg: ATEYQzySJtE9quXmSxuGnjQcjYRuzyvOjK6HEmPeHKmWqPG/8eFFm9m5e1XekAIpTYB
	wUPLKeD84sjBy8FXi69P9mCIc/WeXX+Vo4wd5tDGo7XdIbgUqu7ZL/yY5LkPQTvNPAJXSmRzTnI
	OdkGxjPVLUFgmSfrsOok0obVrbapHTm0WRvmsxv1Hp9epoxe+/rvoefVgfOn1nysDfavYybxT1V
	S3Le66+jjUXnuH6JdLR9ksZuIiacJ345OtnAq3+JKeaueGcXNn5M2J1KPuxeBqtWcIHEbPUw3YO
	8NfwIvyb2a1PkqQhYn0QJ4xv5QtJUM1Z8cuizi87SYulOPV85288eYwbjuCfPqFtHVEFLtituMm
	JAeoFNVSMhkJTJGZqLSPr6d3aHigO3of+Xyd+5vK5bXJ1UqRaDg1EFa0ZXbi9K3faJevyBDIcR7
	RDGr3OxM+t/IKY8KI=
X-Received: by 2002:a05:6000:24c1:b0:439:bf2f:123e with SMTP id ffacd0b85a97d-439da55aa93mr15748818f8f.11.1773044453921;
        Mon, 09 Mar 2026 01:20:53 -0700 (PDT)
X-Received: by 2002:a05:6000:24c1:b0:439:bf2f:123e with SMTP id ffacd0b85a97d-439da55aa93mr15748762f8f.11.1773044453267;
        Mon, 09 Mar 2026 01:20:53 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97be5sm25784410f8f.11.2026.03.09.01.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:20:52 -0700 (PDT)
Message-ID: <2c4e24ac7c9f39804d2122316cb42a7cabdda2e6.camel@redhat.com>
Subject: Re: [PATCH RFC 1/7] selftests/sched: Add SCHED_DEADLINE test
 framework infrastructure
From: Gabriele Monaco <gmonaco@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>, Shuah Khan <shuah@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann	
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Valentin
 Schneider <vschneid@redhat.com>, Clark Williams <williams@redhat.com>,
 Tommaso Cucinotta	 <tommaso.cucinotta@santannapisa.it>, Luca Abeni
 <luca.abeni@santannapisa.it>, 	linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Mon, 09 Mar 2026 09:20:51 +0100
In-Reply-To: <20260306-upstream-deadline-kselftests-v1-1-2b23ef74c46a@redhat.com>
References: 
	<20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
	 <20260306-upstream-deadline-kselftests-v1-1-2b23ef74c46a@redhat.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-03-06 at 17:10 +0100, Juri Lelli wrote:
> Add the foundational infrastructure for SCHED_DEADLINE scheduler tests
> following the pattern established by sched_ext selftests. This provides
> a clean, extensible framework for testing SCHED_DEADLINE functionality.
>=20
> The framework uses ELF constructors for automatic test registration,
> allowing new tests to be added simply by defining a struct dl_test and
> calling REGISTER_DL_TEST(). The runner discovers all registered tests
> at runtime and executes them serially, providing a simple and consistent
> way to expand test coverage without modifying the test runner itself.
>=20
> The framework provides a complete test lifecycle with setup, run, and
> cleanup phases for each test. Tests can be filtered by name, listed for
> inspection, or run in quiet mode for automated testing environments. The
> framework includes assertion macros such as DL_EQ and DL_FAIL_IF to
> simplify test authoring and provide consistent error reporting. Signal
> handling ensures graceful interruption and cleanup when tests are
> terminated early.
>=20
> This commit establishes the framework without any actual tests. Tests
> will be added in subsequent patches. The framework design is inspired by
> tools/testing/selftests/sched_ext/ but tailored for SCHED_DEADLINE
> testing needs.
>=20
> Assisted-by: Claude Code: claude-sonnet-4-5@20250929
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> ---
> =C2=A0tools/testing/selftests/sched/deadline/.gitignore |=C2=A0=C2=A0 3 +
> =C2=A0tools/testing/selftests/sched/deadline/Makefile=C2=A0=C2=A0 |=C2=A0=
 34 ++++
> =C2=A0tools/testing/selftests/sched/deadline/dl_test.h=C2=A0 | 238
> ++++++++++++++++++++++
> =C2=A0tools/testing/selftests/sched/deadline/runner.c=C2=A0=C2=A0 | 219 +=
+++++++++++++++++++
> =C2=A04 files changed, 494 insertions(+)
>=20

I wonder if this runner couldn't be made generic, something like not mentio=
ning
DL in any of the helpers, keep runner.c in tools/testing/selftests/sched/ a=
nd
have a tools/testing/selftests/sched/deadline/Makefile glue all required ob=
jects
together for the deadline tests (or anything else).

That would probably make adding new tests much easier without code duplicat=
ion.

Just a thought, haven't tested it.
Thanks,
Gabriele

> diff --git a/tools/testing/selftests/sched/deadline/.gitignore
> b/tools/testing/selftests/sched/deadline/.gitignore
> new file mode 100644
> index 0000000000000..503a1a968f952
> --- /dev/null
> +++ b/tools/testing/selftests/sched/deadline/.gitignore
> @@ -0,0 +1,3 @@
> +runner
> +cpuhog
> +*.o
> diff --git a/tools/testing/selftests/sched/deadline/Makefile
> b/tools/testing/selftests/sched/deadline/Makefile
> new file mode 100644
> index 0000000000000..fd57794f1a543
> --- /dev/null
> +++ b/tools/testing/selftests/sched/deadline/Makefile
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +TEST_GEN_PROGS :=3D runner
> +
> +# override lib.mk's default rules
> +OVERRIDE_TARGETS :=3D 1
> +include ../../lib.mk
> +
> +CFLAGS +=3D -Wall -O2 -g -pthread
> +
> +OUTPUT_DIR :=3D $(OUTPUT)
> +
> +# Utility object files
> +UTIL_OBJS :=3D
> +
> +# Test object files (all .c files except runner.c, dl_util.c, cpuhog.c)
> +# Will be populated as we add tests
> +TEST_OBJS :=3D
> +
> +# Runner binary links utility and test objects
> +$(OUTPUT)/runner: runner.c $(UTIL_OBJS) $(TEST_OBJS) dl_test.h |
> $(OUTPUT_DIR)
> +	$(CC) $(CFLAGS) -o $@ runner.c $(UTIL_OBJS) $(TEST_OBJS) $(LDFLAGS)
> +
> +$(OUTPUT_DIR):
> +	mkdir -p $@
> +
> +.PHONY: all clean
> +
> +all: $(TEST_GEN_PROGS)
> +
> +clean:
> +	rm -f $(OUTPUT)/runner
> +	rm -f $(OUTPUT)/*.o
> +	rm -f *.o
> diff --git a/tools/testing/selftests/sched/deadline/dl_test.h
> b/tools/testing/selftests/sched/deadline/dl_test.h
> new file mode 100644
> index 0000000000000..545fae1af6631
> --- /dev/null
> +++ b/tools/testing/selftests/sched/deadline/dl_test.h
> @@ -0,0 +1,238 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * SCHED_DEADLINE Test Framework
> + *
> + * Provides infrastructure for testing SCHED_DEADLINE scheduler
> functionality.
> + * Tests register themselves using REGISTER_DL_TEST() macro and are
> + * automatically discovered by the runner at runtime.
> + */
> +
> +#ifndef __DL_TEST_H__
> +#define __DL_TEST_H__
> +
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdlib.h>
> +
> +/* Test status return codes */
> +enum dl_test_status {
> +	DL_TEST_PASS =3D 0,	/* Test passed successfully */
> +	DL_TEST_SKIP,		/* Test skipped (feature unavailable, etc.)
> */
> +	DL_TEST_FAIL,		/* Test failed */
> +};
> +
> +/**
> + * struct dl_test - Deadline scheduler test definition
> + * @name: Short test identifier (e.g., "basic_scheduling")
> + * @description: Human-readable description of what the test validates
> + * @setup: Optional callback to prepare test environment
> + * @run: Required callback to execute test logic
> + * @cleanup: Optional callback to cleanup test resources
> + *
> + * Tests are defined by filling in this structure and registering with
> + * REGISTER_DL_TEST(). The runner will discover and execute all register=
ed
> + * tests automatically.
> + */
> +struct dl_test {
> +	/**
> +	 * name - The name of the test
> +	 *
> +	 * Short identifier used for filtering and reporting. Should be
> +	 * lowercase with underscores (e.g., "bandwidth_admission").
> +	 */
> +	const char *name;
> +
> +	/**
> +	 * description - Human-readable test description
> +	 *
> +	 * Explains what the test validates and why it's important.
> +	 * Displayed when test runs unless quiet mode is enabled.
> +	 */
> +	const char *description;
> +
> +	/**
> +	 * setup - Optional setup callback
> +	 * @ctx: Pointer to context pointer, can be set to pass data to run()
> +	 *
> +	 * Called before run() to prepare test environment. Can allocate
> +	 * resources, check prerequisites, etc.
> +	 *
> +	 * Return:
> +	 * - DL_TEST_PASS: Continue to run()
> +	 * - DL_TEST_SKIP: Skip this test (feature not available, etc.)
> +	 * - DL_TEST_FAIL: Abort test (setup failed)
> +	 *
> +	 * If setup() returns SKIP or FAIL, run() and cleanup() are not
> called.
> +	 */
> +	enum dl_test_status (*setup)(void **ctx);
> +
> +	/**
> +	 * run - Required test execution callback
> +	 * @ctx: Context pointer set by setup(), or NULL if no setup
> +	 *
> +	 * Executes the actual test logic. This is the main test function.
> +	 *
> +	 * Return:
> +	 * - DL_TEST_PASS: Test passed
> +	 * - DL_TEST_SKIP: Test skipped (unlikely here, prefer setup())
> +	 * - DL_TEST_FAIL: Test failed
> +	 */
> +	enum dl_test_status (*run)(void *ctx);
> +
> +	/**
> +	 * cleanup - Optional cleanup callback
> +	 * @ctx: Context pointer set by setup(), or NULL if no setup
> +	 *
> +	 * Called after run() to cleanup resources. Always runs if setup()
> +	 * succeeded, regardless of run() result. Cannot fail the test.
> +	 */
> +	void (*cleanup)(void *ctx);
> +};
> +
> +/**
> + * dl_test_register() - Register a test with the framework
> + * @test: Pointer to test structure
> + *
> + * Called by REGISTER_DL_TEST() macro. Don't call directly.
> + */
> +void dl_test_register(struct dl_test *test);
> +
> +/**
> + * REGISTER_DL_TEST() - Register a test for auto-discovery
> + * @__test: Pointer to struct dl_test
> + *
> + * Uses ELF constructor attribute to automatically register the test
> + * when the binary loads. The runner will discover and execute all
> + * registered tests.
> + *
> + * Example:
> + *=C2=A0=C2=A0 static struct dl_test my_test =3D {
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "my_test",
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .description =3D "Tests something=
 important",
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .run =3D my_test_run,
> + *=C2=A0=C2=A0 };
> + *=C2=A0=C2=A0 REGISTER_DL_TEST(&my_test);
> + */
> +#define __DL_CONCAT(a, b) a##b
> +#define _DL_CONCAT(a, b) __DL_CONCAT(a, b)
> +
> +#define REGISTER_DL_TEST(__test)					\
> +	__attribute__((constructor))					\
> +	static void _DL_CONCAT(___dlregister_, __LINE__)(void)		\
> +	{								\
> +		dl_test_register(__test);				\
> +	}
> +
> +/* Error reporting macros */
> +
> +/**
> + * DL_ERR() - Print error message with file/line info
> + */
> +#define DL_ERR(__fmt, ...)						\
> +	do {								\
> +		fprintf(stderr, "ERR: %s:%d\n", __FILE__, __LINE__);	\
> +		fprintf(stderr, __fmt"\n", ##__VA_ARGS__);		\
> +	} while (0)
> +
> +/**
> + * DL_FAIL() - Fail the test with a message
> + *
> + * Prints error message and returns DL_TEST_FAIL. Use in test run() or
> + * setup() functions.
> + */
> +#define DL_FAIL(__fmt, ...)						\
> +	do {								\
> +		DL_ERR(__fmt, ##__VA_ARGS__);				\
> +		return DL_TEST_FAIL;					\
> +	} while (0)
> +
> +/**
> + * DL_FAIL_IF() - Conditionally fail the test
> + * @__cond: Condition to check
> + * @__fmt: printf-style format string
> + *
> + * If condition is true, fail the test with the given message.
> + */
> +#define DL_FAIL_IF(__cond, __fmt, ...)					\
> +	do {								\
> +		if (__cond)						\
> +			DL_FAIL(__fmt, ##__VA_ARGS__);			\
> +	} while (0)
> +
> +/* Comparison assertion macros */
> +
> +/**
> + * DL_EQ() - Assert two values are equal
> + */
> +#define DL_EQ(_x, _y) \
> +	DL_FAIL_IF((_x) !=3D (_y), \
> +		=C2=A0=C2=A0 "Expected %s =3D=3D %s (%lld =3D=3D %lld)", \
> +		=C2=A0=C2=A0 #_x, #_y, (long long)(_x), (long long)(_y))
> +
> +/**
> + * DL_NE() - Assert two values are not equal
> + */
> +#define DL_NE(_x, _y) \
> +	DL_FAIL_IF((_x) =3D=3D (_y), \
> +		=C2=A0=C2=A0 "Expected %s !=3D %s (%lld !=3D %lld)", \
> +		=C2=A0=C2=A0 #_x, #_y, (long long)(_x), (long long)(_y))
> +
> +/**
> + * DL_LT() - Assert x < y
> + */
> +#define DL_LT(_x, _y) \
> +	DL_FAIL_IF((_x) >=3D (_y), \
> +		=C2=A0=C2=A0 "Expected %s < %s (%lld < %lld)", \
> +		=C2=A0=C2=A0 #_x, #_y, (long long)(_x), (long long)(_y))
> +
> +/**
> + * DL_LE() - Assert x <=3D y
> + */
> +#define DL_LE(_x, _y) \
> +	DL_FAIL_IF((_x) > (_y), \
> +		=C2=A0=C2=A0 "Expected %s <=3D %s (%lld <=3D %lld)", \
> +		=C2=A0=C2=A0 #_x, #_y, (long long)(_x), (long long)(_y))
> +
> +/**
> + * DL_GT() - Assert x > y
> + */
> +#define DL_GT(_x, _y) \
> +	DL_FAIL_IF((_x) <=3D (_y), \
> +		=C2=A0=C2=A0 "Expected %s > %s (%lld > %lld)", \
> +		=C2=A0=C2=A0 #_x, #_y, (long long)(_x), (long long)(_y))
> +
> +/**
> + * DL_GE() - Assert x >=3D y
> + */
> +#define DL_GE(_x, _y) \
> +	DL_FAIL_IF((_x) < (_y), \
> +		=C2=A0=C2=A0 "Expected %s >=3D %s (%lld >=3D %lld)", \
> +		=C2=A0=C2=A0 #_x, #_y, (long long)(_x), (long long)(_y))
> +
> +/**
> + * DL_ASSERT() - Assert condition is true
> + */
> +#define DL_ASSERT(_x) \
> +	DL_FAIL_IF(!(_x), "Expected %s to be true", #_x)
> +
> +/**
> + * DL_BUG_ON() - Fatal assertion (for framework bugs, not test failures)
> + * @__cond: Condition to check
> + * @__fmt: Error message
> + *
> + * For internal framework consistency checks. If condition is true,
> + * prints error and aborts. Use for "should never happen" cases.
> + */
> +#define DL_BUG_ON(__cond, __fmt, ...)					\
> +	do {								\
> +		if (__cond) {						\
> +			fprintf(stderr, "BUG: %s:%d: " __fmt "\n",	\
> +				__FILE__, __LINE__, ##__VA_ARGS__);	\
> +			abort();					\
> +		}							\
> +	} while (0)
> +
> +#endif /* __DL_TEST_H__ */
> diff --git a/tools/testing/selftests/sched/deadline/runner.c
> b/tools/testing/selftests/sched/deadline/runner.c
> new file mode 100644
> index 0000000000000..358f695423ef5
> --- /dev/null
> +++ b/tools/testing/selftests/sched/deadline/runner.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SCHED_DEADLINE Test Runner
> + *
> + * Discovers and executes all registered SCHED_DEADLINE tests.
> + * Tests are statically linked and register themselves via ELF construct=
ors.
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <stdbool.h>
> +#include "dl_test.h"
> +
> +const char help_fmt[] =3D
> +"Runner for SCHED_DEADLINE scheduler tests.\n"
> +"\n"
> +"All tests are statically linked and run serially. Tests require root\n"
> +"privileges to set SCHED_DEADLINE scheduling policy.\n"
> +"\n"
> +"Usage: %s [-t TEST] [-h]\n"
> +"\n"
> +"=C2=A0 -t TEST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Only run tests whose=
 name includes this string\n"
> +"=C2=A0 -s=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Include print output for skipped tests\n"
> +"=C2=A0 -l=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 List all available tests\n"
> +"=C2=A0 -q=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Don't print the test descriptions during run\n"
> +"=C2=A0 -h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Display this help and exit\n";
> +
> +static volatile int exit_req;
> +static bool quiet, print_skipped, list;
> +
> +#define MAX_DL_TESTS 256
> +
> +static struct dl_test *__dl_tests[MAX_DL_TESTS];
> +static unsigned int __dl_num_tests;
> +
> +static void sigint_handler(int sig)
> +{
> +	exit_req =3D 1;
> +}
> +
> +static void print_test_preamble(const struct dl_test *test, bool quiet)
> +{
> +	printf("=3D=3D=3D=3D=3D START =3D=3D=3D=3D=3D\n");
> +	printf("TEST: %s\n", test->name);
> +	if (!quiet)
> +		printf("DESCRIPTION: %s\n", test->description);
> +	printf("OUTPUT:\n");
> +}
> +
> +static const char *status_to_result(enum dl_test_status status)
> +{
> +	switch (status) {
> +	case DL_TEST_PASS:
> +	case DL_TEST_SKIP:
> +		return "ok";
> +	case DL_TEST_FAIL:
> +		return "not ok";
> +	default:
> +		return "<UNKNOWN>";
> +	}
> +}
> +
> +static void print_test_result(const struct dl_test *test,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum dl_test_status status,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int testnum)
> +{
> +	const char *result =3D status_to_result(status);
> +	const char *directive =3D status =3D=3D DL_TEST_SKIP ? "SKIP " : "";
> +
> +	printf("%s %u %s # %s\n", result, testnum, test->name, directive);
> +	printf("=3D=3D=3D=3D=3D=C2=A0 END=C2=A0 =3D=3D=3D=3D=3D\n");
> +}
> +
> +static bool should_skip_test(const struct dl_test *test, const char *fil=
ter)
> +{
> +	return filter && !strstr(test->name, filter);
> +}
> +
> +static enum dl_test_status run_test(const struct dl_test *test)
> +{
> +	enum dl_test_status status;
> +	void *context =3D NULL;
> +
> +	if (test->setup) {
> +		status =3D test->setup(&context);
> +		if (status !=3D DL_TEST_PASS)
> +			return status;
> +	}
> +
> +	status =3D test->run(context);
> +
> +	if (test->cleanup)
> +		test->cleanup(context);
> +
> +	return status;
> +}
> +
> +static bool test_valid(const struct dl_test *test)
> +{
> +	if (!test) {
> +		fprintf(stderr, "NULL test detected\n");
> +		return false;
> +	}
> +
> +	if (!test->name) {
> +		fprintf(stderr,
> +			"Test with no name found. Must specify test
> name.\n");
> +		return false;
> +	}
> +
> +	if (!test->description) {
> +		fprintf(stderr, "Test %s requires description.\n", test-
> >name);
> +		return false;
> +	}
> +
> +	if (!test->run) {
> +		fprintf(stderr, "Test %s has no run() callback\n", test-
> >name);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	const char *filter =3D NULL;
> +	unsigned int testnum =3D 0, i;
> +	unsigned int passed =3D 0, skipped =3D 0, failed =3D 0;
> +	int opt;
> +
> +	signal(SIGINT, sigint_handler);
> +	signal(SIGTERM, sigint_handler);
> +
> +	while ((opt =3D getopt(argc, argv, "qslt:h")) !=3D -1) {
> +		switch (opt) {
> +		case 'q':
> +			quiet =3D true;
> +			break;
> +		case 's':
> +			print_skipped =3D true;
> +			break;
> +		case 'l':
> +			list =3D true;
> +			break;
> +		case 't':
> +			filter =3D optarg;
> +			break;
> +		default:
> +			fprintf(stderr, help_fmt, argv[0]);
> +			return opt !=3D 'h';
> +		}
> +	}
> +
> +	for (i =3D 0; i < __dl_num_tests; i++) {
> +		enum dl_test_status status;
> +		struct dl_test *test =3D __dl_tests[i];
> +
> +		if (list) {
> +			printf("%s\n", test->name);
> +			if (i =3D=3D (__dl_num_tests - 1))
> +				return 0;
> +			continue;
> +		}
> +
> +		if (should_skip_test(test, filter)) {
> +			/*
> +			 * Printing the skipped tests and their preambles can
> +			 * add a lot of noise to the runner output. Printing
> +			 * this is only really useful for CI, so let's skip
> it
> +			 * by default.
> +			 */
> +			if (print_skipped) {
> +				print_test_preamble(test, quiet);
> +				print_test_result(test, DL_TEST_SKIP,
> ++testnum);
> +			}
> +			continue;
> +		}
> +
> +		print_test_preamble(test, quiet);
> +		status =3D run_test(test);
> +		print_test_result(test, status, ++testnum);
> +
> +		switch (status) {
> +		case DL_TEST_PASS:
> +			passed++;
> +			break;
> +		case DL_TEST_SKIP:
> +			skipped++;
> +			break;
> +		case DL_TEST_FAIL:
> +			failed++;
> +			break;
> +		}
> +
> +		if (exit_req) {
> +			fprintf(stderr, "\nInterrupted by signal\n");
> +			break;
> +		}
> +	}
> +
> +	printf("\n\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n\n");
> +	printf("RESULTS:\n\n");
> +	printf("PASSED:=C2=A0 %u\n", passed);
> +	printf("SKIPPED: %u\n", skipped);
> +	printf("FAILED:=C2=A0 %u\n", failed);
> +
> +	return failed > 0 ? 1 : 0;
> +}
> +
> +void dl_test_register(struct dl_test *test)
> +{
> +	DL_BUG_ON(!test_valid(test), "Invalid test found");
> +	DL_BUG_ON(__dl_num_tests >=3D MAX_DL_TESTS, "Maximum tests exceeded");
> +
> +	__dl_tests[__dl_num_tests++] =3D test;
> +}

