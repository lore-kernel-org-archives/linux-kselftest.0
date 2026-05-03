Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE03AD50A
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777846481; cv=none; b=o1NkMHv2MbTb73KfqpF1K7MgSCYjMnTlzrJsiJtusNZwA5GH3f3jbcMxacO/Fo0Q0JJ7BTZ6lnspEPAaIoNmPmpF2tbq3qA+b61/JdplAcDCqH7elu35Fwnep46MfP/q2Johwm6fdNWZ/1iKxvfRiDTCYwe5iyA62Tz+vfWnl9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777846481; c=relaxed/simple;
	bh=BaFK+l1sX3ADpfIjQNA2IUZt5l5N4nAXC9kCyMDguRA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Rki4Z9hxAo1VKZOHZOtln7YbD/IQ4/qD71/n+kKQW8npl7kISrZP/sZCUcOwly0PmHr+d6/lZQJMtVjGdh068Cwuo9TUjks7ZICjvii1hbRzlz429NZP73YV4iOFBsLrQXVgpKeF6lgLwuXVha1/pTRrB6X1NWb5duwn10oJ0IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmaM2YET; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmaM2YET"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so31215497b3.2
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 15:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777846479; x=1778451279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1s7lxifgy912ACtUOU9iNuu7fnofGoCw3ubhmVVhWxE=;
        b=XmaM2YET0AFJ1o1ITTvsLx/tHYs3R6DoQsJpc7pTJIS2vyEE2dhAf7fdKhv1n+lRze
         /h4ftr5/P2SmHXwlhX838V4sMnXCknpsmASodGqqiXcord/G0WCGwOJhdswdILocqDmb
         Z/G+6jL1squm05oRG9kPW0LOMW8FGzhHGatteBMhBXFgZSrnyd1xz8b+/ayoHexlw0Ni
         XnazVQcVKEw6EDICy2MujYux+/Unn/s2Nk/2h9oqLHh5bpMg6wh8R6q3XAFxrbuWhaEc
         Smvo2f7eahpk03ShRCcONJr+8/hFBYcRXg1eACiLjV4opaopcVAWFpmXz0OkyygyLXnK
         IPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777846479; x=1778451279;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1s7lxifgy912ACtUOU9iNuu7fnofGoCw3ubhmVVhWxE=;
        b=eCXlOBOutuLr6C6/CVL6ia8noxTGx0KHfozGa45fXHJwQqVVGxbOANUf/NY4cL/gs3
         TEaCRdQxvqZhhDQlrxEzNqvKgSJfURNFHhiMWnZO0LA7DOSaYvH4UwT7b9aYjrTqlQcT
         HKipfB2994mVuJtf0Y3Ovy4Z1cSn4VdgzbgizVhzQDMQ776Q9hR55is25hvC9SHXuPKY
         GdhzIV4X/kRYUT68z/aRL0PKsdBSJ8V6+nVXOjUUV/BwwmC7Lu6qP6qHb+8JAUmmbL6f
         QrbnXDUoSDkuLfgFQhZvYq4mQKjblrDhwtDQzTRoLbKy6VBL27N/AOVwMewMDiJXBJoW
         01xQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yA3uqLpkgOvaDOxJIZUkYc/B0z0U/qvCvmNAxZJ+O5Il4MwIIZpCkumD26RsqKMMoO942+AMDO/vAp1il3iM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxTeClccS/hfyRDFimgk0rayGKH4L9r8Qb7xOigoa202MwKpU9
	EgCOPhtkbRxZU7CcCPq5lrVGQPMg1clgdAHtpRadIuKOiBNNQfNE+vMM
X-Gm-Gg: AeBDieun/uUeg5x/p1IgJb10cNKFmjZL+2X0MFrLWcvng1P5kMzmYqTpRBXNtJM1UXS
	S8ifKT+8AV7daZYVWt4X85mZZGaqx/KFCgPBTcQNzOgjSUyK4p94BNAuaCEmcmZuMqdjj29RpIj
	Xpfp1MjoO6M8bYothVatB/EAiyX/Wzhv2sW7mBMmotElm0OQOSIgKZAEVPVElx7KAzs5fJw2rMZ
	T+OQJbrviicgY3a+F+OBzxRcAg+kb11eHkEjIxUDH7bHGoayhGfYM3VYQATDb7q4VSQExI+YRvN
	0eiieZF3vgzqY3knDua6abtthPIYw5PUX5bGxfjR2PJzqvVbrA+3z91h+Kwkses7SNom3olqMXJ
	vcNSxtwSPudY7Mm63x8R4FSQK6t9CyZgKCGIcrIhwbx8BRqLfR5ZF8WW8asRnLFQa0cqTLn/kDX
	hp6ykVVTP44bMPaIjx2zpd6D1+55K5bMB2y2pWuDLlIABHh9uaT6UwFazDdvQ1Tkb1JhfdHQDtg
	le0LLYgd1WmDqs=
X-Received: by 2002:a05:690c:92:b0:7a4:8718:8c73 with SMTP id 00721157ae682-7bd76f7591emr72539927b3.9.1777846478752;
        Sun, 03 May 2026 15:14:38 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66837e34sm40744557b3.28.2026.05.03.15.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 15:14:38 -0700 (PDT)
Date: Sun, 03 May 2026 18:14:37 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 davem@davemloft.net, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 shuah@kernel.org, 
 Willem de Bruijn <willemb@google.com>
Message-ID: <willemdebruijn.kernel.258359727e7a2@gmail.com>
In-Reply-To: <20260501173918.575ecdc4@kernel.org>
References: <20260430132820.1944517-1-willemdebruijn.kernel@gmail.com>
 <20260430132820.1944517-2-willemdebruijn.kernel@gmail.com>
 <20260501173918.575ecdc4@kernel.org>
Subject: Re: [PATCH net-next v6 1/3] selftests: net: py: support cmd verifying
 expected failure
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> On Thu, 30 Apr 2026 09:28:04 -0400 Willem de Bruijn wrote:
> > From: Willem de Bruijn <willemb@google.com>
> > 
> > Support negative tests, where cmd raises an exception if the command
> > succeeded.
> > 
> > Existing fail values are
> > 
> > - True:            Pass if returncode == 0, raise Exception otherwise
> > - False:           Pass unconditionally
> > - None:            True iff not terminated explicitly
> > 
> > Introduce a variant of True that inverses the condition:
> > 
> > - 'verify_failed': Pass if returncode != 0, raise Exception otherwise
> > 
> > We cannot reuse False for this, because existing tests rely on current
> > behavior to pass unconditionally.
> > 
> > Only suppress regular test failure. Python subprocess may set a
> > negative return code on process crash or timeout. Those are not
> > anticipated failures.
> 
> The fact that subprocess sets retcode to negative on crash / timeout
> may be worth a comment in the code. I didn't know that.
> 
> > diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
> > index 6c44a3d2bbf7..ef31c0ba47fc 100644
> > --- a/tools/testing/selftests/net/lib/py/utils.py
> > +++ b/tools/testing/selftests/net/lib/py/utils.py
> > @@ -111,10 +111,14 @@ class cmd:
> >  
> >          stdout, stderr = self._process_terminate(terminate=terminate,
> >                                                   timeout=timeout)
> > -        if self.proc.returncode != 0 and fail:
> > +
> > +        if (self.proc.returncode != 0 and fail and
> > +            (self.proc.returncode < 0 or fail != 'verify_failed')):
> 
> Personal preference but doesn't feel clean. I would have added 
> a dedicated argument for this. Up to you..

Do you mean adding an expect_fail as below? I have to thread it to cmd and bkg,
but it's not too bad.

@@ -112,13 +120,17 @@ class cmd:
         stdout, stderr = self._process_terminate(terminate=terminate,
                                                  timeout=timeout)

-        if (self.proc.returncode != 0 and fail and
-            (self.proc.returncode < 0 or fail != 'verify_failed')):
+        # Fail on unexpected test failure if fail.
+        # Fail on unexpected test success if expect_fail.
+        # Fail on negative returncode if either:
+        # Set by subprocess on crash or signal, this is never expected failure.
+        if (self.proc.returncode != 0 and fail or
+            (self.proc.returncode < 0 and expect_fail)):
             if len(stderr) > 0 and stderr[-1] == "\n":
                 stderr = stderr[:-1]
             raise CmdExitFailure("Command failed", self)
-        elif self.proc.returncode == 0 and fail == 'verify_failed':
-            raise CmdExitFailure("Command succeeded while should fail", self)
+        elif self.proc.returncode == 0 and expect_fail:
+            raise CmdExitZeroFailure("Command succeeded (expected fail)", self)

 
> >              if len(stderr) > 0 and stderr[-1] == "\n":
> >                  stderr = stderr[:-1]
> >              raise CmdExitFailure("Command failed", self)
> > +        elif self.proc.returncode == 0 and fail == 'verify_failed':
> > +            raise CmdExitFailure("Command succeeded while should fail", self)
> 
> Can we create a new exception type? Just inherit CmdExitFailure 
> but name it more appropriately.
> 
> Regarding the message maybe: "Command succeeded (expected fail)" or
> "Command succeeded (unexpectedly)"


