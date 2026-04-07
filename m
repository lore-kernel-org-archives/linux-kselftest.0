Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8BE3314D0
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 05:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775538278; cv=pass; b=qqZLsnoYF4yBWptxjWE9k9/kUpAN/iC1w2KJ5PDa+UkaqaLQC7tvBQ6+Sg/8cN7aRmKD2L0j6I77ArDqQpDK6CnQwmlsMk52cBvotBHiXDSeoVw1QLl21RT//iHJ68ctJJHc2iWLkPhkb++v7sHG4CVQF1wWoe2YKdbpbpoNG1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775538278; c=relaxed/simple;
	bh=pR75v0+K8Ebngm+mOi4GYi6HyIecwye1FToL+3OGSrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCY6p3rFNOs70HGbE1ibBPQpM08tzTGwImDa4G5zxUTB/ZUUuKz3iXr3vXho+q6i/PKmQ7v1nfHj6tfyUODCSnZfISfdj23wEvQu/E3+EoDbp4Mckl7FqZ1hciqCjLy9xZpQAsF2HEhdESO1sZoFOJeSilEhlNWIEyDn4yqyd5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ugn2cCFP; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ugn2cCFP"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66bb7118c96so33791a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 22:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775538276; cv=none;
        d=google.com; s=arc-20240605;
        b=ODEW1bQLhbiVCqW+SkdtegDVOMFxUem4pbcZaHUZVdla5xrmGChcMaOC3NT0VcCQLe
         Dp/4nqKZER751QCcgdaGuEvUgJbxz6yO02rS4CRCKyfoVGMpJEnk1V8U/FRKJjg7lN9x
         A0VOJAZoOMjwDrr0jRn9uaAMlnIA0yLz1WyKzFNqHMiIdKKXaeXEptTN3VURLtZpvhpy
         fy6SrdsHUwoyTpRFioAu+81JQpYy+StVh+MQUBIWmdfTp1BfLn1qqeOI7RM4gbj3nbt2
         E7UeK0RIuzCrTULNCsUoAbcr5f8ftYPFCxVvcAHkxcDi3rN5ze1RFKi+xs8QTpToLuS8
         58IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25GmHcuPSEteOmJErKcJfWIQ20/JH8qsbM1yjXNIBGk=;
        fh=glHMMHJwFiDcnvvVFoloPwFcb2W/ZXIFgrEyOREjoX0=;
        b=cYwaRNi4XKWcU23D7Wz9xd45yurOdEqVDxrAc0I+2jODjxVuxBe3C7OoRGuGIOEpzC
         fLszF1UJR6APMipZr1lCza5/OuZgJxh63M5LMGx46pza+cmgyFVWYnSmd2PG2gOZ0kpE
         6KpQ7AdAq7ewg/sZU5YZOpXHNj2HSvsCXJkeau7esfQ46PEYKqAenu4yzg0LzZ4yuszt
         mdrlf7goA/1Y/eezRwJqM2P02RLnnBHzMcK3C3JEKvMFKfOF0Wy2a00aZBzUBvYaVOnR
         NY+e5PAZda4xl2zLRM2W43e1mMVeke5mOaYttACMYjb415FHufThna+XiX7VG4QLd55P
         blDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775538276; x=1776143076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25GmHcuPSEteOmJErKcJfWIQ20/JH8qsbM1yjXNIBGk=;
        b=ugn2cCFPLVtf7RqXH0j6l7suoKVd1SKnkYEW99irar/lvyMbbQf3Ed7Nh3KPxGC86r
         jv4KFYOSV2bRUZp6ttVLIxt7JbXE10C+0EZ0gEtLVR+kCEU4Yyt2tnJukPYnxmInLOEs
         tjCqb96kpmk/pCFsXAO9OLvlDP6tcXrXAqeruhn6BXE0QMfgI8V3DLnt4RMuo2gvUY8M
         n0p1AxCvIkaP464NM2UFvJ0S2He7C+FzoQyoB8RKewiGu2H/VW6hF+5KPHTNuKJq022g
         OB994vy7RwwLcsekxZmf51vREBMLqyjb8DEm799RUB7Dd7Qy+ySYlVclL0/SFjaKCIST
         6+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775538276; x=1776143076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=25GmHcuPSEteOmJErKcJfWIQ20/JH8qsbM1yjXNIBGk=;
        b=dqyP9Oh9aIfzAswWvgYDt2EkLj18CNFoX7SVGF9WMTYEkL6icy40OEvDtR+HZyIVod
         UXWclm5ffwwv+hwkPrAsnMYQNFD3Eotd2D9qt2sPXwT3Q8b9pEe+l92R9OCfR0Vqbih3
         AhkCLC+X1+RicW9DJ3n+VOBVXpGzsGSGk5j9tXC7KlwAsLU/oObyH87edoefKJhm7Fgv
         1jwsZsfRmRLbLiwfa+E1o8MT68gveBittsXSNL/zmbwEGFDg53KaGxPtPgjDmcus+Fpy
         1FvWehdYri/EzuYHxffa0/lhxlIpfnho61bf8OHiHvIu3l8zhNQ1wjFo/xlmlIY9hnRE
         BrcA==
X-Forwarded-Encrypted: i=1; AJvYcCWJJCpmna1qKce3G0zv+k5b8PwhcUNwJI40YzR4bIKdIisPu1IHhWtmk212LXpYoo+zKfbKa1054jYwKxk9WXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSG0Mxkjy7dsa7SuuqIeOepetoy27u1fgk8ISCx9j9TzwwYZk8
	LrAFFz+uB3R3D/hUpBQpJH18+h7fZ87kgAchiYNdQZCHXIqiAaep9iUMB98tD4NKcLpdOoIR7eh
	S+V/k855rgG8Cu+Nz/mOnXRaEIyxCyAjWrdf3npmt
X-Gm-Gg: AeBDietxe/U/6Za5dZDYSou04pOXRjEq67wqihCSLWZWXu45v93t1wa3/oWuTc6a/kj
	YwYkzlQH4gUnF25PepCJhzmS+o108nMCu+CIGiUNcArankH0FWM52w9BlK2Hpl881wROm9NjdGu
	NdCorog0y3QVb2dsFxDRp8ZorVotqppm1+wm13NMmIv02XLWt3tt6WcsqPf5qH+77qOghPIXf2s
	xHCMUZZ91XzLKVaU4VNUo81OOQY0Hc41hS5+7NzWsKv9iOmNspknDkncpDv06F4z4Y9L4tKGWj6
	8LU8iCEoZaujUx/cNcRM8jiS1HnRlpQa75omfug=
X-Received: by 2002:a50:fa85:0:b0:66b:b4da:a8b0 with SMTP id
 4fb4d7f45d1cf-66e4136b3b3mr143872a12.8.1775538275237; Mon, 06 Apr 2026
 22:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com> <20260406074437.3ebb904a@kernel.org>
In-Reply-To: <20260406074437.3ebb904a@kernel.org>
From: Marc Harvey <marcharvey@google.com>
Date: Mon, 6 Apr 2026 22:04:23 -0700
X-Gm-Features: AQROBzChFB6cRcn-i5tgpGES8rLGUFP-i2wknSViONSNsMGB8Isf8uEKGuixfcU
Message-ID: <CANkEMg=DOiwj-ZbTLGC3oXaQuPM=sGOjg09CTXNpguCL5dh7Ug@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/10] Decouple receive and transmit
 enablement in team driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 7:44=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Mon, 06 Apr 2026 03:03:36 +0000 Marc Harvey wrote:
> > Allow independent control over receive and transmit enablement states
> > for aggregated ports in the team driver.
> >
> > The motivation is that IEE 802.3ad LACP "independent control" can't
> > be implemented for the team driver currently. This was added to the
> > bonding driver in commit 240fd405528b ("bonding: Add independent
> > control state machine").
> >
> > This series also has a few patches that add tests to show that the old
> > coupled enablement still works and that the new decoupled enablement
> > works as intended (4, 5, and 10).
> >
> > There are three patches with small fixes as well, with the goal of
> > making the final decoupling patch clearer (1, 2, and 3).
>
> activebackup:
>
> TAP version 13
> 1..1
> # overriding timeout to 2400
> # selftests: drivers/net/team: teamd_activebackup.sh
> # Setting up two-link aggregation for runner activebackup
> # Teamd version is: teamd 1.32
> # Conf files are /tmp/tmp.ydjNK9Um7H and /tmp/tmp.xZuc3cWbN0
> # This program is not intended to be run as root.
> # This program is not intended to be run as root.
> # Created team devices
> # Teamd PIDs are 21457 and 21461
> # exec of "ip link set eth0 up" failed: No such file or directory
> # exec of "ip link set eth0 up" failed: No such file or directory
> # exec of "ip link set eth1 up" failed: No such file or directory
> # exec of "ip link set eth1 up" failed: No such file or directory
> # PING fd00::2 (fd00::2) 56 data bytes
> # 64 bytes from fd00::2: icmp_seq=3D1 ttl=3D64 time=3D0.753 ms
> #
> # --- fd00::2 ping statistics ---
> # 1 packets transmitted, 1 received, 0% packet loss, time 0ms
> # rtt min/avg/max/mdev =3D 0.753/0.753/0.753/0.000 msPacket count for tes=
t_team2 was 0
> # Waiting for eth0 in ns2-lZ0gqd to stop receiving
> # Packet count for eth0 was 0Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # Waiting for eth1 in ns2-lZ0gqd to stop receiving
> # Packet count for eth1 was 0Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # TEST: teamd active backup runner test                               [FA=
IL]
> # Traffic did not reach team interface in NS2.
> # Tearing down two-link aggregation
> # Failed to kill daemon: Timer expired
> # Failed to kill daemon: Timer expired
> # Sending sigkill to teamd for test_team1
> # rm: cannot remove '/var/run/teamd/test_team1.pid': No such file or dire=
ctory
> # rm: cannot remove '/var/run/teamd/test_team1.sock': No such file or dir=
ectory
> # Sending sigkill to teamd for test_team2
> # rm: cannot remove '/var/run/teamd/test_team2.pid': No such file or dire=
ctory
> # rm: cannot remove '/var/run/teamd/test_team2.sock': No such file or dir=
ectory
> not ok 1 selftests: drivers/net/team: teamd_activebackup.sh # exit=3D1
>
>
> transmit_failover:
>
> TAP version 13
> 1..1
> # overriding timeout to 2400
> # selftests: drivers/net/team: transmit_failover.sh
> # Error: ipv6: address not found.
> # Setting team in ns2-yxjiUo to mode roundrobin
> # Error: ipv6: address not found.
> # Setting team in ns1-Jht6kA to mode broadcast
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # TEST: Failover of 'broadcast' test                                  [FA=
IL]
> # eth0 not transmitting when both links enabled
> # Setting team in ns1-Jht6kA to mode roundrobin
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # TEST: Failover of 'roundrobin' test                                 [FA=
IL]
> # eth0 not transmitting when both links enabled
> # Setting team in ns1-Jht6kA to mode random
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # Packet count for eth0 was 0
> # Packet count for eth1 was 0
> # TEST: Failover of 'random' test                                     [FA=
IL]
> # eth0 not transmitting when both links enabled
> not ok 1 selftests: drivers/net/team: transmit_failover.sh # exit=3D1
> --
> pw-bot: cr

Apologies for all of the test failures. Before sending this revision,
I ran each test thousands of times and observed no failures, so I
thought the flakiness would be resolved.

No matter what I try, I can't recreate either issue on my end. I've
tried building with the exact config from one of the test runs
(https://netdev-ctrl.bots.linux.dev/logs/vmksft/bonding/results/590921/).
I've tried stressing the VM according to
https://github.com/linux-netdev/nipa/wiki/How-to-run-netdev-selftests-CI-st=
yle#reproducing-unstable-tests
(this makes the tests time out, but I can still see traffic). I've
tried using the netdev-testing/net-next-2026-04-06--09-00 kernel
source. I've tried in nested and unnested virtual machines. I've also
tried running multiple test instances in parallel, but nothing
recreates the issues. The issues seem related to tcpdump, but without
reproducing them, I can only guess. Any suggestions for running the
tests exactly as the CI does would be greatly appreciated.

- Marc
