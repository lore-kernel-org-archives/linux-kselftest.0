Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F03A255D
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 18:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772648018; cv=pass; b=KeTwPDbt1hmbR21yqollEtruwpTTboqpt/6FgPTAppxf9XdHSn5HEwRK2UUwps5H4imOMljsViYiExAxg1UQJ6c5pRXql408Hl0yc5ACvVkOBqbKwSGkf0iDeux6gxsgs5GC8nmySw4E7WvIiq2U80sVosYQrjGSCXVW1HPxQJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772648018; c=relaxed/simple;
	bh=Bz3h524S+Me6wnmPEXTEscST+QbpKO+D9vNqguqzmeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=saDLc0VSSBuEqWQx/QEUVpjirZdVahrOmEZM28PV4E4rz30tEgRYlrRb/lv8STVlWNq2DBErsY7cb7l8MOU/CSWRU1m0NNc6JI4bK3gVo4BpbdUoJwQiJNULX5Bu9uNm1B9/rXwWEeqRxVJlltGKIyyhPrzMGUnre+btW5KRSUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=khx3qyZB; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="khx3qyZB"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9382e59c0eso126345066b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 10:13:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772648014; cv=none;
        d=google.com; s=arc-20240605;
        b=cv0jzz9mj3diA7DhXsI5k/53ch7VOef0wSEeq/1NlmuDpn0jlPN6xftO/oq7u2FAde
         57kTLORTJPwzuCuusxTpjq/6PIlJWknn7aMfI438lnqKkSGaeq0iYiCOfH2KTNDgJavy
         Oq7eALIz83COBUzGomDnhaXRgLOyRLa1Cn2LSc1uTd+akcr/EgBVGf0Pccx7lP4gt1Cv
         QrxZKVamVGrSWr6OAd4JcauczbJtVBoqd6lduHb2m/fbUpO7Ty24yh8ckZy0AGTy0EtY
         u0RUHwabG9CU87VFGgTCM5B24jKWh/CJLoYbNpcNcM/9NaXAMSwIyuBkyK7bqluB3dH5
         v6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LrQZQ4TMSoJ6fNc6gcQ++hehPffTagkw5Fo7Aas+Fhs=;
        fh=Byrbr6dGkA4Pz7zUUYgQQmB+urDEdAqn70g4fIw6o28=;
        b=MXHgYlTAHn2y6vDIa2/R0Qkiij7fJqPVek5Emq+c7nyqUQxMFoCzuvLdW8Kv1Ul6m6
         A0txFqUMJtt7xM4NlmLf+tqL8I3wsAjQ0r3qNk3A2EVKtL5zs3NH1VYjXsc4+U/mgpI/
         30b9XqYLex/l0jZ+iCFdXOIbQcH8MoCzkmbCrRjJ+ys06VxgXIjaulCgfGZaL/7tzj55
         kfJfxl4ATMr1pjLR4kjcWBcU01S+g6lK5EEUhyDJoYW+IbOUbgI7SN4SVRuL46EVkfhd
         skvmxBtRn9GDBWqSJDTsGPaFJAr8WM+EqPiPBA/flTidXYSGzVmhJiSts4ED5j+W7tGP
         BglA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772648014; x=1773252814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrQZQ4TMSoJ6fNc6gcQ++hehPffTagkw5Fo7Aas+Fhs=;
        b=khx3qyZBWHJNJH7iv9v0Bws+3iHAgLYJhXHzGzoDXJLPo2ugCMC0CWtUO8eusOKfxX
         2qsrMgGhTGmzbFPE+w2BvQZX0eptvqUFnxHrywS/iFptJXk72gc+XXHOLdDTzN4jY6K5
         B75XSy19Nq5r9f93/cTleByS3XpK+4Myl3HzIJc/RkzYMjg5OQn2K4uDHov6ptzAuxvr
         7QDaCG3n0NfWSKb6vYt5irOQu+fMGh5D39invC5KLU0j0KMatRlfeXwKwPR6WItpd3df
         Fw/wt9FBkiMTEh4Ii4XTrLgIVrBa8ouKuR/23aQuSfBCIlzuszCTi0vQ6N7xqh/YqCqW
         Ckyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772648014; x=1773252814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LrQZQ4TMSoJ6fNc6gcQ++hehPffTagkw5Fo7Aas+Fhs=;
        b=njvO0UKNOqI9T8vAz4AcUTF0AHgbmM+JydSjLOhEJOD/m40YdIfoMu7Ozm+4yHo4oX
         mQ8UldwKnCnN4oXUpIquWbk2wft7Mjj/JgniZeRf1KpOqkAk1Kfdt/DZMpYsovqwFpXq
         4VI4ArrSoa80scUBEYL86NBCSbmVenTMwdK7L4ANCmVQshaeuEP8IEtW6WyHNQY0IOq0
         nO6RsTbbXpBrjLyFdvqTUOcp7slQRKd8JLCtF0R3OjbE/eyqGFDe6iHD7LodBBXRw+qx
         kOebCYvF0DFCnl0bJ65u2DpoDViImubpCES/dw7hXSh9p7ZdLBCpGtbu4JoJWhpfGRa/
         Zidw==
X-Forwarded-Encrypted: i=1; AJvYcCWtNBNzq0ByBwhz0IiQE3FfjUSceQRFrwZlTKI/y53HMz9n9n3At1KH7AJRUWe2E6w7irlwfd+/Mz610oJETQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz61SETSvN6gI1e1gP05tyl0NrIEhNTSTCsZ5k8lNBW+oHG3Ppf
	xDP9Ba7PeGW7Moj7UrPvIU1y5x6a0aQ2e2kbLd08mOoSYKbFOp6TGcHfGPec07Oh7bbSrfWRywo
	eBIqOYTvQEdEAQnBchpFBjtc8kgkAN5W3DK8DAlw=
X-Gm-Gg: ATEYQzxFwLmfi0QYzF5nqUwRv91WZyLhC+mShLHRx5/PATC2QSehskFLybz7bCOrAlG
	tELm8rctflIxUMJl/27Ngy7DGjhzAjCujPmLdpgvO9grOy1D+d0g5UVVylZxnap4f0TyoJWlPEZ
	UD7YJTDsmgexj63gDlGa0eejvYksVcuk/KckB9vgeBE19QyzoHmXrrTvtnsEeeWUb5sBkoO9Jit
	/ts1yWOVWoEVQwIjCIQzZtsVYKN0YgFasrBU6JKwnluFYBERfXTvnD/oaH3txvJtKG5pBFMKGbO
	ieuLWUmuyCFkiFM4AIO9GwE8eug9ByfrajfnysUS
X-Received: by 2002:a17:907:72c8:b0:b87:117f:b6f1 with SMTP id
 a640c23a62f3a-b93f115d8cdmr207412766b.2.1772648013979; Wed, 04 Mar 2026
 10:13:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304082348.959786-1-soolaugust@gmail.com>
In-Reply-To: <20260304082348.959786-1-soolaugust@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 4 Mar 2026 10:13:21 -0800
X-Gm-Features: AaiRm52kw9DqM8ykaOCzBsACy_sm0tnMc9dCpHWbLmYpaCYNPQsq_lqF-pZLAwI
Message-ID: <CANDhNCpNnBzSM9Vx1vbp0dhCwjeKETNwnQnB8sjzX47+GM+REQ@mail.gmail.com>
Subject: Re: [RFC PATCH] sched/proxy_exec: Extend PE blocked_on chain to rwsem write-side
To: soolaugust@gmail.com
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	will@kernel.org, boqun@kernel.org, longman@redhat.com, shuah@kernel.org, 
	bigeasy@linutronix.de, kprateek.nayak@amd.com, 
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	zhidao su <suzhidao@xiaomi.com>, Suleiman Souhlal <suleiman@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 12:23=E2=80=AFAM <soolaugust@gmail.com> wrote:
>
> From: zhidao su <suzhidao@xiaomi.com>
>
> Proxy Execution currently tracks blocked_on chains only through
> struct mutex. This patch extends the infrastructure to support
> rw_semaphore write-side blocking, allowing PE to eliminate priority
> inversion where a high-priority writer waits for a low-priority
> write lock holder.

I'm confused. I've already mentioned Suleiman has implemented rwsem
support for proxy back in September:
  https://lore.kernel.org/lkml/20250926032931.27663-1-jstultz@google.com/

Which the latest version can be found here (though I do have fixes
pending for v25):
  https://github.com/johnstultz-work/linux-dev/commits/proxy-exec-v24-6.18/


> diff --git a/tools/testing/selftests/sched/proxy_exec_test.c b/tools/test=
ing/selftests/sched/proxy_exec_test.c
> new file mode 100644
> index 00000000000..30fc58b9738
> --- /dev/null
> +++ b/tools/testing/selftests/sched/proxy_exec_test.c
> @@ -0,0 +1,763 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Proxy Execution (PE) selftest
> + *
> + * Tests for the sched_proxy_exec feature. Verifies that the kernel
> + * correctly handles RT priority inheritance through proxy execution.
> + *
> + * TC-1: Basic PE activation =E2=80=94 low-prio holder releases lock for=
 high-prio
> + *        waiter within expected time bound.
> + * TC-2: Three-level blocked_on chain =E2=80=94 PE chains through B->C s=
o that
> + *        A eventually acquires its mutex.
> + * TC-3: PE deactivate path =E2=80=94 SIGSTOP/SIGCONT on holder; high-pr=
io thread
> + *        must still acquire the lock within a generous timeout.
> + */
> +
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <pthread.h>
> +#include <sched.h>
> +#include <errno.h>
> +#include <signal.h>
> +#include <time.h>
> +#include <sys/syscall.h>
> +#include <sys/types.h>
> +
> +static int test_count;
> +
> +/* ------------------------------------------------------------------ */
> +/* Helpers                                                              =
*/
> +/* ------------------------------------------------------------------ */
> +
> +/*
> + * is_proxy_exec_enabled - check whether CONFIG_SCHED_PROXY_EXEC is acti=
ve
> + *
> + * Try to read /proc/sys/kernel/sched_proxy_exec. If the file exists and
> + * contains a non-zero value the feature is considered enabled. Returns =
1
> + * when enabled, 0 otherwise.
> + */
> +static int is_proxy_exec_enabled(void)
> +{
> +       FILE *f;
> +       int val =3D 0;
> +
> +       f =3D fopen("/proc/sys/kernel/sched_proxy_exec", "r");
> +       if (!f)
> +               return 0;

? There is no /proc/sys/kernel/sched_proxy_exec file.

This seems a bit like its AI generated, and wasn't tested. I'd avoid
sending stuff like that out to the list.

thanks
-john
