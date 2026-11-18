Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794969186;
	b=V12rPxwVbYOAFycxD8r76P9UAtDn91K8W8ZFH78sUxmD0a0wguofmlCsOhiAL0kHu15f
	 /baOwla5v9AeNboZtK9p1ND4znVOzjLxIdnZ00PKeEj+B2skjf9rxhzi/j/xFY/V1XEyq
	 pnnG9eB73BvKEcgJBcf/qsM3lHQX1UhK7ME8yInl1CzYJAyKaIEzqILMvbNb53SjQ9ar4
	 rbqVmnFDkvIB+czGzSRiZvkqRDG7JBYxEBrFR6k828aRHg3N52enN+97VL4twz8rVo+Pk
	 JOAi9zKkZES8Ix5987x9thpedl4flEpd2+7ugbm1Ql/YYU36JcWY/dnMIyoumKjcNiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
	b=Kw+Zpf/HULjnB4sz9utHKmx9ZkgNAdAxhlAVMMUtI7Nrtuac6390G1PnFkprdVVMkyPR
	 t7RU/duCQ1P59Y5yLVd26IdjREscfe/lRsFrYYnA9HiZyXUO9c2b8H69u7hW5k4Ra7EsG
	 zno90NNrLH9I/g5d8kqmVdJznEej6NP8sMGRyfxO5eW2ZWlkmZEXKVYJ/oEWoXxTBI8oU
	 jQVLj0nSr0o4E8UvTDqYx6fjJTabwg8smZJYGv+CiYKkiXPZSYhlvYRd44zgEIhm84QLk
	 eMAxQSOQ5anFFJPVd0tCNlOPyHFj2B+Opb/IakpP/aHaobm1A0fjsJj+QNd7qw6eDzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brQVox1F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11F1606A32C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 02:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E11F1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brQVox1F
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ee1e4e3abcso135154e0c.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 18:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794969185; cv=none;
        d=google.com; s=arc-20260327;
        b=PHa5YnjPiIuj+noP8SzRY456/cmnFrH+A1KUXOmB5jA/cmR30OalEBUbil7PYovrKn
         3Byo1AlUNYm0myVmy8E14Kc1CqwKT3+D650rJLqIghOGSQcg1ULJ4+Usa6A0Rl3sdQBE
         sH0ZVuczUjieHCwBDE54XqDNyXKMtEcYootymrstvR1y0XCtER4TTb9T4tOUFi0F8h3c
         PHUYQBBhnBHN+CXog+1GIA2ogJ0YzirBGuTEz54QIeqBQgDsI09hox2QNJIXgpcD/jFD
         d9lUfgxeKSn4pMDFHmtgQDSEIHRU4nytcO5l/Bd/PAds64MJRO1BmTAu/poj9BuZobVv
         Oh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
        fh=qNLKUKXxrsFN1hHGAVeEoOfJHAgdOC1iZmXudYFdL2M=;
        b=EBqUPWIp7ybonky2Xcyr3d7Lo/yQqanIWtLNos/1paTbr1xATsNWZM1AP9a/cf+Gl+
         wzK8ifj5K7nMFbhJZqn5oaEp6xRc2kds41BuEHZE4kkINQgcR4Jh/OoWK4EWUBYWULmH
         vQXaLEEneqmBIjWP4+QGeF85p1b+p80KiliTRFmxQ7HbEs6ceX3l9LKwTltALjf5+mCK
         Z+vIequSdcaSl3CXJTDiPgeidkprKK2RDVFQhoR236OPAsqPDdfuQa0RPv/cEnMEyTfb
         XXlLTZ+LSgGRvceZQBBg45ciKIhmmTkvpT2jOqIYvoq1r5ONhfefoQQ2IIc0MT4lwaJa
         V6ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794969185; x=1795573985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
        b=brQVox1F6VXFbGdLs1+5DMYomOu4P/zJmzDC9Ti5885w/zs4TQQIbpk+NF3r9zyy1Y
         qzRElcNXYoo8DvxnoVvb4Lbf2dAREqfcmjd+iBdL2wbVRCy4kMnQzyJFpR8fHmKM9fG+
         uQ6XWKes8zbeiQgz5eIIM+Te8KNZBYgvc4IlvpXFqiLwJwab8cpVZCulDFC1NjLhrbRp
         6wPQfnwT8XLwP0RKpR98M7DveMFpl7k7gkT0M5oawiW5vG12E08SQ+FH3gyn2OzHJ6Df
         GlPjHxzCjAc+xAHLmrN6KMr/POrH1l/qjoCfhQjmNAz7Z3gFO1JokkIfILvegihdbN1f
         arWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794969185; x=1795573985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
        b=ml1IK/RRHB0iFdmegH4++4OklsWUcfr2+5EdUU1ecWgqOvihRdKMg171i0v+u1cVjb
         0n7U2ULOcT3PG38uF2xCB7uyPIlYKRvlwQAJovseMeLoU2jRHQXGhxRlamI71aGyKBAp
         op9TVgfO2zB8/zBmRlb8VUIBAbYq/e6h58qzmEf+yAE1l83HXR1jTYFCW5mdYCBrEz1S
         k7AVJcKY3q3IaWPnkT6KZX2bQxlC8QEzmx/oRe6HINxhgDL/fF0o3tCV/4b3nx92Ct6K
         2zy7cidfl2ZtysQBHPxhs4C5cU1Fve6xp6nOVdTe4gAqVBBLJLznR/85QTRNIaM98R4q
         Kinw==
X-Forwarded-Encrypted: i=1; AL+hErGUFsmt7QemecEdEQIafpzA60GSpNBpjaaaENPUB2TE0yHwLWhpK7w/dEmeXoJA4wM3ns2A6brU1D1Ss1FUJoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9snqOCMEP3tUJsHKyasGSYwSg0H/Uqqep+4AAdv/Fq2os5Mi1X
	NMvuYmchxGXswMvsvjsYCOIqYZ+fcj24U4CgkDqQ+MioORQxgAmTausm65mjCfnGIqydd75Q+FQ
	6EUkzYGedNoFvuO0aC2qCAxQbzRHPYgBbYbMAC9Gq
X-Gm-Gg: AYBFou1vrmMSCbsuZF8ugnCCmkxzMoLrSEHQbAIB3IHYXo2vSt8h3CLaG+mqIEmt6as
	NolNuKiOKc9+isCUZJb5RQ0SalelS1Ibkkpkakz9nwamV7FPjZZRla3q2I5/pVKJTlJtxsqx8Da
	1Bo447ODEywaTiyBRDAfQCWY7YI9jdQ74aGPj5QsGfZ/vuQjpOtHhYx9J10rpZ1gVKYwN3SYJyX
	Us6cYx7/DmaTlizHSDdf3SjuHUSFrEtFkZmZlepmsM0cKvLx3o98mZrDrJLTqqetIqtPWsTeH6i
	lmWdf18xqAptJozJqIiuKf9pW7tC49by3072DTQ2o40WrAih6GzprADRY/DSqxLH8RzbgTSbhrB
	VnQWRnR4/CDgptpHHRrc6dMjdeEhEPg6VeUxl
X-Received: by 2002:a05:6122:2090:b0:5ec:e6b8:eb94 with SMTP id
 71dfb90a1353d-5ee64707670mr743046e0c.12.1794969184030; Tue, 17 Nov 2026
 18:33:04 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112014942.2946303-1-treapking@google.com>
 <avaewOJD7tX1UYfE@fedora> <avanVkILHDYdpond@fedora> <CAHwYsio=qtCY10EPnh+qvWpdgtQUG5mw1b3WKMt9_Kytcc7h9A@mail.gmail.com>
 <avwBrbJfp4ET9ifT@fedora>
In-Reply-To: <avwBrbJfp4ET9ifT@fedora>
From: Pin-yen Lin <treapking@google.com>
Date: Tue, 17 Nov 2026 18:32:52 -0800
X-Gm-Features: AclHuK8PlSleIouGSsimoM04t8dnEBmceA6kyDcl75PCQlr4VIa_x83DUMY1klA
Message-ID: <CAHwYsiqwCVPJqtQRoP+9Uw66RpdGL4zuiCPO8+mqShxnvFgDPw@mail.gmail.com>
Subject: Re: [PATCH net] selftests: bonding: fix failover race in
 bond_options.sh prio test
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Bjoern Doebel <doebel@amazon.de>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	Matthieu Baerts <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	Jonathan Toppins <jon.toppins+linux@gmail.com>, linux-kselftest@vger.kernel.org, 
	Hangbin Liu <liuhangbin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hangbin,

On Mon, Nov 16, 2026 at 11:26=E2=80=AFPM Hangbin Liu <hangbin.liu@linux.dev=
> wrote:
>
> Hi Pin-yen,
> On Mon, Nov 16, 2026 at 05:30:28PM -0800, Pin-yen Lin wrote:
> > Hi Hangbin,
> >
> > On Thu, Nov 12, 2026 at 10:00=E2=80=AFPM Hangbin Liu <hangbin.liu@linux=
.dev> wrote:
> > >
> > > On Fri, Nov 13, 2026 at 01:23:40PM +0800, Hangbin Liu wrote:
> > > > Hi Pin-yen,
> > > > On Wed, Nov 11, 2026 at 05:46:18PM -0800, Pin-yen Lin wrote:
> > > > > The prio test intermittently fails in the arp_ip_target and
> > > > > ns_ip6_target variants:
> > > > >
> > > > >   TEST: prio (active-backup ns_ip6_target primary_reselect 1)   [=
FAIL]
> > > > >     Current active slave is eth0 but not eth2
> > > > >
> > > > > The ARP/NS monitor marks a slave down when it has received nothin=
g for
> > > > > too long. With arp_interval 100 and the default arp_missed_max, t=
hat is
> > > > > about 250ms for the active slave (eth1) and 350ms for a backup sl=
ave
> > > > > (eth0, eth2). Every 100ms, eth1 sends a probe: eth1 receives the =
reply,
> > > > > and eth0/eth2 receive a copy forwarded by the gateway bridge. Onc=
e eth1
> > > > > is down, its probes reach no one and no slave receives anything, =
so
> > > > > eth1 normally times out first and the new active slave is picked =
by
> > > > > prio:
> > > > >
> > > > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > > > >   t=3D10   test sets eth1 down
> > > > >   t=3D300  monitor: eth1 idle 300ms -> down
> > > > >                   eth0/eth2 idle 300ms -> up, eth2 picked by prio
> > > > >
> > > > > But the test takes eth1 down right after bond_check_connection(),=
 whose
> > > > > ping replies only arrive on eth1:
> > > > >
> > > > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > > > >   t=3D70   ping reply on eth1 only
> > > > >   t=3D85   test sets eth1 down
> > > > >   t=3D300  monitor: eth1 idle 230ms -> still up
> > > > >   t=3D400  monitor: eth1 idle 330ms -> down
> > > > >                   eth2 idle 400ms -> down too
> > > > >
> > > > > eth2 can then no longer be picked. eth0 becomes the active slave =
if it
> > > > > happened to receive some other packet (e.g. an MLD report), other=
wise
> > > > > whichever slave comes back first does. With primary_reselect 1 or=
 2,
> > > > > the bond keeps eth0 even after eth2 comes back.
> > > > >
> > > > > Before taking the active slave down, wait two monitor intervals
> > > > > (200ms), so that at least one more probe is sent after the last p=
ing
> > > > > reply and all slaves last received that probe. The miimon variant=
s do
> > > > > not need the wait, but the extra delay is negligible.
> > > >
> > > > I'm afraid the waiting time is too strict, especially with a debug =
kernel
> > > > since delays can happen.
> > > >
> > > > Bjoern is also fixing[1] this issue by pinging a non-existent neigh=
bor to
> > > > keep traffic flowing. Would you like to test whether that works for=
 you?
> > > >
> > > > [1] https://lore.kernel.org/netdev/20261104142018.552135-1-doebel@a=
mazon.de/
> > >
> > > BTW, using ping may not able to triger the arp request in time. You c=
an try
> > > arping instead.
> >
> > Thanks for the pointer, but I believe Bjoern's patch addresses a
> > different problem.
>
> I think they are the same issue, as you comment also said
>
> The ARP/NS monitor marks a slave down when it has received nothing for
> too long.

This is the existing behavior of the bonding driver, and the prio test
uses it to check which backup slave takes over. Slaves being marked
down is not the root cause of the test failure. Instead, the root
cause is the ping replies described below.

>
> >
> > Bjoern's patch keeps the traffic flowing so that idle slaves are kept
> > alive between the test steps. This patch fixes the case where the ping
> > replies from bond_check_connection() only arrive on the active slave
> > right before it is set down. The active slave's failure is then
> > detected one monitor interval late, when the backups have also timed
> > out.
>
> The reason is we set arp interval to 100ms, and slowwait also check every
> 100ms. If the backup slave down at the same check point, e.g.
>
>   t=3D300  monitor: eth1 idle 230ms -> still up
>   t=3D400  monitor: eth1 idle 330ms -> down
>                   eth2 idle 400ms -> down too
>
> The test failed.

I don't think the slowwait interval makes a difference here.

The ARP monitor decides which slave becomes active, and slowwait only
reads the result afterwards. The test expects the active slave and the
backups to time out in different monitor runs, so that a backup can
take over. In the example above, eth2 is already down when the bond
picks the new active slave, no matter when slowwait polls.
>
> >
> > The ARP requests triggered by Bjoern's ping are sent only about once
> > per second, which isn't frequent enough for this failure. I tested
> > Bjoern's patch and confirmed that it didn't fix the issue in our
> > testing environment. We also can't simply use arping instead because
> > iputils arping doesn't support sub-second intervals.
> >
> > If you're worried that the 200ms sleep is too short, would increasing
> > it to 0.5s or 1s work for you?
>
> It's not about the sleep time before setting active slave down. I'm afrai=
d
> about the slowwait checking time. Even we sleep 1s, with arp interval 100=
,
> we still only have 100ms checking window. Before the window, the active s=
lave
> is up, after the window, the backup slave also down. With a debug kernel,=
 this
> time is a little tight.
>
> So, either we have some background arp traffic, or let's extend the arp
> interval to a larger one.
>
> What do you think?

I agree that a 100ms ARP interval could be too short in environments
like a debug kernel.

Background ARP traffic doesn't widen that window, though: it is sent
through the active slave, so once the active slave is set down,
nothing reaches the backups. It could only help with the ping reply
race if it were very frequent; Bjoern's patch triggers about one ARP
request per second and didn't fix the failures in our testing.

Increasing the ARP interval alone won't address the ping reply race,
but it should help in environments like a debug kernel. I'd prefer to
keep this patch focused on the ping reply race and send the ARP
interval change as a follow-up, but I can fold it into v2 if you
prefer.
>
> Thanks
> Hangbin

Regards,
Pin-yen
