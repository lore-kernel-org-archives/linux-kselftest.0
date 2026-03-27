Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B98C35B65F
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629022; cv=pass; b=Z03S7z6+egXYKWDK4xWTzGpxKK5w4cFj5SOIPAJkjjUiP0IRHbghdH30AeIyvXrSJvm+PtTe6F6P76RFb4w1al2iQfjfditGGYnoroGfkBD9/zqRHKTd2LXDlLeIjqT2TUS90ONr/+6VGYZ9gny0GzLGwjyAb1A40yBpLIkIrwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629022; c=relaxed/simple;
	bh=FC3aGEn7yaFpmPR9w0yiTeAf7we4oOmunpak6tx0IxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mM1d9wo9Te04pyV5JxGUnLrdwwh7cVJJEJ2g/Cu5FXpdZnxDbpUFk+F5BKAaGdBSU0j5oXY8XZ/QjO3/0lJm1HLTEX+n265YewNWan+bVGktEg2nuCcvn9DNRKKJRZLfNQt2V5OrNfygUJmWee2kFiZoPHIvRCMKjDe/093FEho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od/DrxZO; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od/DrxZO"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8f97c626aaso413935666b.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 09:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774629019; cv=none;
        d=google.com; s=arc-20240605;
        b=X0cPiHymeLFkwsPqw2oPFxCx969vu9V/zfTWsbwJmb5+ki3+5epBrtmIIQP6u6RYqx
         3kR82G/pLthBWkbrvm/eMmKGMze03sV0OSskWB/heO1NW8RBvOXdMztBsvbDiiqptiXH
         sJKsXJdlgXM99KZ8cWIZXV8UPHkxX502qqO9Jv8XGTH1vKvtaS3qf9QKqLtPEOQCFqUG
         UnicZWsNxsC3hUBnI9zTXr6luVlua6LCKnG5yJrXQP38VnM+kHkzoI4x3iyyph3JM7/e
         jbf5r24SQQP9SzHUZJxiZCWvQyOPQVel3XgQQhY1Q4ytQVBWtBUQjSmCL41T4MyaKx8q
         MdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FC3aGEn7yaFpmPR9w0yiTeAf7we4oOmunpak6tx0IxU=;
        fh=v0vfsP+GAn8GyE3jUVJgbtRCAVW9l2tro3lAdF+cwDY=;
        b=OqG2J5JuoC2dUR9Badic0+Y6Cj6Kppv9g24lJUTZuRbT23JwS0dhDwpGBYpekMca6n
         1kdoglPR2SOERrvZhb9PF72WuXpgc6Ma+AWd1Zc/QJGJx32Y5ap/UqsONfWgUn5KnAAw
         Nxl+2JqLrUM5dQNyjSroFfTHhFs1wX8oeiTYRtnnc5PRbo4QJgr2iJrG2CcEChL2elKY
         ltmeu9B5bH5ZuT4JSSu6SfvLoZURq8thF3nstsQ17cgT+T0X0jPV9mi1u5aW6WHtnd4I
         q0BzfDixqe7QJ+xILEYNNFyMQVL2mV/PNeFlEc42fKuNgcKGftYcvzlgI0D7k3McnhaT
         776A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774629019; x=1775233819; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FC3aGEn7yaFpmPR9w0yiTeAf7we4oOmunpak6tx0IxU=;
        b=Od/DrxZObGIaVdSxQ2bSIsHGjb8vLQNHDWwSqHnDURK8rMUWLQ0p/SdEQuRzjIJ14c
         Z7lXUIkzbWouxV/wfu1+5V0bMPzs5U0N0H7jQdcv+PBOWfvoHxI/ic7AR5N9nSTUZX7F
         TfRi0qI4Nz1tQ23LXh2stlW7vFKbKU9xB7VYzsctT7G4fcMV1ODllniaRAZF3QEWGnpC
         WowRbdFz9bjMo08oQOU+o8+kl04Uh/Z0izXHK9MJVTfGp8bwMHpdbZ0VHKYasL5iYlSN
         sAJInd6OeuW5KUxN6+liEx3chYTAq3KT4D0/AHA8hGQkx7vR5K2TZjNB7Fr29Z69mYLA
         QB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774629019; x=1775233819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FC3aGEn7yaFpmPR9w0yiTeAf7we4oOmunpak6tx0IxU=;
        b=tB3XXfyMJD8PA+YEIjkdinLEAjhUXKj6Ll/ioyTW6AVVO3HQqNDnJac2Hzlha2v9Eo
         Hub1VMgkSaRFjtMaSBav8y/A9yVfusCjrfm6EdVObCq62GRUltahej3GA4jkbJxERCY3
         Vp5jTGRYlbGUwZVPJ5w2OR+pVvQPXageUtLcjDX/0qiTpwX6oRGgcNemPJeCrqSrWQ8W
         xI4EeExtc4cpJZF+FGNWbbK2jb//RF3ukmQL+B6jxLwEBFj2LWyACxuUKRo4nvw2MZQj
         ZEv5cr0p3VGe7P0FTvCI6R8zuqW3+Tn0HfcAC6JG/TR5omTD7Sn3JSLofgtdDVko5yBm
         hASg==
X-Forwarded-Encrypted: i=1; AJvYcCXxpzFoqBBWwdOHWO3BVGdXy6Gl+nmXvxTMgn92uwQguoQChdPNzHFqCKJtM0iHTsIVpWcItwEWkPIf3LXQOrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydg1hDPNWoIOAXcHz99QRxLfn/JmrzCi0nod6OifpZWe6slDKN
	gmyp9OgHMCgDEhLT9mS7km/aljntjxH8Noucgidk7Ftm7SLAStGP9+ky0SjjgnAY2HRt//y+C6A
	9HtAodye5kMY8Yf4pjjlZqiqS8GNNJhQ=
X-Gm-Gg: ATEYQzzJ7lF7ikAZnNI1VpWNXUQ53+pKXRiScFvkLy+zOnvp0rw/+6aGDYohfScT4TK
	uBCltKzERX4XxhTRA6cBvqGheSa224LKojoFIM5BDJE9VpP5OJgPE5FSut36DK4ulrqW6LQxcxG
	wlB0z+X+C4L8FK2tGo0uYj9+LbFbsGaaRASnEvcF6fIX1BlYTJA5do5iIRCmR7cyMt1AKldmrii
	GostDNKec05ubVZK5+skAbr6AIr9pjndPmxEEl4NIWGlbFjluEvwf4Svh2FOPVwGlTzIGgeUHIE
	57c3EWw4tyurl8V199+42M0MzOO5D0/uzAZTe0p/M2U4veWmfg==
X-Received: by 2002:a17:906:9597:b0:b98:2732:3dd1 with SMTP id
 a640c23a62f3a-b9b507cc370mr155133266b.42.1774629019174; Fri, 27 Mar 2026
 09:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327141616.1961457-1-hayatake396@gmail.com>
 <20260327141616.1961457-2-hayatake396@gmail.com> <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
 <CADFiAcLvdjE7zwqf-hpH01jnbxtnWQNoj4+zBwK0+RU80-k9bg@mail.gmail.com>
 <CAADnVQLR6Y94wKo1G_4w0-xTPdR8ws38oGu3xfHOXxNKcqjyWA@mail.gmail.com>
 <CADFiAcJtjVHYVQeYJ_znVsjiJkEBmLfOafp5srY0HQMGwVtiQQ@mail.gmail.com>
 <CAADnVQ+0EwaJXgS1WSDf12+Ds2Uxbh9KMpDcyq+gyZjcQ_6+dw@mail.gmail.com>
 <CADFiAcJFy-n5Zz+Wj1dWEH0WcK+PhKXi7cbvdsLnPhMXRcVktg@mail.gmail.com> <CAADnVQJmqKVZC1gkvAaAmO9V=cnYPO0UYB6Wyp6Shko4tZeUQg@mail.gmail.com>
In-Reply-To: <CAADnVQJmqKVZC1gkvAaAmO9V=cnYPO0UYB6Wyp6Shko4tZeUQg@mail.gmail.com>
From: Takeru Hayasaka <hayatake396@gmail.com>
Date: Sat, 28 Mar 2026 01:30:07 +0900
X-Gm-Features: AQROBzBzwb6fls0dn26HPvWeRnh5qPUOZ6CMbjvFarf6_LGZ-e-aYjW0CDjTnwE
Message-ID: <CADFiAcJCrS0wjkPcGU9sCYQukEoegeZG7JMkqhGDYq5C43nfXA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, x86: patch tail-call fentry slot on
 non-IBT JITs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> yet you're still top posting :(

Sorry about that. I misunderstood what top posting meant and ended up
replying in the wrong style.
I had not understood that it referred to quoting in that way, and I am
embarrassed that I got it wrong....

> see how cilium did it. with pwru tool, etc.

Thank you for the suggestion.
As for pwru, I had thought it was not able to capture packet data such as pcap,
and understood it more as a tool to trace where a specific packet
enters the processing path and how it is handled.

For example, in an environment where systems are already
interconnected and running, I sometimes want to capture the actual
packets being sent for real processing.
On the other hand, if the goal is simply to observe processing safely
in a development environment, I think tools such as ipftrace2 or pwru
can be very useful.
