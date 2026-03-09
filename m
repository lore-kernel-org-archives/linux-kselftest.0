Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4FC27F754
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773044164; cv=none; b=jjoC0PHUT8pVHLZ7nbAwze3BweZi9KvMQeO8QlrDYQa1bmmREvmUSDGN6hYWtNVpfscNNELeCVoBisD+B1mctTmLOuPihNUkqmJgza8WXvA3vbTnFsFY3Lc7rOFCRpIeMUTB6N/eqpikxRI+jFjbzvKFWvTR2SC8SMeiLRDX8sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773044164; c=relaxed/simple;
	bh=cT+T/hqHFr7lrTF15rWikRaO50e53ZT2RN4SJqijhvY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=odkYuONxbbcsLZyjqf1dYGGptVsIayXAVXN3fRJ/+MGT1KZa2U7fh7uOcZi3E0lsXS8C8xHgv+Jt2LgvYEXJ8grfWEutaZdmEYQBmeWXXzo+Buuu9hbzPv3NFWUEHNGSgWVUeFJSgXkV1p78UkHpYt7VNbagwdaNl0JgtNYO92o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CK1dLj4g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OtLvQ7Nx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CK1dLj4g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OtLvQ7Nx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773044161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y1Ps22diV+WqMM3WZSbsW6DrnFcvdXzfbQr1BWPykyo=;
	b=CK1dLj4g/2j+U23iUxynCbS+nfyrS54tGUo8TWHsX5YoleoTz8EwH/sBlpIxdW0BWmSZwo
	XSPoDh30S5CR8ebovmsqtA66TbetbcpL+m36X/SLt2TQiFqba6z8BAM1wBHixGZ0OBtSXV
	oX/TtejX88j9nLYhQutNcJoJ/zraKwU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-REEP_EpcMsym8stIm4dPuw-1; Mon, 09 Mar 2026 04:15:59 -0400
X-MC-Unique: REEP_EpcMsym8stIm4dPuw-1
X-Mimecast-MFC-AGG-ID: REEP_EpcMsym8stIm4dPuw_1773044158
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-485355493aeso12077365e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773044158; x=1773648958; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y1Ps22diV+WqMM3WZSbsW6DrnFcvdXzfbQr1BWPykyo=;
        b=OtLvQ7NxpQA2ZepsnsOcNEUv1NLWZetx6H1BLF3Q9U+wR6Wtz5u90ELTjofBx6iFPS
         tkVloVyosMseQIenvwfu1lKgiRc17WMeX7cKwVhYIayXaJWTF4qdc5Adhy2rIgvl16HC
         5tT1Eid0DJWiGVG/hlXJ/wFPHtY/kGfpKj6eS9kNPFgKu0lDq/NPHqRhRoov83vL/YG2
         OC7dw1iPXSxajvUbL4ftmycwebvC8WT+tckuS1NJNh12jwsLjgekurVGNXC60jZYU36W
         OFEx5A3MqXflrCLmzCJBWLptqE5d9NdJ/ad6AYn2QGi1mQxLOxZt+BOUzNI1GovbZlxe
         j9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773044158; x=1773648958;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1Ps22diV+WqMM3WZSbsW6DrnFcvdXzfbQr1BWPykyo=;
        b=BW7v5GBojD4XSQTtf2m4phIZfam6hcAagfDc4/k6yEmEZOd/dPZXawcjFTysfzvPwN
         RXlBGV0U/Zljq7HFyuxzKZ11i4LinRB5dPZ88MGuHNYWa3L/ZGE+0R97yk/YU+0nGuFn
         UdNgMyt9MluxbQNEAyIHraA+2bqCaaG/HdSzMXpGYVwM3ZVmEKPFawWFwmvHIevhGvjS
         VnQIEN7IwpvFussoL7ULEpx/qlyK/0DiVQFzQw8TE3cHb64vydVqYMXKY7jau+lE3ahD
         4uKJ0N9BoBX1v1AezhsKxOflsKZiXk5qb7zpAMKaFxzOmdOSfKTHq8iWN+OuDMreYcdp
         WIKw==
X-Forwarded-Encrypted: i=1; AJvYcCVia/scfzwf2DZwmbvMuWLdsBfpr0bKV17EvN9AXezeAUi4kI7N0JMu4Zfkcxnf+4Ranv2jwd7+CXaVb3b5eZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzggrUesVjGnMtXlyZhEwhd8pvHRAdkI08dVXv0CIG8x50hX24U
	ItAO6hlxAJdWq+k6bASHR9kiExtoGMeB85TG/lDAjYlMJhEIssPP5eaO1pfGjR0yoBvQbBT1XxK
	zvNjyhAQSIJ2pvJrMr99xX/gWUACefcBhm3Nr84BEiyVggbrnPEt8XQKbNikIhnMUieA0Yw==
X-Gm-Gg: ATEYQzzuBrqaeOtydODcbvSKU/Zo8kXsH6bOSwJpngbsEW7LcFSgZXfGsyg+9GBc2tF
	trjgcveoidCOt2AhzbahqzrZpUDXwg21yqUddXkgY/6nE0uyq+yd27zMBzFl7s5/4qYX7q8Bo7c
	4W0bN+7hwq/afbYYbh2Q9qi/Ug0wnXWujQmxcpImfhl/S8waDIrUOxjyjs0ArWQHt/MRoj46tbN
	kdgcAnY/ONj3kUFsi99bnyE9sU2vyEcyO07i5sfCD7+/gzxthnicISBKtDTOlhQcLiR6Q03bT43
	S0G7ttL16jw0QEnzX2pZ8ZlvcBuKZSNiDiavJZu/tuGk5EArybrpc8pMkfyAopUCrXczwVW3pT2
	arN7a92jIggYdAhLaxMCgoD0iRbAuMu4xJw44BOZxU0qfDPpdi2MXDCksL44/6LRXLHPTtkDc6F
	Lxx83soov5itBn/cU=
X-Received: by 2002:a05:600c:64c7:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-48526923bbcmr157396425e9.11.1773044158330;
        Mon, 09 Mar 2026 01:15:58 -0700 (PDT)
X-Received: by 2002:a05:600c:64c7:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-48526923bbcmr157396025e9.11.1773044157793;
        Mon, 09 Mar 2026 01:15:57 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237dcf04sm121719035e9.1.2026.03.09.01.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:15:57 -0700 (PDT)
Message-ID: <64fa81f453d7909e5669cc32284f7c9f48f2fea9.camel@redhat.com>
Subject: Re: [PATCH RFC 4/7] selftests/sched: Add basic SCHED_DEADLINE
 functionality tests
From: Gabriele Monaco <gmonaco@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>, Shuah Khan <shuah@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann	
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Valentin
 Schneider <vschneid@redhat.com>, Clark Williams <williams@redhat.com>,
 Tommaso Cucinotta	 <tommaso.cucinotta@santannapisa.it>, Luca Abeni
 <luca.abeni@santannapisa.it>, 	linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Mon, 09 Mar 2026 09:15:55 +0100
In-Reply-To: <20260306-upstream-deadline-kselftests-v1-4-2b23ef74c46a@redhat.com>
References: 
	<20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
	 <20260306-upstream-deadline-kselftests-v1-4-2b23ef74c46a@redhat.com>
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

Hello,

On Fri, 2026-03-06 at 17:10 +0100, Juri Lelli wrote:
> Add initial test coverage for SCHED_DEADLINE scheduler functionality.
> This patch introduces two fundamental tests that validate core
> SCHED_DEADLINE behavior using the test framework and utility library.
>=20
> The basic_scheduling test creates a cpuhog process with SCHED_DEADLINE
> policy and verifies the scheduling policy is correctly set to policy 6
> (SCHED_DEADLINE). It confirms the task executes successfully for the
> specified duration using reasonable parameters with 30ms runtime, 100ms
> deadline, and 100ms period. This validates the fundamental operation of
> setting SCHED_DEADLINE policy and running deadline-scheduled tasks.
>=20
> The parameter_validation test ensures the kernel properly validates
> SCHED_DEADLINE parameters. It tests that invalid parameter combinations
> such as runtime greater than deadline are correctly rejected with
> EINVAL, while valid parameter configurations are accepted. This confirms
> the kernel's parameter validation logic is working correctly and
> prevents misconfigured deadline tasks from being scheduled.
>=20
> Both tests use the dl_util library for SCHED_DEADLINE operations and
> follow the framework pattern with automatic registration via
> REGISTER_DL_TEST(). The tests pass cleanly in VM environments with 2
> tests passing, 0 skipped, and 0 failed.
>=20
> Assisted-by: Claude Code: claude-sonnet-4-5@20250929
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> ---
...
> =C2=A0
> +# Test files
> +$(OUTPUT)/basic.o: basic.c dl_test.h dl_util.h | $(OUTPUT_DIR)
> +	$(CC) $(CFLAGS) -c $< -o $@
> +

This seems a constant in all tests, what about just having make do the tric=
k:

  $(OUTPUT)/%.o: %.c dl_test.h dl_util.h | $(OUTPUT_DIR)
  	$(CC) $(CFLAGS) -c $< -o $@

The rest looks neat.

Thanks,
Gabriele

> =C2=A0$(OUTPUT_DIR):
> =C2=A0	mkdir -p $@
> =C2=A0
> diff --git a/tools/testing/selftests/sched/deadline/basic.c
> b/tools/testing/selftests/sched/deadline/basic.c
> new file mode 100644
> index 0000000000000..f1c4e8c751b61
> --- /dev/null
> +++ b/tools/testing/selftests/sched/deadline/basic.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Basic SCHED_DEADLINE functionality tests
> + *
> + * Validates fundamental SCHED_DEADLINE scheduler operations including
> + * policy setup, parameter validation, and basic task execution.
> + */
> +
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <sys/types.h>
> +#include <sys/wait.h>
> +#include <errno.h>
> +#include <sched.h>
> +#include "dl_test.h"
> +#include "dl_util.h"
> +
> +/*
> + * Test: Basic SCHED_DEADLINE scheduling
> + *
> + * Verifies that a task can be successfully scheduled with SCHED_DEADLIN=
E
> + * policy and executes correctly.
> + */
> +static enum dl_test_status test_basic_scheduling_run(void *ctx)
> +{
> +	pid_t pid;
> +	int policy;
> +	int status;
> +	uint64_t runtime_ns, deadline_ns, period_ns;
> +
> +	/* Use reasonable deadline parameters: 30ms/100ms/100ms */
> +	runtime_ns =3D dl_ms_to_ns(30);
> +	deadline_ns =3D dl_ms_to_ns(100);
> +	period_ns =3D dl_ms_to_ns(100);
> +
> +	/* Create a cpuhog process with SCHED_DEADLINE */
> +	pid =3D dl_create_cpuhog(runtime_ns, deadline_ns, period_ns, 2);
> +	DL_FAIL_IF(pid < 0, "Failed to create cpuhog process: %s",
> +		=C2=A0=C2=A0 strerror(errno));
> +
> +	/* Process is now running with SCHED_DEADLINE set */
> +	printf("=C2=A0 Created cpuhog with SCHED_DEADLINE (PID %d)\n", pid);
> +
> +	/* Verify it's using SCHED_DEADLINE (policy 6) */
> +	policy =3D dl_get_policy(pid);
> +	DL_FAIL_IF(policy < 0, "Failed to read scheduling policy");
> +	DL_EQ(policy, SCHED_DEADLINE);
> +
> +	/* Alternative check using helper */
> +	DL_ASSERT(dl_is_deadline_task(pid));
> +
> +	printf("=C2=A0 cpuhog running with SCHED_DEADLINE (PID %d)\n", pid);
> +
> +	/* Wait for cpuhog to complete (2 seconds) */
> +	if (waitpid(pid, &status, 0) < 0) {
> +		dl_cleanup_cpuhog(pid);
> +		DL_FAIL("waitpid failed: %s", strerror(errno));
> +	}
> +
> +	/* Verify it exited successfully */
> +	DL_FAIL_IF(!WIFEXITED(status), "Process did not exit normally");
> +	DL_EQ(WEXITSTATUS(status), 0);
> +
> +	printf("=C2=A0 cpuhog completed successfully\n");
> +
> +	return DL_TEST_PASS;
> +}
> +
> +static struct dl_test test_basic_scheduling =3D {
> +	.name =3D "basic_scheduling",
> +	.description =3D "Verify basic SCHED_DEADLINE policy setup and
> execution",
> +	.run =3D test_basic_scheduling_run,
> +};
> +REGISTER_DL_TEST(&test_basic_scheduling);
> +
> +/*
> + * Test: SCHED_DEADLINE parameter validation
> + *
> + * Verifies that the kernel correctly validates deadline parameters,
> + * rejecting invalid configurations and accepting valid ones.
> + */
> +static enum dl_test_status test_parameter_validation_run(void *ctx)
> +{
> +	int ret;
> +	uint64_t runtime_ns, deadline_ns, period_ns;
> +
> +	printf("=C2=A0 Testing invalid parameters (runtime > deadline)...\n");
> +
> +	/* Invalid: runtime (200ms) > deadline (100ms) */
> +	runtime_ns =3D dl_ms_to_ns(200);
> +	deadline_ns =3D dl_ms_to_ns(100);
> +	period_ns =3D dl_ms_to_ns(100);
> +
> +	ret =3D dl_set_sched_attr(0, runtime_ns, deadline_ns, period_ns);
> +	DL_FAIL_IF(ret =3D=3D 0, "Invalid parameters were accepted (runtime >
> deadline)");
> +	DL_FAIL_IF(errno !=3D EINVAL, "Expected EINVAL, got %s",
> strerror(errno));
> +
> +	printf("=C2=A0 Invalid parameters correctly rejected with EINVAL\n");
> +
> +	printf("=C2=A0 Testing valid parameters...\n");
> +
> +	/* Valid: runtime (30ms) <=3D deadline (100ms) <=3D period (100ms) */
> +	runtime_ns =3D dl_ms_to_ns(30);
> +	deadline_ns =3D dl_ms_to_ns(100);
> +	period_ns =3D dl_ms_to_ns(100);
> +
> +	ret =3D dl_set_sched_attr(0, runtime_ns, deadline_ns, period_ns);
> +	DL_FAIL_IF(ret < 0, "Valid parameters were rejected: %s",
> strerror(errno));
> +
> +	printf("=C2=A0 Valid parameters correctly accepted\n");
> +
> +	/* Reset to normal scheduling using sched_setscheduler */
> +	struct sched_param param =3D { .sched_priority =3D 0 };
> +
> +	sched_setscheduler(0, SCHED_OTHER, &param);
> +
> +	return DL_TEST_PASS;
> +}
> +
> +static struct dl_test test_parameter_validation =3D {
> +	.name =3D "parameter_validation",
> +	.description =3D "Verify SCHED_DEADLINE parameter validation
> (accept/reject)",
> +	.run =3D test_parameter_validation_run,
> +};
> +REGISTER_DL_TEST(&test_parameter_validation);

