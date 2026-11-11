Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411014;
	b=BwFMFJIhvZiSWKGSpetxT4AYWTYRlgSfjpKOaLJqEI6srfA5qO8OKgH+8q1Vbq32Ehx3
	 wcQsSnd1q2i1d5WmVHDOvQ+hRX4N+VW6k7uWMiqh/A9BA2+bYF2i6kpuE6Hhpeg3v+8eW
	 l7QAVWVjQ9oZ/f1N1DwkY2l15q4Wta3gesQP/qGDn+sgW7vlCeLnqdDpE1AYbhxB95qNi
	 UdvCnqZ37vwysWztB4Cr4o9DyQGbyWw+LKbS0Aet0A07foLcnJIik3WsXG5Ugkgwd0OKW
	 LgKmp0JnRBcR8riSCjbTgzcjouiLuwzabwkv2GrVESJdAfa5S7k2QKb4Yo5nIPUyW2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dX6hFmZdS7Gg8cUOEwScRtDpzCl55I9CPUiy1XCzenQ=;
	b=5PnSCfnCe4iEohEwas/S6XLl2iBm54IA0R1/3TFyu4gVJ4q3wI6iU7fTksGqgJ1LX2Yj
	 wuGmdIHUSiwDgIY1tPS9SwgGco3mmcjOBvN7K8QXuw0aTPZRDXgAi45VPezxzQ+MQtO/v
	 PmlIgT3aNZzH9uD31qrkYXkcXzgJ0PLVT5oeLaDombIdfQnSSX5uU3QxOX4vO9EUEgCMO
	 LhJ9JF8Tcou7y6zEy3h2oC0VcXYh4jmTEj9tGh3CPQiq9ftGfDNuaUPq+Q5Jx+YwEt0el
	 DKGTNf8jxEP6AcIQ2YH+97MKKgSfKzFuvTV+QzN0BrueZBrlgsnJTX7jGMgeZBxsEqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPvURM2E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73228606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 15:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73228606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPvURM2E
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4ad587ba293so1971499fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:30:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794411013; cv=none;
        d=google.com; s=arc-20260327;
        b=BKT1CdvJZvKQ+IqmDSsH1UdxfqSNK5/CRbmaJIBOk3kZdjV5qkdayH7dNYJVpxhJU0
         SmWAJmQHathvVnDK6wIVmq3g4iglb/A5IJkWowNTp1KVy8e2/0IATNoF0r6lDgDoTCN2
         4xkp1JU4fDov//THw6VEk9lDUe816gg3E0ynb9v5v+5D+3eVc9hKpGxSk9JIjLmoXHmB
         rXZuB0wBAXCLbewb2HKKJaRbkQONi7LTYDT5h1shP/o5CWgA6t02QFnxZ/A07dUzOoJq
         uETcZUt87P8hsgFhzVl8IBti287C0oduc8yHIltgaGkkl4axi3yKMbNptd+EQa1jo3TK
         Dvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dX6hFmZdS7Gg8cUOEwScRtDpzCl55I9CPUiy1XCzenQ=;
        fh=z1K5GcUvqLHxfDBE2H76+I0bR2evwH1skDjfLJ5uS0Y=;
        b=GaqYmOSYdl2vGchCCckQTjhf0LCKOiQTA6KKw1Gz/6UOjEw4s09dRiQE/s4vOMbhxz
         b2tY6dkyE+l8a/6kY4TfXbWFCwakhHh8mng7YH5VJlPg36J24nS6RXngwar+36751OOw
         KVDt0YzZxnWFaoUkvPBRMcwg/voZvn5ZqVtkSKUYWKHpMWZfHzzlKR0YqS7arF7sTF6v
         y4SDH57qpV5+6ncygnr3c+fItVL9DV66sUEaHlrSXMHEiTfDoO3IvYMXVrwJ3LK3V6+0
         AnbzMdPsJAD5moUBgTAuIXp2F7cIIILb0m4lyWikznc+326aliG/zbANE6tU/H6zhCIx
         ErgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411013; x=1795015813; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dX6hFmZdS7Gg8cUOEwScRtDpzCl55I9CPUiy1XCzenQ=;
        b=uPvURM2EQFxOyq7hd1v1FGg3JL8ari51ttuca9gK060yWtnx9L3TA4MmDMiMSo3rZL
         WFD1G4lvnZVNa2HuDBUrZq6ik1T7dI675MvF2kIPB1AjR6o0pwQmedDHWg3g6F9g1Nol
         dRGdVeA0htRy/F1dI2UaxY15rtGq2ijkVikVT/YdY6PSa4/479UdwKOS7LmkZ4MHega3
         5aLRD/SwptUczegbPOjkbigMsTrzCLEifDGFYwYEslf48xjKM1dSlqpCziK2HWHO1jGM
         4Okcd4LKVRA2WaqFtRu9agY3VafW7MFh7Vj4ZW5tUkkucfzNCFpJbG3hrwMAEht90mgO
         udGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411013; x=1795015813;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dX6hFmZdS7Gg8cUOEwScRtDpzCl55I9CPUiy1XCzenQ=;
        b=dcgu+urRRvqXK7xcnxlkj10NPpT9uF3RCsScp8r/pmPWlEbFXW98cDq2UjnaNcvjMO
         HUKdLuCRmJluS+mjpv//9qlgAz/jTH0lW85UEabahsGX22ptfB2cETRqFSmyYnpribfv
         +QVii03hUjiyvdRwViHT7mUd2xw7DhqTarUL2CME9Y45JMEb6yKKfV4GLAktLLJVoKt3
         YcguEtyHLQ616vv96eYgnN0PBnObP5zPs/e+cdNHHiFQhRqP5W0M19NHB5uJ3cuMRKoN
         kWSmwQ/GhcJUNIswf0DhHVjTHK3xFPGuJhtm/WcpiZHAwvGDh9z7ZVULeZQXVZfn75mA
         /YYQ==
X-Forwarded-Encrypted: i=1; AL+hErGt2DSHqCfx8gMqIgl/zcxRzkjuYzg/MiUumPQG6kviDz9n+ePXv7pJaWgp8yzrDSImc9LMBoV98udfs1DeXpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bYobAz1Co4Bkn1zU46bic5TtxZcXubHdUrF2ehjJZDAHT82Qi
	W23hnaAFzShS5Dq7FTGTA+CCgWYe+UdXr8zb/o1r0bbi/SOnvCPcK4YBCvkBmu6tgQaU7EGpblv
	Bg6S8Bmd4hayDuCQ2SrtslvPtnGT80S8=
X-Gm-Gg: AYBFou26XSLE/kJ/8jg3yydfH27jvVqd1QKfmAoDPFti6mrGIZ+oapi7X8qnz0MfxA9
	R/xN+YjvdCT7h6bzD0XLajiTXYBDyznHIDHUsDoNKgshpV6uTW8luyDwF7WTWLibhfS09zUGJrl
	dxcQHEbw7Fe2Z2z0vTq7omGGSDa87Y/WrhiwkoAv+dY6f5opfgmre3QWzBmJBHpjDDzmQPc8SIg
	8s5HMsdOMMv1bugM7IsCSyFSCdNPDhC5oU3EJinqXSHvF29diAke1QlOg+sff7MeUT2a+ZO7TZP
	XWdXhRgt3yNN5Kxyt2kbryJ/+oBQTiRQrKWqYEdAzwrsnV0U2rmiqOVlGbjaNszOV/YOruWMaoU
	CKTEmwBwa162Jz2Oi9XqeMJJZHG075YjcL+cJG6puvmbxdxA2Ir7RSKlsMDU1CRG7QNGrl8CJ+6
	T7eKVTPkkqM1B3Ip8IljiZDFY=
X-Received: by 2002:a05:6870:c112:b0:483:cb42:3979 with SMTP id
 586e51a60fabf-4ae46a42831mr2381441fac.17.1794411012764; Wed, 11 Nov 2026
 07:30:12 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 10:30:12 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 10:30:03 -0500
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 11 Nov 2026 07:29:09 -0800
From: Kanishk Singh <kanishk2607@gmail.com>
Date: Wed, 11 Nov 2026 10:30:12 -0500
X-Gm-Features: AclHuK8RPhVT8h4SoQ-sBKh-mRKS0ugcCHlJN_3RKGREeGlNi0WOGPnSLTYbW0U
Message-ID: <CAC=pywoHKV1157BrUsew_E4zriGMx3Gh8B2o_rR24c1yfZ1V0w@mail.gmail.com>
Subject: [PATCH] selftests/cgroup: Decode waitid results correctly in clone_reap
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

clone_reap() applies the waitpid() status macros to waitid()'s
si_status. Unlike waitpid()'s encoded status, si_status already holds
the exit code or signal number, and si_code identifies the event.

For example, a child exiting with status 128 is reported as successful,
while a child exiting with status 42 produces -1 rather than 42. Stop
and continuation events are also rejected. With WNOHANG, a live child
can be reported as having exited successfully because the zeroed
si_status passes WIFEXITED().

Check si_code for the requested event and return si_status directly
for exit and stop events. Accept CLD_TRAPPED along with CLD_STOPPED,
as both correspond to stopped children.

Fixes: 27eaaaf3b30e ("selftests/cgroup: add tests for cloning into cgroups")
Signed-off-by: Kanishk Singh <kanishk2607@gmail.com>
---
This patch was prepared with ChatGPT/Codex assistance for code inspection,
implementation, commit-message drafting, and local testing. The task was to
find and reproduce a cgroup selftest helper bug, make a focused fix, and
verify the result against the original helper.

Testing: the cgroup selftest programs build successfully. A standalone
reproducer linked against cgroup_util.c passes all 256 exit codes, SIGSTOP,
SIGCONT, SIGKILL, WNOHANG, ECHILD, and an interrupted wait after this change.
The original helper fails 255 of the 256 exit-code comparisons, the stop
and continuation checks, the WNOHANG check, and the interrupted-wait
exit-code check. No full cgroup runtime suite was run: the environment has
no cgroup mount. A ptrace stop check was skipped because PTRACE_TRACEME
was unavailable.

 tools/testing/selftests/cgroup/lib/cgroup_util.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/cgroup/lib/cgroup_util.c
b/tools/testing/selftests/cgroup/lib/cgroup_util.c
index 823b0312b..4915d80ed 100644
--- a/tools/testing/selftests/cgroup/lib/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/lib/cgroup_util.c
@@ -508,17 +508,17 @@ int clone_reap(pid_t pid, int options)
 	}

 	if (options & WEXITED) {
-		if (WIFEXITED(info.si_status))
-			return WEXITSTATUS(info.si_status);
+		if (info.si_code == CLD_EXITED)
+			return info.si_status;
 	}

 	if (options & WSTOPPED) {
-		if (WIFSTOPPED(info.si_status))
-			return WSTOPSIG(info.si_status);
+		if (info.si_code == CLD_STOPPED || info.si_code == CLD_TRAPPED)
+			return info.si_status;
 	}

 	if (options & WCONTINUED) {
-		if (WIFCONTINUED(info.si_status))
+		if (info.si_code == CLD_CONTINUED)
 			return 0;
 	}


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.52.0
