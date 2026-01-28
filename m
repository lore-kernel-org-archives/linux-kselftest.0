Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC7033F38C
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 11:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599120; cv=none; b=mc+uI3OdjVNPl0DqGwTKBIUgs7KvnBWZ1KSBBp0etsTfRFe72zTnA6O8QGU8tlMGFNhGYcawnnKc/7kcCDh4MGgAMZFOWP3DGTvjzgzZcbBhVy75iG3P9wkLrNXH6TPHIc5m0vp4IM0QDwDQyvfHMgjX0hbNlMuchUUjXA9S5i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599120; c=relaxed/simple;
	bh=EC4CajeL8lDheWSIIcXP+9QcBRi+1c/g3PBKw5bAIR0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TUx/78T/aXawJCgVIhIDjTgXA/18o4sj/iIy2SCnMaFlamlETII8PS/+nhca6lADFK9KDwXrrmhAm9LANDdjvZ6AwRR5wTrhBp2mLr4OSk/pd4w4q08fM47zGBOBtvsVcf7Ne/3qrlP9SzEQZY4Yp/laQjzt5xO0AOHWonS0WsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kUOAFaU9; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kUOAFaU9"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b8861544696so624196466b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 03:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769599116; x=1770203916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EC4CajeL8lDheWSIIcXP+9QcBRi+1c/g3PBKw5bAIR0=;
        b=kUOAFaU9kSU9MjXoCaqRWuCL92t/2MoW43yQr/Qbxz0JSpqLWtpzkzqNelGBV0i+78
         KgBg+GZH99j5KUGCvUoo0H+BfADaDYpWxvq9Zqp4sTZNAUuD0TQihCs3r/Ok/DIx3UXs
         8Qgu3fvV37uMt8lJlzqQDavzDMz0dsGLPInc0/QxOXTopLTUPAyf6IVRVT8n0+K9LpU/
         p0ybA7jXuJ4iIHojiDN0ajP5FVxiUKWUdB5tuNqQgCnU/FIzj7Bp8xsltiSnGYFszAU8
         FTR8fNy3OVe7aHwnqdyxrLysG4ZrKV8BgVjpYcfVx1tppbn/xk3WJL2pUf5Ma4EuJPtH
         js4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599116; x=1770203916;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EC4CajeL8lDheWSIIcXP+9QcBRi+1c/g3PBKw5bAIR0=;
        b=d2X0UJKEOnBTl1augo2MG4dQYihehpn9SeAGbwWHj62n8f4p2pu+K03pcTiME8VEUU
         9U7IUB3P+esPnVKXqj4+PUPfTQwgDW/C0Zebb4fR5ya5Yw8cWYaefdk1FdiROosls52W
         cmFKM0jnfO0/PJRzhsPX5puLpQbsdBQMe1uCkslBzVBJNdgoCLOYtFfvYsRGR9hb+qzA
         mJmTekGJMjqUM+5+K6rLdB2srv95+JiA1tKz4Z7od1rmErD6C6Lse2YuF9hbgpHrwxfQ
         5AU+l76F2noMBd/uDoCKifY5SeaSATi4t5yehToZFbbvwy4YxMv3ORrPl+XlY09QjBTg
         qyFg==
X-Forwarded-Encrypted: i=1; AJvYcCUfd8QI5jtDj+HXcOYgMYOe2xA4H6QvCt/GJGP5OdXXTxRh8vlRW2ewRdPzX3+3nob5ndiAMFTIA2tLx2BAAwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxUA6geG0ibnpevlPDooKgPXFA00IzKigQ7gJVsAAMSsW214Ux
	zQMvTtrYa3QC5sloRwh+jcZ8+TH5OqV7W+4voWyfiiFNRb8QxkqyzjmBRhlQRnWrSSmmSe8vtC8
	gPfhJhCEBDRFzXA==
X-Received: from ejckj13.prod.google.com ([2002:a17:907:764d:b0:b73:5208:4052])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3da5:b0:b87:7a69:226e with SMTP id a640c23a62f3a-b8dab28d15amr350226266b.10.1769599116237;
 Wed, 28 Jan 2026 03:18:36 -0800 (PST)
Date: Wed, 28 Jan 2026 11:18:35 +0000
In-Reply-To: <20260128-kselftest-fix-failures-file-v1-1-b58072c66317@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260128-kselftest-fix-failures-file-v1-1-b58072c66317@linutronix.de>
X-Mailer: aerc 0.21.0
Message-ID: <DG06J6S40UW7.15VFU5DA8YJIY@google.com>
Subject: Re: [PATCH] selftests: runner: Avoid spurious warning about missing
 failures file
From: Brendan Jackman <jackmanb@google.com>
To: "=?utf-8?q?Thomas_Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, Shuah Khan <shuah@kernel.org>, 
	Brendan Jackman <jackmanb@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, <linux-kselftest@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed Jan 28, 2026 at 9:05 AM UTC, Thomas Wei=C3=9Fschuh wrote:
> When runner.sh is *not* executed via run_kselftest.sh,=20

Hm, what's the usecase for that? runner.sh is a "library", right? So in
my mind there's basically an undocumented contract that you need to set
this variable before you call the relevant functions.

The fix below opens the door to bugs where we fail to report test
failures which would be... a shame!

> the variable
> $kselftest_failures_file does not exist. This triggers a harmless but
> annyoing warning from runner.sh if a test fails:
>
> tools/testing/selftests/kselftest/runner.sh: line 50: : No such file or d=
irectory
>
> Silence the spurious warning.
>
> Fixes: d9e6269e3303 ("selftests/run_kselftest.sh: exit with error if test=
s fail")
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Having said that, it's not a big deal, the risk of those bugs is not
that high and we'd probably notice them before too long. Assuming you
have a usecase where just setting the variable to /dev/null yourself is
a pain, this LGTM.

Reviewed-By: Brendan Jackman <jackmanb@google.com>
