Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2C8366050
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771850407; cv=none; b=H82mElcDH4MbriYLJXEc/Zl49eopbjprApSnK7I7svHt9ByrAjmM//OODiq7IsiXsI2+FqnqvSmIQ42AfagfchgL3vMdKtu/zcd4jkTnSYVWNvvSLpF/42mk1ujOOhsKY7+VKZNTIqDfo4U875ARENcQ0H3lUgIabIhP1GrgOo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771850407; c=relaxed/simple;
	bh=zLP9DBt5ACqyKp8zyP1I6et5L1V4brYDFyjTSlJe5AE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G4jNy6Rire2qPUQR3jWt+R7d2rmyaoPK6OGjxYpcITnzthnDaNwDrIjYW43VTPKu9JFFj7Nw5PlnnjaeSMDe87tu2vdHS3M+YAeb/gwLyB68OSZ+L87RnYKybdwuH3UwoiBwotHCX40UwEiXR0So4UAoIyoCdcYdY2YmZCSl5ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MhhFQ5n+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MhhFQ5n+"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48372facfedso45454975e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 04:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771850404; x=1772455204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9UVo+Ch5cqNfZ/7JsfHkoD1JYgkJQPxukS4MObThec=;
        b=MhhFQ5n+PzDSPKzBRtwe18lbIdpDDdJ8T2UM7Z68MUfaA8vva/U/vYQGy371uSH/xK
         HURYzbBhCJrQsMfIXdbTz5VEHPeBUomjVKvWNTU5g9shcFqZSVcebFhGYPUOihJczlQO
         d9h68IRBguf9E0KRTLjFQ5g/UnBioix9RwFJm9+3Hvsegxp6zNuYN0ostrxzkRVhYoyj
         p+LezSlbU3wuwv/Y6HA90R/ynwaSYcCeNAaGHvsNsbZj+yo22lp5JnoSPRC5emNU9J/j
         23ydVbt9Hj+ZM3D2q04tmC/DtE/NEzD1CZU3nWNQX1YcIp+AcojKNCL2SKRB/Y78wS6W
         O+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771850404; x=1772455204;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H9UVo+Ch5cqNfZ/7JsfHkoD1JYgkJQPxukS4MObThec=;
        b=FeQR8U53hkEaFDVI6kRMSIPyZ3kRmUnVvaROwIkCC76GzcvrDQRTCEiZj2C2UsEi6D
         kH357PH8o7SOJ7WWdkGFjFsuw6LJiMjOYcf2Z1TBJOmp19R6H4anfiOPAPtFzB+KPxem
         hPqTPPmgZp9l3kVlM3JvGdqDfMRF5xdauJcrOtdD05bB9w5eUJpJZC7esmCtuBlByH5+
         eH6VlC33A8rKJ3Ri3rBvhMUHlX019RoAlK94qxCFe0d+65YoS47foZfG3Gaatx4YRWMG
         4hlhF1q7F7awXEMW1LdIcIyx/xFwpg3yrhOemNLZepkZTBOX79DIarv7Ndr4gLNiFQmK
         E0IQ==
X-Gm-Message-State: AOJu0YxRmFMf2na55rn2dTWUWu2acLdrSwiNtGKYL+JwIGZvNhFuYEbw
	w4aBXlfeWdSaIaxWr9jdjhn71mmTH25IQT1h0DhU+GdxyuIGuMPjzQRtrkiFqQaCt4mj3ZuzCWc
	k7WuM1I7UaUulmQ==
X-Received: from wmnv12.prod.google.com ([2002:a05:600c:444c:b0:477:a181:1919])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a204:b0:483:fbe:23dd with SMTP id 5b1f17b1804b1-483a00a52bdmr187554465e9.12.1771850403661;
 Mon, 23 Feb 2026 04:40:03 -0800 (PST)
Date: Mon, 23 Feb 2026 12:40:03 +0000
In-Reply-To: <aYX8dot4fTh3FJFI@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260206081704.53215-1-liuhangbin@gmail.com> <DG7TJFKZNG1J.19BZF87IWD3UG@google.com>
 <aYX8dot4fTh3FJFI@fedora>
X-Mailer: aerc 0.21.0
Message-ID: <DGMCJQ2TKZ1O.Q2C502GV1GSL@google.com>
Subject: Re: [PATCH selftests] selftests: Use ktap helpers for runner.sh
From: Brendan Jackman <jackmanb@google.com>
To: Hangbin Liu <liuhangbin@gmail.com>, Brendan Jackman <jackmanb@google.com>
Cc: <linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, 
	<netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri Feb 6, 2026 at 2:36 PM UTC, Hangbin Liu wrote:
> Hi Brendan,
> On Fri, Feb 06, 2026 at 10:48:59AM +0000, Brendan Jackman wrote:
>> On Fri Feb 6, 2026 at 8:17 AM UTC, Hangbin Liu wrote:
>> > This has been on my todo list for a long time. We should use ktap
>> > helpers in runner.sh. I saw Brendan did some work in d9e6269e3303
>> > ("selftests/run_kselftest.sh: exit with error if tests fail") to make
>> > run_kselftest.sh exit with the correct return value. But we still use =
a
>> > custom solution in runner.sh. Let's convert all the print messages to =
use
>> > formal ktap helpers. Here=E2=80=99s what I changed:
>> >
>> >   1. Move TAP header from runner.sh to run_kselftest.sh, since run_kse=
lftest.sh
>> >      is the only caller of run_many().
>> >   2. In run_kselftest.sh, call run_many() in main process to count the
>> >      pass/fail numbers.
>> >   3. In run_kselftest.sh, do not generate kselftest_failures_file; jus=
t
>> >      use ktap_print_totals to report the result.
>> >   4. In runner.sh run_one(), get the return value and use ktap helpers=
 for
>> >      all pass/fail reporting. This allows counting pass/fail numbers i=
n the
>> >      main process.
>> >   5. In runner.sh run_in_netns(), also return the correct rc, so we ca=
n
>> >      count results during wait.
>> >
>> > After the change, the printed result looks like:
>> >
>> >   not ok 4 4 selftests: clone3: clone3_cap_checkpoint_restore # exit=
=3D1
>> >   # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0
>> >
>> >   ]# echo $?
>> >   1
>>=20
>> Sorry I'm being a bit lazy by not investigating this myself but the
>> current intended behaviour is for runner.sh to output correct KTAP,
>> right? Could you describe what behavioural changes this is expected to
>
> For runner.sh, I just want to make it using the formal helper in
> ktap_helpers.sh other than manually echo.
>
>> bring - does it fix/change the KTAP output? (Or if it's just a cleanup
>> with no intended change then please note that in the commit message).
>
> It changes the run_kselftest.sh's output, with a total result. e.g.
>
> # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0

Cool thanks, then please just clarify the commit message to say this.

>> I have not reviewed the code properly yet (I just read enough to check
>> that it still does the thing I care about i.e. return an error code when
>> something fails). I can do a proper review next week if you add a bit
>> more context re the question above though.
>
> Yes, I also care about the return code. This patch doesn't break it.
>
>>=20
>> > -	wait
>> > +	# Handle the return values when running in netns.
>> > +	for pid in "${pids[@]}"; do
>> > +		wait "$pid"
>> > +		rc=3D$?
>> > +		[ "$rc" -eq "$KSFT_PASS" ] && KTAP_CNT_PASS=3D$((KTAP_CNT_PASS+1))
>> > +		[ "$rc" -eq "$KSFT_FAIL" ] && KTAP_CNT_FAIL=3D$((KTAP_CNT_FAIL+1))
>> > +		[ "$rc" -eq "$KSFT_SKIP" ] && KTAP_CNT_SKIP=3D$((KTAP_CNT_SKIP+1))
>> > +		[ "$rc" -eq "$KSFT_XFAIL" ] && KTAP_CNT_XFAIL=3D$((KTAP_CNT_XFAIL+1=
))
>>=20
>> These variables don't seeem to have anything to do with KTAP so I think
>> they should have a different name prefix. I guess KSFT_*? Or maybe
>> RUNNER_* or something.
>>=20
>> Also I guess we should initialise them to 0 so they are still set if no
>> tests actually get run?
>>=20
>> Also I think it's probably time to start documenting the
>> interface of runner.sh - sorry I probably should have done this when I
>> created kselftest_failures_file. Can you add a comment at the top to
>> show that these variables are part of the "API"?
>
> These variables are defined in ktap_helpers.sh and used by the ktap helpe=
rs.

Hm, I see. Then it seems pretty hacky to mutate them directly here, and
is it correct to always increment them by 1?

I think the "correct" thing to do here is to parse the KTAP from the
child process's stdout, but I assume that's not actually practical with
the current tools we have available. (I could be wrong though, let me
know if that's the case).

Or maybe we can dump the values of the variables at the end of the child
and then add them into the parent process' values...=20

Or, if we just keep the current approach I think just having some
commentary to explain why we are doing this would help. I.e. "these
variables are outputs of ktap_helpers.sh but since we've run the test in
a subprocess we need to update them manually" (the current comment talks
about the netns which I think is confusing, I don't think the netns is
relevant at all).
