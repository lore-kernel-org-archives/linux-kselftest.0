Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736F92E266C
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144757; cv=pass; b=EzZwabfideTHqPVK4DmO6IXdwT/OkVNRRM+5iP18vjFWPjhb1LhZB0hBSI6Nacd9fUbE5YgMkUMLb/nl9FW3JOV49g/B2v9yd7CUKuthwsuy5r5xRooZdTrmaVDwhE5p6vplTPxyfo5JWUcwHh6ekx5e/Dj2U0MvnTpTCpklCco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144757; c=relaxed/simple;
	bh=/pTHh1FwlwKHTpQht+ePSPn6d2XZSZ5XYd3TyLXK26A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dfr96BvmmurZENk1PIsyzQ7mFIqDJr9Wov4IzJrNfdUkDSpd8bcuoHsZEq6AaGpqFAiqRk09cr3EePsiwJ5JBZvjS9RIr56vMXsKaclHHacpzMNq8wkDYULVPEQKH8P5+mJ9FAf6vytwF2FC9g3I5qUEVmOvN3FCVMnaXXnlEfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yl7+vEM/; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yl7+vEM/"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2853b1f8cso1072277e87.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 08:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775144754; cv=none;
        d=google.com; s=arc-20240605;
        b=fBFKOOkykXFXFIKIO0naVfFiEpnwVgUFv9TESbTrziwyucpW4V0FxtUXggMKjSeDSK
         7G1JCIGEwP9gbETZBN/qKfmSfX+x8W/iqtGNZHXGTQh4J/+SFw37cUPNi6hWzAqHaRJJ
         WwXmnRN153L3kFRw0XVoHDWFIBc4Eu4ld6VioDJqnU+8SYe1ZbXKRIIZjQHdOWhcFhGJ
         OBZBIBX0CH0aE9oKPaR0A8opdi/R9LqDzmR0/JXVPR6ouSyDzaAJeUcQjid7pLvPr9w0
         AVqFJSrnNQ/ysk8QvbTHnWvQBqg2B6xvLOKWbpFaJ33XYjA4rJNw2ji3fCzr/ncaBuIV
         5fPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v8pXqmHG/qA51T0dr7MQi7kX0TYmgPL+L8IrHwbfF3E=;
        fh=WDyGl240q7y7YzzQwU8LsTiT4QG3ygQlu5flmXX5aAo=;
        b=OSxNrM9+fWSkLuYpj1lsL6NFpuKpKDjE6d4W+04abEh0wngIcc/wjr7iHLEfTD2etD
         KZ7KU9EuJgXAPdfkHkUqTAEDKq4E7ZDsaQUeuPKle5ZnPCfm1UKreR/ZWZVNAJKMRmZA
         kArtEakYPi12+SP9mOjMTA3yStCTlnP1cLTqcLnojBmLS/pdXFV3e/LESivBywmTBXvm
         Osz2Rs/MGPaz0a9psfrKJPfS6CoctY5vk4EPcTwGZkvU5WXiIgpFw33uXJQdOuqwAEyf
         nwLjrH6hRECzfawnHw2GO+nj5n4oojMPS9V75s1Hq5Uh9/JFZUY7Q5darISyuXzqIAHP
         23EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144754; x=1775749554; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v8pXqmHG/qA51T0dr7MQi7kX0TYmgPL+L8IrHwbfF3E=;
        b=Yl7+vEM//XPrp7wX+dwUboJmURpCGQYJc2d/beW6DoLNGX4ymoyNKbh6PMK801M2dK
         junoT4IHnwP5qM+6lL8OHB5NpAJ3JffaDP+iDLrBgcOdt6PkhXQGnGEqsVVtgTv8QlGl
         bi8bxbvaCtdoyRNl0WHx1FO5e6kSaZTeU8DZKZGmV+/La9ew1Y7gN0OJ7kwItgpyqgud
         tmV8FjtwLAXBH7wcY3DKufwee/hBk9nzlctrd6Do7e8/vdrMYXaApwdNLtph92wUm6NZ
         gfrfEbaKCUQ7IleIgrz60/ntJFxmy0ICKlD4Usv9zw0NgVLyXEFy+tDLlscED+N0B7Tm
         Tjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144754; x=1775749554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8pXqmHG/qA51T0dr7MQi7kX0TYmgPL+L8IrHwbfF3E=;
        b=ZI8LEVaGZDbCsPB13JR62ezW7zsKMTAIC6KSe9V/roHrlPVLp5dqv37VG0XORi+uj4
         VoGUcwV5cmjxSkygt1ZKrb4d0dPwz6K990drZC+JNXzYBH346ffjCAcw1sK6R0we/Y5r
         BQSm1x+AtB3ilgaqM7bi5MyiG3ddAy5NFpmLXF9lD57SKcCt6wqzZh+cgsj47/GbUlgE
         5vHRjC9T1rMM71SPTNigrZO/eQ5ym36tS3GyIgjQ7Yc0nEH7+W1teEuOSseUngRBBXMF
         FVxSRmK2N/hEYC4IlUDg0hjc1ZXEX27LBf2kbf2xFS9CE+8bjjWVP+CCgFufHiRBADvZ
         3xLw==
X-Forwarded-Encrypted: i=1; AJvYcCWLBK3B57J+OmSiZqRyA1gyQy2+f1GBDNkHWdfM1w0VCUjsbvLkMjS6LRBU5kOPAsxyln9QGAuEIfFt2qvY0AY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCemFUyCXguY5s6TtXvhbKavOiriXTwkkVbysWSoxdhAsuUEwq
	P7lpLK+R9SX6Nvbc8cEvSegJZ3m1qbgvLinaXwIVeUbYMX/fzj0HcqGNBGhjtJ0MhQeiXh8q4in
	jYcgNQtEK1GVz+EH54wn6lJ66L3xOV5o=
X-Gm-Gg: ATEYQzxFkOWDNUGswm1ed51Qj63BIHfX1nI4g8XA2ikwYBwghuFl3G7bp0Kqqh+rdKt
	r/y/Y7qHHuCp014UcZ7GXwotDaHKIgTAA4Th0bppsJC8RlrpWVRIVYBgLB1Vm31EKACogJ+slRm
	uLxWC+DbQAd/LkCBdumB6jaafs6t+zX0uy3Nv5SwdQOwa+l8UMIDV51Z1noNuYXZwUAe7unlmIj
	4M7Z8h4P6mfmhPbDq5Cc1ZVCs6ya2Rk9kv5fBV0iS4zwEMPnqhfsFD1VgGctQVf1dp04V9u3HHp
	Iyosdy4RjjgJCm3u5NYmLuQtu7KIUZyUBIXTadH/gpMO8VP13FAHYuLuGZkPFgZSsE3CwDuXtg=
	=
X-Received: by 2002:a05:6512:238e:b0:5a1:26f7:71b with SMTP id
 2adb3069b0e04-5a2c1c9b911mr3539069e87.0.1775144753402; Thu, 02 Apr 2026
 08:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205135842.20517-1-seokwoo.chung130@gmail.com>
 <20260205135842.20517-5-seokwoo.chung130@gmail.com> <20260324131204.735c60133288e94718f20d31@kernel.org>
In-Reply-To: <20260324131204.735c60133288e94718f20d31@kernel.org>
From: Ryan Chung <seokwoo.chung130@gmail.com>
Date: Thu, 2 Apr 2026 11:45:42 -0400
X-Gm-Features: AQROBzDhQBJMUd2pX45KTasnqGiAEY84CyM8ttQPZa50vwWtIMxIkKUtK7Q78K4
Message-ID: <CAB1jyqw_6wepbDaKi7087GDUcJ9t1jQO6qP9pa0DWCjti7ABZg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] selftests/ftrace: Add accept cases for fprobe list syntax
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, corbet@lwn.net, shuah@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Masami,

Thank you for your feedback. Unfortunately, I am not in the position
to continue working on this patch series for the foreseeable future.
If you or anyone else on the list would like to pick it up and carry
it forward, you are welcome to do so. I appreciate your time and
effort on this.

Best regards,
Seokwoo Chung

On Tue, 24 Mar 2026 at 00:12, Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> On Thu,  5 Feb 2026 08:58:42 -0500
> "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com> wrote:
>
> > Add fprobe_list.tc to test the comma-separated symbol list syntax
> > with :entry/:exit suffixes.  Three scenarios are covered:
> >
> >   1. List with default (entry) behavior and ! exclusion
> >   2. List with explicit :entry suffix
> >   3. List with :exit suffix for return probes
>
>
> Could you also add wildcard pattern test?
>
> >
> > Each test verifies that the correct functions appear in
> > enabled_functions and that excluded (!) symbols are absent.
> >
> > Note: The existing tests add_remove_fprobe.tc, fprobe_syntax_errors.tc,
> > and add_remove_fprobe_repeat.tc check their "requires" line against the
> > tracefs README for the old "%return" syntax pattern.  Since the README
> > now documents ":entry|:exit" instead, these tests report UNSUPPORTED.
> > Their "requires" lines need updating in a follow-up patch.
>
> This means you'll break the selftest. please fix those test first.
> (This fix must be done before "tracing/fprobe: Support comma-separated
> symbols and :entry/:exit" so that we can safely bisect it.)
>
> Thank you,
>
>
> >
> > Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
> > ---
> >  .../ftrace/test.d/dynevent/fprobe_list.tc     | 92 +++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >  create mode 100644 tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
> >
> > diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
> > new file mode 100644
> > index 000000000000..45e57c6f487d
> > --- /dev/null
> > +++ b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc
> > @@ -0,0 +1,92 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +# description: Fprobe event list syntax and :entry/:exit suffixes
> > +# requires: dynamic_events "f[:[<group>/][<event>]] <func-name>[:entry|:exit] [<args>]":README
> > +
> > +# Setup symbols to test. These are common kernel functions.
> > +PLACE=vfs_read
> > +PLACE2=vfs_write
> > +PLACE3=vfs_open
> > +
> > +echo 0 > events/enable
> > +echo > dynamic_events
> > +
> > +# Get baseline count of enabled functions (should be 0 if clean, but be safe)
> > +if [ -f enabled_functions ]; then
> > +     ocnt=`cat enabled_functions | wc -l`
> > +else
> > +     ocnt=0
> > +fi
> > +
> > +# Test 1: List default (entry) with exclusion
> > +# Target: Trace vfs_read and vfs_open, but EXCLUDE vfs_write
> > +echo "f:test/list_entry $PLACE,!$PLACE2,$PLACE3" >> dynamic_events
> > +grep -q "test/list_entry" dynamic_events
> > +test -d events/test/list_entry
> > +
> > +echo 1 > events/test/list_entry/enable
> > +
> > +grep -q "$PLACE" enabled_functions
> > +grep -q "$PLACE3" enabled_functions
> > +! grep -q "$PLACE2" enabled_functions
> > +
> > +# Check count (Baseline + 2 new functions)
> > +cnt=`cat enabled_functions | wc -l`
> > +if [ $cnt -ne $((ocnt + 2)) ]; then
> > +     exit_fail
> > +fi
> > +
> > +# Cleanup Test 1
> > +echo 0 > events/test/list_entry/enable
> > +echo "-:test/list_entry" >> dynamic_events
> > +! grep -q "test/list_entry" dynamic_events
> > +
> > +# Count should return to baseline
> > +cnt=`cat enabled_functions | wc -l`
> > +if [ $cnt -ne $ocnt ]; then
> > +     exit_fail
> > +fi
> > +
> > +# Test 2: List with explicit :entry suffix
> > +# (Should behave exactly like Test 1)
> > +echo "f:test/list_entry_exp $PLACE,!$PLACE2,$PLACE3:entry" >> dynamic_events
> > +grep -q "test/list_entry_exp" dynamic_events
> > +test -d events/test/list_entry_exp
> > +
> > +echo 1 > events/test/list_entry_exp/enable
> > +
> > +grep -q "$PLACE" enabled_functions
> > +grep -q "$PLACE3" enabled_functions
> > +! grep -q "$PLACE2" enabled_functions
> > +
> > +cnt=`cat enabled_functions | wc -l`
> > +if [ $cnt -ne $((ocnt + 2)) ]; then
> > +     exit_fail
> > +fi
> > +
> > +# Cleanup Test 2
> > +echo 0 > events/test/list_entry_exp/enable
> > +echo "-:test/list_entry_exp" >> dynamic_events
> > +
> > +# Test 3: List with :exit suffix
> > +echo "f:test/list_exit $PLACE,!$PLACE2,$PLACE3:exit" >> dynamic_events
> > +grep -q "test/list_exit" dynamic_events
> > +test -d events/test/list_exit
> > +
> > +echo 1 > events/test/list_exit/enable
> > +
> > +# Even for return probes, enabled_functions lists the attached symbols
> > +grep -q "$PLACE" enabled_functions
> > +grep -q "$PLACE3" enabled_functions
> > +! grep -q "$PLACE2" enabled_functions
> > +
> > +cnt=`cat enabled_functions | wc -l`
> > +if [ $cnt -ne $((ocnt + 2)) ]; then
> > +     exit_fail
> > +fi
> > +
> > +# Cleanup Test 3
> > +echo 0 > events/test/list_exit/enable
> > +echo "-:test/list_exit" >> dynamic_events
> > +
> > +clear_trace
> > --
> > 2.43.0
> >
>
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
