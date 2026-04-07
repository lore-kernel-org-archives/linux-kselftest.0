Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47C2BEC45
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 23:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775603178; cv=pass; b=aR+iqY0AN23SJDKb1tV3Xno0Ayp/+ySLhU8YoMViSIVHa9ymXGy3a4Ev0aV3cQi2GERHVFVWNMXW8UZrsSx+FMi3xoWc/x9nXKW9m1CLGQ7RqwAREFlUERcM2kip6hB1mijCJV9cNBd3Yd+844cSnT0jjAwWyUVmMr79d/gr/vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775603178; c=relaxed/simple;
	bh=eBBNZf+H2wH8bTLyUEgmWMro+6gVPpIYQxFPjJImcMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSUwkTSmdKdqE7FcxtDUYHt2tLI3iQ7ke3uwfJhMjYekcD4wld6LQQEvBA9V91w7Vw4BKg3yzDN9SUk5VSyR86/0Im66qRrkC8KcRMrMRD2gaH5QNt8V51hAs4VmnkmwgtUnqfnMpHc6D47O9ctUfSEwMoryW6H5H+opXvx29D8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NJEYa1N2; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NJEYa1N2"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66baa7fdfd3so2457a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 16:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775603175; cv=none;
        d=google.com; s=arc-20240605;
        b=VtniwlEKL/2L31U7SoEcoWAKzuQXN/aZgloi3xJxlavyfo+SIPbi1Fghj8owfQkxkp
         a451crKFIn58EjFxapmJKVFfUj7eOP2fuHabho6UDavjnuvmrqykGUDoNDj40SNX3EVa
         ezhdsXQzn7EinbV6R/06RpaNU57QVE3P/ZLb5X9rpPldcTJOlaTrXkohX7tJj7QqqYMR
         pPjqnFi79GhM2NabIGNhwG2SgPQz5/1FUYhDjUIYS2Cp8aQsEJAkgM7jRKXeSsXK0i6P
         bRWPBEE0djzc1fSxf7KCYHTlO3nAiB0vEAcWpZtxsYPP51k87YNyJXLdR6+8iwABulCO
         pREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QmF+mBJB5wkWwThlx9EWCJMVN4nWBYJprFHL0HGHAp8=;
        fh=j9iGsjVdySrnHxF8pL++viD4cbX7edVgK2ugjLPl+5c=;
        b=WvKPscU/tGkWzSOMfVnA0clFYu0GrEDLNRR5T6mdc6YwoBLywQvvCYCdWw0LVuARfq
         p6Kkikn7EyIG2fv2RlDNFKGVX2qVsQNfrGljxSaFqWPI2p90P5k3n/9PqjtyXGeKEVZv
         Ps20s5w3kA8FTjB5X52V15BRaHks5Gmw3P12OHQ+wvqFKxOzl7kb6acTYCqWd/jXfl/o
         fBJbjKuZLyWcbtzuWR9QU4zfzFZT2Yz8nAJeJObqUXzZFG/SWofoUWKMxJ+lyu4/9OX0
         h+Sb/bMhxox8foy3UxvQHSD6XCTnMI4ND2qvO0XsKulgMU6T3n/aBqJFhDatgVsvenwV
         /r+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775603175; x=1776207975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmF+mBJB5wkWwThlx9EWCJMVN4nWBYJprFHL0HGHAp8=;
        b=NJEYa1N2cWh5gTJxM2PgA+HWpOnpWkwo48jxrz6DivWE7M/jUVAcxSAMFKEQHhdfyJ
         TOR6a8+ieqJqft60uyGxZijkGxia5Qs3OjmjDEPt7PkHbfmCM9DuhAjlIclqoFcnihs3
         BM7iaINKD2Pi4XVrLUiR/EBojbPzjiytuF7HgKJ1WkBPrKNb4j+MtbKUhs3qGItlPtrA
         Ribv376iNWvMtl0zaXH9GxoHQwHCQtwkeC+6ozl7np0Q+ip1lTgTLYWnK6v/6hQwpAM1
         CyIepAPTFOFMm7FugiMNYya2evaRlKci4mK5H21z/tO+W694mhSAtsEcXW++AqXATCr/
         Ketw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775603175; x=1776207975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QmF+mBJB5wkWwThlx9EWCJMVN4nWBYJprFHL0HGHAp8=;
        b=UhlUdORMwzhBWrQYIQ3H1pL2k5gzHIRe8OR6993m3EQoaJM/CfOnr3+Km2mz6gckd3
         CqQwl+u/An2s7rADg2LBU7mc27Gk7Bj0Vr5CsVTOStX4a4jzUHl3tVkIpeEOZsyQP3bw
         rIbk51aIQlG8YGa/KJiJ7ILmYaSBdltJvGOEPHGhhTgESmV4gGgEwZGIwcJobPgxeacA
         ayCOXUezjMuRfxeTTHqi4bUmBUSylutNlV02IjyWKYwJa+V8CcvWiIz2qs/9OMGGFE2T
         pYuWfSqUsNEtPdHwMlls1ELKetjURd01xlmc/kk5ZTUz/TWm8sv7WiE9NxwmiP+h9bKi
         CgzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgRUU1Nmn2yKQB91r7gnYoZPVyQcD1rn1jsFcpbMYvYgSS2rrru3Xor7PcG3FdV59kP3wkaBWU1lCY+wyQsfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV6HNd2iSRoblaam4fsNdMS9zr3SBW3zt+vsw6yvOVjwAoQgdO
	xjXBetpbjGZXpZ6MbW4L021hBpikQqiGUmu+TjgzA5s0/3ST8eDuuT6gzCil9M3HMeL51He4IQQ
	mNK1s+TN88D0vPYKwj7emyYey+VBGTz/ftNQn2VkD
X-Gm-Gg: AeBDievAIukbX1bmOC+hfr+eL4pAVNOW9KPjWqOqlxoakj5bcyM4Li9hRnNrph83liN
	oXBw7rzyoMdUDKezCb3yzJQAQ03rKh+x6nDKwF0IWqIRkVJ3EanOD7TmtHgV6qAR/EmkbeJUTo9
	Kno0CLHng0eYscSDmyfuXe74P1yk2k/Ofae7oyuq35ceh1Tdxgr64rDi46DflbRZnCDN4WQ3qd3
	bleL3zMY2jOGD+Qk+K0cF2ub+PT5scdEc74GViLsXGG2LW40gv10b4l+GeuGrt2H6bGewPYP1G5
	eQ8823P/dKNnejnUnuMuAeD7+lY30NeN5ogW2Cfs6obaopBtPJHdRoWgfdvnukobj+e5cxQlfhq
	r
X-Received: by 2002:aa7:da89:0:b0:661:f987:357b with SMTP id
 4fb4d7f45d1cf-66f9f1d713cmr4620a12.14.1775603174425; Tue, 07 Apr 2026
 16:06:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
 <20260406074437.3ebb904a@kernel.org> <CANkEMg=DOiwj-ZbTLGC3oXaQuPM=sGOjg09CTXNpguCL5dh7Ug@mail.gmail.com>
In-Reply-To: <CANkEMg=DOiwj-ZbTLGC3oXaQuPM=sGOjg09CTXNpguCL5dh7Ug@mail.gmail.com>
From: Marc Harvey <marcharvey@google.com>
Date: Tue, 7 Apr 2026 16:06:02 -0700
X-Gm-Features: AQROBzD7QpyozeSBIy2mXUDVY6lrhOs36GjlEK3ZGP87OP5SUlpgMnX1Qnvt-Qg
Message-ID: <CANkEMgmeHoJkffx3B+N04buW-V0pHD9c=jajNWafmev6f6K85A@mail.gmail.com>
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

On Mon, Apr 6, 2026 at 10:04=E2=80=AFPM Marc Harvey <marcharvey@google.com>=
 wrote:
>
> On Mon, Apr 6, 2026 at 7:44=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
> >
> > On Mon, 06 Apr 2026 03:03:36 +0000 Marc Harvey wrote:
> > > Allow independent control over receive and transmit enablement states
> > > for aggregated ports in the team driver.
> > >
> > > The motivation is that IEE 802.3ad LACP "independent control" can't
> > > be implemented for the team driver currently. This was added to the
> > > bonding driver in commit 240fd405528b ("bonding: Add independent
> > > control state machine").
> > >
> > > This series also has a few patches that add tests to show that the ol=
d
> > > coupled enablement still works and that the new decoupled enablement
> > > works as intended (4, 5, and 10).
> > >
> > > There are three patches with small fixes as well, with the goal of
> > > making the final decoupling patch clearer (1, 2, and 3).
> >
> > activebackup:
> >
> > TAP version 13
> > 1..1
> > # overriding timeout to 2400
> > # selftests: drivers/net/team: teamd_activebackup.sh
> > # Setting up two-link aggregation for runner activebackup
> > # Teamd version is: teamd 1.32
> > # Conf files are /tmp/tmp.ydjNK9Um7H and /tmp/tmp.xZuc3cWbN0
> > # This program is not intended to be run as root.
> > # This program is not intended to be run as root.
> > # Created team devices
> > # Teamd PIDs are 21457 and 21461
> > # exec of "ip link set eth0 up" failed: No such file or directory
> > # exec of "ip link set eth0 up" failed: No such file or directory
> > # exec of "ip link set eth1 up" failed: No such file or directory
> > # exec of "ip link set eth1 up" failed: No such file or directory
> > # PING fd00::2 (fd00::2) 56 data bytes
> > # 64 bytes from fd00::2: icmp_seq=3D1 ttl=3D64 time=3D0.753 ms
> > #
> > # --- fd00::2 ping statistics ---
> > # 1 packets transmitted, 1 received, 0% packet loss, time 0ms
> > # rtt min/avg/max/mdev =3D 0.753/0.753/0.753/0.000 msPacket count for t=
est_team2 was 0
> > # Waiting for eth0 in ns2-lZ0gqd to stop receiving
> > # Packet count for eth0 was 0Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # Waiting for eth1 in ns2-lZ0gqd to stop receiving
> > # Packet count for eth1 was 0Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # TEST: teamd active backup runner test                               [=
FAIL]
> > # Traffic did not reach team interface in NS2.
> > # Tearing down two-link aggregation
> > # Failed to kill daemon: Timer expired
> > # Failed to kill daemon: Timer expired
> > # Sending sigkill to teamd for test_team1
> > # rm: cannot remove '/var/run/teamd/test_team1.pid': No such file or di=
rectory
> > # rm: cannot remove '/var/run/teamd/test_team1.sock': No such file or d=
irectory
> > # Sending sigkill to teamd for test_team2
> > # rm: cannot remove '/var/run/teamd/test_team2.pid': No such file or di=
rectory
> > # rm: cannot remove '/var/run/teamd/test_team2.sock': No such file or d=
irectory
> > not ok 1 selftests: drivers/net/team: teamd_activebackup.sh # exit=3D1
> >
> >
> > transmit_failover:
> >
> > TAP version 13
> > 1..1
> > # overriding timeout to 2400
> > # selftests: drivers/net/team: transmit_failover.sh
> > # Error: ipv6: address not found.
> > # Setting team in ns2-yxjiUo to mode roundrobin
> > # Error: ipv6: address not found.
> > # Setting team in ns1-Jht6kA to mode broadcast
> > # Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # TEST: Failover of 'broadcast' test                                  [=
FAIL]
> > # eth0 not transmitting when both links enabled
> > # Setting team in ns1-Jht6kA to mode roundrobin
> > # Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # TEST: Failover of 'roundrobin' test                                 [=
FAIL]
> > # eth0 not transmitting when both links enabled
> > # Setting team in ns1-Jht6kA to mode random
> > # Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # Packet count for eth0 was 0
> > # Packet count for eth1 was 0
> > # TEST: Failover of 'random' test                                     [=
FAIL]
> > # eth0 not transmitting when both links enabled
> > not ok 1 selftests: drivers/net/team: transmit_failover.sh # exit=3D1
> > --
> > pw-bot: cr
>
> Apologies for all of the test failures. Before sending this revision,
> I ran each test thousands of times and observed no failures, so I
> thought the flakiness would be resolved.
>
> No matter what I try, I can't recreate either issue on my end. I've
> tried building with the exact config from one of the test runs
> (https://netdev-ctrl.bots.linux.dev/logs/vmksft/bonding/results/590921/).
> I've tried stressing the VM according to
> https://github.com/linux-netdev/nipa/wiki/How-to-run-netdev-selftests-CI-=
style#reproducing-unstable-tests
> (this makes the tests time out, but I can still see traffic). I've
> tried using the netdev-testing/net-next-2026-04-06--09-00 kernel
> source. I've tried in nested and unnested virtual machines. I've also
> tried running multiple test instances in parallel, but nothing
> recreates the issues. The issues seem related to tcpdump, but without
> reproducing them, I can only guess. Any suggestions for running the
> tests exactly as the CI does would be greatly appreciated.
>
> - Marc

Thank you very much to kuniyu@google.com, who figured out how to
recreate the issue on Fedora. Fedora's /etc/services maps TCP port
1234 to the "search-agent" service (normal), which tcpdump then uses
to text-replace port numbers in its output. So the tests were looking
for ${ip_address}.1234, but tcpdump was spitting out
${ip_address}.search_agent. What is strange is that the test already
uses tcpdump's "-n" option: "Don't convert addresses (i.e., host
addresses, port numbers, etc.) to names."

It turns out that Fedora has a patched version of tcpdump that
separates the normal "-n" option into two options! "-n" handles host
addresses, and "-nn" handles port and protocol numbers. The tcpdump
invocation used by the selftests only uses "-n". What's stranger is
that passing "-nn" to tcpdump is actually portable, because under the
hood it is treated as a counter, with or without the Fedora patch:
https://github.com/the-tcpdump-group/tcpdump/blob/master/tcpdump.c#L1915
(thanks again to Kuniyuki for discovering this).

For v6, I will just change the TCP port to one that is not used by a
service, and will make the tcpdump helper function in the
net/forwarding lib use "-nn" instead of "-n".

- Marc
