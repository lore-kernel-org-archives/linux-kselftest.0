Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111281E7C03
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 01:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775007761; cv=pass; b=LesbSxQLOiwnlnvxVq02KcTKauXotWpDvJX+djiz34Wh0lP+H2q2tpPxy1c8TMqAu8J95lQ78H70BhuOfzQUih3R7J+dHzw1nohvRORbZd0lRvrs8Fg9P5Y0rbn3vAelpw8P2/eYso0r4GKdo4KSlC7DD7jSifg99gaDxKRvsDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775007761; c=relaxed/simple;
	bh=+CueuBEFQLyDaLLPGAviVcZIfDrvhLK7Jnm9pbO3sAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9/s4NZtbVP3kn5wZ4RTXZZ/6UHc2PJ4dAZp+/E+QGIV8P+tIvX4fqQDoYM2agxs4AR3CFy5AG6MSoFHRSZjLTA9NLis3Nshve51NKTLMbSb08hfUeuAZxLChhs24kS5iRNqLpMcdXz3v+05mZ0GPRLlm7zuXpgH+GT0jxY94TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v2arFblw; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v2arFblw"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66baa7fdfd3so18601a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 18:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775007758; cv=none;
        d=google.com; s=arc-20240605;
        b=KtO8KGkHVfYkJJ8hDUgf1PcL/TXZ7CPCsHk18OhnDGw2aKBnw/YLkxmH6kbqkcaVMT
         TPASP8yLGO8xAX7QYEBYqgf6i5kxnkH1967FLoqUP2YVQkPbA379MCStG9wf8mtUcmt5
         SqQp0w2NuVV9szoBOXQ1WH0DCtIxYc4je7v2XLasMqbRUUAoBouUtlJwFbZvxeov+tnP
         Z3EIIKkADMCfd2UThmR6lSTxpBXMR6HU0bJjOrspCDyh+rEHUVXiOD+I7K9BJERnFIUI
         nhNbPTC0WittWu8tHVwBOSUMZR7McYa7uxl3D+ga3wkrZwisKyI9bmgwJFZkRFuqyq+9
         SREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cip8P5+Sbm1YzuMFMquH8b9zAj3snIJVnb2qZXOIJI=;
        fh=ely3XYyG+sasmj5x+b2GRlb+Pn+wgbOHvAs6OYXQHyI=;
        b=DQdymxpSBGrlYcTtduS+fw5PXV9FAwFte+c1cWabqKi21hbyjkCFJA4cYg6ny8mHte
         psbVYyA48xKXyCvwD5To8wNn1lRqW+rYqnxUv0ScJCJNhlfW6x1iXly3CQ0vVb9VupXK
         ldKJSiT/oLZl5iNBd2ctMHBjp8IYKs6ZDb3sdjgt0HrE7CiSSfYIP6AMH58E9KRBCfga
         sFz+RaL0nmjFXv8HAYjM7mfPWyWsSV3TIRMHzfaJtZdfiRfKbTid4HadkDdz8ltuouTj
         AthmhC1Hcvqlq4gbCR7BQVpkx4VYSCpuXOstW3BirLXh5vmHzTUOCZflp+Ln+o3ZqqAS
         z2Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775007758; x=1775612558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cip8P5+Sbm1YzuMFMquH8b9zAj3snIJVnb2qZXOIJI=;
        b=v2arFblwfVBTdgn+APy/BHGtfliTQiQBgnR3Rv+ueC9EuqlsLNYyFFDwEWliv1Fjhy
         1202JcaDRj3WxzgDHiO2PbvZfH2KWZZIu4fZPamN94VzocawQtyi/qskWVFuiNzTVVWi
         +QOMCvZKTLS2HARlF4HWIrCyRNkuH/30o4vZKOi8eCH++Tyqu+uZ/NoY9ZFrPqA/vnHJ
         sTggl4dJ7OsBP8OdSl6zghuGhfH56/jPwT5Dh0bBzyahkVD/z1amzs7OGE4qewsV0SRN
         1CImugBXqPcQHdTfKQN1wwN7Lw4ei54kJT/NjcHbZ8PQ+5h+3OSAGwBlbmxyX6hrnT2i
         i1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775007758; x=1775612558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cip8P5+Sbm1YzuMFMquH8b9zAj3snIJVnb2qZXOIJI=;
        b=JUyJ5H1v/35f67CR+mfiY59A1ToBprY4E0lINMQCztKrpGdVR88m7fUayFW2QLhVPM
         nEnfcLQJsPLYBFFaIrfOfJyZK6Qb+ByimUEdx3UICrZTfGEB4GGwVJoFgW/TWTE2Ifdq
         KI32Wv3dUKQAPlnSZwZJpVYYxTgP2XDI0K2Vqkf8LRs0NkkFk+jE4VNOtMTSTG5zfGeZ
         oBkegZNBM+XZZy88KIyEBIDoieiEXMIE7sSlBrSrBkjtNGSiZHGsGG9yg1wzvXWMCqKj
         0VqrkH2W6LFz6uYonAycvyX/kU/+/leDYfhdD7djRz8hIQ8/LcGpTuv+aV+f/U88TE3R
         gVBg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Y9L/87GRYh/kxaQ0IDc1HqcOEiaZs0M5U3vgqdcmX9XebrzdGvK0Xr0DH51j5+eKNHwPNvTPAWLasuDQ/ys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa851jOp8CX3gl8WtxWvb8o5kD6VxHVZjKmdV6SLiBs/QtHt1b
	nWyQBiGHN5+vPEk5d8XtuNW5v0zTKpAMfC5oMsCBNErx8CNbDGlH97fvg21fV1ej/1bcSBYRKGV
	bJcGTgTNydH+QxKrr8QKXa9ZzKZJoGre+M9nGsEB9
X-Gm-Gg: ATEYQzxbYhlySi1GbOZk7AH8apS6zF8Q142HXNHx0nVNq+EQxPLtRKgCH2kC2FwtNJC
	mbOyUh7S7vAD50mkh8LsRgkCQbJkgyIy6KRhp6qnS73oG/f4wDSbx10U3twp1lFODJAj8wBVmMr
	dc4DW3oSA7LqgUCx4FSvniVAfbN6NHJTEIu14yu2UOcJDU96BvYEoCyZiZxFbwsZuZVpYEln+LB
	McW+knDs1y0MG35XhrOkvk/c6ILNlf7PhZsV6Ix5czWDPPGqPYQzqbkqr4VV0PHVZlvDSYdoQTC
	3BseFb3Uj6T3dUexehi20eObwZewMq1M0AwWb4RBn/VW8iRPS1SHF6/6/Q7ipMlER83O
X-Received: by 2002:aa7:c441:0:b0:66b:ed69:a85d with SMTP id
 4fb4d7f45d1cf-66dd127fe4cmr17744a12.5.1775007758009; Tue, 31 Mar 2026
 18:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331053353.2504254-1-marcharvey@google.com> <20260331103308.421aac59@kernel.org>
In-Reply-To: <20260331103308.421aac59@kernel.org>
From: Marc Harvey <marcharvey@google.com>
Date: Tue, 31 Mar 2026 18:42:26 -0700
X-Gm-Features: AQROBzD6g583ppKPRqiZioo7JPIgeyQ8u27KsUKejSiYP9XMnx5dnhkXN2kL5U8
Message-ID: <CANkEMgkMRmyi3y-PdVTN66FHSrEO=neCp1N8PWbBrSA0yfDAzQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/7] Decouple receive and transmit enablement in
 team driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: jiri@resnulli.us, andrew+netdev@lunn.ch, willemb@google.com, 
	maheshb@google.com, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 10:33=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Tue, 31 Mar 2026 05:33:46 +0000 Marc Harvey wrote:
> > Allow independent control over receive and transmit enablement states
> > for aggregated ports in the team driver.
> >
> > The motivation is that IEE 802.3ad LACP "independent control" can't
> > be implemented for the team driver currently. This was added to the
> > bonding driver in commit 240fd405528b ("bonding: Add independent
> > control state machine").
> >
> > This series also has a few patches that add tests to show that the old
> > coupled enablement still works and that the new decoupled enalbment
> > works as intended (4, 5, and 7).
> >
> > There are three patches with small fixes as well, with the goal of
> > making the final decouplement patch clearer (1, 2, and 3).
>
> The tests don't pass for us, any dependencies we should be aware of?

Ah, I added a check for this using the `require_command` function, but
it seems I used it incorrectly. I will fix this in v2, and probably
remove the pv dependency altogether.



>
> # selftests: drivers/net/team: teamd_activebackup.sh
> # Setting up two-link aggregation for runner activebackup
> # Conf files are /tmp/tmp.zYDeygAAcf and /tmp/tmp.y5dfmFapAj
> # This program is not intended to be run as root.
> # This program is not intended to be run as root.
> # Created team devices
> # PING fd00::2 (fd00::2) 56 data bytes
> # 64 bytes from fd00::2: icmp_seq=3D1 ttl=3D64 time=3D233 ms
> #
> # --- fd00::2 ping statistics ---
> # 1 packets transmitted, 1 received, 0% packet loss, time 0ms
> # rtt min/avg/max/mdev =3D 233.163/233.163/233.163/0.000 ms/bin/bash: lin=
e 1: pv: command not found
> # Packet count for test_team2 was 0
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # TEST: teamd active backup runner test                               [FA=
IL]
> # Traffic did not reach team interface in NS2.
> # ./team_lib.sh: line 87: kill: (597) - No such process
> # Tearing down two-link aggregation
> # Failed to kill daemon: Timer expired
> --
> pw-bot: defer
