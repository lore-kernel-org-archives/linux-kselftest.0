Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B33DE42F
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124801; cv=pass; b=CpXVi9bBo/rJmqrsFmUqXm0H5OYRSeGkBLZn9XQy86bwK5G6xJwPmn6uGIuyGbLnKRmdYdzBanKFe/96cBermH+slbBih5osSgYaTapUWrNFN/L0E/9d8zR+NheNHciY82byQ0AGjwXlup5LOpzmws4ZEe7uo9gleIHeE+VwEWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124801; c=relaxed/simple;
	bh=UHRKW7d/gI/agzapMah+6q2m1siwp6pLPB48km3Iw+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyROv21OlgBjDGB96G5/uptTMyEKCgi//S989Itgauyq9W7XXx716WdhU1UenwSJ+bPEItkHBKN4Mdu7k4eITBt21hdGX2h2Ja5tPFqbxe2EYj7JbjgjyJ7Kpd2B+bRG0RCWt0sGKRwQ/NE/nvlKYJRJCD7KSLMMQZlTh9Scn6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ab3lWxkr; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ab3lWxkr"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79885f4a8ffso5485797b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 03:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775124797; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbWtd7Anm9cES8WDQW7lpIeiDiJOUsGlQV97EVfZb3nf4iQQH+octJU6wssnvUFZf1
         Sdg3odl4UYjkCMA26uust7n6wY280o0FhJN+n7F3IJ2XhRBT/+C66i4+LgtT5Fox26iD
         4yDuQc3JY2tYTZubI4iUwzJOatmRmMlvHI/9z91yCJnRshOUKLHsLXPuKblwg7mnIk1U
         qD2KwRnFpwqXu8MikE1DwVWfHHjbSRJvd/juR7UbfgexGk622fdab2ZbQE4FqGSSsqhB
         mWE4mrMjgEECQfnAnbBhV8DAMpXyocybEELJoMD7cjTMPTQ7cJAUKNxtbKVyTP0YwOrP
         2Jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UHRKW7d/gI/agzapMah+6q2m1siwp6pLPB48km3Iw+I=;
        fh=3uJvt2pC9/n89mcQl7nMAzSVhQtwd1YR820IQWEpW1A=;
        b=aDLjMPK9kqgdMpSTOO0k2IhJ/dnw0BsE7cPcPibXdF8U16ba20qugpb11Z2YbZogyx
         /5yrNJTOLfr7dFS6cU5zTrXIHZLYol7CfUm1s4uWh6HbDwvHFxcB7aetc7zlxicvq+YD
         sY11U8q2cqVDiYcU2BBN/YbyRa4rRVCaewsesijIVk5RBbjVYPnBbCgu3hs3V1kJQAKM
         qPeMrypwtyCiOPnHHg0ra1abgnXCR8rodEvVffc2GxFRVZ3f0LqtLcajq+64wHRL/3sR
         T7S9ytNk2uHcl2L2oGVWRv4ywGIBN4HWB+ogEepoapUlsFOjtLXcpWghakqEbbeiTj7k
         kz9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775124797; x=1775729597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHRKW7d/gI/agzapMah+6q2m1siwp6pLPB48km3Iw+I=;
        b=Ab3lWxkrx4atMVO6dRMkxBOrypILc/ouLfaq77lO1TYP/ZcSruZzGaxuLWoC+pa8zF
         aiMsI56tnneL1uDBRajVYW1hz1cI9z635+8cuGtaP092Oqyde7pO/1WjcI4m9c/yiHsY
         hvXPDUYi8KGOHWTDO5WuAD2+ubmaIMAtWCInb3D8oW6aIODDNRAgwajwVGTuu3Ol+t/x
         sMMGmGJiNx1N7z7VtJN1e/fhH8hFDTV3oX11BEQ/lQ8YT36yN153CP+jMGheEhP9srcB
         Dxhl5cC9XcO892r+YHCUDE9T6ieL+ni4ohqrW7OQRZYxqiB5iPvl3n7fPCggVH64AhOo
         RFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775124797; x=1775729597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHRKW7d/gI/agzapMah+6q2m1siwp6pLPB48km3Iw+I=;
        b=ptob8hE1niwEcclPDhKQfKzvJfqRdrI5Khy6/dhULLf+eb3JR+j6pk2hb1FhNJarQD
         lpsmtVSci3LBf1W0dTzwQQqmMA3pXQOdJlwm+XWefsyEK+BjPc6TpoWR9aplmF+SWPVa
         kUWe0E8TuKsz7QGUGbAqI6DCe46hAgS2TNAORiSE41OTvDZ56I8e3zs6cj0FcDu4gOu4
         Q+281P8Fb/BEChet443A8aQWVs7WvF7arS89DkXaRUlNPFcwu0QfAkSYzy1NCm1rNtHa
         73WCACWyr8HcdXclHky3hvf41Q9u4YmD0hr1V+idcYT48swtNAu3JTmAjytbwk3+FYsW
         JFUA==
X-Forwarded-Encrypted: i=1; AJvYcCWrDU/xK2jc2J9EyPzVsNMFrLQVtQyy5NESKg2ZuMu3xXgAseOcF1QFK0/2Ci1x9kqTEPRMBAZOwpklu2rCQEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YygTm6wmz12y2cEG+SPTUkDICGjbjvJiOFgexGgxS3wntmu+ngF
	oZVbhT+0+m/tplFCwG6AFGuBLe9gjbxF73s7JWPbGhRVD/jpNpb9Ce9G+SWH0OZSDCSY3ng8X6E
	TYjt9lhvCH4FER6TIH69ojZ5B3agvDYM=
X-Gm-Gg: AeBDiev0jEQeuDbTPcVQl1Ir2kYwtX5zhm83DUEkZxxZn9Fgym62VioWL/GHdoz62u6
	5u2Ngsbu7hsw0t72v/phW3AhTn+G7v1eXJEsWePvKvkx6BXQ9a2yrRpf6zdBApHjN7PnxEqadRC
	xEF3uzQX5/BAvk6+nVuFoaXxwfDz4suaqlzNHEvh3/S8YqC5+4RnAe3dvQIDvvsSJUrBU4dgFcH
	U4c7enZFqotDDG4z3WtIOtI4yFNk3cFCErr4evQQP5KIwMh91oGCeHFdL6BQdCGrt488N8cIqSq
	t395AmPz2smbXsL+HJMxLmckR3Cetf8A4QfbyE0n
X-Received: by 2002:a05:690c:38b:b0:79c:a09a:e59a with SMTP id
 00721157ae682-7a210a8c012mr71187397b3.24.1775124797268; Thu, 02 Apr 2026
 03:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330035604.133073-1-dqfext@gmail.com> <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
 <20260401175621.549c492e@kernel.org> <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
 <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
In-Reply-To: <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 2 Apr 2026 18:13:05 +0800
X-Gm-Features: AQROBzAyy1DnZFo-szwYlk4Mp8iFMyQo5jot_GYlouwlaNbxdnQyOVQ65zMkKtE
Message-ID: <CALW65ja1FV-OcqSazgKZhQhKf3oqr=kcGxyGkOGbhurGLOJ0-w@mail.gmail.com>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Dianne Skoll <dianne@skoll.ca>, Shuah Khan <shuah@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>, Jaco Kroon <jaco@uls.co.za>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo and Jakub,

On Thu, Apr 2, 2026 at 5:48=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
> Note that similar failures in the past in other test-cases were usually
> due to timing issues. i.e. the pppoe-server starts in background too
> late for the client.

I don't think it is a timing issue, otherwise the PADI negotiation
won't succeed. The "updetach" option on the client side also make it
wait for the negotiation.
It's likely that the pppd instance spawned by pppoe-server fails to
find the "rp-pppoe.so" plugin, so the connection fails when handing
off the session from pppoe-server to pppd. Note the naming difference:
the client loads "pppoe.so", while the server loads "rp-pppoe.so" by
default.

What distro do you run CI tests on? On Ubuntu 24.04, "rp-pppoe.so" is
a symlink to "pppoe.so" in apt package "ppp". Maybe an additional
package is required for the distro you use, or I may work around that
by manually creating the symlink.
