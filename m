Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1940BCAD
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 19:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278167; cv=pass; b=kRfKIWo0PO2HWA43Ksyt3QjqdMZ2iDzyb6OAFDMrMdco12Xg9zzGINfoOLxgs/GS+DD2NWPRXncaXDgTjwVe2b8w35Tp8FwY7HqFo8nKEe7QnJpPyrfUdPUlgPm67kztCF5ibQwpT1olIJq7R0K7J1WYMODR1YjuSFOhKiynjWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278167; c=relaxed/simple;
	bh=hs8xkC5GbX7rsGvvU+YLWtE+aWJsVOhaQkQD9okCwTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fo2XLOzellfD/eDv9LiDwUjHC0I0ttBvhJvUFSN0qKWjjsc+j+Btr3zYp7KbLn17RMdCCayCfM6gQ87kaMaeJWbSxxf36ACamwxbW6pd0Da2eLOyFRQeuc2IkcbI3REQs5rz1UZ6+/F1mTxDu8DDzaK5a+o+CeibZm12dhBUBSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q1x+Hg8O; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q1x+Hg8O"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so1268805e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 12:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278161; cv=none;
        d=google.com; s=arc-20260327;
        b=HsZK/98DhT6GjlP/55HQbislMnW+AMUClZxrZs9y+9l4A7doFp6Oj8JWLB40NTpUcQ
         MBsGVMONjZWYn1jqZA8M6eyqcnj5VI4NIJsoNB/3DY5WReffx995WbsUUX8sG5/8OrsX
         K6ugjE7RcCsJXjT0xo/Xl+XzvshDKrIzpJqwoIU+My6VSoAamUS0VABfTUMs+jN06mtw
         5PmZ5y5nrp6BOgolgO5OwUTvRXncLgCSHLt2UoJoiCailD8pE/RJhMtBpJKthROLRdQC
         SOQLOlUW6bOJQOTkkvSakhbLBbARPcOwIZ34vLlBgF9O1yVjjyi6qeaKEaEJH3XIJ348
         Gq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3tFMJWi5Gov9zmBh5Mcq+CM3NAFp23VSw1Y5x8fDtYE=;
        fh=3bB6/C2Gp92pufVpMoZ9vsoGsAJS+Am3MTEtovdh5Qw=;
        b=kQSbkmnARJ0smX+CsbUb52U2kJ7hNGfJubjGXqK1gUGv1IDk3TneMHJk7TtI22Ni8e
         9vu4LWBC7KDs92IVTZCBV2JARWpqBWL6lEZC45V/EGyMSzan8pgKq7v5lpkkd+1ybMGT
         sNjuZRLDdhbqk8I5nvbXYgZLR21NjkgsgdjbAhhmQd9hftFvU4T2eCZmy513xnPA/Qy0
         S02CTdFZtd+ICgPac0yOpxDsWj8WnyelafWVimGoY+Zvavsv+zsoV5BOiw4E97Qgu5Y4
         OFPDZazjHkdjIfARTsVUT9/JbgO/6aLIVqEX4oZx7GMoTQGKIzsdT7Jd3peyIVjJI22k
         2m7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790278161; x=1790882961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3tFMJWi5Gov9zmBh5Mcq+CM3NAFp23VSw1Y5x8fDtYE=;
        b=Q1x+Hg8OzOFWwoNRCb2TlwL9o8v7fuT17fOHjLIiF+j1Oqcd25bzysoKlBOkDOu8BM
         bN8O7LnW0F/lr1ke/yCSgcx7vj7XRi5XcdWtjgMOiTJxRXEjiD9/19Z5+PNRn9PDDemo
         8ViSRVLss0ctKIegn2nhcmWyeZ+6g94Ro8FInOXrAxoT1JHf/G7V/4FMxq2DbgWdzzBz
         s+823vbiCwsrmR43/2v79BadL6iNlCjxZ4vJPjzmListSVl5NWJUAcHoFEaOPlR5mx8y
         /0Sprh3UEA9t1VB/jz0VKKx3/Ums4WJXaY1hDrAjqMfoYWd/p3l7cEkAhcjLs1lvkw+W
         3dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278161; x=1790882961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tFMJWi5Gov9zmBh5Mcq+CM3NAFp23VSw1Y5x8fDtYE=;
        b=1ectnqQai4taWTXrbBgPRRt0nj5NgUSEM46ecVz7rm1GBIaKGx7o9lIk0ub9waRHDb
         uFJDehaxuCuK1h4pr4LoEEs0bq2EtIn5ivLD88rymMDR7lNzMASbIu370zjhIRdbXPEy
         CkLh6OwMsNRNhOhQUqTGgsTr3R1c/elpBVydkOPt6bjHmmPhQRDsRDD2VDYnJotqgxlv
         wsRWj0bej6Tm/NHsNUAygZcZaqEeJmNCV1pRG5zbUlah4l5Be7VSG1F0oM+2+3cZmRcc
         NfIVZbySQAwAtGoDG7wBxJVlLEVmKnXhCCS8/pZUZenkV6sbOJA0rMTxI36GxyrM5E7U
         5ABg==
X-Forwarded-Encrypted: i=1; AKwUvBza9DFpbrVPQ1rqlSBqu74Ikw/wotriaivGo5kq++AzHDgRlPc+rI3wauVVK2WnShDuHxxOpD+8OLSpgGtYD+s=@vger.kernel.org
X-Gm-Message-State: AFuF++lTMdZsXzUlazQ1uq/sbrbyWbs0ZYMvvIwoldXAZZeJ6u+HEEHJ
	FPHAZ84vyhZcwuIn8MtEgklLvmuNIazioTjwyOCa2IOjo6XHYSZQOmTtwyVp+Xluk5WVMRiq3YX
	yGfTWjIz7CSpTnazId+J00F7cJA3wzRO4526Ldn8=
X-Gm-Gg: AYBFou1a7azCmayNuU9fVEV8IN+/U/UiwaG6Ts6Kxs8JTRRdPxuG08NmXHUJxk5AK/n
	YPa0dUFO5ryGttIbZmCvQPdmZECxa2CVbuBBYMdnQ3UYyYQLFFY0X5SwqpRp9l7CDVCqdm8q9NA
	s87AK1ovr3m4e1PaZNp7TK+YSotLAvKD3pacB7Z0asGnqwQ/6pld5vIjC0EOel5u8VlKWRnW4we
	y8Nj5wU6X62MCnhXUEcuLuHSPtv0ELipOJgGiaRxsgELQQ0ZCmjQBNXPhsffeKkT3IVcxz9KM98
	EA/1W+TZHrdw1iYjT62cKw2icrB+MkU23nlFCa1t0rxpnku/0PtpVXQwnBf2T+g65GkjV7L3HB2
	6LVSEClbVY7Rn2j26lKqaVGuM8rbyFE8qZZBYGDHDIJWkVJV4irfYMjj4G3OQuzJFE+/UBBimEg
	+othQ5KQ==
X-Received: by 2002:a05:600c:8b6e:b0:499:8aff:59b6 with SMTP id
 5b1f17b1804b1-49fe66cccf5mr56226295e9.14.1790278160828; Thu, 24 Sep 2026
 12:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com> <20260917015237.2462954-2-eva.kurchatova@virtuozzo.com>
In-Reply-To: <20260917015237.2462954-2-eva.kurchatova@virtuozzo.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 24 Sep 2026 12:29:09 -0700
X-Gm-Features: AclHuK9RBM64cKOlW-Jc_KVmdxW2OpdFgUbUbv4kqC_qBroNbvhQU6m6eETAxxs
Message-ID: <CANDhNCrBS+RRkHNLX9q+g8bceYyfeRmF9LjSN-M4yp=aoH-fQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests: timers: measure the CPU timers on the
 clock they count
To: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 6:52=E2=80=AFPM Eva Kurchatova
<eva.kurchatova@virtuozzo.com> wrote:
>
> Commit b00385b8d081 ("selftests/posix_timers: Use CLOCK_THREAD_CPUTIME_ID
> for ITIMER_PROF measurements") gave ITIMER_PROF the clock it counts, as
> measuring a CPU timer against the wall says nothing on a machine where
> the task does not have a CPU to itself. The other CPU timers are still
> measured against CLOCK_REALTIME and fail the same way. With four busy
> loops on the two CPUs of a test machine:
>
>   not ok 2 ITIMER_VIRTUAL
>   not ok 5 timer_create() per CLOCK_THREAD_CPUTIME_ID
>   not ok 6 timer_create() per CLOCK_PROCESS_CPUTIME_ID
>
> ITIMER_VIRTUAL counts the time the task spends in userspace, so take
> CLOCK_THREAD_CPUTIME_ID for it as well; the loop it runs stays in
> userspace, so what that clock adds for system time is far inside the
> half a second the check allows. check_timer_create() arms its timer on
> the clock it is given, so measure on that one.
>
> The test then passes whole on that machine, 19 of 19, busy or idle.
>
> Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>

Looks reasonable to me.

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
