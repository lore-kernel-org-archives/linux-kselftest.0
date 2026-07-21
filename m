Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583C8473C82
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 23:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784677988; cv=none; b=U0LjsK0nUBSIRkXpyOrLwxp6cSVtogVzeWQXj6sW8sJxTvEjMTfE+wwJ2L/i4FUU34lKy2Prw5HhntrDqMgsAIS6EBlaYjgjR/MvnAS0/uHWJFKGidThBe5aqhtouhZ+EcZ4wWj6h4D/g5s2wfE9cFkjzZBRrijPFDKmsj4JYHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784677988; c=relaxed/simple;
	bh=o3/LOYhvDhaSRK4supHpFZWqrvVZAHUL1OwjfXkLq8I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ObR3XZwcX7Rn4rWjJ2ByCxT5LJaBNkrl67kNAk3OESa7JADlEOO3CsRxNWShuT8girlZNz91G3V5M9NwTXH0i1V+DMH5rOQD6LJx9Zvr782iA6WfxDTPjx1DxEQB7JnY74eFXUQVR7vMysSu4MbWuvC8PX7WTRUwEqQGRK11eqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxxjQJgE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxxjQJgE"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-382ef647e20so11419302a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 16:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784677985; x=1785282785; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xz+rLekKfe/AAP0Xgd+Iz5oYMriTqERJLl0HYz+gnMU=;
        b=GxxjQJgECCSY08QnYzjmSGxP6PhdBeUFlNHFBjBKp9Hn+KI0mKXGx2vz8zBVZlv80b
         5rDEvdjBv2dHfizn9LpP3rMryuTBV9KmeGfQzLMOtI2+D7awLZFgh45RUjTy7ERRqskI
         79z/vJIPlVyhO21GqpYh/UmBIgAUwPzEkoKqQV8Fw/F3rCxwUczGqCVswayElOQ7IO8z
         iRA6rDsSwOXdSOsHXY3y+rLVkEuDrwIFOMuXVa7+Q16L69nWiLXcMdA46u9gdltTOADZ
         qIzcqJmSobfSi8BWb95KBFOkFV8f1XBQS/OSmacZW4V6TXXUo59fyUYGasOYjxvbFnqb
         KnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784677985; x=1785282785;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xz+rLekKfe/AAP0Xgd+Iz5oYMriTqERJLl0HYz+gnMU=;
        b=i7o7zI+ONiWwYyeykK3472VsQJg8eIxxKm7nADeEHm5OjF1oS++i0FCIIK/Co4yxEg
         evjbm3EktYZdEWJnxMiOybotbCQk4+1FT8Z8v8XavG6eTstPSfCxAw/yR5kdxRbZQh27
         I+gZHZ7NpivbNkdLyTNeh3IJMTXjmXmp6lnzN9v2/GL0F80gH1j7Uuvr5xWFPVIntgjm
         FWetqpQEDHmrIq8xrsS/l89pXfJ2AUFy3yERrFuAp58HdrsQEC5caeAVe8LmU4Km204x
         FoJjRIQSRzw1Pho+bZ9tflTbRfPQWdR1rBp3IrGMAZtDk2dTtbBoX+A2sqFnhXvg02aV
         SjKw==
X-Forwarded-Encrypted: i=1; AHgh+RqCZ8g/MSbftFK5AUqv9FUFi6X6FiczrKbLED1/gQ+yHQ1JmsMKic/iVS/INWfGyPdhEpfJ1SGwb7XmZgcwlzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXpataiPFpcW1wWoWV/n+YhGao9sYoMOv7Hk42AexDwd/8ev6d
	aH70XF0zcjK6n98nnjTDIfiSC3Qi58ip62VvhrL10Bqp9TfGUT6cbWrf
X-Gm-Gg: AR+sD13dPYYz0E6GrDG1kswC0m0RYAyAYbzDA3C7gquZGMDQcLb9KB3pxKOpo+XM1sQ
	AFCLiNz5IvEdRKbz4cxC9sCXOE0fljaI5A0+klBUNMVQEEAkM1PJF7gZ0G5IlMtvxFW8MEXPPMn
	NVxEdndIW5t0QIZbeYbffTuLZuEF8DByyQMYlZMJxTnPWi/p1lpLyU48OuR3vZ1rMNbBSDl8D3j
	wxukqrhbCidXw9UJxg4Ed4hfrWFvU9xOO8YRjkYnu7hnFr1lmnnu7NAJ8/x1Kp1gCAuqJSZk+Ck
	tTKkYBVhG98wp2+0AzFd6qqJ/huvdI0LyFs81tTdDfEsuwSzktBUx7fFzFLknalR7X9T0/3MgpH
	3MnU2Lq4adXKsvZwCPKbqUyKRpL9WslaMlYXUY7p/BTqwl8pKI6GrwPv3jy6d6RMJUoXm0XjgJk
	ZVypGPVj4WcSumRmRKY9JIbyLsBH8kp44E6pRha1vEyi7TjNhcq+DEs02Q
X-Received: by 2002:a17:90b:3886:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-38e4b2a5964mr21107022a91.0.1784677985494;
        Tue, 21 Jul 2026 16:53:05 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:cda2:e912:7f2e:f787? ([2620:10d:c090:500::7827])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm672641c88.3.2026.07.21.16.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:53:05 -0700 (PDT)
Message-ID: <ea92ce5296ff4cacb1ecddd90493e04424dfc488.camel@gmail.com>
Subject: Re: [PATCH 2/2] selftests/bpf: Cover stack frame number after
 scalar plus fp
From: Eduard Zingerman <eddyz87@gmail.com>
To: bot+bpf-ci@kernel.org, chenyy23@mails.tsinghua.edu.cn, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com
Cc: john.fastabend@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org,
 emil@etsalapatis.com, 	bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 martin.lau@kernel.org, clm@meta.com, 	ihor.solodrai@linux.dev
Date: Tue, 21 Jul 2026 16:53:02 -0700
In-Reply-To: <b076593c985497a5f903439b864d1e8f1cd107f1561d04a22b77c6fafb3b4c13@mail.kernel.org>
References: 
	<81c5f138e510622fcf908b99bfc7000b872e0966.1784563950.git.chenyy23@mails.tsinghua.edu.cn>
	 <b076593c985497a5f903439b864d1e8f1cd107f1561d04a22b77c6fafb3b4c13@mail.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-07-21 at 10:29 +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/tools/testing/selftests/bpf/prog_tests/verifier.c b/tools/=
testing/selftests/bpf/prog_tests/verifier.c
> > index be97f6887f0e..0483ae340726 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/verifier.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/verifier.c
> > @@ -11,7 +11,6 @@
> > =C2=A0#include "verifier_arena_globals2.skel.h"
> > =C2=A0#include "verifier_array_access.skel.h"
> > =C2=A0#include "verifier_async_cb_context.skel.h"
> > -#include "verifier_basic_stack.skel.h"
> > =C2=A0#include "verifier_bitfield_write.skel.h"
> > =C2=A0#include "verifier_bounds.skel.h"
> > =C2=A0#include "verifier_bounds_deduction.skel.h"
> > @@ -165,7 +164,6 @@ void test_verifier_arena(void)                { RUN=
(verifier_arena); }
> > =C2=A0void test_verifier_arena_large(void)          { RUN(verifier_aren=
a_large); }
> > =C2=A0void test_verifier_arena_globals1(void)       { RUN(verifier_aren=
a_globals1); }
> > =C2=A0void test_verifier_arena_globals2(void)       { RUN(verifier_aren=
a_globals2); }
> > -void test_verifier_basic_stack(void)          { RUN(verifier_basic_sta=
ck); }
> > =C2=A0void test_verifier_bitfield_write(void)       { RUN(verifier_bitf=
ield_write); }
> > =C2=A0void test_verifier_bounds(void)               { RUN(verifier_boun=
ds); }
> > =C2=A0void test_verifier_bounds_deduction(void)     { RUN(verifier_boun=
ds_deduction); }
>=20
> The verifier_basic_stack skeleton was already dispatched here through
> RUN(verifier_basic_stack).  Adding the new subtest to
> progs/verifier_basic_stack.c on its own would have exercised it under the
> existing harness with no change to prog_tests.

Bot is spot on here.

pw-bot: cr.
