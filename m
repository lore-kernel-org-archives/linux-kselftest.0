Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793470871;
	b=PMV6Delx8izt2YH/qQxT0kQ9Ak87pKoK19zefo1NZ9kGMGn4PPwh+W9M4dl3MmFeNkiR
	 7Ov4AoeEswIarMgtKmm2DxGNGuPIqnsT4B1vO5Q7jndeBfEE6gnWztHwMnKKr0EufGsb5
	 cNrdSo0tjAfWjW5ZXO139Lf0grv+OsCKInWH6dPWgA3/JMsW133to4h0eYW2+WmGLBIr1
	 r2HxsVAWIlmemjzaEBOB1n1CFTUNyuzf0Nx+NYGcNfNx1TNwORynbBsSVfRs9RsgX1UZC
	 NbzIH1o2sd4Y9srVUBUpNHtEwZ/pfKrD0xOOnqndrMd78fSo4yQ+XK6sIqlDyN6u0ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793470871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=NgMpOyHgT4tLe/3pZX4/Fh1+jmri4pwwdDC4ZMxFH0Y=;
	b=2VW1Hdm1Cw+4ceDATGqGTaN0kWWH1NKRus4/igQWgX4hsjZyPMmXckAA+SpGAXfqJmgk
	 phSmQd1GVusgDxDi/x9C2CJhMfsC7Hnw67gunO8ng/UuIFTw4whIDFI8XVKe1O6rAZ00T
	 O59rMzVgijL0pIRg5uhIrLtdPCTXLC10gB7JYVTdxnbX+OnkXk+0lOCryW5x1pHG+U0aL
	 htbcXBe4UEaN4TMc38ignFiN39vX1HoS0L8bOylEi8qPq1LQGtlj080mQ2i6C1fD+Kia7
	 x2xQNAosPp/vwtikR0pvv7mnoMWvPhGj5TfS1uFXtoza9ek7W80cTd98AgMOQJkx6nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04myyEPr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1286606A31A
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 18:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1286606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04myyEPr
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be47aa555cso1694395e87.3
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 11:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793470868; cv=none;
        d=google.com; s=arc-20260327;
        b=qEwFfyWmU38K6EOGK9J4zcP2hrCFOYY4pLJGhmktMY80n7TNRV1mMpXs9vnbnz5BBD
         lmJmkgsttVp8+Chs4W1arNLb9e3LoXJtA7nFrZF6brzHyqo5iD5cYyZ+Vh1gdg0uqgst
         QqlXCHd0cWiIHMXjf3Nly/wgThW+Cdasr5/VGwfl3+Ra0A5eRYF8IfII2JwraVwZ4Cgf
         RqagmJFgVnamYs3qcHgATrIXKBvyv4TnWsrQUfUXmKv6oAJk4co7IFNGWHKTFvZBzR2q
         P172/VDM8wyOwn2MiNgMZTkCV13tNsgV11+LSbfRzx4eBWBWf9niwUIDfP1iRoHCzi66
         IfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NgMpOyHgT4tLe/3pZX4/Fh1+jmri4pwwdDC4ZMxFH0Y=;
        fh=SIXm10U0XCrZgQxBorSi+HTORsMpdRZz93hpRAbY3/U=;
        b=L5ijscHRQu0cCADCitdj2bbbt4j35WGaaMC4WiXUOJworGiiPnW0zFlWaP5DEk095k
         Y5GS5ArVnKrpYqmd8UL5/gUluKnc2A7gd1H+XL5ta+2t/8HRw5nbRUnqEKnBBzME10TN
         l2bsEmoZN7E45mWlIWyv+WO22bxW95vICIeS8DotO4C/lL93QtUqzOlIero9Y3hYi6kP
         DW2FxVetjI7T/YP8HQ/ICz4qxXrmiIC6DzwnF/HQbY/DWhQycspgSKdD4u57s9SKWIO5
         JI3oak297U10GLnEeyUWR4fmZaB0W0/4JczHc1wHiwzEOozigARnwZXxDVguSjoKG3qr
         6zAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793470868; x=1794075668; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgMpOyHgT4tLe/3pZX4/Fh1+jmri4pwwdDC4ZMxFH0Y=;
        b=04myyEPrHwLG0x07mujSWVZU0/8AkEqECvAmORwOikLlblI/X3UQpIp7WpyPbWYAcf
         3FMOrw23touvviiO3Jar40xSdBUQFuJ+Wq0mjuAmXm1FIBezF2KUJOtLTMT1jj/sxsD1
         9Fv333P00EvMMjZWF5uGbm4xd1MTuDcbkQvpyjEhpIjKpWC2zcD7VdHMKhXjws/bc77I
         0TvL73mhBqQ7gCf1oR5POQ0NWEGnHkZtCaUFWycdWHy22G2sJXMMRpAHtnC/Hun6NxVA
         WwmObMIntm+QXDpTKoRE2zS53dqr3KcC3a/JzkpJjLie0O8FdzKmApDtyue0gj47TGwf
         wtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793470868; x=1794075668;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NgMpOyHgT4tLe/3pZX4/Fh1+jmri4pwwdDC4ZMxFH0Y=;
        b=aasupgj6flvaZwvt9Ltn0rLM8UvOFXkw5vA4nkgvNzS9fWYYk4MOlbhK4RpZ39OjIk
         3A94bJm3HFI5yucZmqohM8nCTrWoVg74W4HUvJ77HXT8RbEByLqlyVAEJdiFUKPQNg0d
         ZjT6DLabFovL/DC+YiQr+FfffowdvFs3GW8QpAsnm3ZsIuiVx8VzH1JSt7xwEf9q6yRk
         Hj5cYBCPOcnYmnNA7iuyj2joujygflDIxg7jK9RAoqTY8jaLdAes65vV9mN7nPnVJyvz
         w6Coy7HwX5kMT33NgAvWqKEdC3vuNNnCgIVJySqH7XGRDtCwVP7XEA8FEbatQMphWj24
         5Icg==
X-Gm-Message-State: AFq9FYJGYYeWF6ywZ0jtPf1wBt2iwWODN+GLxnNgbiglemOBARSz9JVt
	7fl8cdjGcSaWO2lAZjtnWCGixyx/4TxypzwfIJHvgyQScUaKyQo/NFrkdYXZxdirqP7Fz1tJU5n
	f6Vksd/9z2YbkbAwSqA4ihOIX/u+L0D4=
X-Gm-Gg: AYBFou07bgfGga+tWN3YbLVwU1M/ehG9q745rQkuug2sds+sx9HObUPaZ4vTGSTSOyw
	4OHQNdbu/Jxq/wqjkeJHBccfgVAVyiOyOCH9EMd53/dsaceGEJqiBN4xASxXqB18vzcaLuHa1bO
	ydTuagOJ7fY2YxhW/8Xa3Sgdo99ZeA/DlsSkYU4+yVKxrGfvKAtvhnfUTOKihMRuBjXLnnbOSKI
	5/19vQJngIlSTbrRLUy1FsMRr8dfLBECuDFv/WJhqdjx3lHCY9CKFRCx/eaRbo+JNCU2K8tPqnk
	lCFIs0JDo8jT0O3rms4RPb1TqkkxFnQLGKCXL04+mtvbCfW9ZMFwGtY6RtUxm5XZDNW4KegNBrE
	dNgaRJJLUwiemyiJLpt9dJLosjbg3QQ+Vm50=
X-Received: by 2002:a05:6512:308d:b0:5bf:a352:a495 with SMTP id
 2adb3069b0e04-5bfd951f97dmr1794940e87.7.1793470867755; Sat, 31 Oct 2026
 11:21:07 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Regen Yang <regentropfen.yang@gmail.com>
Date: Sun, 1 Nov 2026 02:20:56 +0800
X-Gm-Features: AclHuK8Rrtbz_U38rdfB6lwuC-3qHVr2RDd8rO5whZdmmhGHeCiNbkOP36xafaM
Message-ID: <CAJze65gQg=q2OW-1n5wT6vah8FnjxD9rsPCsyg4HspOB42o53g@mail.gmail.com>
Subject: 
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

run_kselftest.sh sources runner.sh under /bin/sh, but run_in_netns()
uses Bash's &> redirection for running a test and deleting its namespace.
With dash, this backgrounds the command and performs a separate
redirection-only command. Consequently, rc captures the successful
redirection instead of the test status, and namespace cleanup can race
with test execution.

A failing test run with run_kselftest.sh -n can therefore be counted as a
pass and return success. The totals can also appear before the test
result, and skipped and expected-failure tests are counted as passes.

Use portable stdout and stderr redirections so the runner waits for the
test and namespace cleanup, preserves the test status, and reads the log
after the test has finished.

Fixes: 9d0b4ad82d61 ("kselftest/runner.sh: add netns support")
Signed-off-by: Regen Yang <regentropfen.yang@gmail.com>
---
 tools/testing/selftests/kselftest/runner.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh
b/tools/testing/selftests/kselftest/runner.sh
index 45fb8ec38493..38b364da2573 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -186,10 +186,10 @@ run_in_netns()
  fi
  ip -n $netns link set lo up

- in_netns $netns &> $tmplog
+ in_netns $netns > $tmplog 2>&1
  rc=$?

- ip netns del $netns &> /dev/null
+ ip netns del $netns > /dev/null 2>&1
  # Cat the log at once to avoid parallel netns logs.
  cat $tmplog
  rm -f $tmplog
--
